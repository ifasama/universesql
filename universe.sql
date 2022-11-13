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
-- Name: chemical; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.chemical (
    chemical_id integer NOT NULL,
    name character varying NOT NULL,
    symbol character varying NOT NULL
);


ALTER TABLE public.chemical OWNER TO freecodecamp;

--
-- Name: chemical_chemical_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.chemical_chemical_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chemical_chemical_id_seq OWNER TO freecodecamp;

--
-- Name: chemical_chemical_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.chemical_chemical_id_seq OWNED BY public.chemical.chemical_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    major_axis_diameter_in_ly integer,
    minor_axis_diameter_in_ly integer,
    size_in_kpc numeric(5,0),
    name character varying NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    is_natural boolean,
    diameter_in_km numeric(5,0) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    category text,
    main_chemical_composition text,
    has_moon boolean,
    chemical_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    area_in_sqdeg integer,
    messier_object integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: chemical chemical_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical ALTER COLUMN chemical_id SET DEFAULT nextval('public.chemical_chemical_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: chemical; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.chemical VALUES (1, 'oxygen', 'O');
INSERT INTO public.chemical VALUES (2, 'methane', 'CH4');
INSERT INTO public.chemical VALUES (3, 'water', 'H2O');
INSERT INTO public.chemical VALUES (4, 'hydrogen', 'H2');
INSERT INTO public.chemical VALUES (5, 'nitrogen', 'N2');
INSERT INTO public.chemical VALUES (6, 'carbon dioxide', 'CO2');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 87400, 87400, 27, 'milky way');
INSERT INTO public.galaxy VALUES (2, 459800, 285100, 1, 'hercules a');
INSERT INTO public.galaxy VALUES (3, 242900, 155400, 74, 'alcyoneus');
INSERT INTO public.galaxy VALUES (4, 152300, 152300, 47, 'andromeda galaxy');
INSERT INTO public.galaxy VALUES (5, 118800, 93870, 41, 'messier 87');
INSERT INTO public.galaxy VALUES (6, 118700, 118700, 200, 'malin 1');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 3475, 3);
INSERT INTO public.moon VALUES (2, 'phobos', true, 22, 4);
INSERT INTO public.moon VALUES (3, 'deimos', true, 13, 4);
INSERT INTO public.moon VALUES (4, 'io', true, 3643, 5);
INSERT INTO public.moon VALUES (5, 'europa', true, 3100, 5);
INSERT INTO public.moon VALUES (6, 'ganymede', true, 5268, 5);
INSERT INTO public.moon VALUES (7, 'callisto', true, 4821, 5);
INSERT INTO public.moon VALUES (8, 'titan', true, 5150, 6);
INSERT INTO public.moon VALUES (9, 'enceladus', true, 500, 6);
INSERT INTO public.moon VALUES (10, 'iapetus', true, 1469, 6);
INSERT INTO public.moon VALUES (11, 'rhea', true, 1528, 6);
INSERT INTO public.moon VALUES (12, 'puck', true, 162, 7);
INSERT INTO public.moon VALUES (13, 'miranda', true, 470, 7);
INSERT INTO public.moon VALUES (14, 'umbriel', true, 210, 7);
INSERT INTO public.moon VALUES (15, 'titania', true, 1578, 7);
INSERT INTO public.moon VALUES (16, 'oberon', true, 1523, 7);
INSERT INTO public.moon VALUES (17, 'triton', true, 2710, 8);
INSERT INTO public.moon VALUES (18, 'neso', true, 60, 8);
INSERT INTO public.moon VALUES (19, 'nereid', true, 357, 8);
INSERT INTO public.moon VALUES (20, 'vanth', true, 440, 10);
INSERT INTO public.moon VALUES (21, 'charon', true, 660, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 'major planet', 'oxygen', false, 1);
INSERT INTO public.planet VALUES (2, 'venus', 'major planet', 'carbon dioxide', false, 6);
INSERT INTO public.planet VALUES (4, 'mars', 'major planet', 'carbon dioxide', true, 6);
INSERT INTO public.planet VALUES (3, 'earth', 'major planet', 'nitrogen', true, 5);
INSERT INTO public.planet VALUES (11, 'pluto', 'dwarf planet', 'nitrogen', true, 5);
INSERT INTO public.planet VALUES (5, 'jupiter', 'major planet', 'hydrogen', true, 4);
INSERT INTO public.planet VALUES (6, 'saturn', 'major planet', 'hydrogen', true, 4);
INSERT INTO public.planet VALUES (7, 'uranus', 'major planet', 'hydrogen', true, 4);
INSERT INTO public.planet VALUES (8, 'neptune', 'major planet', 'hydorgen', true, 4);
INSERT INTO public.planet VALUES (12, 'haumea', 'dwarf planet', 'water', true, 3);
INSERT INTO public.planet VALUES (10, 'orcus', 'dwarf planet', 'methane', true, 2);
INSERT INTO public.planet VALUES (9, 'ceres', 'dwarf planet', 'water', false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sagittarius', 867, 15, 1);
INSERT INTO public.star VALUES (2, 'hercules', 1225, 2, 2);
INSERT INTO public.star VALUES (3, 'lynx', 545, 0, 3);
INSERT INTO public.star VALUES (4, 'andromeda', 722, 3, 4);
INSERT INTO public.star VALUES (5, 'virgo', 1294, 11, 5);
INSERT INTO public.star VALUES (6, 'coma berenices', 386, 8, 6);


--
-- Name: chemical_chemical_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.chemical_chemical_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: chemical chemical_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical
    ADD CONSTRAINT chemical_name_key UNIQUE (name);


--
-- Name: chemical chemical_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.chemical
    ADD CONSTRAINT chemical_pkey PRIMARY KEY (chemical_id);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

