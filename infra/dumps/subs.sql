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
-- Name: main_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_subscriptions (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    sub_id bigint NOT NULL,
    CONSTRAINT its_not_allowed_to_follow_on_yourself CHECK ((NOT (sub_id = author_id)))
);


ALTER TABLE public.main_subscriptions OWNER TO postgres;

--
-- Name: main_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_subscriptions_id_seq OWNER TO postgres;

--
-- Name: main_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_subscriptions_id_seq OWNED BY public.main_subscriptions.id;


--
-- Name: main_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.main_subscriptions_id_seq'::regclass);


--
-- Data for Name: main_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_subscriptions (id, author_id, sub_id) FROM stdin;
1	1	2
2	2	1
\.


--
-- Name: main_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_subscriptions_id_seq', 2, true);


--
-- Name: main_subscriptions main_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT main_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: main_subscriptions unique_follow; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT unique_follow UNIQUE (author_id, sub_id);


--
-- Name: main_subscriptions_author_id_416f03d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscriptions_author_id_416f03d8 ON public.main_subscriptions USING btree (author_id);


--
-- Name: main_subscriptions_sub_id_2bebea83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscriptions_sub_id_2bebea83 ON public.main_subscriptions USING btree (sub_id);


--
-- Name: main_subscriptions main_subscriptions_author_id_416f03d8_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT main_subscriptions_author_id_416f03d8_fk_users_reworkeduser_id FOREIGN KEY (author_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subscriptions main_subscriptions_sub_id_2bebea83_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT main_subscriptions_sub_id_2bebea83_fk_users_reworkeduser_id FOREIGN KEY (sub_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

