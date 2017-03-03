--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    campaign_name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    currency character varying(255) NOT NULL,
    campaign_slug character varying(255) NOT NULL,
    days_limit integer NOT NULL,
    sales_goal integer NOT NULL,
    items text NOT NULL,
    design text NOT NULL,
    record_status character varying(255) DEFAULT 'inactive'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT campaigns_currency_check CHECK (((currency)::text = ANY ((ARRAY['eur'::character varying, 'usd'::character varying])::text[]))),
    CONSTRAINT campaigns_record_status_check CHECK (((record_status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE campaigns OWNER TO badrinarayanananravi;

--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE campaigns_id_seq OWNER TO badrinarayanananravi;

--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE images (
    id integer NOT NULL,
    image_name character varying(255) NOT NULL,
    teezily_name character varying(255) NOT NULL,
    teezily_image_path character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE images OWNER TO badrinarayanananravi;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE images_id_seq OWNER TO badrinarayanananravi;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE jobs OWNER TO badrinarayanananravi;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobs_id_seq OWNER TO badrinarayanananravi;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: marketplaces; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE marketplaces (
    id bigint NOT NULL,
    marketplace_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    parent_id bigint NOT NULL,
    record_status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT marketplaces_record_status_check CHECK (((record_status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE marketplaces OWNER TO badrinarayanananravi;

--
-- Name: marketplaces_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE marketplaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marketplaces_id_seq OWNER TO badrinarayanananravi;

--
-- Name: marketplaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE marketplaces_id_seq OWNED BY marketplaces.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO badrinarayanananravi;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO badrinarayanananravi;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: badrinarayanananravi
--

CREATE TABLE products (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    product_reference character varying(255) NOT NULL,
    sides_id character varying(255) NOT NULL,
    sides character varying(255) NOT NULL,
    colors character varying(255) NOT NULL,
    record_status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT products_record_status_check CHECK (((record_status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[])))
);


ALTER TABLE products OWNER TO badrinarayanananravi;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: badrinarayanananravi
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO badrinarayanananravi;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: badrinarayanananravi
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: marketplaces id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY marketplaces ALTER COLUMN id SET DEFAULT nextval('marketplaces_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY campaigns (id, campaign_name, description, currency, campaign_slug, days_limit, sales_goal, items, design, record_status, created_at, updated_at) FROM stdin;
\.


--
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('campaigns_id_seq', 2, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY images (id, image_name, teezily_name, teezily_image_path, created_at, updated_at) FROM stdin;
12	image	98365a7feff51913f4086e2955a3b92ac520d060.jpeg	https://tzy.s3-eu-west-1.amazonaws.com/cloud_images/98365a7feff51913f4086e2955a3b92ac520d060.jpeg	2017-02-26 17:10:13	2017-02-26 17:10:13
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('images_id_seq', 12, true);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('jobs_id_seq', 10, true);


--
-- Data for Name: marketplaces; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY marketplaces (id, marketplace_id, name, slug, parent_id, record_status, created_at, updated_at) FROM stdin;
1	1	fundraise	fundraise	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
2	2	peace_for_paris	fundraise/peace-for-paris	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
3	3	human_rights	fundraise/human-rights	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
4	4	animal_rescue	fundraise/animal-rescue	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
5	5	autism	fundraise/autism	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
6	6	cancer	fundraise/cancer	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
7	7	world_peace	fundraise/world-peace	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
8	8	disability	fundraise/disability	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
9	9	for_a_cause	fundraise/for-a-cause	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
10	10	other	fundraise/other	1	active	2017-02-21 16:19:24	2017-02-21 16:19:24
11	11	family	family	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
12	12	girlfriend	family/girlfriend	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
13	13	grandparents	family/grandparents	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
14	14	wife	family/wife	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
15	15	mother	family/mother	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
16	16	kids	family/kids	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
17	17	father	family/father	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
18	18	husband	family/husband	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
19	19	nephew_and_niece	family/nephew-and-niece	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
20	20	parents	family/parents	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
21	21	brother	family/brother	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
22	22	sister	family/sister	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
23	23	son	family/son	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
24	24	uncle	family/uncle	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
25	25	daugther	family/daugther	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
26	26	other	family/other	11	active	2017-02-21 16:19:24	2017-02-21 16:19:24
27	27	hobbies	hobbies	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
28	28	fitness	hobbies/fitness	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
29	29	music	hobbies/music	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
30	30	movies	hobbies/movies	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
31	31	video_games	hobbies/video-games	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
32	32	running	hobbies/running	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
33	33	yoga	hobbies/yoga	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
34	34	camping	hobbies/camping	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
35	35	art	hobbies/art	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
36	36	photography	hobbies/photography	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
37	37	travel	hobbies/travel	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
38	38	cars	hobbies/cars	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
39	39	motorcycle	hobbies/motorcycle	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
40	40	fishing	hobbies/fishing	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
41	41	other	hobbies/other	27	active	2017-02-21 16:19:24	2017-02-21 16:19:24
42	42	sports	sports	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
43	43	football	sports/football	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
44	44	rugby	sports/rugby	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
45	45	basketball	sports/basketball	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
46	46	tennis	sports/tennis	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
47	47	table_tennis	sports/table-tennis	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
48	48	badminton	sports/badminton	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
49	49	volleyball	sports/volleyball	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
50	50	other	sports/other	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
51	51	animals	animals	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
52	52	dog	animals/dog	51	active	2017-02-21 16:19:24	2017-02-21 16:19:24
53	53	cat	animals/cat	51	active	2017-02-21 16:19:24	2017-02-21 16:19:24
54	54	horse	animals/horse	51	active	2017-02-21 16:19:24	2017-02-21 16:19:24
55	55	pets	animals/pets	51	active	2017-02-21 16:19:24	2017-02-21 16:19:24
56	56	other	animals/other	51	active	2017-02-21 16:19:24	2017-02-21 16:19:24
57	57	events	events	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
58	58	st_patricks_day	events/st-patrick-s-day	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
59	59	14_juillet	events/14-juillet	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
60	60	mardi_gras	events/mardi-gras	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
61	61	oktoberfest	events/oktoberfest	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
62	62	fathers_day	events/father-s-day	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
63	63	mothers_day	events/mother-s-day	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
64	64	halloween	events/halloween	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
65	65	christmas	events/christmas	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
66	66	valentines_day	events/valentine-s-day	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
67	67	easter	events/easter	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
68	68	new_year	events/new-year	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
69	69	other	events/other	57	active	2017-02-21 16:19:24	2017-02-21 16:19:24
70	70	jobs	jobs	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
71	71	farmer	jobs/farmer	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
72	72	fisherman	jobs/fisherman	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
73	73	engineer	jobs/engineer	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
74	74	military	jobs/military	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
75	75	legal	jobs/legal	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
76	76	high_school	jobs/high-school	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
77	77	hospital	jobs/hospital	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
78	78	industrial	jobs/industrial	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
79	79	services	jobs/services	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
80	80	science	jobs/science	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
81	81	education	jobs/education	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
82	82	transportation	jobs/transportation	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
83	83	business	jobs/business	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
84	84	other	jobs/other	70	active	2017-02-21 16:19:24	2017-02-21 16:19:24
85	85	entertainment	entertainment	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
86	86	music	entertainment/music	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
87	87	movie	entertainment/movie	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
88	88	journalism	entertainment/journalism	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
89	89	books	entertainment/books	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
90	90	science_fiction	entertainment/science-fiction	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
91	91	podcast	entertainment/podcast	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
92	92	radio	entertainment/radio	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
93	93	tv	entertainment/tv	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
94	94	video_games	entertainment/video-games	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
95	96	other	entertainment/other	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
96	97	alcool	entertainment/alcool	85	active	2017-02-21 16:19:24	2017-02-21 16:19:24
97	98	hockey	sports/hockey	42	active	2017-02-21 16:19:24	2017-02-21 16:19:24
98	99	ages	ages	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
99	100	1_10	ages/1-10	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
100	101	11_20	ages/11-20	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
101	102	21_30	ages/21-30	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
102	103	31_40	ages/31-40	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
103	104	41_50	ages/41-50	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
104	105	51_60	ages/51-60	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
105	106	61_70	ages/61-70	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
106	107	71_80	ages/71-80	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
107	108	81_100	ages/81-100	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
108	109	1920_1935	ages/1920-1935	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
109	110	1936_1945	ages/1936-1945	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
110	111	1946_1955	ages/1946-1955	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
111	112	1956_1965	ages/1956-1965	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
112	113	1966_1975	ages/1966-1975	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
113	114	1976_1985	ages/1976-1985	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
114	115	1986_1995	ages/1986-1995	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
115	116	1996_2005	ages/1996-2005	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
116	117	2006_2015	ages/2006-2015	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
117	118	2016_2025	ages/2016-2025	99	active	2017-02-21 16:19:24	2017-02-21 16:19:24
118	119	names	names	0	active	2017-02-21 16:19:24	2017-02-21 16:19:24
119	120	starting_with_a	names/starting-with-a	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
120	121	starting_with_b	names/starting-with-b	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
121	122	starting_with_c	names/starting-with-c	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
122	123	starting_with_d	names/starting-with-d	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
123	124	starting_with_e	names/starting-with-e	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
124	125	starting_with_f	names/starting-with-f	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
125	126	starting_with_g	names/starting-with-g	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
126	127	starting_with_h	names/starting-with-h	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
127	128	starting_with_i	names/starting-with-i	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
128	129	starting_with_j	names/starting-with-j	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
129	130	starting_with_k	names/starting-with-k	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
130	131	starting_with_l	names/starting-with-l	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
131	132	starting_with_m	names/starting-with-m	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
132	133	starting_with_n	names/starting-with-n	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
133	134	starting_with_o	names/starting-with-o	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
134	135	starting_with_p	names/starting-with-p	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
135	136	starting_with_q	names/starting-with-q	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
136	137	starting_with_r	names/starting-with-r	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
137	138	starting_with_s	names/starting-with-s	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
138	139	starting_with_t	names/starting-with-t	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
139	140	starting_with_u	names/starting-with-u	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
140	141	starting_with_v	names/starting-with-v	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
141	142	starting_with_w	names/starting-with-w	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
142	143	starting_with_x	names/starting-with-x	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
143	144	starting_with_y	names/starting-with-y	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
144	145	starting_with_z	names/starting-with-z	119	active	2017-02-21 16:19:24	2017-02-21 16:19:24
\.


--
-- Name: marketplaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('marketplaces_id_seq', 144, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY migrations (id, migration, batch) FROM stdin;
2	2017_02_14_170521_create_products_table	1
3	2017_02_14_175001_create_marketplaces_table	2
4	2017_02_19_115302_create_images_table	3
12	2017_02_27_171846_create_campaigns_table	4
13	2017_03_03_100157_create_jobs_table	4
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('migrations_id_seq', 13, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: badrinarayanananravi
--

COPY products (id, product_id, product_reference, sides_id, sides, colors, record_status, created_at, updated_at) FROM stdin;
1	1	TSRN_U	1,2	front,back	white,black,navy,royal_blue,blue_sky,yellow,red,green_bottle,charcoal,dark_chocolate,irish_green,orange,sport_grey,sand,purple,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
2	6	TSVN_U	11,12	front,back	white,black,navy,red,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
3	7	TSVN_W	13,14	front,back	white,black,navy,red,pink_azalea,sport_grey,purple,irish_green,royal_blue,charcoal	active	2017-02-26 13:08:47	2017-02-26 13:08:47
4	11	TKTP_W	21,22	front,back	white,black,navy,red,pink_azalea,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
5	15	SWTR_U	29,30	front,back	white,black,navy,royal_blue,red,green_bottle,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
6	21	HOOD_U	41,42	front,back	black,navy,royal_blue,red,purple,charcoal	active	2017-02-26 13:08:47	2017-02-26 13:08:47
7	26	TSRN_W	51,52	front,back	pink_azalea,black,charcoal,yellow,dark_chocolate,irish_green,blue_sky,navy,purple,red,royal_blue,white,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
8	28	TSLS_U	55,56	front,back	white,navy,black,charcoal,red,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
9	31	HOOD_U	57,58	front,back	black,navy,royal_blue,red,green_bottle,purple,turquoise,orange,dark_pink,charcoal,white,blue_sky,sport_grey,irish_green	active	2017-02-26 13:08:47	2017-02-26 13:08:47
10	32	TSRN_U	59,60	front,back	white,black,navy,royal_blue,yellow,red,green_bottle,orange,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
11	33	TSLS_U	61,62	front,back	white,navy,black,red,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
12	34	TSRN_K	63,64	front,back	white,black,navy,red,royal_blue	active	2017-02-26 13:08:47	2017-02-26 13:08:47
13	35	HOOD_K	65,66	front,back	white,black,navy,red,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
14	36	BODY_B	67,68	front,back	white	active	2017-02-26 13:08:47	2017-02-26 13:08:47
15	37	TKTP_U	69,70	front,back	white,black,navy,red,royal_blue,sport_grey	active	2017-02-26 13:08:47	2017-02-26 13:08:47
16	38	MAGN_U	71,85	front,side	white,black,navy,royal_blue,blue_sky,yellow,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
17	39	MUG_U	72,73,74	front,side,back	white,black	active	2017-02-26 13:08:47	2017-02-26 13:08:47
18	40	IP6PC_U	75	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
19	41	IP6C_U	76	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
20	42	IP5C_U	77	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
21	44	IP5SC_U	79	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
22	48	SGS6C_U	83	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
23	49	SGS5C_U	84	front	white,black,navy,royal_blue,blue_sky,red,green_bottle,neon_yellow,charcoal,chestnut,dark_chocolate,irish_green,military_green,neon_orange,sand,pink_azalea,purple,light_pink,turquoise,dark_pink	active	2017-02-26 13:08:47	2017-02-26 13:08:47
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: badrinarayanananravi
--

SELECT pg_catalog.setval('products_id_seq', 23, true);


--
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: marketplaces marketplaces_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY marketplaces
    ADD CONSTRAINT marketplaces_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: badrinarayanananravi
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_reserved_at_index; Type: INDEX; Schema: public; Owner: badrinarayanananravi
--

CREATE INDEX jobs_queue_reserved_at_index ON jobs USING btree (queue, reserved_at);


--
-- PostgreSQL database dump complete
--

