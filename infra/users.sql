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
1	pbkdf2_sha256$260000$MQEIztOGYw0mvqKHtNDxjA$EAqSFWgrSA2M5m8pMLuFN+Dx0YY+zq95GEj4sZVyAqA=	2023-04-29 12:17:26.736908+03	t			t	t	2023-04-22 14:49:05.114261+03	root2@rt.rt	rot
2	pbkdf2_sha256$260000$wzQQq8M8cokxYZ5QVVsQcq$6UO3JAIzpRq/7JtiA+xCGuqCiRxlV+egbkMWvdONgAk=	\N	f	Vsev	Ryb	f	t	2023-04-29 12:28:29.620832+03	root@rt.rt	Test_tip_user
\.


--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_id_seq', 2, true);


--
-- Name: users_reworkeduser users_reworkeduser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_email_key UNIQUE (email);


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
-- Name: users_reworkeduser_email_355107e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_email_355107e5_like ON public.users_reworkeduser USING btree (email varchar_pattern_ops);


--
-- Name: users_reworkeduser_username_61cc1848_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_username_61cc1848_like ON public.users_reworkeduser USING btree (username varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

