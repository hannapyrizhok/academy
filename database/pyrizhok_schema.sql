--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

-- Started on 2019-01-22 00:23:40 EET

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
-- TOC entry 2886 (class 0 OID 0)
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
-- TOC entry 2887 (class 0 OID 0)
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
-- TOC entry 2888 (class 0 OID 0)
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
-- TOC entry 2889 (class 0 OID 0)
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


-- Completed on 2019-01-22 00:23:40 EET

--
-- PostgreSQL database dump complete
--

