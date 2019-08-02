--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: alexsiegberg
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.projects OWNER TO alexsiegberg;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: alexsiegberg
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO alexsiegberg;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexsiegberg
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: alexsiegberg
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO alexsiegberg;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: alexsiegberg
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO alexsiegberg;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexsiegberg
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: alexsiegberg
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: alexsiegberg
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: alexsiegberg
--

COPY public.projects (id, title) FROM stdin;
215	Clean up downtown
216	Art lessons for low-income residents
214	Feed the homeless
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: alexsiegberg
--

COPY public.volunteers (id, name, project_id) FROM stdin;
201	Karen	216
204	Kim	214
198	George	214
203	Jennifer	214
207	Ben	0
208	Willy	0
210	Griffith	0
209	Casca	0
206	Sammy	0
200	Thomas	215
199	Holly	215
197	Doug	215
202	Beth	216
205	John	216
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexsiegberg
--

SELECT pg_catalog.setval('public.projects_id_seq', 216, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alexsiegberg
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 210, true);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: alexsiegberg
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: alexsiegberg
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

