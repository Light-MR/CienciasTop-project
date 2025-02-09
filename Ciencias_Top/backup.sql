--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id character varying(12) NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: productos_producto; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.productos_producto (
    codigo character varying(12) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    existencia integer NOT NULL,
    pumapuntos integer NOT NULL,
    dias_renta integer NOT NULL,
    imagen character varying(100),
    propietario_id character varying(12) NOT NULL,
    CONSTRAINT productos_producto_dias_renta_check CHECK ((dias_renta >= 0)),
    CONSTRAINT productos_producto_existencia_check CHECK ((existencia >= 0)),
    CONSTRAINT productos_producto_pumapuntos_check CHECK ((pumapuntos >= 0))
);


ALTER TABLE public.productos_producto OWNER TO admin;

--
-- Name: rentas_renta; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.rentas_renta (
    id_renta character varying(10) NOT NULL,
    fecha_renta timestamp with time zone NOT NULL,
    fecha_devolucion_estimada timestamp with time zone,
    fecha_devolucion timestamp with time zone,
    estado character varying(20) NOT NULL,
    pumapuntos_obtenidos integer NOT NULL,
    producto_id character varying(12) NOT NULL,
    usuario_id character varying(12) NOT NULL,
    CONSTRAINT rentas_renta_pumapuntos_obtenidos_check CHECK ((pumapuntos_obtenidos >= 0))
);


ALTER TABLE public.rentas_renta OWNER TO admin;

--
-- Name: usuarios_superusuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuarios_superusuario (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    numero_cuenta character varying(12) NOT NULL,
    contrasenia_temp character varying(128),
    nombre character varying(50) NOT NULL,
    apellido_paterno character varying(50) NOT NULL,
    apellido_materno character varying(50),
    celular character varying(10) NOT NULL,
    correo character varying(254) NOT NULL,
    carrera character varying(100) NOT NULL,
    rol character varying(20) NOT NULL,
    tipo_usuario character varying(20) NOT NULL
);


ALTER TABLE public.usuarios_superusuario OWNER TO admin;

--
-- Name: usuarios_superusuario_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuarios_superusuario_groups (
    id bigint NOT NULL,
    superusuario_id character varying(12) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.usuarios_superusuario_groups OWNER TO admin;

--
-- Name: usuarios_superusuario_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.usuarios_superusuario_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_superusuario_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: usuarios_superusuario_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuarios_superusuario_user_permissions (
    id bigint NOT NULL,
    superusuario_id character varying(12) NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.usuarios_superusuario_user_permissions OWNER TO admin;

--
-- Name: usuarios_superusuario_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.usuarios_superusuario_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_superusuario_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: usuarios_usuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.usuarios_usuario (
    id bigint NOT NULL,
    pumapuntos integer NOT NULL,
    user_id character varying(12) NOT NULL
);


ALTER TABLE public.usuarios_usuario OWNER TO admin;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.usuarios_usuario ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.usuarios_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
1	Administradores
2	Proveedores
3	Usuarios
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
17	1	51
18	1	52
19	1	53
20	1	54
21	1	55
22	1	56
23	1	57
24	1	58
25	1	59
26	2	51
27	2	52
28	2	53
29	2	54
30	3	51
31	3	60
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
35	Can add usuario	7	add_usuario
36	Can change usuario	7	change_usuario
37	Can delete usuario	7	delete_usuario
38	Can view usuario	7	view_usuario
39	Can add producto	8	add_producto
40	Can change producto	8	change_producto
41	Can delete producto	8	delete_producto
42	Can view producto	8	view_producto
43	Can add renta	9	add_renta
44	Can change renta	9	change_renta
45	Can delete renta	9	delete_renta
46	Can view renta	9	view_renta
47	Can add super usuario	6	add_superusuario
48	Can change super usuario	6	change_superusuario
49	Can delete super usuario	6	delete_superusuario
50	Can view super usuario	6	view_superusuario
51	Puede ver productos	6	ver_productos
52	Puede agregar productos	6	agregar_producto
53	Puede editar productos	6	editar_producto
54	Puede eliminar productos	6	eliminar_producto
55	Puede añadir usuarios	6	agregar_usuario
56	Puede editar usuarios	6	editar_usuario
57	Puede eliminar usuarios	6	eliminar_usuario
58	Puede ver usuarios	6	ver_usuarios
59	Puede sumar puma puntos	6	sumar_pumapuntos
60	Puede rentar productos	6	rentar_producto
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-10-24 10:03:36.669375+00	318211073	318211073 -> admin	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Email address", "Groups", "User permissions", "Contrasenia temp", "Apellido materno", "N\\u00famero de celular", "Carrera", "Tipo de usuario"]}}]	6	318211073
2	2024-10-24 10:08:40.013622+00	328211073	328211073 -> proveedor	1	[{"added": {}}]	6	318211073
3	2024-10-24 10:12:23.354921+00	348211073	348211073 -> usuario	1	[{"added": {}}]	6	318211073
4	2024-10-24 10:13:11.601186+00	AJED97840314	AJED97840314 -> Ajedrez	1	[{"added": {}}]	8	318211073
5	2024-10-24 10:14:53.406681+00	JUEG67140064	JUEG67140064 -> Juego de mesa GO	1	[{"added": {}}]	8	318211073
6	2024-10-24 10:19:28.662247+00	COMP40721534	COMP40721534 -> Computadora portátil	1	[{"added": {}}]	8	318211073
7	2024-10-24 10:21:00.061225+00	TABL37405456	TABL37405456 -> Tableta Android	1	[{"added": {}}]	8	318211073
8	2024-10-24 10:22:54.306195+00	AUDI07217584	AUDI07217584 -> Audífonos con cancelación de ruido	1	[{"added": {}}]	8	318211073
9	2024-10-24 10:25:52.230426+00	BALO34895495	BALO34895495 -> Balón de fútbol	1	[{"added": {}}]	8	318211073
10	2024-10-24 10:27:23.713991+00	UEGO11066862	UEGO11066862 -> uego de cartas "Uno"	1	[{"added": {}}]	8	318211073
11	2024-10-24 10:28:01.216317+00	R-4F7C0	R-4F7C0 -> 348211073 -> usuario -> JUEG67140064 -> Juego de mesa GO	1	[{"added": {}}]	9	318211073
12	2024-10-24 10:30:47.816278+00	358211073	358211073 -> usuario	1	[{"added": {}}]	6	318211073
13	2024-10-24 10:31:16.281664+00	R-E3BDB	R-E3BDB -> 358211073 -> usuario -> TABL37405456 -> Tableta Android	1	[{"added": {}}]	9	318211073
14	2024-10-24 11:11:26.688605+00	358211073	358211073 -> usuario	2	[{"changed": {"fields": ["User permissions"]}}]	6	318211073
15	2024-10-24 11:23:18.948857+00	358211073	358211073 -> usuario	2	[{"changed": {"fields": ["User permissions"]}}]	6	318211073
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	usuarios	superusuario
7	usuarios	usuario
8	productos	producto
9	rentas	renta
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-10-24 09:32:48.467231+00
2	contenttypes	0002_remove_content_type_name	2024-10-24 09:32:48.482862+00
3	auth	0001_initial	2024-10-24 09:32:48.551823+00
4	auth	0002_alter_permission_name_max_length	2024-10-24 09:32:48.565778+00
5	auth	0003_alter_user_email_max_length	2024-10-24 09:32:48.574514+00
6	auth	0004_alter_user_username_opts	2024-10-24 09:32:48.591709+00
7	auth	0005_alter_user_last_login_null	2024-10-24 09:32:48.604453+00
8	auth	0006_require_contenttypes_0002	2024-10-24 09:32:48.612295+00
9	auth	0007_alter_validators_add_error_messages	2024-10-24 09:32:48.619716+00
10	auth	0008_alter_user_username_max_length	2024-10-24 09:32:48.635906+00
11	auth	0009_alter_user_last_name_max_length	2024-10-24 09:32:48.650096+00
12	auth	0010_alter_group_name_max_length	2024-10-24 09:32:48.666512+00
13	auth	0011_update_proxy_permissions	2024-10-24 09:32:48.676813+00
14	auth	0012_alter_user_first_name_max_length	2024-10-24 09:32:48.69261+00
15	usuarios	0001_initial	2024-10-24 09:32:48.788444+00
16	admin	0001_initial	2024-10-24 09:32:48.832402+00
17	admin	0002_logentry_remove_auto_add	2024-10-24 09:32:48.848628+00
18	admin	0003_logentry_add_action_flag_choices	2024-10-24 09:32:48.88351+00
19	productos	0001_initial	2024-10-24 09:32:48.917429+00
20	productos	0002_initial	2024-10-24 09:32:48.951386+00
21	rentas	0001_initial	2024-10-24 09:32:48.986769+00
22	rentas	0002_initial	2024-10-24 09:32:49.036659+00
23	sessions	0001_initial	2024-10-24 09:32:49.053827+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
sjskehuma8jjboya6gqrgx8ehsvbhr43	.eJxVzc0OwiAQBOB34WwItMAuHr33GQg_i1QNTUp7Mr67NOlBz_PNzJs5v2_F7Y1WNyd2ZaPCQUoBI7v8ZsHHJ9UDpIev94XHpW7rHPhB-Jk2Pi2JXrfT_g0U30pvU9ZKeYkICKR0fzMqGySBESSITEmBtdoHGLLFmLIhCSEk2yEYPbLPF_wsOO8:1t3vxU:y6CxzJBPG613JEtSCnxqprfjF2AxENKK8slCsUxlF4M	2024-11-07 11:24:52.263888+00
\.


--
-- Data for Name: productos_producto; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.productos_producto (codigo, nombre, descripcion, existencia, pumapuntos, dias_renta, imagen, propietario_id) FROM stdin;
AJED97840314	Ajedrez	Juego de ajedrez chico.	3	50	4	productos_imagenes/ajredrez_juego.jpg	328211073
JUEG67140064	Juego de mesa GO	Tablero de GO + fichas	6	70	3	productos_imagenes/go_tablero.jpg	318211073
COMP40721534	Computadora portátil	omputadora portátil de alto rendimiento con pantalla de 15.6", procesador Intel i5, 8GB de RAM y 256GB SSD. Ideal para trabajos académicos y proyectos creativos.	10	50	7	productos_imagenes/portatil.jpg	318211073
TABL37405456	Tableta Android	Tableta de 10", resolución Full HD, 64GB de almacenamiento, perfecta para ver series y películas o tomar notas en clase.	3	60	6	productos_imagenes/tablet.jpg	318211073
AUDI07217584	Audífonos con cancelación de ruido	Audífonos inalámbricos con cancelación activa de ruido, batería de larga duración y sonido de alta calidad. Perfectos para estudiar sin distracciones. Color: blanco	10	20	5	productos_imagenes/audifonos-in-cancelacion.jpg	318211073
BALO34895495	Balón de fútbol	Balón de fútbol oficial de la liga, tamaño 5, ideal para partidos y entrenamiento.	5	50	3	productos_imagenes/futbol_balon.jpg	328211073
UEGO11066862	uego de cartas "Uno"	Clásico juego de cartas "Uno", ideal para disfrutar en grupo. Regla sencilla y diversión garantizada.	15	25	5	productos_imagenes/juego_uno.jpg	318211073
\.


--
-- Data for Name: rentas_renta; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.rentas_renta (id_renta, fecha_renta, fecha_devolucion_estimada, fecha_devolucion, estado, pumapuntos_obtenidos, producto_id, usuario_id) FROM stdin;
R-4F7C0	2024-10-24 10:28:01.213283+00	\N	\N	R	35	JUEG67140064	348211073
R-E3BDB	2024-10-24 10:31:16.281664+00	\N	\N	R	30	TABL37405456	358211073
\.


--
-- Data for Name: usuarios_superusuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuarios_superusuario (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, numero_cuenta, contrasenia_temp, nombre, apellido_paterno, apellido_materno, celular, correo, carrera, rol, tipo_usuario) FROM stdin;
pbkdf2_sha256$870000$WizaWvEBTtNsGq9qH6Ff3k$jRPkjiU1xnAUlUN6wjIrwXY8MGpAL7LYyTbOZ50OkqA=	2024-10-24 10:59:00.278236+00	f	simon22	Simon	Sima	simonsima22@unam.mx	f	t	2024-10-24 10:03:48+00	328211073	simon2222	Simón	Sima	Montes	5545658900	simonsima22@unam.mx	biologia	proveedor	estudiante
pbkdf2_sha256$870000$v3A61UOOqsPFTtBrrhC1Ln$LgdDkMaHFn5d3+w+v7j1yMmDXTFRZMGj5oh/0/IP3Vs=	2024-10-24 11:11:55+00	f	del444	Delfino	Delfinez	delfi444@unam.mx	f	t	2024-10-24 10:28:16+00	358211073	gogo22	Delfino	Delfinez	Gonzalez	5567893455	delfi444@unam.mx	biologia	usuario	estudiante
pbkdf2_sha256$870000$EtJSahFzcRk6Q2OAXLx0RP$6tdtJIoQy8M22dorH9WL17G7N8heRkxZyebfu74H4uA=	2024-10-24 11:24:29.943406+00	t	light	Luz	Rey	lmaria.reyes221b@ciencias.unam.mx	t	t	2024-10-24 09:54:44+00	318211073	221b	Luz	Reyes	Ramos	5545678909	lmaria.reyes221b@ciencias.unam.mx	computacion	admin	estudiante
pbkdf2_sha256$870000$gJ7QSlyOEBOmVRT6rq1Tog$TfytHohMtrnibnG6ySq8u+6obuJx6k/FPRSZIoX6Bes=	2024-10-24 11:24:52.261872+00	f	filemon33	Filemon	Santacruz	santa33@ciencias.unam.mx	f	t	2024-10-24 10:08:48+00	348211073	file333	Filemón	Santacruz	Sánchez	5567890534	santa33@ciencias.unam.mx	academico	usuario	trabajador
\.


--
-- Data for Name: usuarios_superusuario_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuarios_superusuario_groups (id, superusuario_id, group_id) FROM stdin;
1	318211073	1
2	328211073	2
3	348211073	3
4	358211073	3
\.


--
-- Data for Name: usuarios_superusuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuarios_superusuario_user_permissions (id, superusuario_id, permission_id) FROM stdin;
19	358211073	51
20	358211073	60
\.


--
-- Data for Name: usuarios_usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.usuarios_usuario (id, pumapuntos, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 31, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 15, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: usuarios_superusuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.usuarios_superusuario_groups_id_seq', 4, true);


--
-- Name: usuarios_superusuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.usuarios_superusuario_user_permissions_id_seq', 20, true);


--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.usuarios_usuario_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: productos_producto productos_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.productos_producto
    ADD CONSTRAINT productos_producto_pkey PRIMARY KEY (codigo);


--
-- Name: rentas_renta rentas_renta_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.rentas_renta
    ADD CONSTRAINT rentas_renta_pkey PRIMARY KEY (id_renta);


--
-- Name: usuarios_superusuario usuarios_superusuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario
    ADD CONSTRAINT usuarios_superusuario_correo_key UNIQUE (correo);


--
-- Name: usuarios_superusuario_groups usuarios_superusuario_gr_superusuario_id_group_id_8b7c5612_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_groups
    ADD CONSTRAINT usuarios_superusuario_gr_superusuario_id_group_id_8b7c5612_uniq UNIQUE (superusuario_id, group_id);


--
-- Name: usuarios_superusuario_groups usuarios_superusuario_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_groups
    ADD CONSTRAINT usuarios_superusuario_groups_pkey PRIMARY KEY (id);


--
-- Name: usuarios_superusuario usuarios_superusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario
    ADD CONSTRAINT usuarios_superusuario_pkey PRIMARY KEY (numero_cuenta);


--
-- Name: usuarios_superusuario_user_permissions usuarios_superusuario_us_superusuario_id_permissi_0f3585d5_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_user_permissions
    ADD CONSTRAINT usuarios_superusuario_us_superusuario_id_permissi_0f3585d5_uniq UNIQUE (superusuario_id, permission_id);


--
-- Name: usuarios_superusuario_user_permissions usuarios_superusuario_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_user_permissions
    ADD CONSTRAINT usuarios_superusuario_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: usuarios_superusuario usuarios_superusuario_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario
    ADD CONSTRAINT usuarios_superusuario_username_key UNIQUE (username);


--
-- Name: usuarios_usuario usuarios_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_usuario
    ADD CONSTRAINT usuarios_usuario_pkey PRIMARY KEY (id);


--
-- Name: usuarios_usuario usuarios_usuario_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_usuario
    ADD CONSTRAINT usuarios_usuario_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_admin_log_user_id_c564eba6_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6_like ON public.django_admin_log USING btree (user_id varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: productos_producto_codigo_791f094d_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX productos_producto_codigo_791f094d_like ON public.productos_producto USING btree (codigo varchar_pattern_ops);


--
-- Name: productos_producto_propietario_id_34181590; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX productos_producto_propietario_id_34181590 ON public.productos_producto USING btree (propietario_id);


--
-- Name: productos_producto_propietario_id_34181590_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX productos_producto_propietario_id_34181590_like ON public.productos_producto USING btree (propietario_id varchar_pattern_ops);


--
-- Name: rentas_renta_id_renta_9c8b27e3_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX rentas_renta_id_renta_9c8b27e3_like ON public.rentas_renta USING btree (id_renta varchar_pattern_ops);


--
-- Name: rentas_renta_producto_id_79921aca; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX rentas_renta_producto_id_79921aca ON public.rentas_renta USING btree (producto_id);


--
-- Name: rentas_renta_producto_id_79921aca_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX rentas_renta_producto_id_79921aca_like ON public.rentas_renta USING btree (producto_id varchar_pattern_ops);


--
-- Name: rentas_renta_usuario_id_2cbf3b73; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX rentas_renta_usuario_id_2cbf3b73 ON public.rentas_renta USING btree (usuario_id);


--
-- Name: rentas_renta_usuario_id_2cbf3b73_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX rentas_renta_usuario_id_2cbf3b73_like ON public.rentas_renta USING btree (usuario_id varchar_pattern_ops);


--
-- Name: usuarios_superusuario_correo_ce6a2470_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_correo_ce6a2470_like ON public.usuarios_superusuario USING btree (correo varchar_pattern_ops);


--
-- Name: usuarios_superusuario_groups_group_id_b8c64860; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_groups_group_id_b8c64860 ON public.usuarios_superusuario_groups USING btree (group_id);


--
-- Name: usuarios_superusuario_groups_superusuario_id_2441a83c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_groups_superusuario_id_2441a83c ON public.usuarios_superusuario_groups USING btree (superusuario_id);


--
-- Name: usuarios_superusuario_groups_superusuario_id_2441a83c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_groups_superusuario_id_2441a83c_like ON public.usuarios_superusuario_groups USING btree (superusuario_id varchar_pattern_ops);


--
-- Name: usuarios_superusuario_numero_cuenta_7ac8222f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_numero_cuenta_7ac8222f_like ON public.usuarios_superusuario USING btree (numero_cuenta varchar_pattern_ops);


--
-- Name: usuarios_superusuario_us_superusuario_id_f31b0347_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_us_superusuario_id_f31b0347_like ON public.usuarios_superusuario_user_permissions USING btree (superusuario_id varchar_pattern_ops);


--
-- Name: usuarios_superusuario_user_permissions_permission_id_4239e12c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_user_permissions_permission_id_4239e12c ON public.usuarios_superusuario_user_permissions USING btree (permission_id);


--
-- Name: usuarios_superusuario_user_permissions_superusuario_id_f31b0347; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_user_permissions_superusuario_id_f31b0347 ON public.usuarios_superusuario_user_permissions USING btree (superusuario_id);


--
-- Name: usuarios_superusuario_username_1fd37ea1_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_superusuario_username_1fd37ea1_like ON public.usuarios_superusuario USING btree (username varchar_pattern_ops);


--
-- Name: usuarios_usuario_user_id_27bf56db_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX usuarios_usuario_user_id_27bf56db_like ON public.usuarios_usuario USING btree (user_id varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_ FOREIGN KEY (user_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: productos_producto productos_producto_propietario_id_34181590_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.productos_producto
    ADD CONSTRAINT productos_producto_propietario_id_34181590_fk_usuarios_ FOREIGN KEY (propietario_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rentas_renta rentas_renta_producto_id_79921aca_fk_productos_producto_codigo; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.rentas_renta
    ADD CONSTRAINT rentas_renta_producto_id_79921aca_fk_productos_producto_codigo FOREIGN KEY (producto_id) REFERENCES public.productos_producto(codigo) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rentas_renta rentas_renta_usuario_id_2cbf3b73_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.rentas_renta
    ADD CONSTRAINT rentas_renta_usuario_id_2cbf3b73_fk_usuarios_ FOREIGN KEY (usuario_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuarios_superusuario_user_permissions usuarios_superusuari_permission_id_4239e12c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_user_permissions
    ADD CONSTRAINT usuarios_superusuari_permission_id_4239e12c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuarios_superusuario_groups usuarios_superusuari_superusuario_id_2441a83c_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_groups
    ADD CONSTRAINT usuarios_superusuari_superusuario_id_2441a83c_fk_usuarios_ FOREIGN KEY (superusuario_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuarios_superusuario_user_permissions usuarios_superusuari_superusuario_id_f31b0347_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_user_permissions
    ADD CONSTRAINT usuarios_superusuari_superusuario_id_f31b0347_fk_usuarios_ FOREIGN KEY (superusuario_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuarios_superusuario_groups usuarios_superusuario_groups_group_id_b8c64860_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_superusuario_groups
    ADD CONSTRAINT usuarios_superusuario_groups_group_id_b8c64860_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: usuarios_usuario usuarios_usuario_user_id_27bf56db_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.usuarios_usuario
    ADD CONSTRAINT usuarios_usuario_user_id_27bf56db_fk_usuarios_ FOREIGN KEY (user_id) REFERENCES public.usuarios_superusuario(numero_cuenta) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

