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
-- Name: main_basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_basket (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.main_basket OWNER TO postgres;

--
-- Name: main_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_basket_id_seq OWNER TO postgres;

--
-- Name: main_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_basket_id_seq OWNED BY public.main_basket.id;


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
-- Name: main_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_ingredients (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    measurement_unit character varying(50) NOT NULL
);


ALTER TABLE public.main_ingredients OWNER TO postgres;

--
-- Name: main_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_ingredients_id_seq OWNER TO postgres;

--
-- Name: main_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_ingredients_id_seq OWNED BY public.main_ingredients.id;


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
-- Name: main_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_recipe (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    img character varying(255),
    description character varying(400) NOT NULL,
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
-- Name: main_recipe_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_recipe_tags (
    id bigint NOT NULL,
    recipe_id bigint NOT NULL,
    tags_id bigint NOT NULL
);


ALTER TABLE public.main_recipe_tags OWNER TO postgres;

--
-- Name: main_recipe_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_recipe_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_recipe_tags_id_seq OWNER TO postgres;

--
-- Name: main_recipe_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_recipe_tags_id_seq OWNED BY public.main_recipe_tags.id;


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
-- Name: main_basket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_basket ALTER COLUMN id SET DEFAULT nextval('public.main_basket_id_seq'::regclass);


--
-- Name: main_favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_favorites ALTER COLUMN id SET DEFAULT nextval('public.main_favorites_id_seq'::regclass);


--
-- Name: main_ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredients ALTER COLUMN id SET DEFAULT nextval('public.main_ingredients_id_seq'::regclass);


--
-- Name: main_ingredientstorecipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe ALTER COLUMN id SET DEFAULT nextval('public.main_ingredientstorecipe_id_seq'::regclass);


--
-- Name: main_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe ALTER COLUMN id SET DEFAULT nextval('public.main_recipe_id_seq'::regclass);


--
-- Name: main_recipe_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe_tags ALTER COLUMN id SET DEFAULT nextval('public.main_recipe_tags_id_seq'::regclass);


--
-- Name: main_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.main_subscriptions_id_seq'::regclass);


--
-- Name: main_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_tags ALTER COLUMN id SET DEFAULT nextval('public.main_tags_id_seq'::regclass);


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
49	Can add subscriptions	13	add_subscriptions
50	Can change subscriptions	13	change_subscriptions
51	Can delete subscriptions	13	delete_subscriptions
52	Can view subscriptions	13	view_subscriptions
53	Can add tags	14	add_tags
54	Can change tags	14	change_tags
55	Can delete tags	14	delete_tags
56	Can view tags	14	view_tags
57	Can add user	15	add_reworkeduser
58	Can change user	15	change_reworkeduser
59	Can delete user	15	delete_reworkeduser
60	Can view user	15	view_reworkeduser
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
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
8	main	basket
9	main	favorites
10	main	ingredients
11	main	ingredientstorecipe
12	main	recipe
13	main	subscriptions
14	main	tags
15	users	reworkeduser
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-04-07 12:56:49.113859+00
2	contenttypes	0002_remove_content_type_name	2023-04-07 12:56:49.12744+00
3	auth	0001_initial	2023-04-07 12:56:49.182055+00
4	auth	0002_alter_permission_name_max_length	2023-04-07 12:56:49.190019+00
5	auth	0003_alter_user_email_max_length	2023-04-07 12:56:49.198055+00
6	auth	0004_alter_user_username_opts	2023-04-07 12:56:49.20579+00
7	auth	0005_alter_user_last_login_null	2023-04-07 12:56:49.213465+00
8	auth	0006_require_contenttypes_0002	2023-04-07 12:56:49.216433+00
9	auth	0007_alter_validators_add_error_messages	2023-04-07 12:56:49.227752+00
10	auth	0008_alter_user_username_max_length	2023-04-07 12:56:49.234493+00
11	auth	0009_alter_user_last_name_max_length	2023-04-07 12:56:49.24107+00
12	auth	0010_alter_group_name_max_length	2023-04-07 12:56:49.24878+00
13	auth	0011_update_proxy_permissions	2023-04-07 12:56:49.255933+00
14	auth	0012_alter_user_first_name_max_length	2023-04-07 12:56:49.263315+00
15	users	0001_initial	2023-04-07 12:56:49.318297+00
16	admin	0001_initial	2023-04-07 12:56:49.346175+00
17	admin	0002_logentry_remove_auto_add	2023-04-07 12:56:49.356396+00
18	admin	0003_logentry_add_action_flag_choices	2023-04-07 12:56:49.365992+00
19	authtoken	0001_initial	2023-04-07 12:56:49.384509+00
20	authtoken	0002_auto_20160226_1747	2023-04-07 12:56:49.417728+00
21	authtoken	0003_tokenproxy	2023-04-07 12:56:49.422001+00
22	main	0001_initial	2023-04-07 12:56:49.47687+00
23	main	0002_initial	2023-04-07 12:56:49.716832+00
24	sessions	0001_initial	2023-04-07 12:56:49.735627+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
1r5zbd6v7hy5ru9ad4drcou76t6da1qj	.eJxVjEEOwiAQRe_C2pBWGGBcuu8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1EX1avT78aUHnnagdxpus06zdO6jKx3RR-06WGW_Lwe7t9BpVa_teNSRCgkz9YDCqB3RLkD4wyGsxGboBiH4DrwwmiZCxYMtscAne_V-wPv6jdz:1pklgd:wbGSuvrpGgZsntVNJuMLXV4MvYXyUmlctLwT7Zu_VjE	2023-04-21 12:59:27.228288+00
\.


--
-- Data for Name: main_basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_basket (id, recipe_id, user_id) FROM stdin;
\.


--
-- Data for Name: main_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_favorites (id, recipe_id, user_id) FROM stdin;
\.


--
-- Data for Name: main_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_ingredients (id, name, measurement_unit) FROM stdin;
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
1225	пекорино	г
1226	пектин	г
1227	пеленгас	г
1228	пельмени	г
1229	пенне	г
1230	пенне ригате	г
1231	пеперончино	ч. л.
1232	пеперончино молотый	щепотка
1233	переводной лист для шоколада	шт.
1234	перепелки	тушка
1235	перец	г
1236	перец белый	г
1237	перец белый горошком	по вкусу
1238	перец белый молотый	г
1239	перец белый свежемолотый	ч. л.
1240	перец болгарский	г
1241	перец болгарский желтый	г
1242	перец болгарский зеленый	г
1243	перец болгарский красный	г
1244	перец горошком	г
1245	перец горошком смесь	г
1246	перец душистый	щепотка
1247	перец душистый горошком	г
1248	перец душистый молотый	г
1249	перец испанский острый	шт.
1250	перец кайенский	г
1251	перец кайенский красный	г
1252	перец кайенский молотый	щепотка
1253	перец красный	г
1254	перец красный горошком	г
1255	перец красный жгучий	г
1256	перец красный молотый	г
1257	перец красный острый	г
1258	перец красный острый молотый	по вкусу
1259	перец красный хлопьями	щепотка
1260	перец лимонный	г
1261	перец маринованный	г
1262	перец острый	г
1263	перец острый зеленый	шт.
1264	перец острый молотый	щепотка
1265	перец падрон	г
1266	перец пеперони	г
1267	перец пеперони красный	шт.
1268	перец розовый горошком	г
1269	перец свежемолотый смесь	г
1270	перец сенегальский	по вкусу
1271	перец сладкий	г
1272	перец сладкий желтый	г
1273	перец сладкий зеленый	г
1274	перец сладкий красный	г
1275	перец сладкий красный маринованный	шт.
1276	перец сладкий красный молотый	г
1277	перец сладкий оранжевый	г
1278	перец сладкий сушеный	г
1279	перец сычуаньский	г
1280	перец халапеньо	г
1281	перец халапеньо маринованный	шт.
1282	перец черный	ст. л.
1283	перец черный горошком	по вкусу
1284	перец черный молотый	г
1285	перец черный свежемолотый	г
1286	перец чили	г
1287	перец чили зеленый	стручок
1288	перец чили красный	стручок
1289	перец чили маринованный	по вкусу
1290	перец чили молотый	г
1291	перец чили сухой	ст. л.
1292	перец чили хлопьями	по вкусу
1293	перец ямайский	г
1294	перловая крупа	г
1295	перловая мука	г
1296	персики	г
1297	персики консервированные	г
1298	персики сушеные	горсть
1299	персиковое пюре	г
1300	персиковый джем	г
1301	персиковый мармелад	ст. л.
1302	персиковый сироп	мл
1303	персиковый сок	г
1304	перцовая паста	ч. л.
1305	петрушка	г
1306	петрушка зелень	г
1307	петрушка итальянская	пучок
1308	петрушка корень	г
1309	петрушка рубленая	г
1310	петрушка сушеная	г
1311	печень	г
1312	печенье	по вкусу
1313	печенье Oreo	г
1314	печенье Амаретти	г
1315	печенье бисквитное	г
1316	печенье галетное	шт.
1317	печенье «Дамские пальчики»	г
1318	печенье песочное	г
1319	печенье рассыпчатое	г
1320	печенье Савоярди	г
1321	печенье сахарное	г
1322	печенье сладкое	г
1323	печенье сухое	г
1324	печенье шоколадное	г
1325	печенье Юбилейное молочное	г
1326	пиво	г
1327	пиво имбирное	мл
1328	пиво нефильтрованное	г
1329	пиво светлое	г
1330	пиво темное	банка
1331	пикша	шт.
1332	питы	по вкусу
1333	повидло	г
1334	подсолнечное масло	г
1335	подсолнечные семечки	г
1336	полба	г
1337	полба недозрелая	г
1338	полента	по вкусу
1339	полента быстрого приготовления	стакан
1340	помело	г
1341	помидоры	г
1342	помидоры бурые	г
1343	помидоры вяленые	по вкусу
1344	помидоры вяленые в масле	г
1345	помидоры желтые	шт.
1346	помидоры зеленые	кг
1347	помидоры консервированные	г
1348	помидоры консервированные в собственном соку	г
1349	помидоры консервированные в собственном соку с базиликом	г
1350	помидоры протертые пассата	г
1351	помидоры соленые	шт.
1352	помидоры сушеные хлопьями	г
1353	помидоры черри	г
1354	помидоры черри желтые	г
1355	попкорн	г
1356	поросенок	кг
1357	портвейн	г
1358	портобелло	г
1359	портулак	г
1360	посыпка кондитерская	по вкусу
1361	почки	г
1362	приправа 4 перца	г
1363	приправа 5 специй (five spice)	ч. л.
1364	приправа для баранины	ст. л.
1365	приправа для картофеля	г
1366	приправа для курицы	г
1367	приправа для макарон	по вкусу
1368	приправа для маринования свинины	по вкусу
1369	приправа для морепродуктов	по вкусу
1370	приправа для мяса	г
1371	приправа для паэльи	по вкусу
1372	приправа для пиццы	ч. л.
1373	приправа для плова	г
1374	приправа для птицы	ст. л.
1375	приправа для рыбы	г
1376	приправа для салатов	по вкусу
1377	приправа заатар	ч. л.
1378	приправа креольская	ст. л.
1379	приправа с сушеными грибами	ч. л.
1380	приправы	г
1381	прованские травы	г
1382	проволоне	г
1383	просекко	мл
1384	простокваша	г
1385	протеин сывороточный	г
1386	прошутто	г
1387	пряники	г
1388	пряничные специи	г
1389	пряности	г
1390	псиллиум	г
1391	птитим	г
1392	пудинг	г
1393	пудинг ванильный	г
1394	пудинг ванильный инстант	упаковка
1395	пудинг карамельный	г
1396	пшеница	г
1397	пшеничная крупа	г
1398	пшеничная мука	г
1399	пшеничная мука цельнозерновая	г
1400	пшеничные зародыши	стакан
1401	пшеничные отруби	г
1402	пшеничные ростки	г
1403	пшеничные хлопья	г
1404	пшенные хлопья	ст. л.
1405	пшено	г
1406	пыльца цветочная	г
1407	пюре	по вкусу
1408	радиккио	шт.
1409	разрыхлитель	г
1410	раки	шт.
1411	раковые шейки	г
1412	раковые шейки в рассоле	г
1413	рамбутан	г
1414	рапаны	г
1415	рапсовое масло	по вкусу
1416	рассол	г
1417	рассол от каперсов	ст. л.
1418	рассол от оливок	ст. л.
1419	растительное масло	г
1420	растительное масло для жарки	г
1421	растительное масло нерафинированное	стакан
1422	растительное масло рафинированное	г
1423	растительное молоко	стакан
1424	ревень	г
1425	реган	веточка
1426	редис	г
1427	редька	г
1428	редька белая	шт.
1429	редька зеленая	шт.
1430	редька черная	шт.
1431	репа	г
1432	репа белая	шт.
1433	ржаная закваска	г
1434	ржаная закваска густая	г
1435	ржаная мука	г
1436	ржаные отруби	г
1437	ригатони	г
1438	рикотта	г
1439	рикотта твердая	г
1440	рис	г
1441	рис арборио	г
1442	рис басмати	г
1443	рис бурый	г
1444	рис бурый и дикий смесь	г
1445	рис вареный	г
1446	рис виола	г
1447	рис девзира	г
1448	рис дикий	г
1449	рис дикий и золотистый смесь	г
1450	рис длиннозерный	г
1451	рис длиннозерный золотистый	г
1452	рис для плова	г
1453	рис для пудинга	г
1454	рис для ризотто	г
1455	рис для суши	г
1456	рис жасминовый	г
1457	рис золотистый	г
1458	рис индика	г
1459	рис италика	г
1460	рис карнароли	г
1461	рис красный	г
1462	рис круглозерный	г
1463	рис кубанский	г
1464	рисовая бумага	г
1465	рисовая лапша	г
1466	рисовая мука	г
1467	рисовое вино	ч. л.
1468	рисовые хлопья	г
1469	рисовые шарики воздушные	г
1470	рисовый крахмал	ст. л.
1471	рисовый уксус	по вкусу
1472	рис пропаренный	г
1473	рис пропаренный и дикий смесь	г
1474	рис японика	г
1475	рожь	г
1476	розмарин	шт.
1477	розмарин сушеный	по вкусу
1478	розовая вода	г
1479	розовые бутоны сушеные	г
1480	розовые лепестки	г
1481	розы	г
1482	рокфор	г
1483	ром	бутылка
1484	ромашка сушеная	г
1485	ромовый экстракт	ч. л.
1486	ром темный	г
1487	ростбиф	г
1488	рукола	г
1489	рулька	по вкусу
1490	рыба	г
1491	рыба белая	г
1492	рыба белая филе	г
1493	рыба консервированная	банка
1494	рыба копченая	г
1495	рыба копченая филе	г
1496	рыба красная	г
1497	рыба красная соленая	г
1498	рыба красная филе	г
1499	рыба-меч	г
1500	рыба морская	г
1501	рыба солнечник филе	шт.
1502	рыба-соль	тушка
1503	рыбное филе	г
1504	рыбные консервы	г
1505	рыбные кости	г
1506	рыбные обрезки, головы, плавники	по вкусу
1507	рыбный бульон	г
1508	рыбный соус	г
1509	рыбный соус Nam Pla	г
1510	рыбный соус тайский	г
1511	рыбный фарш	г
1512	рябина черноплодная	г
1513	рябчик	г
1514	ряженка	г
1515	ряженка 4%	г
1516	сайда	г
1517	сайда филе	г
1518	сайра	г
1519	сайра консервированная	банка
1520	саке	ст. л.
1521	салака	г
1522	салат	г
1523	салат айсберг	г
1524	салат китайский	г
1525	салат корн	пучок
1526	салат кочанный	г
1527	салат кучерявый	г
1528	салат листовой	г
1529	салатный микс	г
1530	салат романо	г
1531	салат фриссе	г
1532	сало	г
1533	сало копченое в перце	г
1534	сало копченое с мясными прослойками	г
1535	сало с мясными прослойками	г
1536	сальник	г
1537	сальса	г
1538	сальса верде	ч. л.
1539	салями	г
1540	салями итальянская	г
1541	сардельки	г
1542	сардельки копченые	г
1543	сардинки маленькие	шт.
1544	сардины	г
1545	сардины в масле	банка
1546	сахар	г
1547	сахар ванильный	г
1548	сахар демерара	г
1549	сахар жемчужный	г
1550	сахар коричневый	г
1551	сахар коричневый крупнокристаллический	г
1552	сахар мусковадо	горсть
1553	сахарная пудра	г
1554	сахарная пудра апельсиновая	г
1555	сахарная пудра ванильная	г
1556	сахарные жемчужинки	г
1557	сахарные кондитерские украшения	горсть
1558	сахарный песок	г
1559	сахарный песок крупный	г
1560	сахарный песок мелкий	г
1561	сахарный сироп	г
1562	сахар пальмовый	г
1563	сахар-рафинад	г
1564	сахар-рафинад с корицей	г
1565	сахар тростниковый	г
1566	сванская соль	г
1567	свекла	г
1568	свекла вареная	г
1569	свекольная ботва	г
1570	свекольные листья	г
1571	свиная вырезка	г
1572	свиная голова	г
1573	свиная грудинка	г
1574	свиная корейка	г
1575	свиная корейка копченая	г
1576	свиная корейка на кости	г
1577	свиная лопатка варено-копченая	г
1578	свиная мякоть	г
1579	свиная пашина	кг
1580	свиная печень	г
1581	свиная рулька	по вкусу
1582	свиная рулька варено-копченая	г
1583	свиная рулька копченая	г
1584	свиная шейка	кусок
1585	свинина	г
1586	свинина вареная	г
1587	свинина нежирная	г
1588	свинина с жирком	г
1589	свиное сердце	г
1590	свиное филе	г
1591	свиной подчеревок	г
1592	свиной фарш	г
1593	свиной язык	г
1594	свиные котлеты на косточке	шт.
1595	свиные легкие	г
1596	свиные ножки	г
1597	свиные отбивные	г
1598	свиные отбивные на косточке	г
1599	свиные ребра	г
1600	свиные уши	шт.
1601	свиные щечки	шт.
1602	свити	г
1603	сельдерей	г
1604	сельдерей зелень	г
1605	сельдерей корень	г
1606	сельдерей корень сушеный	по вкусу
1607	сельдерейная соль	г
1608	сельдерей семена	ч. л.
1609	сельдерей стебли	г
1610	сельдь	г
1611	сельдь слабосоленая	г
1612	сельдь соленая	шт.
1613	сельдь филе	г
1614	семга	г
1615	семга копченая	г
1616	семга свежая	г
1617	семга соленая	г
1618	семга филе на коже	г
1619	семечки	г
1620	семечки смесь	ст. л.
1621	семолина	г
1622	сервелат варено-копченый	г
1623	сибас	г
1624	сидр	г
1625	сироп	г
1626	сироп от консервированных груш	г
1627	сироп от консервированных персиков	ст. л.
1628	сироп топинамбура	стакан
1629	скумбрия	по вкусу
1630	скумбрия свежая	г
1631	скумбрия филе	г
1632	скумбрия холодного копчения	г
1633	сливки	упаковка
1634	сливки 10-20%	г
1635	сливки 15%	г
1636	сливки 20%	г
1637	сливки 33-35%	г
1638	сливки жирные	г
1639	сливки кондитерские	г
1640	сливовая паста	г
1641	сливовое варенье	г
1642	сливовое вино	г
1643	сливовый джем	г
1644	сливовый ликер	ст. л.
1645	сливовый соус	г
1646	сливочное масло	г
1647	сливы	кг
1648	сливы замороженные	г
1649	смалец	г
1650	смесь для кекса	шт.
1651	смесь для оладий	г
1652	смесь для хлеба 8 злаков	г
1653	сметана	г
1654	сметана 10%	г
1655	сметана 15%	ч. л.
1656	сметана 18%	г
1657	сметана 20%	г
1658	сметана 25%	г
1659	сметана 30%	г
1660	сметана 35%	г
1661	сметана жирная	г
1662	сметана нежирная	г
1663	сметана некислая	г
1664	смородина сушеная	г
1665	смородиновые листья	г
1666	сморчки сухие	г
1667	снежок	л
1668	сныть	г
1669	сода	г
1670	соевая мука	г
1671	соевое масло	г
1672	соевое молоко	г
1673	соевые ростки	г
1674	соевый соус	г
1675	сок	г
1676	сок из красных апельсинов	мл
1677	сок мультивитаминный	мл
1678	сок юзу	мл
1679	солод	ч. л.
1680	солод жидкий	г
1681	солодовый экстракт	г
1682	солод темный	г
1683	соломка	г
1684	соль	г
1685	соль гималайская	г
1686	соль крупного помола	г
1687	соль морская	г
1688	сом филе	г
1689	сосиски	г
1690	сосиски из куриного фарша	шт.
1691	сосиски копченые	г
1692	соус	г
1693	соус black bean	ст. л.
1694	соус sambal oelek	ч. л.
1695	соус барбекю	г
1696	соус краснодарский	г
1697	соус красный острый	г
1698	соус мирин	по вкусу
1699	соус наршараб	г
1700	соус острый	г
1701	соус песто	по вкусу
1702	соус сацебели	г
1703	соус табаско	капля
1704	соус терияки	г
1705	соус ткемали	стакан
1706	соус ткемали благородный	г
1707	соус ткемали ранний	ст. л.
1708	соус устричный	ч. л.
1709	соус чили	г
1710	соус чили сладкий	ч. л.
1711	соус экзотический	г
1712	соя	г
1713	спагетти	г
1714	спагетти № 3	г
1715	спагетти № 5	г
1716	спагетти лунги	г
1717	спаржа	кг
1718	спаржа белая	г
1719	спаржа зеленая	г
1720	спаржа молодая	г
1721	спек	г
1722	спельта	стакан
1723	спельтовая (полбяная) мука	г
1724	специи	г
1725	спирт	г
1726	спирулина порошок	г
1727	спред	г
1728	ставрида	г
1729	стейк семги	шт.
1730	стеклянная лапша	г
1731	страчателла	г
1732	судак	г
1733	судак филе	г
1734	судак филе на коже	г
1735	сулугуни	г
1736	сулугуни копченый	г
1737	сумах	г
1738	суповой набор	г
1739	сухари	по вкусу
1740	сухари белые	г
1741	сухари молотые	г
1742	сухари панировочные	г
1743	сухари ржаные	г
1744	сухарная крошка	г
1745	сухофрукты	г
1746	сухофрукты тропические	по вкусу
1747	сушки	г
1748	сыворотка	г
1749	сыр	г
1750	сыр tete de moine	г
1751	сыр Австрия блю	г
1752	сыр адыгейский	г
1753	сыр бри	г
1754	сыр буко	г
1755	сыр гауда	г
1756	сыр гойя	г
1757	сыр голландский	г
1758	сыр голубой	г
1759	сыр гравьера	г
1760	сыр джугас	г
1761	сыр домашний	г
1762	сыр дорблю	г
1763	сыр имеретинский	г
1764	сыр кефалотири	г
1765	сырки творожные	г
1766	сыр козий мягкий	г
1767	сыр козий твердый	г
1768	сыр колбасный	г
1769	сыр копченый	г
1770	сыр коттедж	г
1771	сыр Маскарпоне	г
1772	сыр мраморный	г
1773	сыр мягкий	по вкусу
1774	сыр овечий	г
1775	сыр панир	г
1776	сыр пеше миньон	г
1777	сыр плавленый	г
1778	сыр плавленый шоколадный	г
1779	сыр пластинками	г
1780	сыр полутвердый	г
1781	сыр провола	г
1782	сыр российский	г
1783	сыр скаморца	г
1784	сыр скаморца копченый	г
1785	сыр сливочный	г
1786	сыр с плесенью	г
1787	сыр с плесенью мягкий	г
1788	сыр твердый	г
1789	сыр филадельфия	г
1790	сыр фонтина	г
1791	сыр хаварти	г
1792	сыр швейцарский	г
1793	сычужный фермент	ч. л.
1794	таледжо	г
1795	тальолини	г
1796	тальятелле	г
1797	тальятелле-гнезда	шт.
1798	тамаринд	шт.
1799	тамариндовая паста	ч. л.
1800	тапиока	г
1801	тарталетки	по вкусу
1802	тартар	ст. л.
1803	тархун	г
1804	творог	г
1805	творог 18%	г
1806	творог 2%	г
1807	творог 5%	г
1808	творог 9%	г
1809	творог жирный	г
1810	творог зерненый	г
1811	творог обезжиренный	г
1812	творожная масса	г
1813	творожная паста	г
1814	творожный сыр	г
1815	творожный сыр соленый	г
1816	творожок клубничный	г
1817	текила	стакан
1818	телятина	по вкусу
1819	телятина вареная	г
1820	телячий фарш	г
1821	телячьи отбивные на косточке	шт.
1822	телячьи шницели	шт.
1823	телячьи эскалопы	г
1824	телячья вырезка	г
1825	телячья печень	г
1826	телячья щека	шт.
1827	тесто бездрожжевое	г
1828	тесто готовое	г
1829	тесто для вонтонов	г
1830	тесто для пиццы	шт.
1831	тесто дрожжевое	по вкусу
1832	тесто катаифи	г
1833	тесто макаронное	г
1834	тесто макаронное для лазаньи	г
1835	тесто пельменное	г
1836	тесто песочное	по вкусу
1837	тесто пресное	г
1838	тесто пряничное	г
1839	тесто слоеное	г
1840	тесто слоеное бездрожжевое	по вкусу
1841	тесто слоеное дрожжевое	кг
1842	тесто фило	г
1843	тилапия	г
1844	тилапия филе	г
1845	тильзитер	г
1846	тимьян	горсть
1847	тимьян лимонный	веточка
1848	тимьян свежий	по вкусу
1849	тимьян сушеный	г
1850	ткемали	г
1851	тмин	г
1852	тмин молотый	г
1853	томатная паста	г
1854	томатное пюре	г
1855	томатный концентрат	г
1856	томатный порошок	г
1857	томатный сок	г
1858	томатный соус	г
1859	томатный соус итальянский	г
1860	томатный соус острый	г
1861	томатный соус с базиликом	г
1862	тоник	бутылка
1863	топинамбур	г
1864	топленое масло	г
1865	тортильи	по вкусу
1866	тортильони	г
1867	тофу	г
1868	травы ароматные	г
1869	травы пряные с перцем	ч. л.
1870	травы сухие	г
1871	треска	г
1872	треска печень	г
1873	треска филе	г
1874	трюфель	г
1875	трюфельная крошка	г
1876	трюфельное масло	ст. л.
1877	трюфель черный	шт.
1878	тунец	по вкусу
1879	тунец консервированный	г
1880	тунец филе	г
1881	тушенка	г
1882	тыква	г
1883	тыквенное масло	шт.
1884	тыквенное пюре	г
1885	тыквенные семечки	г
1886	тюлька свежая	г
1887	угорь	г
1888	угорь копченый	г
1889	угурт	г
1890	укроп	г
1891	укропное семя	ч. л.
1892	укроп свежий	г
1893	укроп сушеный	г
1894	уксус	г
1895	уксус 9%	г
1896	уксус из сидра	ст. л.
1897	уксусная эссенция	г
1898	уксус столовый	г
1899	улитки	г
1900	улитки виноградные	шт.
1901	урюк	г
1902	устрицы	г
1903	утиная грудка	г
1904	утиная печень	г
1905	утиное филе	г
1906	утиные бедрышки	г
1907	утиные ножки	по вкусу
1908	утка	по вкусу
1909	утка печеная	г
1910	утка тушка	тушка
1911	уцхо-сунели	г
1912	фазан	г
1913	фарш (баранина и говядина)	г
1914	фарш (свинина и курица)	г
1915	фасоль	г
1916	фасоль белая	г
1917	фасоль белая консервированная	г
1918	фасоль белая лима	г
1919	фасоль зеленая стручковая	г
1920	фасоль кенийская	горсть
1921	фасоль кидни красная	г
1922	фасоль консервированная	г
1923	фасоль красная	г
1924	фасоль красная вареная	стакан
1925	фасоль красная консервированная	г
1926	фасоль молодая замороженная	г
1927	фасоль пинто	г
1928	фасоль спаржевая вареная	г
1929	фасоль стручковая	г
1930	фасоль стручковая замороженная	г
1931	фасоль стручковая консервированная	г
1932	фасоль черный глаз	г
1933	фейхоа	г
1934	фенхель	г
1935	фенхель семена	г
1936	фенхель семена молотые	г
1937	фестонате	г
1938	фета	г
1939	фетаки	г
1940	фетакса	г
1941	феттучине	г
1942	фиалки засахаренные	шт.
1943	фиалковый сироп	г
1944	физалис	по вкусу
1945	филе красного окуня	шт.
1946	филе лосося	г
1947	филе палтуса	шт.
1948	финики	г
1949	финики без косточек	стакан
1950	финики иранские	г
1951	финики иранские без косточек	шт.
1952	фисташки	г
1953	фисташки очищенные	г
1954	фисташки очищенные несоленые	горсть
1955	фисташки рубленые	г
1956	фисташковая мука	г
1957	фисташковая паста	г
1958	фисташковое масло	г
1959	фокачча	по вкусу
1960	форель	г
1961	форель вареная	г
1962	форель горячего копчения	г
1963	форель озерная свежая	шт.
1964	форель слабосоленая	г
1965	форель стейки	шт.
1966	форель филе	г
1967	форель холодного копчения	г
1968	фрикадельки	г
1969	фрукт дракона	шт.
1970	фруктовый сироп	г
1971	фруктовый сок	г
1972	фруктовый сок без сахара	стакан
1973	фруктоза	г
1974	фрукты	г
1975	фрукты консервированные	г
1976	фундук	г
1977	фундучная мука	г
1978	фунчоза	г
1979	халва	г
1980	халва ванильная	г
1981	халва подсолнечная	г
1982	халуми	г
1983	хамон	г
1984	хек	г
1985	хек филе	г
1986	херес	стакан
1987	хересный уксус	ч. л.
1988	хлеб	г
1989	хлеб 7 злаков	батон
1990	хлеб белый	г
1991	хлеб белый сухой	г
1992	хлеб бородинский	кусок
1993	хлеб датский ржаной	г
1994	хлеб для сэндвичей	г
1995	хлебная крошка	г
1996	хлеб ржаной	г
1997	хлеб серый	г
1998	хлеб с кунжутом	кусок
1999	хлеб цельнозерновой	г
2000	хлебцы пшенично-ржаные цельнозерновые	г
2001	хлопья 4 злака	г
2002	хлопья 5 злаков	г
2003	хлопья 7 злаков	ст. л.
2004	хлопья быстрого приготовления	стакан
2005	хлорид кальция	г
2006	хмели-сунели	г
2007	хмель	ст. л.
2008	хрен	г
2009	хрен протертый	г
2010	хрен со сливками	г
2011	хурма	г
2012	хурма спелая	г
2013	цесарка тушка	г
2014	цикорий	ч. л.
2015	цитроновые цукаты	горсть
2016	цитрусовые цукаты	шт.
2017	цитрусовый свежевыжатый сок	мл
2018	цукаты	г
2019	цукини	г
2020	цукини цветы	шт.
2021	цыплята	г
2022	цыплята-корнишоны	шт.
2023	чабер	г
2024	чабрец	г
2025	чабрец сушеный	г
2026	чай дарджилинг	пакетик
2027	чай жасминовый	ст. л.
2028	чай зеленый	пакетик
2029	чай копченый лапсанг сушонг	г
2030	чай красный	г
2031	чай ройбуш	ст. л.
2032	чай черный	г
2033	чай черный крупнолистовой	ч. л.
2034	чай черный со специями	пакет
2035	чай эрл грей	стакан
2036	чатни манго	г
2037	чеддер	г
2038	черемуха	г
2039	черемуховая мука	г
2040	черемша	г
2041	черешневый джем	г
2042	черешня	г
2043	черешня консервированная без косточек	ст. л.
2044	черная смородина	г
2045	черника	г
2046	черника замороженная	г
2047	чернила каракатицы	г
2048	черничный джем	стакан
2049	чернослив	г
2050	чернослив без косточек	г
2051	чернослив вяленый	г
2052	чернослив копченый без косточек	г
2053	черносмородиновое варенье	г
2054	черносмородиновый джем	г
2055	чеснок	г
2056	чеснок молодой	г
2057	чеснок сушеный	г
2058	чесночная соль	щепотка
2059	чесночное масло	по вкусу
2060	чесночный порошок	г
2061	чечевица	г
2062	чечевица вареная	ст. л.
2063	чечевица зеленая	г
2064	чечевица красная	г
2065	чечил спагетти	г
2066	чиабатта	кусок
2067	чиа семена	г
2068	чипотле молотый	щепотка
2069	чипсы	г
2070	чоризо	г
2071	шалфей	г
2072	шалфей свежий	пучок
2073	шалфей сушеный	лист
2074	шампанское	г
2075	шампанское советское	стакан
2076	шампанское сухое	ст. л.
2077	шампиньоны	по вкусу
2078	шампиньоны замороженные	г
2079	шампиньоны консервированные	г
2080	шампиньоны маринованные	г
2081	шампиньоны свежие	г
2082	шафран	г
2083	шафран имеретинский	г
2084	шафран молотый	ч. л.
2085	шафран нити	шт.
2086	шелковица	г
2087	шелковица сушеная	г
2088	шиповник	г
2089	шиповниковый сироп	г
2090	шнапс	г
2091	шнитт-лук	стебель
2092	шоколад	г
2093	шоколад белый	г
2094	шоколад горький с апельсиновой цедрой	г
2095	шоколад молочный	г
2096	шоколад мятный	г
2097	шоколадная паста	г
2098	шоколадная стружка	г
2099	шоколадное масло	г
2100	шоколадно-ореховая паста	г
2101	шоколадные горошины	г
2102	шоколадные капли	г
2103	шоколадные капли белые	г
2104	шоколадные конфеты	г
2105	шоколадные хлопья	г
2106	шоколадные шарики из готовых завтраков	горсть
2107	шоколадный ликер	г
2108	шоколадный сироп	г
2109	шоколадный соус	г
2110	шоколад полусладкий	г
2111	шоколад с орехами	г
2112	шоколад черный горький	г
2113	шоколад черный горький 70%	г
2114	шоколад черный горький 75%	ч. л.
2115	шоколад черный горький 85%	г
2116	шортенинг	стакан
2117	шпик	шт.
2118	шпик копченый	г
2119	шпинат	г
2120	шпинат замороженный	г
2121	шпинат молодой	г
2122	шпинат свежий	г
2123	шпроты	г
2124	шпроты в масле	г
2125	шрот	г
2126	щавель замороженный	г
2127	щавель свежий	веточка
2128	щука	г
2129	щука филе	г
2130	эгг-ног	стакан
2131	эдам	г
2132	эль	мл
2133	эмменталь	г
2134	эскалоп	г
2135	эстрагон	г
2136	эстрагон сушеный	веточка
2137	яблоки	г
2138	яблоки антоновка	кг
2139	яблоки гала	г
2140	яблоки голден	г
2141	яблоки гренни смит	кг
2142	яблоки зеленые	г
2143	яблоки красные	шт.
2144	яблоки моченые	шт.
2145	яблоки нетвердых сортов	г
2146	яблоки сладкие	г
2147	яблоки сушеные	г
2148	яблочная эссенция	ч. л.
2149	яблочное варенье	г
2150	яблочное повидло	г
2151	яблочное пюре	г
2152	яблочные чипсы	стакан
2153	яблочный джем	г
2154	яблочный сироп	ст. л.
2155	яблочный сок	г
2156	яблочный соус	ст. л.
2157	яблочный уксус	г
2158	ягнятина	г
2159	ягнятина кострец	г
2160	ягнятина фарш	г
2161	ягнячьи отбивные на косточке	шт.
2162	ягнячья голень нарубленная	г
2163	ягнячья корейка	г
2164	ягодное варенье	ст. л.
2165	ягодное желе	г
2166	ягодный сироп	г
2167	ягодный сок	г
2168	ягодный соус кислый	г
2169	ягоды	г
2170	ягоды вяленые	по вкусу
2171	ягоды замороженные	г
2172	ягоды лесные	г
2173	ягоды лесные замороженные	г
2174	яичные белки	г
2175	яичные желтки	г
2176	яичные желтки вареные	шт.
2177	яичные желтки крупные	г
2178	яичный меланж	г
2179	яичный порошок	ст. л.
2180	яйца куриные	г
2181	яйца куриные крупные	г
2182	яйца перепелиные	г
2183	японская крошка панко	г
2184	ячменные хлопья	г
2185	ячмень	г
2186	ячневая крупа	г
\.


--
-- Data for Name: main_ingredientstorecipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_ingredientstorecipe (id, amount, ingredient_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: main_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_recipe (id, name, img, description, time_to_cook, author_id) FROM stdin;
\.


--
-- Data for Name: main_recipe_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_recipe_tags (id, recipe_id, tags_id) FROM stdin;
\.


--
-- Data for Name: main_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_subscriptions (id, author_id, sub_id) FROM stdin;
\.


--
-- Data for Name: main_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_tags (id, name, color, slug) FROM stdin;
\.


--
-- Data for Name: users_reworkeduser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reworkeduser (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, username) FROM stdin;
1	pbkdf2_sha256$260000$9v4jBAYREXIBBeO7kzpKM4$rSkeAXfbN0p7ShWV+3SI8PTxbSvYS642a7t0TLG3c60=	2023-04-07 12:59:27.225586+00	t			t	t	2023-04-07 12:59:24.489825+00	root@rt.rt	root
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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: main_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_basket_id_seq', 1, false);


--
-- Name: main_favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_favorites_id_seq', 1, false);


--
-- Name: main_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_ingredients_id_seq', 2186, true);


--
-- Name: main_ingredientstorecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_ingredientstorecipe_id_seq', 1, false);


--
-- Name: main_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_recipe_id_seq', 1, false);


--
-- Name: main_recipe_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_recipe_tags_id_seq', 1, false);


--
-- Name: main_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_subscriptions_id_seq', 1, false);


--
-- Name: main_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_tags_id_seq', 1, false);


--
-- Name: users_reworkeduser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_groups_id_seq', 1, false);


--
-- Name: users_reworkeduser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_id_seq', 1, true);


--
-- Name: users_reworkeduser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reworkeduser_user_permissions_id_seq', 1, false);


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
-- Name: main_basket main_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_basket
    ADD CONSTRAINT main_basket_pkey PRIMARY KEY (id);


--
-- Name: main_basket main_basket_user_id_recipe_id_21d87b7e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_basket
    ADD CONSTRAINT main_basket_user_id_recipe_id_21d87b7e_uniq UNIQUE (user_id, recipe_id);


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
-- Name: main_ingredients main_ingredients_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredients
    ADD CONSTRAINT main_ingredients_name_key UNIQUE (name);


--
-- Name: main_ingredients main_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredients
    ADD CONSTRAINT main_ingredients_pkey PRIMARY KEY (id);


--
-- Name: main_ingredientstorecipe main_ingredientstorecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_ingredientstorecipe
    ADD CONSTRAINT main_ingredientstorecipe_pkey PRIMARY KEY (id);


--
-- Name: main_recipe main_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe
    ADD CONSTRAINT main_recipe_pkey PRIMARY KEY (id);


--
-- Name: main_recipe_tags main_recipe_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe_tags
    ADD CONSTRAINT main_recipe_tags_pkey PRIMARY KEY (id);


--
-- Name: main_recipe_tags main_recipe_tags_recipe_id_tags_id_75c71394_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe_tags
    ADD CONSTRAINT main_recipe_tags_recipe_id_tags_id_75c71394_uniq UNIQUE (recipe_id, tags_id);


--
-- Name: main_subscriptions main_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT main_subscriptions_pkey PRIMARY KEY (id);


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
-- Name: main_subscriptions unique_follow; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_subscriptions
    ADD CONSTRAINT unique_follow UNIQUE (author_id, sub_id);


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
-- Name: main_basket_recipe_id_ae6a2d9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_basket_recipe_id_ae6a2d9c ON public.main_basket USING btree (recipe_id);


--
-- Name: main_basket_user_id_98e99cea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_basket_user_id_98e99cea ON public.main_basket USING btree (user_id);


--
-- Name: main_favorites_recipe_id_73eb79a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_favorites_recipe_id_73eb79a4 ON public.main_favorites USING btree (recipe_id);


--
-- Name: main_favorites_user_id_728d716c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_favorites_user_id_728d716c ON public.main_favorites USING btree (user_id);


--
-- Name: main_ingredients_name_f824a24f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_ingredients_name_f824a24f_like ON public.main_ingredients USING btree (name varchar_pattern_ops);


--
-- Name: main_ingredientstorecipe_ingredient_id_3ea04b46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_ingredientstorecipe_ingredient_id_3ea04b46 ON public.main_ingredientstorecipe USING btree (ingredient_id);


--
-- Name: main_ingredientstorecipe_recipe_id_45f1355a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_ingredientstorecipe_recipe_id_45f1355a ON public.main_ingredientstorecipe USING btree (recipe_id);


--
-- Name: main_recipe_author_id_3b3e7443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_recipe_author_id_3b3e7443 ON public.main_recipe USING btree (author_id);


--
-- Name: main_recipe_tags_recipe_id_a60f5405; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_recipe_tags_recipe_id_a60f5405 ON public.main_recipe_tags USING btree (recipe_id);


--
-- Name: main_recipe_tags_tags_id_bca4c68f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_recipe_tags_tags_id_bca4c68f ON public.main_recipe_tags USING btree (tags_id);


--
-- Name: main_subscriptions_author_id_416f03d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscriptions_author_id_416f03d8 ON public.main_subscriptions USING btree (author_id);


--
-- Name: main_subscriptions_sub_id_2bebea83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_subscriptions_sub_id_2bebea83 ON public.main_subscriptions USING btree (sub_id);


--
-- Name: main_tags_name_b21216e6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_tags_name_b21216e6_like ON public.main_tags USING btree (name varchar_pattern_ops);


--
-- Name: main_tags_slug_92646cf9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_tags_slug_92646cf9_like ON public.main_tags USING btree (slug varchar_pattern_ops);


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
-- Name: main_basket main_basket_recipe_id_ae6a2d9c_fk_main_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_basket
    ADD CONSTRAINT main_basket_recipe_id_ae6a2d9c_fk_main_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.main_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_basket main_basket_user_id_98e99cea_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_basket
    ADD CONSTRAINT main_basket_user_id_98e99cea_fk_users_reworkeduser_id FOREIGN KEY (user_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: main_recipe main_recipe_author_id_3b3e7443_fk_users_reworkeduser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe
    ADD CONSTRAINT main_recipe_author_id_3b3e7443_fk_users_reworkeduser_id FOREIGN KEY (author_id) REFERENCES public.users_reworkeduser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_recipe_tags main_recipe_tags_recipe_id_a60f5405_fk_main_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe_tags
    ADD CONSTRAINT main_recipe_tags_recipe_id_a60f5405_fk_main_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.main_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_recipe_tags main_recipe_tags_tags_id_bca4c68f_fk_main_tags_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_recipe_tags
    ADD CONSTRAINT main_recipe_tags_tags_id_bca4c68f_fk_main_tags_id FOREIGN KEY (tags_id) REFERENCES public.main_tags(id) DEFERRABLE INITIALLY DEFERRED;


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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

