--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

DROP INDEX public.users_reworkeduser_username_61cc1848_like;
ALTER TABLE ONLY public.users_reworkeduser DROP CONSTRAINT users_reworkeduser_username_key;
ALTER TABLE ONLY public.users_reworkeduser DROP CONSTRAINT users_reworkeduser_pkey;
ALTER TABLE public.users_reworkeduser ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_reworkeduser_id_seq;
DROP TABLE public.users_reworkeduser;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users_reworkeduser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_reworkeduser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(150) NOT NULL
);


ALTER TABLE public.users_reworkeduser OWNER TO postgres;

--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_reworkeduser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_reworkeduser_id_seq OWNER TO postgres;

--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_reworkeduser_id_seq OWNED BY public.users_reworkeduser.id;


--
-- Name: users_reworkeduser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser ALTER COLUMN id SET DEFAULT nextval('public.users_reworkeduser_id_seq'::regclass);


--
-- Data for Name: users_reworkeduser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reworkeduser (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, username) FROM stdin;
1	pbkdf2_sha256$260000$9v4jBAYREXIBBeO7kzpKM4$rSkeAXfbN0p7ShWV+3SI8PTxbSvYS642a7t0TLG3c60=	2023-04-07 12:59:27.225586+00	t			t	t	2023-04-07 12:59:24.489825+00	root@rt.rt	root
\.


--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_id_seq', 1, true);


--
-- Name: users_reworkeduser users_reworkeduser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_pkey PRIMARY KEY (id);


--
-- Name: users_reworkeduser users_reworkeduser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_username_key UNIQUE (username);


--
-- Name: users_reworkeduser_username_61cc1848_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_username_61cc1848_like ON public.users_reworkeduser USING btree (username varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

