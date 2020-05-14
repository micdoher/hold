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
\.


--
-- Name: bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.bookmark_id_seq', 73, true);


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

