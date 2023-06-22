--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: recipes_basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_basket (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.recipes_basket OWNER TO postgres;

--
-- Name: recipes_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_basket_id_seq OWNER TO postgres;

--
-- Name: recipes_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_basket_id_seq OWNED BY public.recipes_basket.id;


--
-- Name: recipes_favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_favorites (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.recipes_favorites OWNER TO postgres;

--
-- Name: recipes_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_favorites_id_seq OWNER TO postgres;

--
-- Name: recipes_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_favorites_id_seq OWNED BY public.recipes_favorites.id;


--
-- Name: recipes_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_ingredients (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    measurement_unit character varying(50) NOT NULL
);


ALTER TABLE public.recipes_ingredients OWNER TO postgres;

--
-- Name: recipes_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredients_id_seq OWNER TO postgres;

--
-- Name: recipes_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_ingredients_id_seq OWNED BY public.recipes_ingredients.id;


--
-- Name: recipes_ingredientstorecipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_ingredientstorecipe (
    id bigint NOT NULL,
    amount smallint NOT NULL,
    ingredient_id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    CONSTRAINT recipes_ingredientstorecipe_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.recipes_ingredientstorecipe OWNER TO postgres;

--
-- Name: recipes_ingredientstorecipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_ingredientstorecipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_ingredientstorecipe_id_seq OWNER TO postgres;

--
-- Name: recipes_ingredientstorecipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_ingredientstorecipe_id_seq OWNED BY public.recipes_ingredientstorecipe.id;


--
-- Name: recipes_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_recipe (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    img character varying(100) NOT NULL,
    description character varying(5000) NOT NULL,
    time_to_cook smallint NOT NULL,
    author_id bigint NOT NULL,
    CONSTRAINT recipes_recipe_time_to_cook_check CHECK ((time_to_cook >= 0))
);


ALTER TABLE public.recipes_recipe OWNER TO postgres;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_id_seq OWNER TO postgres;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes_recipe.id;


--
-- Name: recipes_recipe_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_recipe_tags (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    tags_id bigint NOT NULL
);


ALTER TABLE public.recipes_recipe_tags OWNER TO postgres;

--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_recipe_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_tags_id_seq OWNER TO postgres;

--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_recipe_tags_id_seq OWNED BY public.recipes_recipe_tags.id;


--
-- Name: recipes_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes_tags (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    color character varying(18) NOT NULL,
    slug character varying(150) NOT NULL
);


ALTER TABLE public.recipes_tags OWNER TO postgres;

--
-- Name: recipes_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipes_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_tags_id_seq OWNER TO postgres;

--
-- Name: recipes_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipes_tags_id_seq OWNED BY public.recipes_tags.id;


--
-- Name: users_reworkeduser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_reworkeduser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL
);


ALTER TABLE public.users_reworkeduser OWNER TO postgres;

--
-- Name: users_reworkeduser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_reworkeduser_groups (
    id bigint NOT NULL,
    reworkeduser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_reworkeduser_groups OWNER TO postgres;

--
-- Name: users_reworkeduser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_reworkeduser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_reworkeduser_groups_id_seq OWNER TO postgres;

--
-- Name: users_reworkeduser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_reworkeduser_groups_id_seq OWNED BY public.users_reworkeduser_groups.id;


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
-- Name: users_reworkeduser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_reworkeduser_user_permissions (
    id bigint NOT NULL,
    reworkeduser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_reworkeduser_user_permissions OWNER TO postgres;

--
-- Name: users_reworkeduser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_reworkeduser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_reworkeduser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_reworkeduser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_reworkeduser_user_permissions_id_seq OWNED BY public.users_reworkeduser_user_permissions.id;


--
-- Name: users_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_subscriptions (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    sub_id bigint NOT NULL,
    CONSTRAINT its_not_allowed_to_follow_on_yourself CHECK ((NOT (sub_id = author_id)))
);


ALTER TABLE public.users_subscriptions OWNER TO postgres;

--
-- Name: users_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_subscriptions_id_seq OWNER TO postgres;

--
-- Name: users_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_subscriptions_id_seq OWNED BY public.users_subscriptions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: recipes_basket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_basket ALTER COLUMN id SET DEFAULT nextval('public.recipes_basket_id_seq'::regclass);


--
-- Name: recipes_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_favorites ALTER COLUMN id SET DEFAULT nextval('public.recipes_favorites_id_seq'::regclass);


--
-- Name: recipes_ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredients ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredients_id_seq'::regclass);


--
-- Name: recipes_ingredientstorecipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredientstorecipe ALTER COLUMN id SET DEFAULT nextval('public.recipes_ingredientstorecipe_id_seq'::regclass);


--
-- Name: recipes_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe ALTER COLUMN id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);


--
-- Name: recipes_recipe_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.recipes_recipe_tags_id_seq'::regclass);


--
-- Name: recipes_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_tags ALTER COLUMN id SET DEFAULT nextval('public.recipes_tags_id_seq'::regclass);


--
-- Name: users_reworkeduser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser ALTER COLUMN id SET DEFAULT nextval('public.users_reworkeduser_id_seq'::regclass);


--
-- Name: users_reworkeduser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_groups ALTER COLUMN id SET DEFAULT nextval('public.users_reworkeduser_groups_id_seq'::regclass);


--
-- Name: users_reworkeduser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_reworkeduser_user_permissions_id_seq'::regclass);


--
-- Name: users_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.users_subscriptions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add basket	8	add_basket
30	Can change basket	8	change_basket
31	Can delete basket	8	delete_basket
32	Can view basket	8	view_basket
33	Can add favorites	9	add_favorites
34	Can change favorites	9	change_favorites
35	Can delete favorites	9	delete_favorites
36	Can view favorites	9	view_favorites
37	Can add ingredients	10	add_ingredients
38	Can change ingredients	10	change_ingredients
39	Can delete ingredients	10	delete_ingredients
40	Can view ingredients	10	view_ingredients
41	Can add ingredients to recipe	11	add_ingredientstorecipe
42	Can change ingredients to recipe	11	change_ingredientstorecipe
43	Can delete ingredients to recipe	11	delete_ingredientstorecipe
44	Can view ingredients to recipe	11	view_ingredientstorecipe
45	Can add recipe	12	add_recipe
46	Can change recipe	12	change_recipe
47	Can delete recipe	12	delete_recipe
48	Can view recipe	12	view_recipe
49	Can add tags	13	add_tags
50	Can change tags	13	change_tags
51	Can delete tags	13	delete_tags
52	Can view tags	13	view_tags
53	Can add reworked user	14	add_reworkeduser
54	Can change reworked user	14	change_reworkeduser
55	Can delete reworked user	14	delete_reworkeduser
56	Can view reworked user	14	view_reworkeduser
57	Can add subscriptions	15	add_subscriptions
58	Can change subscriptions	15	change_subscriptions
59	Can delete subscriptions	15	delete_subscriptions
60	Can view subscriptions	15	view_subscriptions
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
91dc077be232675bda15d6b97c335d27c8372349	2023-06-21 23:55:10.532435+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-06-21 23:53:30.920774+00	1	Салат	1	[{"added": {}}]	13	1
2	2023-06-21 23:53:40.002935+00	2	Суп	1	[{"added": {}}]	13	1
3	2023-06-21 23:53:48.884441+00	1	Цезарь	1	[{"added": {}}, {"added": {"name": "ingredients to recipe", "object": "\\u043e\\u0441\\u044c\\u043c\\u0438\\u043d\\u043e\\u0433\\u0438 \\u043c\\u0438\\u043d\\u0438"}}]	12	1
4	2023-06-21 23:54:34.886464+00	2	Борщ	1	[{"added": {}}, {"added": {"name": "ingredients to recipe", "object": "\\u043f\\u0430\\u0440\\u043c\\u0435\\u0437\\u0430\\u043d"}}]	12	1
5	2023-06-21 23:54:45.31004+00	1	Favorites object (1)	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	recipes	basket
9	recipes	favorites
10	recipes	ingredients
11	recipes	ingredientstorecipe
12	recipes	recipe
13	recipes	tags
14	users	reworkeduser
15	users	subscriptions
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-06-21 23:51:30.090432+00
2	contenttypes	0002_remove_content_type_name	2023-06-21 23:51:30.099457+00
3	auth	0001_initial	2023-06-21 23:51:30.146975+00
4	auth	0002_alter_permission_name_max_length	2023-06-21 23:51:30.15281+00
5	auth	0003_alter_user_email_max_length	2023-06-21 23:51:30.162072+00
6	auth	0004_alter_user_username_opts	2023-06-21 23:51:30.168308+00
7	auth	0005_alter_user_last_login_null	2023-06-21 23:51:30.175773+00
8	auth	0006_require_contenttypes_0002	2023-06-21 23:51:30.17834+00
9	auth	0007_alter_validators_add_error_messages	2023-06-21 23:51:30.184075+00
10	auth	0008_alter_user_username_max_length	2023-06-21 23:51:30.189994+00
11	auth	0009_alter_user_last_name_max_length	2023-06-21 23:51:30.19619+00
12	auth	0010_alter_group_name_max_length	2023-06-21 23:51:30.204065+00
13	auth	0011_update_proxy_permissions	2023-06-21 23:51:30.211955+00
14	auth	0012_alter_user_first_name_max_length	2023-06-21 23:51:30.217848+00
15	users	0001_initial	2023-06-21 23:51:30.290822+00
16	admin	0001_initial	2023-06-21 23:51:30.311684+00
17	admin	0002_logentry_remove_auto_add	2023-06-21 23:51:30.322463+00
18	admin	0003_logentry_add_action_flag_choices	2023-06-21 23:51:30.331437+00
19	authtoken	0001_initial	2023-06-21 23:51:30.351269+00
20	authtoken	0002_auto_20160226_1747	2023-06-21 23:51:30.378621+00
21	authtoken	0003_tokenproxy	2023-06-21 23:51:30.382295+00
22	recipes	0001_initial	2023-06-21 23:51:30.42752+00
23	recipes	0002_initial	2023-06-21 23:51:30.610419+00
24	sessions	0001_initial	2023-06-21 23:51:30.624307+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
of7ung9b3c6t7oa15semcm28q5bppqqz	.eJxVjDsOwyAQBe9CHSFYvk6Z3mdAu4CDkwgkY1dR7h5bcpG0b2bemwXc1hK2npcwJ3Zlkl1-N8L4zPUA6YH13nhsdV1m4ofCT9r52FJ-3U7376BgL3uNZCTFPExeaucjWjR2iJ6iNqCzMN6CEMoKMKTAU5ZOqQmSFnvlCIB9vtsENyo:1qC7cn:bL1RNzVlhISTVfUzvnURxWj8yrSdcrVIJJ9CWfJ_UTA	2023-07-05 23:52:33.224128+00
\.


--
-- Data for Name: recipes_basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_basket (id, recipe_id, user_id) FROM stdin;
\.


--
-- Data for Name: recipes_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_favorites (id, recipe_id, user_id) FROM stdin;
1	2	1
\.


--
-- Data for Name: recipes_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_ingredients (id, name, measurement_unit) FROM stdin;
1	абрикосовое варенье	г
2	абрикосовое пюре	г
3	абрикосовый джем	г
4	абрикосовый сок	стакан
5	абрикосы	г
6	абрикосы консервированные	г
7	авокадо	по вкусу
8	агава сироп	г
9	агар-агар	г
10	аграм	г
11	аджика	г
12	аджика зеленая	г
13	айва	по вкусу
14	айвовое пюре	г
15	айран	г
16	айсинг	г
17	акула стейки	г
18	алкоголь	стакан
19	алкоголь крепкий	ст. л.
20	алыча	г
21	альбухара	шт.
22	альмехи	г
23	амарантовая мука	г
24	ананасовый сироп	г
25	ананасовый сок	г
26	ананасы	г
27	ананасы вяленые	г
28	ананасы консервированные	по вкусу
29	анис	по вкусу
30	анис звездочки	г
31	анисовый ликер	мл
32	анис семена	г
33	анчоусы	г
34	апельсиновая вода	г
35	апельсиновая цедра	г
36	апельсиновая эссенция	ч. л.
37	апельсиновое варенье	г
38	апельсиновые цукаты	г
39	апельсиновый джем	г
40	апельсиновый джем с имбирем	г
41	апельсиновый ликер	г
42	апельсиновый сироп	стакан
43	апельсиновый сок	по вкусу
44	апельсиновый сок свежевыжатый	г
45	апельсиновый уксус	ст. л.
46	апельсиновый экстракт	ч. л.
47	апельсины	г
48	апельсины красные	шт.
49	апельсины крупные	шт.
50	арахис	г
51	арахис жареный	г
52	арахисовая паста	г
53	арахисовое масло	г
54	арахис соленый	г
55	арбузная мякоть	г
56	арбузы	г
57	аргановое масло	г
58	аришта	г
59	ароматизатор	г
60	ароматизатор "ананас"	по вкусу
61	ароматизатор "вишня"	капля
62	ароматизатор "малина"	капля
63	ароматизатор "ром"	г
64	артишоки	г
65	артишоки в масле	г
66	артишоки маринованные	г
67	аспирин	шт.
68	ассорти мясное	г
69	ассорти овощное	г
70	ассорти фруктовое	г
71	ассорти ягодное	г
72	аши	г
73	багет	г
74	багет вчерашний	г
75	багет мини	г
76	бадан	звездочка
77	бадьян	щепотка
78	базилик лимонный	г
79	базилик свежий	г
80	базилик сушеный	г
81	базилик тайский	горсть
82	базилик фиолетовый	г
83	баклажаны	по вкусу
84	баклажаны мини	г
85	баклажаны тайские	г
86	балык	г
87	бальзам	г
88	бальзамический крем	стакан
89	бальзамический соус	ст. л.
90	бальзамический уксус	стакан
91	бальзам рижский черный	ст. л.
92	бамия	г
93	банановое пюре	г
94	банановые чипсы	горсть
95	банановый зеленый сироп	мл
96	банановый ликер	мл
97	бананы	г
98	бананы мини	г
99	барабулька	г
100	бараний ливер	г
101	бараний окорок на косточке	кусок
102	бараний фарш	г
103	баранина	г
104	баранки	г
105	бараньи антрекоты	кг
106	бараньи голяшки	шт.
107	бараньи потроха	кг
108	бараньи ребрышки	шт.
109	баранья лопатка	кг
110	баранья нога	г
111	баранья печень	г
112	барбарис	г
113	барбарис вяленый	ст. л.
114	барбарис молотый	г
115	бастурма	г
116	батат	г
117	батон	г
118	батончики шоколадные	г
119	безе	г
120	бекон	по вкусу
121	бекон варено-копченый	г
122	бекон сырокопченый	г
123	белорыбица	г
124	бирнель	мл
125	бисквик смесь готовая	пакет
126	бисквит	г
127	бисквитная крошка	г
128	бисквитный корж	г
129	бисквитный рулет	г
130	бисквит шоколадный	г
131	бифштекс	шт.
132	блинная мука	г
133	блины готовые	г
134	блины овсяные	шт.
135	бобовые ростки	г
136	бобы	г
137	бобы мунг пророщенные	г
138	бобы тонка	шт.
139	ботарга	г
140	брезаола	г
141	бренди	г
142	брокколи замороженная	г
143	брокколи свежая	г
144	брусника замороженная	г
145	брусника свежая	г
146	брусника сушеная	г
147	брусничное варенье	г
148	брусничный соус	г
149	брынза	по вкусу
150	брынза сербская	г
151	брюква	г
152	буженина	г
153	бузина сироп	ст. л.
154	букет гарни	пучок
155	булгур	г
156	булка	кусок
157	булка белая	г
158	булка сдобная	г
159	булочки	г
160	булочки белые черствые	г
161	булочки бриошь	шт.
162	булочки вчерашние	шт.
163	булочки для гамбургеров	шт.
164	булочки зерновые	шт.
165	булочки ржаные	кусок
166	булочки с кунжутом	шт.
167	бульон	г
168	бульонные кубики	г
169	бурбон	г
170	Буррата	г
171	буряк	г
172	бусинки кондитерские	ч. л.
173	бусинки кондитерские серебряные	по вкусу
174	бычий хвост	г
175	ванилин	г
176	ваниль в стручках	г
177	ванильная настойка	ст. л.
178	ванильная эссенция	г
179	ванильный порошок	г
180	ванильный сироп	г
181	ванильный экстракт	по вкусу
182	варенье	г
183	васаби	г
184	вафельная крошка	г
185	вафельные коржи	г
186	вафельные трубочки	г
187	вафли	г
188	вафли шоколадные	г
189	вермишель	г
190	вермишель яичная	г
191	вермут	г
192	вермут белый	г
193	вермут сухой	г
194	ветчина	г
195	ветчина вареная	г
196	ветчина варено-копченая	кусок
197	ветчина копченая	г
198	ветчина пармская	г
199	ветчина сырокопченая	г
200	вешенки	г
201	винегрет	г
202	винный камень	щепотка
203	винный уксус	г
204	винный уксус белый	г
205	винный уксус красный	ч. л.
206	винный уксус на чесноке	ч. л.
207	винный уксус на эстрагоне	ст. л.
208	вино белое	по вкусу
209	вино белое полусладкое	г
210	вино белое полусухое	г
211	вино белое сладкое	г
212	вино белое столовое	стакан
213	вино белое сухое	г
214	виноград	г
215	виноград без косточек	г
216	виноград белый	г
217	виноград изабелла	кг
218	виноградное желе	ст. л.
219	виноградные листья	г
220	виноградные листья маринованные	г
221	виноградные листья молодые	шт.
222	виноградный сок	г
223	виноградный сок осветленный	ч. л.
224	виноград синий	г
225	виноград черный	г
226	вино десертное	г
227	вино игристое сухое	г
228	вино красное	г
229	вино красное полусладкое	г
230	вино красное полусухое	г
231	вино красное сладкое	г
232	вино красное сухое	г
233	вино крепленое	г
234	вино розовое полусладкое	ст. л.
235	вино розовое полусухое	г
236	виски	г
237	витамин C в порошке	г
238	вишневая настойка	мл
239	вишневое варенье	г
240	вишневые листья	г
241	вишневый джем	г
242	вишневый ликер	по вкусу
243	вишневый сироп	стакан
244	вишневый сок	г
245	вишня	г
246	вишня вяленая	г
247	вишня замороженная	г
248	вишня засахаренная кондитерская	шт.
249	вишня коктейльная	г
250	вишня мараскино	шт.
251	вишня, протертая с сахаром	г
252	вода	г
253	вода минеральная без газа	стакан
254	вода минеральная газированная	г
255	водка	г
256	водка анисовая	ч. л.
257	водоросли	г
258	вустерширский соус	г
259	галангал корень	долька
260	галеты	г
261	гамбургер	г
262	ганаш	г
263	гарам масала	г
264	гарнир	г
265	гаспачо	г
266	гвоздика	г
267	гвоздика молотая	по вкусу
268	герань листья	г
269	геркулес	г
270	глазурь	г
271	глазурь белая	г
272	глазурь готовая	по вкусу
273	глазурь черная	по вкусу
274	глазурь шоколадная белая	г
275	глутамат натрия	г
276	глюкоза	г
277	глюкоза сироп	г
278	говядина	г
279	говядина на кости	г
280	говяжий фарш	по вкусу
281	говяжий язык	г
282	говяжье сердце	по вкусу
283	говяжьи бифштексы	г
284	говяжьи голяшки	г
285	говяжьи легкие	г
286	говяжьи ребра	г
287	говяжьи стейки рибай	г
288	говяжья вырезка	шт.
289	говяжья грудинка	кг
290	говяжья лопатка	г
291	говяжья мозговая кость	шт.
292	говяжья мякоть	кг
293	говяжья печень	шт.
294	говяжья черева	г
295	говяжья шейка	кг
296	годжи	г
297	голец филе	шт.
298	голубика	г
299	голубика замороженная	г
300	голубь	г
301	горбуша	по вкусу
302	горбуша в собственном соку	банка
303	горбуша филе	г
304	горгонзола	г
305	горгонзола пиканте	г
306	горох	г
307	горох колотый	г
308	гороховые ростки	горсть
309	гороховый суп	г
310	горошек зеленый	г
311	горошек зеленый замороженный	г
312	горошек зеленый консервированный	г
313	горошек стручковый свежий	г
314	горчица	г
315	горчица дижонская	г
316	горчица дижонская с медом	г
317	горчица желтая семена	г
318	горчица острая	г
319	горчица русская	ст. л.
320	горчица семена	г
321	горчица с зернами	г
322	горчица сухая	г
323	горчица французская	г
324	горчица цитрусовая	г
325	горчичное масло	г
326	горчичный порошок	г
327	грана падано	ст. л.
328	гранатные зерна	г
329	гранатовая паста	ст. л.
330	гранатовый сироп	г
331	гранатовый сок	г
332	гранатовый сок свежевыжатый	мл
333	гранатовый соус	ч. л.
334	гранаты	г
335	гранита	г
336	гранола с орехами	г
337	граппа	ч. л.
338	гратен	кг
339	грейпфрутовая цедра	г
340	грейпфрутовый сок	г
341	грейпфруты	г
342	грейпфруты розовые	г
343	гренадин	г
344	гренки	г
345	грецкие орехи	г
346	грецкие орехи рубленые	г
347	гречневая крупа	г
348	гречневая крупа зеленая	ст. л.
349	гречневая лапша соба	г
350	гречневая мука	г
351	гречневое молоко	стакан
352	гречневые хлопья	г
353	грибы	г
354	грибы белые	г
355	грибы белые замороженные	г
356	грибы белые маринованные	г
357	грибы белые сухие	г
358	грибы замороженные	г
359	грибы замороженные (опята и маслята)	г
360	грибы лесные	г
361	грибы маринованные	г
362	грибы свежие	г
363	грибы соленые	г
364	грибы соломенные консервированные	шт.
365	грибы сухие	г
366	грибы шиитаке	г
367	грибы шиитаке сухие	г
368	гриль	г
369	гриссини	г
370	грудинка	г
371	грудинка варено-копченая	г
372	грудинка копченая	по вкусу
373	грушевое пюре	г
374	грушевый ликер	мл
375	грушевый сироп	мл
376	грушевый сок	г
377	грушевый уксус	ст. л.
378	груши	по вкусу
379	груши вяленые	г
380	грюйер	г
381	гуава	шт.
382	гуанчиале	г
383	гурьевская каша	г
384	гусиная грудка копченая	г
385	гусиная печень	г
386	гусиный жир	ст. л.
387	гусь	г
388	гусь тушка	кг
389	дайкон	г
390	детское питание	г
391	джем	г
392	джин	г
393	джусай	г
394	диоксид титана	г
395	долма	г
396	дорада	шт.
397	дорада потрошеная с головой	шт.
398	дорада с головой	шт.
399	дорада тушка	шт.
400	драже	г
401	дрожжи домашние	г
402	дрожжи свежие	г
403	дрожжи сухие	по вкусу
404	дубовая кора	г
405	душица	г
406	дыня	г
407	ежевика	г
408	ежевика замороженная	г
409	ерш	г
410	ёрш-носарь	шт.
411	желатин	г
412	желатин листовой	по вкусу
413	желе	г
414	желе для торта	упаковка
415	желирующее вещество	упаковка
416	желирующий сахар	г
417	женьшень	г
418	жидкий дым	г
419	жимолость	г
420	жир	г
421	жир вытопленный	стакан
422	жир кулинарный	г
423	жир растительный	г
424	заатар	щепотка
425	завтрак сухой	г
426	завтрак сухой подушечки	г
427	загуститель для сливок	г
428	зайчатина	г
429	закваска	пакет
430	закваска вечная	г
431	заменитель сахара	по вкусу
432	заменитель сахара стевия	г
433	заправка для салатов готовая	г
434	зверобой	по вкусу
435	зелень	г
436	зелень рубленая	г
437	земляника	по вкусу
438	земляника замороженная	г
439	зефир	г
440	зира	г
441	злаковые хлопья	г
442	зубатка	г
443	зубатка филе	г
444	изолят соевого протеина	г
445	изюм	г
446	изюм без косточек	г
447	изюм белый	г
448	изюм черный	г
449	икра	г
450	икра вяленой рыбы	г
451	икра горбуши зернистая	г
452	икра красная	г
453	икра красной рыбы мелкая	г
454	икра летучей рыбы	г
455	икра лосося	г
456	икра мойвы	г
457	икра палтуса	г
458	икра судака	г
459	икра черная	г
460	имбирное варенье	г
461	имбирное печенье	по вкусу
462	имбирные цукаты	ст. л.
463	имбирь	г
464	имбирь засахаренный	г
465	имбирь корень	г
466	имбирь маринованный	г
467	имбирь молотый	г
468	индейка	г
469	индейка голень	г
470	индейка грудка	г
471	индейка копченая	г
472	индейка тушка	шт.
473	индейка фарш	г
474	индейка филе	г
475	индоутка	шт.
476	индюшачья печень	г
477	инжир	г
478	инжир свежий	г
479	инжир сушеный	г
480	ирга	г
481	ириски	г
482	итальянские травы	г
483	йогурт	г
484	йогурт греческий	г
485	йогурт жирный	г
486	йогурт козий	г
487	йогурт натуральный	г
488	йогурт нежирный	г
489	йогурт обезжиренный	г
490	йогурт фруктовый	г
491	кабачки	г
492	кабачки замороженные	г
493	кабачки молодые	г
494	каджунская смесь специй	ст. л.
495	какао	горсть
496	какао-бобы	г
497	какао-масло	г
498	какао-порошок	по вкусу
499	какао-порошок обезжиренный	г
500	какао сгущенное	банка
501	калина	по вкусу
502	калина протертая	г
503	калинджи семена	ч. л.
504	кальвадос	г
505	кальмары	г
506	кальмары вареные	г
507	кальмары замороженные	г
508	кальмары консервированные	г
509	кальмары филе	шт.
510	камамбер	упаковка
511	камбала	г
512	камбала филе	г
513	кампари	мл
514	кандурин золотой	ч. л.
515	каннеллони	г
516	капеллини	г
517	каперсы	г
518	каперсы в винном уксусе	г
519	каперсы маринованные	г
520	капуста белокочанная	г
521	капуста брюссельская	г
522	капуста брюссельская замороженная	г
523	капуста кале	г
524	капуста квашеная	по вкусу
525	капуста кольраби	г
526	капуста краснокочанная	г
527	капуста морская	по вкусу
528	капуста морская замороженная	г
529	капуста морская сушеная	г
530	капуста пекинская	г
531	капуста савойская	г
532	капуста цветная	г
533	капуста цветная замороженная	г
534	капустный рассол	г
535	капучино	г
536	каракатица	г
537	каракатица очищенная	г
538	карамбола	г
539	карамель	мл
540	карамельный соус	г
541	карамель с начинкой	г
542	карамель соленая	г
543	карась	г
544	карбонад	г
545	кардамон	г
546	кардамон зерна	ч. л.
547	кардамон молотый	г
548	кардамон стручки	шт.
549	каркаде	г
550	карп	г
551	карп зеркальный	кг
552	карп филе	кг
553	карри	г
554	карри листья	г
555	карри паста	пакет
556	картофель	г
557	картофель вареный	г
558	картофель вареный в мундире	г
559	картофель молодой	г
560	картофельное пюре	по вкусу
561	картофельные ньокки	г
562	картофельные хлопья	г
563	картофельные чипсы	г
564	картофельный крахмал	г
565	картофельный отвар	г
566	картофельный хэш замороженный	г
567	картофель печеный	г
568	катык	г
569	каффир-лайм листья	по вкусу
570	каша	г
571	каша для детского питания	г
572	каштановая мука	г
573	каштановый крем	г
574	каштаны	г
575	каштаны вареные	г
576	каштаны консервированные	г
577	каштаны очищенные	г
578	квас	г
579	квасное сусло	г
580	квасной концентрат сухой	упаковка
581	квас хлебный	г
582	кедровая мука	г
583	кедровые орехи	г
584	кедровые орехи жареные	г
585	кета	г
586	кетчуп острый	по вкусу
587	кетчуп томатный	г
588	кетчуп тосканский	ст. л.
589	кетчуп шашлычный	г
590	кефаль	г
591	кефир	по вкусу
592	кефир 1%	г
593	кефир 2,5%	г
594	кефир 3,2%	г
595	кефир обезжиренный	г
596	кешью	г
597	кивано	г
598	киви	кг
599	киви желе	г
600	кижуч	г
601	кижуч горячего копчения филе	г
602	кизил	г
603	килька	г
604	кимчи	г
605	кинза свежая	зубчик
606	кинза сушеная	г
607	киноа	г
608	киноа молотая	г
609	кипяток	г
610	кирш	ст. л.
611	кисель	г
612	кисель сухой	г
613	кисломолочный напиток Тан	мл
614	кишки	г
615	клейковина	г
616	клементины	г
617	кленовый сироп	г
618	клубника	г
619	клубника в сиропе	г
620	клубника замороженная	г
621	клубника, протертая с сахаром	г
622	клубника сушеная	г
623	клубничное варенье	г
624	клубничное желе	упаковка
625	клубничное пюре	г
626	клубничный джем	г
627	клубничный джем густой	мл
628	клубничный компот	стакан
629	клубничный ликер	г
630	клубничный сироп	г
631	клюква	г
632	клюква вяленая	г
633	клюква замороженная	г
634	клюква, протертая с сахаром	г
635	клюквенное варенье	г
636	клюквенный джем	г
637	клюквенный морс	ст. л.
638	клюквенный сироп	г
639	клюквенный соус	г
640	козлиная печень	г
641	козлятина молодая	кг
642	кока-кола	ст. л.
643	кокосовая вода	стакан
644	кокосовая мука	ст. л.
645	кокосовая стружка	г
646	кокосовая стружка цветная	г
647	кокосовое масло	мл
648	кокосовое молоко	г
649	кокосовые сливки	г
650	кокосовый ликер	ст. л.
651	кокосовый экстракт	г
652	кокосы	г
653	кола	г
654	колбаса	г
655	колбаса вареная	г
656	колбаса варено-копченая	г
657	колбаса копченая	г
658	колбаса кровяная	г
659	колбаса полукопченая	г
660	колбаса сырокопченая	г
661	колбаска свиная свежая (salsiccia)	шт.
662	колбаски	г
663	колбаски для жарки	г
664	колбаски домашние	шт.
665	колбаски охотничьи	г
666	колбаски сырокопченые	шт.
667	компот	г
668	конопляное масло	ст. л.
669	конопля семена	г
670	конфеты	по вкусу
671	конфеты M&M’s	г
672	конфеты жевательные лакричные	г
673	конфеты Коровка	г
674	конфеты Трюфель	г
675	конфитюр	по вкусу
676	конфитюрка	упаковка
677	коньяк	г
678	копчености	г
679	коренья	по вкусу
680	кориандр	г
681	кориандр зелень	г
682	кориандр молотый	г
683	кориандр семена	г
684	коринка	ст. л.
685	корица	г
686	корица молотая	г
687	корнишоны	г
688	корнишоны маринованые	г
689	корюшка	г
690	корюшка горячего копчения	г
691	кости	г
692	кости мозговые	г
693	кость сахарная	г
694	кофе в зернах	стакан
695	кофе зеленый	г
696	кофейные зерна в шоколаде	г
697	кофейный ликер	г
698	кофейный ликер Kahlua	мл
699	кофейный напиток	мл
700	кофейный сироп	г
701	кофейный экстракт	мл
702	кофе молотый	ст. л.
703	кофе растворимый	г
704	кофе свежесваренный	г
705	кофе черный	г
706	кофе эспрессо	стакан
707	крабовое мясо	г
708	крабовые палочки	по вкусу
709	краб снежный	по вкусу
710	крабы	г
711	крапива	г
712	краситель-гель пищевой	шт.
713	краситель пищевой	г
714	краситель пищевой вишневый	щепотка
715	краситель пищевой желтый	г
716	краситель пищевой зеленый	ст. л.
717	краситель пищевой красный	г
718	краситель пищевой оранжевый	г
719	краситель пищевой фиолетовый	г
720	краситель пищевой черный	г
721	красная смородина	г
722	красная смородина, протертая с сахаром	ст. л.
723	красноперка	шт.
724	красносмородиновое варенье	г
725	красный винный соус	г
726	крахмал	г
727	креветки	г
728	креветки замороженные	г
729	креветки королевские	г
730	креветки очищенные	г
731	креветки очищенные в рассоле	г
732	креветки салатные	г
733	креветки сушеные	г
734	креветки тигровые	г
735	крекер	г
736	крекер соленый	г
737	крем заварной	г
738	крем заварной порошковый	г
739	крем-фреш	г
740	кресс-салат	г
741	кровь	мл
742	кролик	г
743	кролик тушка	г
744	кролик филе	г
745	кроличья печень	г
746	круассаны	по вкусу
747	крутоны мелкие	г
748	крыжовник	г
749	крыжовниковое варенье	банка
750	кукуруза	г
751	кукуруза замороженная	г
752	кукуруза консервированная	г
753	кукуруза обжаренная кикос	г
754	кукурузная крупа	г
755	кукурузная мука	г
756	кукурузное масло	г
757	кукурузные лепешки	шт.
758	кукурузные палочки	г
759	кукурузные хлопья	г
760	кукурузные хлопья глазированные	г
761	кукурузные чипсы	г
762	кукурузный (золотой) сироп	г
763	кукурузный крахмал	по вкусу
764	кумин	г
765	кумкваты	горсть
766	кунжут	г
767	кунжутная мука	г
768	кунжутная паста	г
769	кунжутное масло	г
770	кунжутные семечки	по вкусу
771	кунжут черный	ч. л.
772	купаты	шт.
773	курага	по вкусу
774	курдючное сало	г
775	курдючный жир	г
776	куриная ветчина	г
777	куриная кожа	г
778	куриная печень	г
779	куриное карпаччо	г
780	куриное филе	г
781	куриные бедра	г
782	куриные голени	г
783	куриные голени копченые	шт.
784	куриные грудки	г
785	куриные грудки вареные	г
786	куриные грудки копченые	г
787	куриные желудочки	шт.
788	куриные кости	г
789	куриные крылья	г
790	куриные окорочка	г
791	куриные окорочка копченые	г
792	куриные потрошки	г
793	куриные сердечки	г
794	куриный бульон	г
795	куриный паштет	г
796	куриный суповой набор	кг
797	куриный фарш	г
798	курица	г
799	курица вареная	г
800	курица для жарки	кг
801	курица копченая	г
802	курица тушка	г
803	куркума	г
804	куропатки	г
805	кускус	г
806	кускус жемчужный	стакан
807	кэроб	г
808	лаванда	г
809	лаванда сушеная	щепотка
810	лавандовый краситель	ч. л.
811	лаваш	по вкусу
812	лаваш армянский	г
813	лаваш персидский круглый	г
814	лаваш тонкий	пласт
815	лавровые листья свежие	шт.
816	лавровый лист	г
817	лайм	г
818	лайм листья	шт.
819	лаймовая цедра	г
820	лаймовый сок	г
821	лангустины	шт.
822	лапша	г
823	лапша для лагмана	упаковка
824	лапша ширатаки	г
825	лапша яичная в гнездах	шт.
826	латук	г
827	легкие	г
828	лед	г
829	леди-фиш тушка	шт.
830	лемонграсс (лимонное сорго)	г
831	лен семена	г
832	лепешки	г
833	лепешки арабские	шт.
834	лесные орехи	г
835	лечо	г
836	ливер	г
837	ликер	г
838	ликер Alchermes	г
839	ликер Amaretto	г
840	ликер Baileys	г
841	ликер Cointreau	г
842	ликер кремовый	г
843	ликер сливочный	г
844	лимонад	г
845	лимонная кислота	г
846	лимонная цедра	г
847	лимонник стебель	г
848	лимонник ягоды	г
849	лимонные корочки засахаренные	г
850	лимонные цукаты	г
851	лимонный сок	г
852	лимонный уксус	г
853	лимонный экстракт	г
854	лимончелло	г
855	лимоны	г
856	лингвине	шт.
857	лисички	г
858	лисички сушеные	г
859	личи	шт.
860	личи компот	г
861	лобстер	г
862	лонган	г
863	лонгконг	шт.
864	лососевые молоки	г
865	лососевый фарш	г
866	лосось	г
867	лосось горячего копчения	г
868	лосось копченый	г
869	лосось свежесоленый	г
870	лосось свежий	г
871	лосось свежий филе	г
872	лосось слабосоленый	г
873	лосось стейки	г
874	лосось филе	г
875	лосось филе на коже	г
876	лосось холодного копчения	г
877	лосятина	кг
878	лук белый	по вкусу
879	лук зеленый	г
880	лук красный	по вкусу
881	лук маринованный	г
882	луковая шелуха	г
883	луковый порошок	г
884	лук-порей	горсть
885	лук-резанец	по вкусу
886	лук репчатый	г
887	лук репчатый мелкий	г
888	лук салатный	шт.
889	лук сушеный	г
890	лук-шалот	г
891	лук-шалот красный	шт.
892	льняная мука	г
893	льняное масло	ч. л.
894	льняное семя	г
895	льняное семя молотое	г
896	любисток	г
897	маасдам	г
898	мадера	г
899	майонез	г
900	майонез домашний	г
901	майонез легкий	г
902	майонезный соус «Слобода» Постный	г
903	майонез оливковый	г
904	майонез «Слобода» Легкий	г
905	майонез «Слобода» На перепелиных яйцах	г
906	майонез «Слобода» Оливковый	г
907	майонез «Слобода» Провансаль	г
908	майонез «Слобода» С лимонным соком	г
909	майонез «Слобода» Сметанный	г
910	майоран	г
911	майоран свежий	по вкусу
912	майоран сушеный	г
913	мак	г
914	макаронные изделия	г
915	макаронные изделия мелкие	г
916	макароны	г
917	макароны-бабочки (farfalle)	г
918	макароны-бабочки (farfalle) мини	г
919	макароны баветте	г
920	макароны-бантики	г
921	макароны букатини	г
922	макароны джильи	г
923	макароны диталони	г
924	макароны-звездочки	стакан
925	макароны орзо	г
926	макароны-ракушки (conchiglie)	г
927	макароны-ракушки (conchiglie rigate)	г
928	макароны-ракушки крупные	г
929	макароны рисони	г
930	макароны-рожки (pipe rigate)	г
931	макароны-спиральки (fusilli)	г
932	макароны-ушки (orecchiette)	г
933	маккерончини	г
934	мак молотый	г
935	маковая масса	пачка
936	малина	г
937	малина замороженная	г
938	малина, протертая с сахаром	стакан
939	малина сушеная	г
940	малиновое варенье	г
941	малиновое желе	г
942	малиновое пюре	г
943	малиновый джем	г
944	малиновый крем	г
945	малиновый сироп	ч. л.
946	малиновый соус	ч. л.
947	малиновый уксус	мл
948	малиновый чай	г
949	манго	по вкусу
950	манговый сироп	мл
951	манго консервированное	г
952	мангольд	г
953	мангустин	шт.
954	мандариновое пюре	г
955	мандариновые цукаты	г
956	мандариновый сок	г
957	мандарины	по вкусу
958	мандарины в собственном соку	г
959	манная крупа	г
960	маракуйя	г
961	маргарин	г
962	маргарин сливочный	г
963	мармелад	по вкусу
964	мармелад бутербродный	г
965	марсала	стакан
966	мартини	г
967	мартини красный	г
968	марципан	по вкусу
969	марципан зеленый	г
970	марципан розовый	г
971	маршмеллоу	г
972	маршмеллоу крем	г
973	маршмеллоу мини	г
974	маскарпоне	г
975	маслины	г
976	маслины без косточек	г
977	масло авокадо	г
978	масло виноградных косточек	г
979	масло грецкого ореха	ч. л.
980	масло для фритюра	г
981	масло кедрового ореха	г
982	маслята	г
983	мастика	г
984	мастика желатиновая	г
985	мастика шоколадная	г
986	матча	г
987	мафальдине	г
988	маца	г
989	мацони	г
990	маш	г
991	мед	г
992	мед акации	г
993	мед гречишный	г
994	мед жидкий	г
995	мед лавандовый	г
996	мелисса	г
997	меренги	шт.
998	мидии	г
999	мидии в раковинах	г
1000	мидии в раковинах крупные черные	г
1001	мидии в раковинах мелкие зеленые	г
1002	мидии замороженные	шт.
1003	мидии копченые в масле	г
1004	микрозелень	горсть
1005	миндаль	г
1006	миндаль жареный	г
1007	миндаль измельченный	г
1008	миндальная масса	г
1009	миндальная мука	г
1010	миндальная паста	г
1011	миндальная эссенция	г
1012	миндальное масло	г
1013	миндальное молоко	г
1014	миндальное печенье	г
1015	миндальное пралине	г
1016	миндальные лепестки	г
1017	миндальный ликер	г
1018	миндальный сироп	г
1019	миндальный экстракт	капля
1020	миндаль очищенный	г
1021	миндаль рубленый	г
1022	мини-кукуруза	шт.
1023	минога	г
1024	минтай	г
1025	минтай печень	г
1026	минтай филе	г
1027	мисо-паста	г
1028	мисо-суп	пакет
1029	можжевельник ягоды	г
1030	мойва	г
1031	моллюски	г
1032	молоко	г
1033	молоко 0,5%	г
1034	молоко 1,5%	г
1035	молоко 2,5%	г
1036	молоко 3,2%	г
1037	молоко 3,6%	г
1038	молоко 4%	г
1039	молоко 6%	г
1040	молоко козье	г
1041	молоко концентрированное	г
1042	молоко рисовое	мл
1043	молоко сгущенное	г
1044	молоко сгущенное вареное	ст. л.
1045	молоко сгущенное с какао	г
1046	молоко сухое	г
1047	молоко сухое обезжиренное	ст. л.
1048	молоко топленое	г
1049	молочная смесь	г
1050	молочные продукты	г
1051	морепродукты	шт.
1052	морковное пюре	г
1053	морковь	г
1054	морковь вареная	г
1055	морковь крупная	г
1056	морковь молодая	г
1057	морковь по-корейски	г
1058	морковь тертая	шт.
1059	мороженое	по вкусу
1060	мороженое ванильное	г
1061	мороженое клубничное	г
1062	мороженое лимонное	по вкусу
1063	мороженое малиновое	г
1064	мороженое пломбир	г
1065	мороженое шоколадное	мл
1066	морошка	г
1067	морские гребешки	кг
1068	морской коктейль	г
1069	морской коктейль в масле	упаковка
1070	морской коктейль замороженный	г
1071	морской черт	г
1072	морской язык	г
1073	морской язык филе	г
1074	мортаделла	г
1075	моцарелла	г
1076	моцарелла для запекания	г
1077	моцарелла для пиццы	г
1078	моцарелла мини	г
1079	моцарелла с травами	г
1080	моцарелла шарик большой	г
1081	мука	г
1082	мука 1 сорт	г
1083	мука 2 сорт	г
1084	мука «Аладушкин»	г
1085	мука грубого помола	г
1086	мука для темпуры	г
1087	мука из пророщенной пшеницы	ст. л.
1088	мука манитоба	г
1089	мука самоподнимающаяся	г
1090	мука с отрубями	ч. л.
1091	мука с семечками	г
1092	мука хлебопекарная	г
1093	мука цельнозерновая	г
1094	мускат белый	мл
1095	мускатное вино	г
1096	мускатный орех	г
1097	мускатный орех молотый	г
1098	мюсли	г
1099	мягкий творог	г
1100	мясной бульон	г
1101	мясной фарш	г
1102	мясо	г
1103	мясо дикого кабана	г
1104	мясо криля	г
1105	мясо на косточке	кг
1106	мята	г
1107	мята сушеная	г
1108	мятный сироп	г
1109	мятный шнапс	г
1110	нардек	г
1111	нектарины	шт.
1112	нога ягненка без кости	г
1113	нори	г
1114	нуга	г
1115	нуга с орехами	г
1116	нут	г
1117	нутелла	г
1118	нут консервированный	г
1119	нутовая мука	г
1120	облепиха	г
1121	облепиха замороженная	г
1122	облепиховый сироп	стакан
1123	овощи	г
1124	овощная смесь	г
1125	овощная смесь замороженная	г
1126	овощная смесь замороженная для wok	г
1127	овощная смесь по-китайски	г
1128	овощной бульон	по вкусу
1129	овсяная мука	г
1130	овсяное молоко	стакан
1131	овсяное печенье	г
1132	овсяное толокно	г
1133	овсяные зерна	г
1134	овсяные отруби	г
1135	овсяные хлопья	г
1136	овсяные хлопья быстрого приготовления	г
1137	огуречный рассол	стакан
1138	огурцы	г
1139	огурцы консервированные	шт.
1140	огурцы малосольные	шт.
1141	огурцы маринованные	банка
1142	огурцы свежие	г
1143	огурцы соленые	г
1144	одуванчики	г
1145	окорок	г
1146	окорок варено-копченый	г
1147	окунь	г
1148	окунь красный филе	г
1149	окунь морской	г
1150	окунь морской филе	г
1151	окунь филе	г
1152	оленина	г
1153	оливки	г
1154	оливки без косточек	г
1155	оливки зеленые	по вкусу
1156	оливки зеленые консервированные	банка
1157	оливки каламата	г
1158	оливки консервированные	г
1159	оливки, фаршированные анчоусами	г
1160	оливки черные	по вкусу
1161	оливковая паста	г
1162	оливковое масло	г
1163	оливковое масло Extra Virgin	г
1164	опунция плоды	г
1165	опята	по вкусу
1166	опята замороженные	г
1167	опята маринованные	г
1168	орегано	г
1169	орегано свежий	г
1170	орегано сушеный	г
1171	орехи	г
1172	орехи бразильские	г
1173	орехи макадамия	г
1174	орехи пекан	г
1175	орехи пинии	г
1176	ореховая крошка	стакан
1177	ореховая паста	шт.
1178	ореховое масло	ст. л.
1179	ореховый ликер	мл
1180	ореховый соус	ст. л.
1181	осетр	г
1182	осетрина холодного копчения	г
1183	осьминог	г
1184	осьминоги консервированные	г
1185	осьминоги мини	г
1186	отруби	г
1187	ошеек	г
1188	пагр	г
1189	пажитник	г
1190	пажитник семена	г
1191	палтус	г
1192	пальмовое масло	г
1193	пангасиус	г
1194	панеттоне	шт.
1195	Панифарин	г
1196	панчетта	г
1197	папайя	г
1198	папайя консервированная в собственном соку	г
1199	папоротник	г
1200	папоротник соленый	упаковка
1201	паппарделле	г
1202	паприка	г
1203	паприка копченая	ст. л.
1204	паприка красная	ст. л.
1205	паприка красная молотая	г
1206	паприка острая копченая	г
1207	паприка сладкая	г
1208	паприка сладкая копченая	г
1209	паприка сладкая хлопьями	ч. л.
1210	пармезан	г
1211	паста	г
1212	паста веджимайт	г
1213	паста тахини	г
1214	паста хариса	ст. л.
1215	пастернак	г
1216	пастила	г
1217	пастила виноградная	г
1218	патиссоны	г
1219	патока	г
1220	патока крахмальная	г
1221	патока черная (меласса)	г
1222	пахта	г
1223	паштет	г
1224	пекарский порошок	г
\.


--
-- Data for Name: recipes_ingredientstorecipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_ingredientstorecipe (id, amount, ingredient_id, recipe_id) FROM stdin;
1	123	1185	1
2	100	1210	2
\.


--
-- Data for Name: recipes_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_recipe (id, name, img, description, time_to_cook, author_id) FROM stdin;
1	Цезарь	recipes/salat-cezar-klassicheskii-s-kuricei_1611309331_16_max_JLbY2TA.jpg	Греческий салат	15	1
2	Борщ	recipes/bb647ec7.jpg	Классический представитель русской кухни	12	3
\.


--
-- Data for Name: recipes_recipe_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_recipe_tags (id, recipe_id, tags_id) FROM stdin;
1	1	1
2	1	2
3	2	2
\.


--
-- Data for Name: recipes_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes_tags (id, name, color, slug) FROM stdin;
1	Салат	#83FF4B	Salat
2	Суп	#A346FF	Soup
\.


--
-- Data for Name: users_reworkeduser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reworkeduser (id, password, last_login, is_superuser, is_staff, is_active, date_joined, email, username, first_name, last_name) FROM stdin;
3	pbkdf2_sha256$260000$qcPnmRaxE9Vbk91rtWR2Km$BbgiX2xrz0EPBts/V4cpNkydS8YhzM+Cnk2Lexzv8ic=	\N	f	f	t	2023-04-29 09:33:01.349725+00	root3@rt.rt	Test2_tip_user	Vsev	Ryb
2	pbkdf2_sha256$260000$wzQQq8M8cokxYZ5QVVsQcq$6UO3JAIzpRq/7JtiA+xCGuqCiRxlV+egbkMWvdONgAk=	2023-04-29 09:42:11.731138+00	f	f	t	2023-04-29 09:28:29.620832+00	root@rt.rt	Test_tip_user	Vsev	Ryb
1	pbkdf2_sha256$260000$MQEIztOGYw0mvqKHtNDxjA$EAqSFWgrSA2M5m8pMLuFN+Dx0YY+zq95GEj4sZVyAqA=	2023-06-21 23:55:10.535867+00	t	t	t	2023-04-22 11:49:05.114261+00	root2@rt.rt	rot		
\.


--
-- Data for Name: users_reworkeduser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reworkeduser_groups (id, reworkeduser_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_reworkeduser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reworkeduser_user_permissions (id, reworkeduser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: users_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_subscriptions (id, author_id, sub_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: recipes_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_basket_id_seq', 1, false);


--
-- Name: recipes_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_favorites_id_seq', 1, true);


--
-- Name: recipes_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_ingredients_id_seq', 1225, true);


--
-- Name: recipes_ingredientstorecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_ingredientstorecipe_id_seq', 2, true);


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 2, true);


--
-- Name: recipes_recipe_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_recipe_tags_id_seq', 3, true);


--
-- Name: recipes_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipes_tags_id_seq', 2, true);


--
-- Name: users_reworkeduser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_groups_id_seq', 1, false);


--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_id_seq', 3, true);


--
-- Name: users_reworkeduser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_user_permissions_id_seq', 1, false);


--
-- Name: users_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_subscriptions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: recipes_basket recipes_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_basket
    ADD CONSTRAINT recipes_basket_pkey PRIMARY KEY (id);


--
-- Name: recipes_basket recipes_basket_user_id_recipe_id_cbf4d751_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_basket
    ADD CONSTRAINT recipes_basket_user_id_recipe_id_cbf4d751_uniq UNIQUE (user_id, recipe_id);


--
-- Name: recipes_favorites recipes_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_favorites
    ADD CONSTRAINT recipes_favorites_pkey PRIMARY KEY (id);


--
-- Name: recipes_favorites recipes_favorites_recipe_id_user_id_506d0671_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_favorites
    ADD CONSTRAINT recipes_favorites_recipe_id_user_id_506d0671_uniq UNIQUE (recipe_id, user_id);


--
-- Name: recipes_ingredients recipes_ingredients_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT recipes_ingredients_name_key UNIQUE (name);


--
-- Name: recipes_ingredients recipes_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT recipes_ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredientstorecipe recipes_ingredientstorec_recipe_id_ingredient_id_a27c1fb4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredientstorecipe
    ADD CONSTRAINT recipes_ingredientstorec_recipe_id_ingredient_id_a27c1fb4_uniq UNIQUE (recipe_id, ingredient_id);


--
-- Name: recipes_ingredientstorecipe recipes_ingredientstorecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredientstorecipe
    ADD CONSTRAINT recipes_ingredientstorecipe_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe recipes_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe_tags recipes_recipe_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_pkey PRIMARY KEY (id);


--
-- Name: recipes_recipe_tags recipes_recipe_tags_recipe_id_tags_id_c041d763_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_recipe_id_tags_id_c041d763_uniq UNIQUE (recipe_id, tags_id);


--
-- Name: recipes_tags recipes_tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_tags
    ADD CONSTRAINT recipes_tags_name_key UNIQUE (name);


--
-- Name: recipes_tags recipes_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_tags
    ADD CONSTRAINT recipes_tags_pkey PRIMARY KEY (id);


--
-- Name: recipes_tags recipes_tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_tags
    ADD CONSTRAINT recipes_tags_slug_key UNIQUE (slug);


--
-- Name: users_subscriptions unique_follow; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_subscriptions
    ADD CONSTRAINT unique_follow UNIQUE (author_id, sub_id);


--
-- Name: users_reworkeduser users_reworkeduser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_email_key UNIQUE (email);


--
-- Name: users_reworkeduser_groups users_reworkeduser_group_reworkeduser_id_group_id_df01e40f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_groups
    ADD CONSTRAINT users_reworkeduser_group_reworkeduser_id_group_id_df01e40f_uniq UNIQUE (reworkeduser_id, group_id);


--
-- Name: users_reworkeduser_groups users_reworkeduser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_groups
    ADD CONSTRAINT users_reworkeduser_groups_pkey PRIMARY KEY (id);


--
-- Name: users_reworkeduser users_reworkeduser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_pkey PRIMARY KEY (id);


--
-- Name: users_reworkeduser_user_permissions users_reworkeduser_user__reworkeduser_id_permissi_386f9bce_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_user_permissions
    ADD CONSTRAINT users_reworkeduser_user__reworkeduser_id_permissi_386f9bce_uniq UNIQUE (reworkeduser_id, permission_id);


--
-- Name: users_reworkeduser_user_permissions users_reworkeduser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_user_permissions
    ADD CONSTRAINT users_reworkeduser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_reworkeduser users_reworkeduser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser
    ADD CONSTRAINT users_reworkeduser_username_key UNIQUE (username);


--
-- Name: users_subscriptions users_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_subscriptions
    ADD CONSTRAINT users_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recipes_basket_recipe_id_d679c6f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_basket_recipe_id_d679c6f7 ON public.recipes_basket USING btree (recipe_id);


--
-- Name: recipes_basket_user_id_e80239b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_basket_user_id_e80239b0 ON public.recipes_basket USING btree (user_id);


--
-- Name: recipes_favorites_recipe_id_c32e4c09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_favorites_recipe_id_c32e4c09 ON public.recipes_favorites USING btree (recipe_id);


--
-- Name: recipes_favorites_user_id_c88637ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_favorites_user_id_c88637ac ON public.recipes_favorites USING btree (user_id);


--
-- Name: recipes_ingredients_name_70161089_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_ingredients_name_70161089_like ON public.recipes_ingredients USING btree (name varchar_pattern_ops);


--
-- Name: recipes_ingredientstorecipe_ingredient_id_d0e1d3c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_ingredientstorecipe_ingredient_id_d0e1d3c0 ON public.recipes_ingredientstorecipe USING btree (ingredient_id);


--
-- Name: recipes_ingredientstorecipe_recipe_id_738d09c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_ingredientstorecipe_recipe_id_738d09c4 ON public.recipes_ingredientstorecipe USING btree (recipe_id);


--
-- Name: recipes_recipe_author_id_7274f74b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_recipe_author_id_7274f74b ON public.recipes_recipe USING btree (author_id);


--
-- Name: recipes_recipe_tags_recipe_id_e15a4132; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_recipe_tags_recipe_id_e15a4132 ON public.recipes_recipe_tags USING btree (recipe_id);


--
-- Name: recipes_recipe_tags_tags_id_b6dc311d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_recipe_tags_tags_id_b6dc311d ON public.recipes_recipe_tags USING btree (tags_id);


--
-- Name: recipes_tags_name_f7c3aff1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_tags_name_f7c3aff1_like ON public.recipes_tags USING btree (name varchar_pattern_ops);


--
-- Name: recipes_tags_slug_aab13707_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipes_tags_slug_aab13707_like ON public.recipes_tags USING btree (slug varchar_pattern_ops);


--
-- Name: users_reworkeduser_email_355107e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_email_355107e5_like ON public.users_reworkeduser USING btree (email varchar_pattern_ops);


--
-- Name: users_reworkeduser_groups_group_id_d2fd5fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_groups_group_id_d2fd5fce ON public.users_reworkeduser_groups USING btree (group_id);


--
-- Name: users_reworkeduser_groups_reworkeduser_id_d435856e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_groups_reworkeduser_id_d435856e ON public.users_reworkeduser_groups USING btree (reworkeduser_id);


--
-- Name: users_reworkeduser_user_permissions_permission_id_6574b986; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_user_permissions_permission_id_6574b986 ON public.users_reworkeduser_user_permissions USING btree (permission_id);


--
-- Name: users_reworkeduser_user_permissions_reworkeduser_id_e3cbc19b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_user_permissions_reworkeduser_id_e3cbc19b ON public.users_reworkeduser_user_permissions USING btree (reworkeduser_id);


--
-- Name: users_reworkeduser_username_61cc1848_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_reworkeduser_username_61cc1848_like ON public.users_reworkeduser USING btree (username varchar_pattern_ops);


--
-- Name: users_subscriptions_author_id_1be12ff7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_subscriptions_author_id_1be12ff7 ON public.users_subscriptions USING btree (author_id);


--
-- Name: users_subscriptions_sub_id_7c3d102f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_subscriptions_sub_id_7c3d102f ON public.users_subscriptions USING btree (sub_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_basket recipes_basket_recipe_id_d679c6f7_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_basket
    ADD CONSTRAINT recipes_basket_recipe_id_d679c6f7_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_basket recipes_basket_user_id_e80239b0_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_basket
    ADD CONSTRAINT recipes_basket_user_id_e80239b0_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_favorites recipes_favorites_recipe_id_c32e4c09_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_favorites
    ADD CONSTRAINT recipes_favorites_recipe_id_c32e4c09_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_favorites recipes_favorites_user_id_c88637ac_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_favorites
    ADD CONSTRAINT recipes_favorites_user_id_c88637ac_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientstorecipe recipes_ingredientst_ingredient_id_d0e1d3c0_fk_recipes_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredientstorecipe
    ADD CONSTRAINT recipes_ingredientst_ingredient_id_d0e1d3c0_fk_recipes_i FOREIGN KEY (ingredient_id) REFERENCES public.recipes_ingredients(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_ingredientstorecipe recipes_ingredientst_recipe_id_738d09c4_fk_recipes_r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_ingredientstorecipe
    ADD CONSTRAINT recipes_ingredientst_recipe_id_738d09c4_fk_recipes_r FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe recipes_recipe_author_id_7274f74b_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe
    ADD CONSTRAINT recipes_recipe_author_id_7274f74b_fk_users_reworkeduser_id FOREIGN KEY (author_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe_tags recipes_recipe_tags_recipe_id_e15a4132_fk_recipes_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_recipe_id_e15a4132_fk_recipes_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.recipes_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recipes_recipe_tags recipes_recipe_tags_tags_id_b6dc311d_fk_recipes_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes_recipe_tags
    ADD CONSTRAINT recipes_recipe_tags_tags_id_b6dc311d_fk_recipes_tags_id FOREIGN KEY (tags_id) REFERENCES public.recipes_tags(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reworkeduser_groups users_reworkeduser_g_reworkeduser_id_d435856e_fk_users_rew; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_groups
    ADD CONSTRAINT users_reworkeduser_g_reworkeduser_id_d435856e_fk_users_rew FOREIGN KEY (reworkeduser_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reworkeduser_groups users_reworkeduser_groups_group_id_d2fd5fce_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_groups
    ADD CONSTRAINT users_reworkeduser_groups_group_id_d2fd5fce_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reworkeduser_user_permissions users_reworkeduser_u_permission_id_6574b986_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_user_permissions
    ADD CONSTRAINT users_reworkeduser_u_permission_id_6574b986_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_reworkeduser_user_permissions users_reworkeduser_u_reworkeduser_id_e3cbc19b_fk_users_rew; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reworkeduser_user_permissions
    ADD CONSTRAINT users_reworkeduser_u_reworkeduser_id_e3cbc19b_fk_users_rew FOREIGN KEY (reworkeduser_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_subscriptions users_subscriptions_author_id_1be12ff7_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_subscriptions
    ADD CONSTRAINT users_subscriptions_author_id_1be12ff7_fk_users_reworkeduser_id FOREIGN KEY (author_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_subscriptions users_subscriptions_sub_id_7c3d102f_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_subscriptions
    ADD CONSTRAINT users_subscriptions_sub_id_7c3d102f_fk_users_reworkeduser_id FOREIGN KEY (sub_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

