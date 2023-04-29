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
-- Name: main_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_favorites (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.main_favorites OWNER TO postgres;

--
-- Name: main_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_favorites_id_seq OWNER TO postgres;

--
-- Name: main_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_favorites_id_seq OWNED BY public.main_favorites.id;


--
-- Name: main_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites ALTER COLUMN id SET DEFAULT nextval('public.main_favorites_id_seq'::regclass);


--
-- Data for Name: main_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_favorites (id, recipe_id, user_id) FROM stdin;
1	2	2
2	1	1
\.


--
-- Name: main_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_favorites_id_seq', 2, true);


--
-- Name: main_favorites main_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites
    ADD CONSTRAINT main_favorites_pkey PRIMARY KEY (id);


--
-- Name: main_favorites main_favorites_recipe_id_user_id_01f99c32_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites
    ADD CONSTRAINT main_favorites_recipe_id_user_id_01f99c32_uniq UNIQUE (recipe_id, user_id);


--
-- Name: main_favorites_recipe_id_73eb79a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_favorites_recipe_id_73eb79a4 ON public.main_favorites USING btree (recipe_id);


--
-- Name: main_favorites_user_id_728d716c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_favorites_user_id_728d716c ON public.main_favorites USING btree (user_id);


--
-- Name: main_favorites main_favorites_recipe_id_73eb79a4_fk_main_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites
    ADD CONSTRAINT main_favorites_recipe_id_73eb79a4_fk_main_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.main_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_favorites main_favorites_user_id_728d716c_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites
    ADD CONSTRAINT main_favorites_user_id_728d716c_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

