--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    brightest_star character varying(100) NOT NULL,
    visible_hemisphere character varying(50)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2)
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_moons integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 1, 'Rigel', 'Both');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 1, 'Alioth', 'Northern');
INSERT INTO public.constellation VALUES (3, 'Andromeda Constellation', 2, 'Alpheratz', 'Northern');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'Our home galaxy containing the Solar System.', 13610, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest major galaxy to the Milky Way.', 10010, 2.54);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'The third-largest member of the Local Group.', 12000, 2.73);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 'Known for its bright nucleus and large central bulge.', 13250, 29.35);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 'An interacting grand-design spiral galaxy.', 400, 23.16);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 'One of the closest radio galaxies to Earth.', 13270, 13.05);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, true, 'Earths only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Larger and closer of the two Martian moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Smaller and outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 'Most geologically active object in the Solar System.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, true, 'Smooth ice crust covering a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, true, 'Heavily cratered ancient surface.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, false, 'Irregularly shaped inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5149, true, 'Second-largest moon with a dense atmosphere.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, 'Covered in fresh, clean ice with active geysers.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, true, 'Features the massive Herschel crater.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, true, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Dione', 6, 1122, true, 'Composed primarily of water ice.');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, true, 'Low density icy body.');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1577, true, 'Largest of the moons of Uranus.');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1522, true, 'Outermost major moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, true, 'Darkest of Uranuss major moons.');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1157, true, 'Brightest of Uranuss major moons.');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 2706, true, 'Largest moon of Neptune with a retrograde orbit.');
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 420, false, 'Largest irregularly shaped moon of Neptune.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas giant', false, true, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas giant', false, true, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', false, true, 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice giant', false, true, 16);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Super-Earth', false, true, 0);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 2, 'Sub-Earth', false, true, 0);
INSERT INTO public.planet VALUES (11, 'Sirius Ab', 3, 'Gas giant', false, true, 0);
INSERT INTO public.planet VALUES (12, 'Alpheratz Prime', 5, 'Hot Jupiter', false, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf', 4850, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type main-sequence', 242, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 10, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 'B-type subgiant', 60, true);
INSERT INTO public.star VALUES (6, 'Mirach', 2, 'Red giant', 300, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

