from django import forms
from django.contrib.auth.models import Group, Permission
from .models import SuperUsuario, Usuario 



class UsuarioForm(forms.ModelForm):
    class Meta:
        model = SuperUsuario
        fields = ['tipo_usuario', 'numero_cuenta', 'nombre', 'apellido_paterno', 'apellido_materno', 
                 'celular', 'correo', 'carrera', 'rol']

    def clean_correo(self):
        correo = self.cleaned_data.get('correo')
        dominio = '@unam.mx'
        dominio_1 = '@ciencias.unam.mx'
        if not (correo.endswith(dominio) or correo.endswith(dominio_1)):
            raise forms.ValidationError('El correo debe terminar en ' + dominio + ' o ' + dominio_1)
        return correo
    
    def clean_celular(self):
        celular = self.cleaned_data.get('celular')
        if len(celular) != 10 or not celular.isdigit():
            raise forms.ValidationError('El número de celular debe tener exactamente 10 dígitos numéricos.')
        return celular
    
    def clean_numero_cuenta(self):
        numero_cuenta = self.cleaned_data.get('numero_cuenta')
        tipo_usuario = self.cleaned_data.get('tipo_usuario')

        # Validar si se seleccionó un tipo de usuario
        if not tipo_usuario:
            raise forms.ValidationError('Debes seleccionar un tipo de usuario.')

        # Validaciones basadas en el tipo de usuario
        if tipo_usuario == 'estudiante':
            if len(numero_cuenta) != 9 or not numero_cuenta.isdigit():
                raise forms.ValidationError('El número de cuenta debe tener exactamente 9 dígitos numéricos para estudiantes.')
        
        elif tipo_usuario == 'trabajador':
            if len(numero_cuenta) != 6 or not numero_cuenta.isdigit():
                raise forms.ValidationError('El número de cuenta debe tener exactamente 6 dígitos numéricos para trabajadores.')

        return numero_cuenta

    def save(self, commit=True):
        usuario = super().save(commit=False)
        # Establecer el username igual al número de cuenta
        usuario.username = usuario.numero_cuenta
        # Generar contraseña aleatoria
        contrasenia = usuario.generar_contraseña()
        usuario.set_password(contrasenia)
        usuario.contrasenia_temp = contrasenia

        if commit:
            usuario.save()

            # Asignar grupo basado en el rol
            if usuario.rol == 'admin':
                admin_group, _ = Group.objects.get_or_create(name='Administradores')
                usuario.groups.clear()
                usuario.groups.add(admin_group)
                permisos_admin = [
                    'ver_productos', 'agregar_producto', 'editar_producto', 
                    'eliminar_producto', 'agregar_usuario', 'editar_usuario', 
                    'eliminar_usuario', 'ver_usuarios'
                ]
                for perm in permisos_admin:
                    try:
                        permission = Permission.objects.get(codename=perm)
                        usuario.user_permissions.add(permission)
                    except Permission.DoesNotExist:
                        continue

            elif usuario.rol == 'proveedor':
                proveedor_group, _ = Group.objects.get_or_create(name='Proveedores')
                usuario.groups.clear()
                usuario.groups.add(proveedor_group)
                permisos_proveedor = [
                    'ver_productos', 'agregar_producto', 
                    'editar_producto', 'eliminar_producto'
                ]
                for perm in permisos_proveedor:
                    try:
                        permission = Permission.objects.get(codename=perm)
                        usuario.user_permissions.add(permission)
                    except Permission.DoesNotExist:
                        continue

            elif usuario.rol == 'usuario':
                usuario_group, _ = Group.objects.get_or_create(name='Usuarios')
                usuario.groups.clear()
                usuario.groups.add(usuario_group)
                permisos_usuario = ['ver_productos', 'rentar_producto']
                for perm in permisos_usuario:
                    try:
                        permission = Permission.objects.get(codename=perm)
                        usuario.user_permissions.add(permission)
                    except Permission.DoesNotExist:
                        continue
                
                # Crear perfil de usuario y se asignan 100 pumapuntos
                usuario_perfil, created = Usuario.objects.get_or_create(user=usuario)
                if created:
                    usuario_perfil.pumapuntos = 100 # Asigna pumapuntos solo a los usuarios
                    usuario_perfil.save()
                

            usuario.save()

        return usuario
    



class UsuarioEditForm(forms.ModelForm):
    class Meta:
        model = SuperUsuario
        fields = ['nombre', 'apellido_paterno', 'apellido_materno', 'celular', 'correo', 'rol']

    def clean_correo(self):
        correo = self.cleaned_data.get('correo')
        dominio = '@unam.mx'
        dominio_1 = '@ciencias.unam.mx'
        if not (correo.endswith(dominio) or correo.endswith(dominio_1)):
            raise forms.ValidationError('El correo debe terminar en ' + dominio + ' o ' + dominio_1)
        return correo

    def clean_celular(self):
        celular = self.cleaned_data.get('celular')
        if len(celular) != 10 or not celular.isdigit():
            raise forms.ValidationError('El número de celular debe tener exactamente 10 dígitos numéricos.')
        return celular
