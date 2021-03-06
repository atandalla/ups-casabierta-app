--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id_campus integer NOT NULL,
    nombre_campus character varying(200) NOT NULL,
    sede character varying(50) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_campus_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_campus_seq OWNER TO postgres;

--
-- Name: campus_id_campus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_id_campus_seq OWNED BY public.campus.id_campus;


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id_carrera integer NOT NULL,
    id_campus integer NOT NULL,
    usuario character varying(50) NOT NULL,
    clave character varying(50) NOT NULL,
    nombre_carrera character varying(200) NOT NULL,
    director character varying(200),
    contacto character varying(200),
    perfil_egreso character varying,
    malla_curricular character varying,
    facebook character varying,
    instagram character varying,
    portada character varying
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_carrera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_id_carrera_seq OWNER TO postgres;

--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_carrera_seq OWNED BY public.carrera.id_carrera;


--
-- Name: recurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recurso (
    id_recurso integer NOT NULL,
    id_carrera integer NOT NULL,
    multimedia character varying NOT NULL,
    titulo character varying(200) NOT NULL,
    descripcion character varying(500),
    url_info character varying
);


ALTER TABLE public.recurso OWNER TO postgres;

--
-- Name: recurso_id_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recurso_id_recurso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurso_id_recurso_seq OWNER TO postgres;

--
-- Name: recurso_id_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recurso_id_recurso_seq OWNED BY public.recurso.id_recurso;


--
-- Name: campus id_campus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN id_campus SET DEFAULT nextval('public.campus_id_campus_seq'::regclass);


--
-- Name: carrera id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id_carrera SET DEFAULT nextval('public.carrera_id_carrera_seq'::regclass);


--
-- Name: recurso id_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurso ALTER COLUMN id_recurso SET DEFAULT nextval('public.recurso_id_recurso_seq'::regclass);


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id_campus, nombre_campus, sede) FROM stdin;
1	Campus El Gir??n	Quito
2	Campus Sur	Quito
3	Extensi??n Cayambe	Quito
4	Matriz	Cuenca
5	Campus Centenario	Guayaquil
6	Campus Mar??a Auxiliadora	Guayaquil
\.


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (id_carrera, id_campus, usuario, clave, nombre_carrera, director, contacto, perfil_egreso, malla_curricular, facebook, instagram, portada) FROM stdin;
1	1	???adminempresa_giron	ups2022	Administraci??n de Empresas	Grace Lilian  Moreano Gerra	gmoreano@ups.edu.ec		https://administracionempresasuio.ups.edu.ec/documents/20121/485801/Administraci%C3%B3n+de+Empresas+-+MC.pdf			\N
2	1	biomedicina_giron	ups2022	Biomedicina	Fabi??n Rodrigo Narv??ez Espinoza	fnarvaeze@ups.edu.ec 		https://biomedicinauio.ups.edu.ec/documents/20121/485966/Biomedicina+-+MC.pdf			\N
3	1	biotecnologia_giron	ups2022	Biotecnolog??a	Mar??a Elena Maldonado Rodriguez	mmaldonado@ups.edu.ec		https://biotecnologiauio.ups.edu.ec/documents/20121/486002/Biotecnolog%C3%ADa+-+MC+-++CUE+-+UIO.pdf			\N
4	1	comunicacion_giron	ups2022	Comunicaci??n	Narcisa Jessenia Medranda Morales	nmedranda@ups.edu.ec		https://comunicacionuio.ups.edu.ec/documents/20121/486045/Comunicaci%C3%B3n+-+MC.pdf			\N
5	1	dise??omultimedia_giron	ups2022	Dise??o Multimedia	Narcisa Jessenia Medranda Morales	nmedranda@ups.edu.ec		https://disenomultimediauio.ups.edu.ec/documents/20121/486105/Dise%C3%B1o+Multimedia+-+MC.pdf			\N
6	1	contabilidadauditoria_giron	ups2022	Contabilidad y Auditor??a	Freddy Gonzalo Araque Montenegro	faraque@ups.edu.ec		https://contabilidadyauditoriauio.ups.edu.ec/documents/20121/486060/Contabilidad+y+Auditor%C3%ADa+-+MC.pdf			\N
7	1	pedagogia_giron	ups2022	Pedagog??a	Ana Mar??a Narv??ez Garz??n 	anarvaez@ups.edu.ec		https://ww1.ups.edu.ec/documents/10184/745285/Pedagog%C3%ADa_m_Pedagog%C3%ADa+%2857%29.pdf/32b3acf6-a0e9-40c7-97b4-18c995dcd14b			\N
8	1	derecho_giron	ups2022	Derecho	Jorge Iv??n Rengel Maldonado	jrengel@ups.edu.ec		https://derechouio.ups.edu.ec/documents/20121/486075/Derecho+-+MC.pdf			\N
9	1	educacionbasica_giron	ups2022	Educaci??n B??sica	Ana Mar??a Narv??ez Garz??n	anarvaez@ups.edu.ec		https://educacionbasicauio.ups.edu.ec/documents/20121/486150/Educaci%C3%B3n+B%C3%A1sica+-+MC+-++CUE+-+UIO.pdf			\N
10	1	economia_giron	ups2022	Econom??a	Dargenis La Rosa Torres	dla@ups.edu.ec		https://economiauio.ups.edu.ec/documents/20121/486120/Econom%C3%ADa+-+MC.pdf			\N
11	1	edicacioninicial_giron	ups2022	Educaci??n Inicial	Ana Mar??a Narv??ez Garz??n	anarvaez@ups.edu.ec		https://educacioninicialuio.ups.edu.ec/documents/20121/486177/Educaci%C3%B3n+Inicial+-+MC+-++CUE+-+UIO.pdf			\N
12	1	filosofiaeducacion_giron	ups2022	Filosof??a y Educaci??n 	Robert German Garc??a Iturralde	rgarcia@ups.edu.ec					\N
13	1	gerencialiderazgo_giron	ups2022	Gerencia y Liderazgo	Freddy Gonzalo Araque	faraque@ups.edu.ec		https://gerenciayliderazgouio.ups.edu.ec/documents/20121/486346/Gerencia+y+Liderazgo+-+MC+-+UIO.pdf			\N
14	1	ingenieriaindustrial_giron	ups2022	Ingenier??a Industrial	Lelys Andr??s Ugalde Velasquez	lugalde@ups.edu.ec		https://industrialuio.ups.edu.ec/documents/20121/486459/Ingenier%C3%ADa+Industrial+-+MC+-+UIO.pdf			\N
15	1	psicologia_giron	ups2022	Psicolog??a	Gino Eduardo Grondona Opazo	ggrondona@ups.edu.ec		https://psicologiauio.ups.edu.ec/documents/20121/486601/Psicolog%C3%ADa+-+MC+-++CUE+-+UIO.pdf			\N
16	1	gestiondesarrollo_giron	ups2022	Gesti??n para el Desarrollo Local Sostenible	Pablo Ortiz Tirado	portirz@ups.edu.ec		https://ww1.ups.edu.ec/documents/10184/744161/Malla+Gesti%C3%B3n+para+el+Desarrollo+Local+Sostenible/aa40ff5a-a963-491b-b570-b5d5f15ee9ea			\N
17	1	antropologia_giron	ups2022	Antropolog??a Aplicada (Distancia)	Rub??n Dar??o Bravo Castillo	rbravo@ups.edu.ec		https://antropologiaenl.ups.edu.ec/documents/20121/485951/Antropolog%C3%ADa+-+MC.pdf			\N
18	1	educacionintercultural_giron	ups2022	Educaci??n Intercultural Biling??e (Distancia)	Sebasti??n Granda Merchan	sgranda@ups.edu.ec		https://eibenl.ups.edu.ec/documents/20121/486204/Educaci%C3%B3n+Intercultural+Biling%C3%BCe+-+MC.pdf			\N
19	1	arquitectura_giron	ups2022	Arquitectura				https://www.ups.edu.ec/documents/20121/1161547/Arquitectura+-+MC.pdf			\N
20	1	negociosdigitales_giron	ups2022	Negocios Digitales				https://negociosdigitalesuio.ups.edu.ec/documents/20121/1051455/Negocios+Digitales+-+MC.pdf			\N
30	3	agropecuaria_sur	ups2022	Agropecuaria	JNelson anss Beltr??n Gallardo	nbeltran@ups.edu.ec		https://agropecuariauio.ups.edu.ec/documents/20121/485936/Agropecuaria+-+MC+-+CUE+-+UIO.pdf			\N
31	3	enfermeria_sur	ups2022	Enfermer??a				https://enfermeriauio.ups.edu.ec/documents/20121/1051502/Enfermer%C3%ADa+-+MC.pdf			\N
21	2	computacion_sur	ups2022	Computaci??n	Patsy Malena Prieto Velez	pprieto@ups.edu.ec		https://computacionuio.ups.edu.ec/documents/20121/486030/Computaci%C3%B3n+-+MC.pdf			computacion.png
22	2	electricidad_sur	ups2022	Electricidad	Alexander ??guila Tellez	aaguila@ups.edu.ec		https://electricidaduio.ups.edu.ec/documents/20121/486301/Electricidad+-+MC.pdf			elec.png
23	2	electro_auto_sur	ups2022	Electr??nica y Automatizaci??n	Gustavo Javier Caiza Guanochanga	gcaiza@ups.edu.ec		https://electronicayautomatizacionuio.ups.edu.ec/documents/20121/486316/Electr%C3%B3nica+y+Automatizaci%C3%B3n+-+MC.pdf			electro.png
24	2	ambiental_sur	ups2022	Ingenier??a Ambiental	Alexandra Karina Pazmi??o Pacheco	apazminop@ups.edu.ec		https://ambientaluio.ups.edu.ec/documents/20121/486376/Ingenier%C3%ADa+Ambiental+-+MC+-++CUE+-+UIO.pdf			ambiental2.png
25	2	automotriz_sur	ups2022	Ingenier??a Automotriz	??ngel Geovanny Paucar Urdialez	apaucar@ups.edu.ec		https://automotrizuio.ups.edu.ec/documents/20121/486403/Ingenier%C3%ADa+Automotriz+-+MC.pdf			auto.png
26	2	civil_sur	ups2022	Ingenier??a Civil	Mar??a Gabriela Soria Pugo	msoria@ups.edu.ec		https://civiluio.ups.edu.ec/documents/20121/486418/Ingenier%C3%ADa+Civil+-+MC+-+UIO.pdf			civil.png
27	2	mecanica_sur	ups2022	Mec??nica	Sonia Elizabeth Gua??o Arias	sguano@ups.edu.ec		https://mecanicauio.ups.edu.ec/documents/20121/486486/Mec%C3%A1nica+-+MC+-++CUE+-+UIO.pdf			meca.png
28	2	mecatronica_sur	ups2022	Mecatr??nica	Luisa Fernanda Sotomayor Reinoso	lsotomayor@ups.edu.ec		https://mecatronicauio.ups.edu.ec/documents/20121/486501/Mecatr%C3%B3nica+-+MC.pdf			mecatronica.png
29	2	telecomunicaciones_sur	ups2022	Telecomunicaciones	Germ??n Vicenete Ar??valo Bermeo	garevalo@ups.edu.ec		https://telecomunicacionesuio.ups.edu.ec/documents/20121/486630/Teleomunicaciones+-+MC.pdf			tele.png
\.


--
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recurso (id_recurso, id_carrera, multimedia, titulo, descripcion, url_info) FROM stdin;
\.


--
-- Name: campus_id_campus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_campus_seq', 6, true);


--
-- Name: carrera_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_carrera_seq', 31, true);


--
-- Name: recurso_id_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recurso_id_recurso_seq', 1, false);


--
-- Name: campus campus_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pk PRIMARY KEY (id_campus);


--
-- Name: carrera carrera_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pk PRIMARY KEY (id_carrera);


--
-- Name: recurso recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT recurso_pk PRIMARY KEY (id_recurso);


--
-- Name: carrera campus_carrera_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT campus_carrera_fk FOREIGN KEY (id_campus) REFERENCES public.campus(id_campus);


--
-- Name: recurso carrera_recurso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recurso
    ADD CONSTRAINT carrera_recurso_fk FOREIGN KEY (id_carrera) REFERENCES public.carrera(id_carrera);


--
-- PostgreSQL database dump complete
--

