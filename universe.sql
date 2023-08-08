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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxyname character varying(80),
    galaxytype numeric,
    galaxydesc text,
    name character varying(64),
    anumber integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxyid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxyid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moonname character varying(64),
    moontype character varying(64),
    orbit numeric,
    name character varying(64),
    anumber integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moonid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moonid_seq OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moonid_seq OWNED BY public.moon.moon_id;


--
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    name character varying(64),
    sthg1 integer NOT NULL,
    sthg2 boolean NOT NULL,
    anumber integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_other_id_seq OWNED BY public.other.other_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    planetname character varying(60) NOT NULL,
    planettype numeric,
    hasatmosphere boolean DEFAULT false,
    star_id integer,
    name character varying(64),
    anumber integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planetid_seq OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planetid_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    startype numeric NOT NULL,
    starluminosity numeric NOT NULL,
    galaxy_id integer,
    starname character varying(60) NOT NULL,
    name character varying(64),
    anumber integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_starid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_starid_seq OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_starid_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxyid_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moonid_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planetid_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_starid_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 'Young double spiral', NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 'Young heavy double spiral', NULL, 1);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius', 3, 'Heavy, dark', NULL, 1);
INSERT INTO public.galaxy VALUES (4, 'ABCD1234', 2, 'Small', NULL, 1);
INSERT INTO public.galaxy VALUES (5, 'QWERT45678', 1, 'Recently discovered', NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'XYZ99989', 999, 'Recently discovered, 10 times older than universe', NULL, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', 'Planetoid', 27.6, NULL, 1);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Asteroid', 0.32, NULL, 1);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Asteroid', 1.27, NULL, 1);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Planetoid', 1.77, NULL, 1);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Planetoid', 3.55, NULL, 1);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Planetoid', 7.16, NULL, 1);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Planetoid', 16.69, NULL, 1);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 'Planetoid', 0.94, NULL, 1);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 'Planetoid', 1.37, NULL, 1);
INSERT INTO public.moon VALUES (10, 6, 'Tethy', 'Planetoid', 1.89, NULL, 1);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 'Planetoid', 2.74, NULL, 1);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 'Planetoid', 4.5, NULL, 1);
INSERT INTO public.moon VALUES (13, 6, 'Titan', 'Planetoid', 15.95, NULL, 1);
INSERT INTO public.moon VALUES (14, 6, 'Hyperion', 'Asteroid', 21.28, NULL, 1);
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', 'Asteroid', 79.33, NULL, 1);
INSERT INTO public.moon VALUES (16, 6, 'Ariel', 'Planetoid', 2.5, NULL, 1);
INSERT INTO public.moon VALUES (17, 6, 'Umbriel', 'Planetoid', 4.14, NULL, 1);
INSERT INTO public.moon VALUES (18, 7, 'Titania', 'Planetoid', 8.7, NULL, 1);
INSERT INTO public.moon VALUES (19, 7, 'Oberon', 'Planetoid', 13.46, NULL, 1);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 'Planetoid', 5.87, NULL, 1);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (1, 'What?', 25, true, 25);
INSERT INTO public.other VALUES (2, 'What2?', 24, true, 24);
INSERT INTO public.other VALUES (3, 'What3?', 23, true, 23);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 3, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, true, 1, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 6, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 6, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 9, false, 1, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 2, true, 5, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', 1, false, 5, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Ross 128 b', 2, true, 7, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 777, 1, 'Sol', NULL, 1);
INSERT INTO public.star VALUES (2, 1, 8, 1, 'Bernards Star', NULL, 1);
INSERT INTO public.star VALUES (3, 3, 18, 1, 'Alpha Centauri', NULL, 1);
INSERT INTO public.star VALUES (4, 7, 5, 1, 'Beta Centauri', NULL, 1);
INSERT INTO public.star VALUES (5, 8, 4, 1, 'Proxima Centauri', NULL, 1);
INSERT INTO public.star VALUES (6, 999, 999, 1, 'Tabbys Star', NULL, 1);
INSERT INTO public.star VALUES (7, 4, 8, 1, 'Ross 128', NULL, 1);
INSERT INTO public.star VALUES (8, 3, 12, 1, 'Wolf 1061', NULL, 1);
INSERT INTO public.star VALUES (9, 2, 16, 1, 'Luytens Star', NULL, 1);


--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxyid_seq', 6, true);


--
-- Name: moon_moonid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moonid_seq', 20, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 3, true);


--
-- Name: planet_planetid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planetid_seq', 12, true);


--
-- Name: star_starid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_starid_seq', 9, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other other_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_name_key UNIQUE (name);


--
-- Name: other other_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_pkey PRIMARY KEY (other_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planetid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planetid_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_starid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_starid_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxyid_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

