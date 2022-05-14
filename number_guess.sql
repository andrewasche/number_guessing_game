--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(60) NOT NULL,
    played_games integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1652567559874', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1652567559873', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1652568288191', 0, 0);
INSERT INTO public.users VALUES (7, 'user_1652568288190', 0, 0);
INSERT INTO public.users VALUES (8, 'andre', 0, 0);
INSERT INTO public.users VALUES (9, 'andfrewr', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1652570191740', 0, 0);
INSERT INTO public.users VALUES (11, 'user_1652570191739', 0, 0);
INSERT INTO public.users VALUES (12, 'user_1652570339929', 0, 0);
INSERT INTO public.users VALUES (13, 'user_1652570339928', 0, 0);
INSERT INTO public.users VALUES (1, 'ANDREW', 1, 0);
INSERT INTO public.users VALUES (4, 'andrew', 2, 11);
INSERT INTO public.users VALUES (15, 'user_1652571038427', 2, 215);
INSERT INTO public.users VALUES (14, 'user_1652571038428', 5, 681);
INSERT INTO public.users VALUES (17, 'user_1652571167915', 2, 579);
INSERT INTO public.users VALUES (16, 'user_1652571167916', 5, 914);
INSERT INTO public.users VALUES (19, 'user_1652571272258', 2, 372);
INSERT INTO public.users VALUES (18, 'user_1652571272259', 5, 888);
INSERT INTO public.users VALUES (21, 'user_1652571301450', 2, 860);
INSERT INTO public.users VALUES (20, 'user_1652571301451', 5, 961);
INSERT INTO public.users VALUES (23, 'user_1652571336880', 2, 604);
INSERT INTO public.users VALUES (22, 'user_1652571336881', 5, 943);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 23, true);


--
-- Name: users uniqueusers; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqueusers UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

