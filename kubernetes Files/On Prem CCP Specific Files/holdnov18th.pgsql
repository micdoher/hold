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
\.


--
-- Name: bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pguser
--

SELECT pg_catalog.setval('public.bookmark_id_seq', 19, true);


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

