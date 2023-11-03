--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

-- Started on 2023-11-03 08:09:27 MSK

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
-- TOC entry 212 (class 1259 OID 16395)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 16394)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO admin;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 211
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 210 (class 1259 OID 16388)
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 16387)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO admin;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 214 (class 1259 OID 16407)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 16406)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO admin;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 213
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 216 (class 1259 OID 16419)
-- Name: products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    article character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    data jsonb,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 16418)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO admin;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 215
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 218 (class 1259 OID 16430)
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    roles json NOT NULL
);


ALTER TABLE public.users OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16429)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3225 (class 2604 OID 16398)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16391)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16410)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16422)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 16433)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3391 (class 0 OID 16395)
-- Dependencies: 212
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3389 (class 0 OID 16388)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.migrations VALUES (1, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations VALUES (2, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations VALUES (3, '2023_10_25_171041_create_products_table', 1);
INSERT INTO public.migrations VALUES (4, '2023_11_02_061404_change_product_table', 2);
INSERT INTO public.migrations VALUES (5, '2014_10_12_000000_create_users_table', 3);
INSERT INTO public.migrations VALUES (6, '2023_11_02_111531_change_users_table', 4);


--
-- TOC entry 3393 (class 0 OID 16407)
-- Dependencies: 214
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- TOC entry 3395 (class 0 OID 16419)
-- Dependencies: 216
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.products VALUES (12, 'weww34349', 'GUESS TROUSERS', 'available', '[{"name": "цвет", "value": "зеленый"}]', '2023-11-02 06:28:39', '2023-11-02 08:40:03', '2023-11-02 08:40:03');
INSERT INTO public.products VALUES (13, 'fgdh56787', 'GUESS T-SHORT', 'available', '[{"name": "цвет", "value": "красный"}, {"name": "размер", "value": "xl"}]', '2023-11-02 16:38:39', '2023-11-02 16:40:51', '2023-11-02 16:40:51');
INSERT INTO public.products VALUES (10, 'weww34323', 'GUESS JACKET', 'available', '[{"name": "цвет", "value": "серый"}]', '2023-11-01 08:38:17', '2023-11-02 17:22:54', NULL);
INSERT INTO public.products VALUES (8, 'weww3434', 'GUESS JEANS', 'available', '[{"name": "цвет", "value": "зеленый"}, {"name": "размер", "value": "xs"}]', '2023-11-01 08:22:53', '2023-11-02 17:23:27', NULL);


--
-- TOC entry 3397 (class 0 OID 16430)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.users VALUES (1, 'Vika', 'mail2@gmail.com', NULL, '$2y$10$if90bruvU3aCbrEtI4SE7.sf497y1NBfIHM9Ys5Qrl0GuYKgAXqJm', 'n6kIHe501zXlA6CZxnrgBO3rwzhy9SgHBzmjf8VrpsR7ymEK9J22oyrEtj8t', '2023-11-02 13:09:59', '2023-11-02 13:09:59', '["ROLE_USER"]');
INSERT INTO public.users VALUES (2, 'Ivan', 'admin@gmail.com', NULL, '$2y$10$2k4sbRWMptNEKHeFOtvDMuTM4dXvBvgdn7Gl1ktGb6zBAxeU9N0S.', 'bVSGcY4suW11959dGYhz9Uu2VmSfsO6Tq2F21NtUSG0Lf1cbJQrEg01INR2k', '2023-11-02 13:11:00', '2023-11-02 13:11:00', '["ROLE_ADMIN"]');


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 211
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 213
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 215
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 13, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3233 (class 2606 OID 16403)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 16405)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3231 (class 2606 OID 16393)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16414)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16417)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3242 (class 2606 OID 16428)
-- Name: products products_article_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_article_unique UNIQUE (article);


--
-- TOC entry 3244 (class 2606 OID 16426)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16439)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3248 (class 2606 OID 16437)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 1259 OID 16415)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2023-11-03 08:09:27 MSK

--
-- PostgreSQL database dump complete
--

