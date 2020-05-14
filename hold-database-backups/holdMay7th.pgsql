--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bookmark; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE public.bookmark (
    id integer NOT NULL,
    food_word_1 text NOT NULL,
    food_word_2 text,
    food_word_3 text,
    date timestamp without time zone,
    amount_1 integer NOT NULL,
    amount_2 integer,
    amount_3 integer,
    weather text,
    mood text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.bookmark OWNER TO pguser;

--
-- Name: bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookmark_id_seq OWNER TO pguser;

--
-- Name: bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.bookmark_id_seq OWNED BY public.bookmark.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: pguser; Tablespace: 
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80),
    email character varying(120),
    password_hash character varying
);


ALTER TABLE public."user" OWNER TO pguser;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: pguser
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO pguser;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pguser
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.bookmark ALTER COLUMN id SET DEFAULT nextval('public.bookmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: bookmark; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public.bookmark (id, food_word_1, food_word_2, food_word_3, date, amount_1, amount_2, amount_3, weather, mood, user_id) FROM stdin;
1	omelette	coffee		2018-11-10 22:16:27.329351	2	2	\N	sunny	high	1
2	eggs	pancakes	coffee	2018-11-11 21:21:27.15507	2	2	2	sunny	high	1
3	rice	coffee		2018-11-11 21:55:17.626177	2	1	\N	sunny	high	1
4	omelette	coffee		2018-11-12 08:16:01.323491	2	1	\N	rainy	tired	1
5	salad			2018-11-12 13:51:32.958623	3	\N	\N	rainy	high	1
6	rice			2018-11-13 09:00:38.480463	3	\N	\N	rainy	high	1
7	cereal bar	coffee		2018-11-13 09:02:01.664096	2	1	\N	rainy	high	1
8	omelette	salad		2018-11-13 15:30:17.777395	2	2	\N	sunny	high	1
9	pasta			2018-11-13 20:09:16.36752	2	\N	\N	cloudy	low	1
10	pasta			2018-11-13 20:09:16.377542	2	\N	\N	cloudy	low	1
11	bread	coffee		2018-11-14 09:30:54.272882	2	1	\N	sunny	allergies	1
12	bread	olive oil	coffee	2018-11-15 06:46:34.841999	2	1	1	sunny	high	1
13	coffee			2018-11-15 12:49:46.119737	1	\N	\N	sunny	allergies	1
14	beef	chips	red-wine	2018-11-15 20:22:51.924697	2	1	1		allergies	1
15	pasta	red-wine		2018-11-15 20:23:21.579621	2	1	\N		allergies	1
16	cereal bar	coffee		2018-11-16 07:53:22.098064	2	1	\N		allergies	1
17	red wine			2018-11-16 09:03:29.589634	1	\N	\N		allergies	1
18	bread	olive oil	coffee	2018-11-19 07:25:00.05335	2	2	1		low	1
19	curry	rice	coffee	2018-11-19 11:58:20.996075	3	2	1	sunny	low	1
20	nuts	cereal bar	coffee	2018-11-20 07:43:17.910149	1	2	2	cloudy	allergies	1
21	cous cous	tomatoe sauce	chick peas	2018-11-20 16:01:28.666485	2	2	2	sunny	wind	1
22	cous cous	tomatoe sauce	chick peas	2018-11-20 16:01:28.677631	2	2	2	sunny	wind	1
23	bread	coffee	olive oil	2018-11-21 07:07:44.416386	2	2	2	sunny	wind	1
24	duck	salad	coffee	2018-11-21 12:38:31.463169	2	1	1	sunny	allergies	1
25	red beans	fish	mussels	2018-11-21 21:39:29.457311	3	2	1		tired	1
26	bread	coffee		2018-11-22 07:02:49.551271	2	2	\N	sunny	high	1
27	quiche	radish	red wine	2018-11-22 21:43:12.456738	2	1	2		wind	1
28	eggs	coffee		2018-11-23 06:38:24.990883	3	2	\N		high	1
33	fish	pork	red wine	2018-11-23 16:39:56.217593	2	2	2		wind	1
34	cereal bar	coffee		2018-11-25 09:09:54.187615	2	2	\N	cloudy	allergies	1
35	eggs	coffee		2018-11-26 07:06:43.849037	2	2	\N	cloudy	tired	1
36	carrots	salad	tuna	2018-11-26 13:28:26.478654	2	2	2		tired	1
37	coffee			2018-11-26 13:28:54.229412	2	\N	\N		tired	1
38	pine nuts	squash	pasta	2018-11-26 21:44:38.142678	1	2	1		high	1
39	red wine			2018-11-26 21:45:09.865286	2	\N	\N		high	1
40	eggs	coffee	cereal bar	2018-11-27 07:00:25.216073	2	2	1	cloudy	tired	1
41	paella	red wine		2018-11-27 20:30:57.323609	3	1	\N		high	1
42	eggs	coffee	bread	2018-11-28 10:53:48.878053	2	2	1	rainy	high	1
43	fish		red wine	2018-11-28 21:21:10.508687	2	\N	3		high	1
44	coffee	eggs		2018-11-29 11:03:47.078954	2	2	\N		low	1
45	biscuits	banana	tea	2018-11-29 16:14:50.070973	3	1	1	cloudy	high	1
46	beef	tomatoe sauce	red wine	2018-11-29 19:38:41.196878	2	1	2		high	1
47	beef	coffee	red wine	2018-11-30 14:42:31.062823	2	2	2	sunny	high	1
48	potatoes		red wine	2018-11-30 22:35:19.197699	2	\N	2		wind	1
49	fish	potatoes	coffee	2018-12-03 13:49:54.718526	1	2	2		high	1
50	eggs	tomatoe sauce	coffee	2018-12-04 10:07:35.276306	2	2	2	sunny	tired eyes	1
51	salad	coffee		2018-12-05 15:46:24.647568	2	2	\N		wind	1
52	eggs	bread	coffee	2018-12-06 09:34:38.781258	2	2	1	cloudy	high	1
53	eggs	bread	coffee	2018-12-06 09:34:38.792037	2	2	1	cloudy	high	1
54	bread	coffee		2018-12-10 06:54:40.158229	3	2	\N		high	1
55	bread	olive oil	coffee	2018-12-11 07:58:06.125505	2	2	2		high	1
56	fish	rice	coffee	2018-12-12 13:32:17.943434	1	2	2		high	1
57	salad	bread	vegtable soup	2018-12-12 21:53:47.258954	1	2	3		allergies	1
58	red wine			2018-12-12 21:54:30.290432	2	\N	\N		neutral	1
59	fish	potatoes	coffee	2018-12-13 12:53:54.062418	2	1	1		high	1
60	pork	chips	eggs	2018-12-14 18:31:54.149531	2	2	2	sunny	neutral	1
61	paella	coffee		2018-12-17 11:52:16.527655	3	2	\N	cloudy	tired	1
62	potatoes	fish	salad	2018-12-17 20:27:43.781772	2	2	1		wind	1
63	eggs	bread	coffee	2018-12-20 07:11:29.936553	2	1	2		neutral	1
64	bread	coffee		2018-12-29 09:27:15.349919	2	2	\N		neutral	1
65	bread	coffee		2019-01-07 07:40:02.365923	2	2	\N		high	1
66	rice	coffee		2019-01-07 18:30:08.535768	2	2	\N		neutral	1
67	eggs	coffee		2019-01-08 09:11:42.57739	2	3	\N		tired	1
68	chicken	potatoes	white wine	2019-01-08 20:53:17.590267	2	2	1		tired	1
69	bread	coffee		2019-01-09 06:50:22.245822	2	2	\N		tired	1
70	fennel			2019-01-09 08:35:44.186134	1	\N	\N		allergies	1
71	almonds			2019-01-09 08:37:34.223448	1	\N	\N		allergies	1
72	tortilla	tuna	tomatoe sauce	2019-01-09 14:32:31.693183	2	1	2		tired	1
73	cereal bar	coffee		2019-01-10 07:24:29.602226	3	2	\N	sunny	allergies	1
74	eggs	coffee		2019-01-14 10:25:27.506918	3	2	\N		high	1
75	vegtable soup	hard chese	soft chese	2019-01-28 19:44:50.718649	2	2	1	sunny	high	1
76	red wine			2019-01-28 19:45:08.092399	1	\N	\N		tired	1
77	cereal bar	coffee		2019-01-29 08:40:37.443092	3	2	\N		allergies	1
78	cereal bar	coffee		2019-01-30 08:52:02.50528	2	2	\N	sunny	allergies	1
79	vegtable soup	chicken	salad	2019-01-30 12:18:10.480933	2	2	2		high	1
80	pasta	tomatoe sauce	red wine	2019-01-30 20:16:03.375318	3	2	1		tired	1
81	bread	coffee	olive oil	2019-01-31 07:37:59.248157	3	2	1	rainy	neutral	1
82	potatoes	salad	coffee	2019-01-31 13:11:30.351383	2	3	1		high	1
83	eggs	bread	coffee	2019-02-01 06:56:20.284036	2	2	2		neutral	1
84	beef	sweets	red wine	2019-02-01 15:21:06.316602	2	2	2		neutral	1
87	rice	coffee		2019-02-04 13:40:37.558876	2	1	\N		neutral	1
88	nuts	eggs	bread	2019-02-05 06:58:54.301825	2	2	1		neutral	1
89	coffee			2019-02-05 06:59:10.362879	2	\N	\N		neutral	1
90	cereal bar	coffee		2019-02-06 06:40:03.375443	2	2	\N		neutral	1
91	cereal bar	coffee		2019-02-07 06:50:49.762496	2	2	\N		neutral	1
92	cereal bar	coffee		2019-02-08 08:45:45.142188	2	2	\N	cloudy	high	1
93	chicken	red wine	beer	2019-02-08 14:52:26.251422	1	2	1	sunny	high	1
94	pancakes			2019-02-10 08:05:04.562459	3	\N	\N		allergies	1
95	bread	olive oil	coffee	2019-02-11 09:17:52.504903	3	2	2		neutral	1
96	salad	beef	coffee	2019-02-11 15:26:52.829675	3	1	1	sunny	tired	1
97	eggs	bread	coffee	2019-02-12 07:37:08.280135	2	2	1	sunny	allergies	1
98	lamb	salad	coffee	2019-02-12 14:37:43.776392	2	3	2		allergies	1
99	noodles	seafood		2019-02-12 19:53:03.241319	3	2	\N		high	1
100	bread	coffee	nuts	2019-02-13 09:30:21.309091	2	2	1	sunny	allergies	1
101	pasta	seafood	white wine	2019-02-14 19:57:04.212508	3	2	1	sunny	neutral	1
102	cereal bar	coffee		2019-02-15 07:03:33.728758	2	2	\N	sunny	neutral	1
103	cereal bar	coffee		2019-02-16 07:04:26.147142	2	2	\N	sunny	neutral	1
104	bread	coffee		2019-02-18 07:22:39.267192	2	1	\N		neutral	1
105	bread	olive oil	coffee	2019-02-22 09:18:41.065719	3	2	2		tired	1
106	eggs	coffee		2019-02-24 07:55:41.166506	2	2	\N	sunny	high	1
107	chicken	vegtable soup	soft cheese	2019-02-26 19:56:47.018732	1	2	1		tired	1
108	cereal bar	coffee		2019-02-27 07:15:41.632819	2	2	\N	sunny	tired	1
109	vegtable soup	chicken	red wine	2019-02-27 21:23:27.865361	2	1	1		high	1
110	chicken	stir-fry	rice	2019-02-28 20:32:05.029663	2	3	3		low	1
111	bread	olive oil	coffee	2019-03-01 08:25:08.711706	2	1	2	sunny	tired	1
112	beef	potatoes	red wine	2019-03-03 16:11:26.1673	2	2	3	sunny	neutral	1
113	dhal curry	rice	red wine	2019-03-03 19:28:26.625457	3	3	1	cloudy	low	1
115	eggs			2019-03-04 13:42:27.269271	1	\N	\N		high	1
116	bread	olive oil	coffee	2019-03-05 09:22:25.107842	3	2	3		neutral	1
117	peppers	beef	rice	2019-03-05 21:50:39.569579	2	1	2		neutral	1
118	eggs	bread	coffee	2019-03-06 07:12:59.471109	2	2	1	cloudy	neutral	1
119	beef	pasta	red wine	2019-03-07 19:40:08.743979	2	2	2		tired	1
120	bread	coffee		2019-03-08 08:37:04.002448	2	2	\N		tired	1
121	eggs	coffee	pork	2019-03-15 10:40:06.107516	2	1	1	sunny	tired	1
122	bread	olive oil	coffee	2019-03-19 09:43:36.650314	3	2	2	sunny	neutral	1
123	potatoes	salad	curry	2019-03-19 14:12:39.072275	2	2	1		neutral	1
124	bread	coffee	olive oil	2019-03-20 08:41:31.483689	2	1	2	sunny	neutral	1
125	gnocchi			2019-03-20 08:41:48.274997	1	\N	\N		neutral	1
126	peppers	pasta	red wine	2019-03-20 20:25:52.284239	1	3	2	sunny	high	1
127	eggs	bread	coffee	2019-03-21 08:16:38.193957	2	2	1	sunny	allergies	1
128	salad	avocados	coffee	2019-03-25 15:16:19.394809	4	1	1	sunny	high	1
129	avocados	beef	peppers	2019-03-27 19:33:32.072685	2	1	1	sunny	high	1
130	fish	potatoes	coffee	2019-03-28 15:19:43.987655	1	2	2	sunny	high	1
131	beef	potatoes	salad	2019-03-29 15:06:08.883036	3	2	1	sunny	neutral	1
132	chips	red wine	coffee	2019-03-29 15:07:27.101415	2	1	1		neutral	1
133	paella	red wine	crisps	2019-03-29 20:42:06.781559	4	2	1		neutral	1
134	pancakes	coffee		2019-03-30 07:53:37.957452	4	2	\N		neutral	1
135	pork	bread		2019-04-01 20:19:13.563142	1	1	2		neutral	1
136	croissante	coffee		2019-04-08 07:57:20.670725	2	2	\N		tired	1
137	tomatoe sauce	eggs		2019-04-09 15:47:42.311455	2	2	\N		tired	1
138	bread	olive oil	coffee	2019-04-11 08:40:00.841422	3	2	2	cloudy	allergies	1
\.


--
-- Name: bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.bookmark_id_seq', 138, true);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: pguser
--

COPY public."user" (id, username, email, password_hash) FROM stdin;
1	micdoher	micdoher@gmail.com	pbkdf2:sha256:50000$O3MVaO2w$1cb99cbc26ea952274fdf504ba99e62ca706d69ce9bc61a8ef9a0abb1c7cf5eb
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT bookmark_pkey PRIMARY KEY (id);


--
-- Name: user_email_key; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_username_key; Type: CONSTRAINT; Schema: public; Owner: pguser; Tablespace: 
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: bookmark_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pguser
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT bookmark_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pguser
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM pguser;
GRANT ALL ON SCHEMA public TO pguser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

