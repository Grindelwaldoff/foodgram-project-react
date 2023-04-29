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
-- Name: main_ingredientstorecipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_ingredientstorecipe (
    id bigint NOT NULL,
    amount integer NOT NULL,
    ingredient_id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    CONSTRAINT main_ingredientstorecipe_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.main_ingredientstorecipe OWNER TO postgres;

--
-- Name: main_ingredientstorecipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_ingredientstorecipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_ingredientstorecipe_id_seq OWNER TO postgres;

--
-- Name: main_ingredientstorecipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_ingredientstorecipe_id_seq OWNED BY public.main_ingredientstorecipe.id;


--
-- Name: main_ingredientstorecipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe ALTER COLUMN id SET DEFAULT nextval('public.main_ingredientstorecipe_id_seq'::regclass);


--
-- Data for Name: main_ingredientstorecipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_ingredientstorecipe (id, amount, ingredient_id, recipe_id) FROM stdin;
1	2	2180	1
2	500	280	1
3	100	1532	1
4	30	587	2
5	4	2180	2
6	200	994	2
\.


--
-- Name: main_ingredientstorecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_ingredientstorecipe_id_seq', 6, true);


--
-- Name: main_ingredientstorecipe main_ingredientstorecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe
    ADD CONSTRAINT main_ingredientstorecipe_pkey PRIMARY KEY (id);


--
-- Name: main_ingredientstorecipe main_ingredientstorecipe_recipe_id_ingredient_id_270fcb70_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe
    ADD CONSTRAINT main_ingredientstorecipe_recipe_id_ingredient_id_270fcb70_uniq UNIQUE (recipe_id, ingredient_id);


--
-- Name: main_ingredientstorecipe_ingredient_id_3ea04b46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_ingredientstorecipe_ingredient_id_3ea04b46 ON public.main_ingredientstorecipe USING btree (ingredient_id);


--
-- Name: main_ingredientstorecipe_recipe_id_45f1355a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_ingredientstorecipe_recipe_id_45f1355a ON public.main_ingredientstorecipe USING btree (recipe_id);


--
-- Name: main_ingredientstorecipe main_ingredientstore_ingredient_id_3ea04b46_fk_main_ingr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe
    ADD CONSTRAINT main_ingredientstore_ingredient_id_3ea04b46_fk_main_ingr FOREIGN KEY (ingredient_id) REFERENCES public.main_ingredients(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_ingredientstorecipe main_ingredientstorecipe_recipe_id_45f1355a_fk_main_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe
    ADD CONSTRAINT main_ingredientstorecipe_recipe_id_45f1355a_fk_main_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.main_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

