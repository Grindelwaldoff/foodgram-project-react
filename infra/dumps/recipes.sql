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
-- Name: main_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_recipe (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    img character varying(100) NOT NULL,
    description character varying(5000) NOT NULL,
    time_to_cook integer NOT NULL,
    author_id bigint NOT NULL,
    CONSTRAINT main_recipe_time_to_cook_check CHECK ((time_to_cook >= 0))
);


ALTER TABLE public.main_recipe OWNER TO postgres;

--
-- Name: main_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_recipe_id_seq OWNER TO postgres;

--
-- Name: main_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_recipe_id_seq OWNED BY public.main_recipe.id;


--
-- Name: main_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe ALTER COLUMN id SET DEFAULT nextval('public.main_recipe_id_seq'::regclass);


--
-- Data for Name: main_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_recipe (id, name, img, description, time_to_cook, author_id) FROM stdin;
2	Цезарь	recipes/salat-cezar-klassicheskii-s-kuricei_1611309331_16_max.jpg	Классический греческий салат	15	1
1	Украинский суп	recipes/ob-05_1568611223.jpg	Шаг 1 Готовим бульон для украинского борща. Положите мясо в большую кастрюлю, залейте водой, чтобы покрыла мясо на 5 пальцев. Доведите до кипения и снимите пену. Огонь уменьшите до минимума. Лук, морковь и корень петрушки очистите, разрежьте вдоль пополам и припеките на сухой сковородке до коричневых подпалин. Добавьте к мясу овощи, перец горошком, стебли петрушки (листья сохраните). Варите 2,5 ч. За 15 мин. до окончания положите соль и лавровый лист.Шаг 2Процедите бульон. Снимите мясо с костей небольшими кусками, из мозговой кости выньте костный мозг.Шаг 3 Для заправки украинского борща очистите все овощи. Мелко нарежьте лук. Морковь и свеклу натрите на крупной терке. Перец нарежьте мелкими кубиками. Картофель – средними дольками. Капусту нашинкуйте. Помидоры натрите на терке.Шаг 4 Поставьте на средний огонь 2 сковороды, в каждой растопите сало. В одну положите лук, в другую – свеклу. Обжа­ривайте, помешивая, 5 мин. К луку добавьте морковь и перец, в свеклу – уксус. Готовьте еще 5 мин. Свеклу снимите с огня, в лук с морковкой положите помидоры. Готовьте еще 5 мин.Шаг 5 Вскипятите бульон для борща, положите картофель, варите 10 мин. Положите капусту, варите 5 мин. Добавьте свеклу и лук с морковью, доведите до кипения, варите 10 мин.Шаг 6Чеснок мелко порубите с листьями петрушки, добавьте в борщ вместе с мясом и костным мозгом. Посолите и поперчите. Доведите до кипения, выключите огонь и настаивайте украинский борщ 15 мин. Подавайте с толченым салом и сметаной.	120	1
\.


--
-- Name: main_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_recipe_id_seq', 2, true);


--
-- Name: main_recipe main_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe
    ADD CONSTRAINT main_recipe_pkey PRIMARY KEY (id);


--
-- Name: main_recipe_author_id_3b3e7443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_recipe_author_id_3b3e7443 ON public.main_recipe USING btree (author_id);


--
-- Name: main_recipe main_recipe_author_id_3b3e7443_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe
    ADD CONSTRAINT main_recipe_author_id_3b3e7443_fk_users_reworkeduser_id FOREIGN KEY (author_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
