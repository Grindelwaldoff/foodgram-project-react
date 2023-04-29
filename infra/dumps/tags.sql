--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: main_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_tags (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    color character varying(18) NOT NULL,
    slug character varying(150) NOT NULL
);


ALTER TABLE public.main_tags OWNER TO postgres;

--
-- Name: main_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_tags_id_seq OWNER TO postgres;

--
-- Name: main_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_tags_id_seq OWNED BY public.main_tags.id;


--
-- Name: main_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_tags ALTER COLUMN id SET DEFAULT nextval('public.main_tags_id_seq'::regclass);


--
-- Data for Name: main_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_tags (id, name, color, slug) FROM stdin;
1	Украинская кухня	#FFD527	Ukrainian
2	Греческая кухня	#247EFF	Greece
3	Суп	#FFE27F	Soup
4	Салат	#66FF5B	Salat
\.


--
-- Name: main_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_tags_id_seq', 4, true);


--
-- Name: main_tags main_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_tags
    ADD CONSTRAINT main_tags_name_key UNIQUE (name);


--
-- Name: main_tags main_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_tags
    ADD CONSTRAINT main_tags_pkey PRIMARY KEY (id);


--
-- Name: main_tags main_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_tags
    ADD CONSTRAINT main_tags_slug_key UNIQUE (slug);


--
-- Name: main_tags_name_b21216e6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_tags_name_b21216e6_like ON public.main_tags USING btree (name varchar_pattern_ops);


--
-- Name: main_tags_slug_92646cf9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_tags_slug_92646cf9_like ON public.main_tags USING btree (slug varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

