--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

-- Started on 2019-02-04 23:20:34 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE book_library;
--
-- TOC entry 2894 (class 1262 OID 16403)
-- Name: book_library; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE book_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE book_library OWNER TO postgres;

\connect book_library

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16404)
-- Name: my_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA my_schema;


ALTER SCHEMA my_schema OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12964)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 197 (class 1259 OID 24642)
-- Name: address_sequence; Type: SEQUENCE; Schema: my_schema; Owner: postgres
--

CREATE SEQUENCE my_schema.address_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_schema.address_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 24644)
-- Name: address; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.address (
    id bigint DEFAULT nextval('my_schema.address_sequence'::regclass) NOT NULL,
    country text,
    city text,
    street text,
    "postal code" bigint,
    publisher_id bigint
);


ALTER TABLE my_schema.address OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24651)
-- Name: author; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.author (
    name text NOT NULL,
    id bigint NOT NULL,
    citizenship text NOT NULL,
    birth_year date,
    death_year date
);


ALTER TABLE my_schema.author OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24657)
-- Name: author_sequence; Type: SEQUENCE; Schema: my_schema; Owner: postgres
--

CREATE SEQUENCE my_schema.author_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_schema.author_sequence OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 200
-- Name: author_sequence; Type: SEQUENCE OWNED BY; Schema: my_schema; Owner: postgres
--

ALTER SEQUENCE my_schema.author_sequence OWNED BY my_schema.author.id;


--
-- TOC entry 201 (class 1259 OID 24659)
-- Name: book; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.book (
    id bigint NOT NULL,
    book_name text NOT NULL,
    genre text,
    pages bigint,
    author_id bigint,
    publisher_id bigint,
    date_of_receipt timestamp without time zone,
    year_of_publication integer
);


ALTER TABLE my_schema.book OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24665)
-- Name: book_sequence; Type: SEQUENCE; Schema: my_schema; Owner: postgres
--

CREATE SEQUENCE my_schema.book_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_schema.book_sequence OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 202
-- Name: book_sequence; Type: SEQUENCE OWNED BY; Schema: my_schema; Owner: postgres
--

ALTER SEQUENCE my_schema.book_sequence OWNED BY my_schema.book.id;


--
-- TOC entry 203 (class 1259 OID 24667)
-- Name: contact_person_sequence; Type: SEQUENCE; Schema: my_schema; Owner: postgres
--

CREATE SEQUENCE my_schema.contact_person_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_schema.contact_person_sequence OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24669)
-- Name: contact_person; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.contact_person (
    id bigint DEFAULT nextval('my_schema.contact_person_sequence'::regclass) NOT NULL,
    name text,
    phone_number bigint,
    email text
);


ALTER TABLE my_schema.contact_person OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24676)
-- Name: publisher; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.publisher (
    id bigint NOT NULL,
    publisher_name text,
    contact_person_id bigint,
    address_id bigint
);


ALTER TABLE my_schema.publisher OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24682)
-- Name: publisher_sequence; Type: SEQUENCE; Schema: my_schema; Owner: postgres
--

CREATE SEQUENCE my_schema.publisher_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_schema.publisher_sequence OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 206
-- Name: publisher_sequence; Type: SEQUENCE OWNED BY; Schema: my_schema; Owner: postgres
--

ALTER SEQUENCE my_schema.publisher_sequence OWNED BY my_schema.publisher.id;


--
-- TOC entry 2740 (class 2604 OID 24684)
-- Name: author id; Type: DEFAULT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.author ALTER COLUMN id SET DEFAULT nextval('my_schema.author_sequence'::regclass);


--
-- TOC entry 2741 (class 2604 OID 24685)
-- Name: book id; Type: DEFAULT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.book ALTER COLUMN id SET DEFAULT nextval('my_schema.book_sequence'::regclass);


--
-- TOC entry 2743 (class 2604 OID 24686)
-- Name: publisher id; Type: DEFAULT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.publisher ALTER COLUMN id SET DEFAULT nextval('my_schema.publisher_sequence'::regclass);


--
-- TOC entry 2880 (class 0 OID 24644)
-- Dependencies: 198
-- Data for Name: address; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (2, 'Ukraine', 'Kyiv', 'T. Shevchenka 23', 360095, 2);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (1, 'Russia', 'St.Peterburg', 'M. Hoholia 52', 540098, 1);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (7, 'Russia', 'Moskow', 'Richna 56', 540056, 7);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (4, 'Ukraine', 'Chernivtsy', 'Holovna 200', 890054, 4);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (3, 'Ukraine', 'Chernivtsy', 'Sadova 35', 780065, 3);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (6, 'Ukraine', 'Kharkiv', 'Sumska 45', 230047, 6);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (5, 'Ukraine', 'Kyiv', 'Pivdenna 60', 650042, 5);
INSERT INTO my_schema.address (id, country, city, street, "postal code", publisher_id) VALUES (8, 'Ukraine', 'Kyiv', 'Holovna 65', 560038, 8);


--
-- TOC entry 2881 (class 0 OID 24651)
-- Dependencies: 199
-- Data for Name: author; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Ian Whybrow', 2, 'Great Britain', '1941-05-03', NULL);
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Erwin Moser', 1, 'Austrian', '1954-01-23', '2017-10-12');
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Kolody Vitaly', 3, 'Ukrain', '1939-01-19', '2016-03-24');
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Oscar Wilde', 4, 'Ireland', '1954-10-16', '1900-11-30');
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Regina Brett', 6, 'USA', '1956-05-31', NULL);
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('J. K. Rowling', 5, 'Great Britain', '1965-07-31', NULL);
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Nicholas Sparks', 7, 'USA', '1965-12-31', NULL);
INSERT INTO my_schema.author (name, id, citizenship, birth_year, death_year) VALUES ('Susan Cain', 8, 'USA', '1968-03-20', NULL);


--
-- TOC entry 2883 (class 0 OID 24659)
-- Dependencies: 201
-- Data for Name: book; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (1, 'Fantastic stories for good night', 'story', 240, 1, 4, '2016-09-15 00:00:00', 2016);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (2, 'Dysput', 'poems', 464, 3, 3, '2014-03-28 00:00:00', 2007);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (3, 'the happy prince', 'fairy tales', 208, 4, 1, '2014-03-28 00:00:00', 2007);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (4, 'Little wolf book of badness', 'story', 180, 2, 2, '2014-03-28 00:00:00', 2008);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (5, 'The Philosophers Stone,', 'fantasy', 400, 5, 5, '2016-09-15 00:00:00', 1997);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (6, 'The Chamber of Secrets', 'fantasy', 540, 5, 5, '2016-09-15 00:00:00', 1998);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (7, 'The Prisoner of Azkaban', 'fantasy', 510, 5, 5, '2016-09-15 00:00:00', 1999);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (8, 'The Goblet of Fire', 'fantasy', 780, 5, 5, '2016-09-15 00:00:00', 2000);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (9, 'The Order of the Phoenix', 'fantasy', 800, 5, 5, '2016-09-15 00:00:00', 2003);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (10, 'The Half-Blood Prince', 'fantasy', 650, 5, 5, '2016-09-15 00:00:00', 2005);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (11, 'The Deathly Hallows', 'fantasy', 600, 5, 5, '2016-09-15 00:00:00', 2007);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (12, 'God Never Blinks: 50 Lessons for Lifes Little Detours', 'motivational', 288, 6, 6, '2018-03-28 00:00:00', 2018);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (13, 'Be the Miracle: 50 Lessons for Making the Impossible Possible', 'motivational', 279, 6, 6, '2018-03-28 00:00:00', 2018);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (14, 'God Is Always Hiring: 50 Lessons for Finding Fulfilling Work', 'motivational', 264, 6, 6, '2018-03-28 00:00:00', 2018);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (15, 'Twój dziennik. 12 nowych lekcji i myśli na każdy dzień', 'motivational', 242, 6, 6, '2018-10-15 00:00:00', 2018);
INSERT INTO my_schema.book (id, book_name, genre, pages, author_id, publisher_id, date_of_receipt, year_of_publication) VALUES (16, 'Dear John', 'novel', 319, 7, 7, '2013-05-28 00:00:00', 2009);


--
-- TOC entry 2886 (class 0 OID 24669)
-- Dependencies: 204
-- Data for Name: contact_person; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (1, 'Peter', 380954727487, 'peter@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (2, 'Tony Ross', 380975684352, 'tonnyross@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (3, 'Hanna', 380990698368, 'hanna@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (4, 'BooksXXI', 380507896432, 'book@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (5, 'Ivan Malkovych', 380957843562, 'malkov@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (6, 'Nataly Hojin', 380679854321, 'nhojin@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (7, 'Andrew Nurnberg', 380995432145, 'nurnberg@gmail.com');
INSERT INTO my_schema.contact_person (id, name, phone_number, email) VALUES (8, 'Olesia Omelchuk', 380955643219, 'oomel@gmail.com');


--
-- TOC entry 2887 (class 0 OID 24676)
-- Dependencies: 205
-- Data for Name: publisher; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (2, 'Dobra-chytalna', 2, 2);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (1, 'Azbooka-classica', 1, 1);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (4, 'Chorny Vivtsy', 4, 4);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (3, 'Bookrek', 3, 3);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (6, 'Club', 6, 6);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (5, 'A-ba-ba-ha-la-ma-ha', 5, 5);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (8, 'Nash format', 8, 8);
INSERT INTO my_schema.publisher (id, publisher_name, contact_person_id, address_id) VALUES (7, 'ACT', 7, 7);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 197
-- Name: address_sequence; Type: SEQUENCE SET; Schema: my_schema; Owner: postgres
--

SELECT pg_catalog.setval('my_schema.address_sequence', 8, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 200
-- Name: author_sequence; Type: SEQUENCE SET; Schema: my_schema; Owner: postgres
--

SELECT pg_catalog.setval('my_schema.author_sequence', 8, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 202
-- Name: book_sequence; Type: SEQUENCE SET; Schema: my_schema; Owner: postgres
--

SELECT pg_catalog.setval('my_schema.book_sequence', 18, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 203
-- Name: contact_person_sequence; Type: SEQUENCE SET; Schema: my_schema; Owner: postgres
--

SELECT pg_catalog.setval('my_schema.contact_person_sequence', 8, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 206
-- Name: publisher_sequence; Type: SEQUENCE SET; Schema: my_schema; Owner: postgres
--

SELECT pg_catalog.setval('my_schema.publisher_sequence', 8, true);


--
-- TOC entry 2745 (class 2606 OID 24688)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 24690)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 24692)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 24694)
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 24696)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 24697)
-- Name: book fk_author_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES my_schema.author(id);


--
-- TOC entry 2756 (class 2606 OID 24707)
-- Name: publisher fk_publisher_addrees_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.publisher
    ADD CONSTRAINT fk_publisher_addrees_id FOREIGN KEY (address_id) REFERENCES my_schema.address(id);


--
-- TOC entry 2757 (class 2606 OID 24717)
-- Name: publisher fk_publisher_contact_person__id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.publisher
    ADD CONSTRAINT fk_publisher_contact_person__id FOREIGN KEY (contact_person_id) REFERENCES my_schema.contact_person(id);


--
-- TOC entry 2755 (class 2606 OID 24702)
-- Name: book fk_publisher_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.book
    ADD CONSTRAINT fk_publisher_id FOREIGN KEY (publisher_id) REFERENCES my_schema.publisher(id);


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-02-04 23:20:35 EET

--
-- PostgreSQL database dump complete
--

