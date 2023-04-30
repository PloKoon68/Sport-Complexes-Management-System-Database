--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-04-30 22:42:50

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
-- TOC entry 223 (class 1259 OID 25254)
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    amenity_id integer NOT NULL,
    amenity_name character varying(50) NOT NULL,
    age_restriction integer
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25253)
-- Name: amenities_amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenities_amenity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenities_amenity_id_seq OWNER TO postgres;

--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 222
-- Name: amenities_amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenities_amenity_id_seq OWNED BY public.amenities.amenity_id;


--
-- TOC entry 243 (class 1259 OID 25514)
-- Name: availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availability (
    availability_id integer NOT NULL,
    facility_id integer,
    available_day character varying(10),
    opening_hour time without time zone,
    closing_hour time without time zone
);


ALTER TABLE public.availability OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 25513)
-- Name: availability_availability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.availability_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.availability_availability_id_seq OWNER TO postgres;

--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 242
-- Name: availability_availability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.availability_availability_id_seq OWNED BY public.availability.availability_id;


--
-- TOC entry 232 (class 1259 OID 25316)
-- Name: coach; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach (
    coach_id integer NOT NULL,
    staff_id integer NOT NULL,
    years_of_experience integer,
    branch character varying(50)
);


ALTER TABLE public.coach OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25315)
-- Name: coach_coach_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coach_coach_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_coach_id_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 231
-- Name: coach_coach_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coach_coach_id_seq OWNED BY public.coach.coach_id;


--
-- TOC entry 214 (class 1259 OID 24794)
-- Name: complex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complex (
    complex_id integer NOT NULL,
    complex_name character varying(255) NOT NULL,
    number_of_facilities integer NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255),
    zip_code character(10) NOT NULL,
    phhone_number character(20),
    website character(255) NOT NULL,
    year_established integer
);


ALTER TABLE public.complex OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25330)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    instructor_id integer NOT NULL,
    facility_id integer NOT NULL,
    course_name character varying(255) NOT NULL,
    course_capacity integer,
    course_cost numeric(10,2),
    start_date date,
    end_date date
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25329)
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_course_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 233
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- TOC entry 239 (class 1259 OID 25386)
-- Name: course_enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_enrollment (
    course_id integer NOT NULL,
    member_id integer NOT NULL,
    enrollment_date date
);


ALTER TABLE public.course_enrollment OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25347)
-- Name: course_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_schedule (
    schedule_id integer NOT NULL,
    course_id integer NOT NULL,
    start_time time without time zone,
    end_time time without time zone,
    day_of_week character varying(10)
);


ALTER TABLE public.course_schedule OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25346)
-- Name: course_schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_schedule_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 235
-- Name: course_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_schedule_schedule_id_seq OWNED BY public.course_schedule.schedule_id;


--
-- TOC entry 228 (class 1259 OID 25285)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    facility_id integer NOT NULL,
    sponsor_id integer NOT NULL,
    event_name character varying(255) NOT NULL,
    description text,
    start_date date NOT NULL,
    end_date date NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25284)
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_event_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 227
-- Name: event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_event_id_seq OWNED BY public.event.event_id;


--
-- TOC entry 218 (class 1259 OID 25206)
-- Name: facility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility (
    facility_id integer NOT NULL,
    complex_id integer NOT NULL,
    capacity integer,
    maintenance_schedule character varying(255)
);


ALTER TABLE public.facility OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25260)
-- Name: facility_amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_amenity (
    facility_id integer NOT NULL,
    amenity_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.facility_amenity OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25205)
-- Name: facility_facility_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_facility_id_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 217
-- Name: facility_facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_facility_id_seq OWNED BY public.facility.facility_id;


--
-- TOC entry 245 (class 1259 OID 25545)
-- Name: facility_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_rating (
    ranking_id integer NOT NULL,
    member_id integer NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.facility_rating OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25544)
-- Name: facility_ranking_ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_ranking_ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_ranking_ranking_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 244
-- Name: facility_ranking_ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_ranking_ranking_id_seq OWNED BY public.facility_rating.ranking_id;


--
-- TOC entry 221 (class 1259 OID 25238)
-- Name: facility_sport_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_sport_type (
    facility_id integer NOT NULL,
    sport_type_id integer NOT NULL
);


ALTER TABLE public.facility_sport_type OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25369)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    member_id integer NOT NULL,
    facility_id integer,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    phone_number character varying(20) NOT NULL,
    date_joined date NOT NULL
);


ALTER TABLE public.member OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25368)
-- Name: member_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_member_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 237
-- Name: member_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_member_id_seq OWNED BY public.member.member_id;


--
-- TOC entry 241 (class 1259 OID 25402)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    member_id integer NOT NULL,
    payment_date date NOT NULL,
    amount numeric(10,2) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25401)
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 240
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- TOC entry 216 (class 1259 OID 25194)
-- Name: social_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.social_media (
    social_media_id integer NOT NULL,
    complex_id integer NOT NULL,
    platform character varying(50) NOT NULL,
    url character varying(255) NOT NULL
);


ALTER TABLE public.social_media OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25193)
-- Name: social_media_social_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.social_media_social_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_media_social_media_id_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 215
-- Name: social_media_social_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.social_media_social_media_id_seq OWNED BY public.social_media.social_media_id;


--
-- TOC entry 226 (class 1259 OID 25276)
-- Name: sponsor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sponsor (
    sponsor_id integer NOT NULL,
    sponsor_name character varying(255) NOT NULL,
    logo_url character varying(255),
    website_url character varying(255)
);


ALTER TABLE public.sponsor OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25275)
-- Name: sponsor_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sponsor_sponsor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sponsor_sponsor_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 225
-- Name: sponsor_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sponsor_sponsor_id_seq OWNED BY public.sponsor.sponsor_id;


--
-- TOC entry 220 (class 1259 OID 25230)
-- Name: sport_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sport_types (
    sport_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    definition text
);


ALTER TABLE public.sport_types OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25229)
-- Name: sport_types_sport_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sport_types_sport_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sport_types_sport_type_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 219
-- Name: sport_types_sport_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sport_types_sport_type_id_seq OWNED BY public.sport_types.sport_type_id;


--
-- TOC entry 230 (class 1259 OID 25304)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    facility_id integer,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    salary numeric(10,2) NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25303)
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 229
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;


--
-- TOC entry 3257 (class 2604 OID 25257)
-- Name: amenities amenity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities ALTER COLUMN amenity_id SET DEFAULT nextval('public.amenities_amenity_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 25517)
-- Name: availability availability_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability ALTER COLUMN availability_id SET DEFAULT nextval('public.availability_availability_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 25319)
-- Name: coach coach_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach ALTER COLUMN coach_id SET DEFAULT nextval('public.coach_coach_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 25333)
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 25350)
-- Name: course_schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.course_schedule_schedule_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 25288)
-- Name: event event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN event_id SET DEFAULT nextval('public.event_event_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 25209)
-- Name: facility facility_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility ALTER COLUMN facility_id SET DEFAULT nextval('public.facility_facility_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 25548)
-- Name: facility_rating ranking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_rating ALTER COLUMN ranking_id SET DEFAULT nextval('public.facility_ranking_ranking_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 25372)
-- Name: member member_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member ALTER COLUMN member_id SET DEFAULT nextval('public.member_member_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 25405)
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 25197)
-- Name: social_media social_media_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media ALTER COLUMN social_media_id SET DEFAULT nextval('public.social_media_social_media_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 25279)
-- Name: sponsor sponsor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsor ALTER COLUMN sponsor_id SET DEFAULT nextval('public.sponsor_sponsor_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 25233)
-- Name: sport_types sport_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sport_types ALTER COLUMN sport_type_id SET DEFAULT nextval('public.sport_types_sport_type_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 25307)
-- Name: staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- TOC entry 3476 (class 0 OID 25254)
-- Dependencies: 223
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (amenity_id, amenity_name, age_restriction) FROM stdin;
2001	Outdoor Basketball Court 	\N
2002	Indoor Basketball Court	\N
2003	Tennis Court 	\N
2004	Volleyball Court 	\N
2005	Baseball Field	\N
2006	Football Field	\N
2007	Swimming Pool	\N
2008	Weight Room 	16
2009	Cardio Room	16
2010	Martial Arts Studio	5
2011	Pilates Studio 	16
2012	Squash Court	\N
2013	Hockey Rink	\N
2014	Ice Skating Rink	\N
2015	Badminton Court	\N
2016	Diving Pool	\N
2017	Skate Skiing Area	\N
2018	Ice Hockey Rink	\N
2019	Shower	\N
2020	Locker	\N
\.


--
-- TOC entry 3496 (class 0 OID 25514)
-- Dependencies: 243
-- Data for Name: availability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.availability (availability_id, facility_id, available_day, opening_hour, closing_hour) FROM stdin;
501	3001	Monday	09:00:00	18:45:00
502	3001	Wednesday	13:30:00	22:30:00
503	3001	Friday	14:30:00	23:50:00
504	3002	Saturday	09:00:00	14:30:00
505	3002	Sunday	10:30:00	22:30:00
506	3003	Tuesday	11:45:00	21:45:00
507	3003	Wednesday	12:45:00	22:15:00
508	3004	Monday	10:15:00	23:40:00
509	3004	Wednesday	07:30:00	23:10:00
510	3005	Satruday	06:45:00	22:10:00
511	3005	Sunday	12:00:00	18:45:00
512	3006	Sunday	13:00:00	23:45:00
513	3007	Monday	09:00:00	23:00:00
514	3007	Friday	07:45:00	21:00:00
515	3008	Thursday	11:30:00	18:30:00
516	3009	Saturday	06:45:00	22:45:00
517	3009	Monday	11:00:00	19:30:00
518	3010	Tuesday	11:00:00	19:00:00
519	3010	Thursday	12:00:00	16:30:00
520	3011	Friday	08:00:00	23:00:00
521	3011	Monday	08:00:00	23:00:00
522	3011	Wednesday	09:00:00	17:30:00
523	3012	Saturday	10:00:00	16:00:00
524	3012	Wednesday	14:30:00	18:00:00
525	3012	Friday	12:45:00	18:00:00
526	3013	Saturday	13:00:00	21:00:00
527	3013	Sunday	11:00:00	20:00:00
528	3014	Monday	07:30:00	19:30:00
529	3014	Tuesday	09:45:00	22:00:00
530	3014	Friday	10:30:00	21:03:00
531	3015	Friday	07:00:00	22:00:00
532	3015	Monday	06:00:00	21:30:00
533	3016	Saturday	14:10:00	18:45:00
534	3016	Sunday	12:45:00	18:15:00
535	3017	Monday	15:00:00	22:30:00
536	3017	Wednesday	14:00:00	21:45:00
537	3018	Monday	16:15:00	23:00:00
538	3019	Wednesday	08:00:00	23:30:00
539	3020	Thursday	11:30:00	15:50:00
540	3020	Friday	10:00:00	21:00:00
541	3021	Tuesday	12:00:00	22:30:00
542	3021	Friday	15:00:00	22:45:00
\.


--
-- TOC entry 3485 (class 0 OID 25316)
-- Dependencies: 232
-- Data for Name: coach; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach (coach_id, staff_id, years_of_experience, branch) FROM stdin;
2099	1099	6	Basketball
2100	1100	7	Handball
2101	1101	5	Basketball
2102	1102	8	Martial Arts
2103	1103	4	Tennis
2104	1104	6	Martial Arts
2105	1105	8	Martial Arts
2106	1106	5	Fitness
2107	1107	6	Personal Trainer
2108	1109	10	Swimming
2109	1110	12	Ice Skating
\.


--
-- TOC entry 3467 (class 0 OID 24794)
-- Dependencies: 214
-- Data for Name: complex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.complex (complex_id, complex_name, number_of_facilities, address, city, state, zip_code, phhone_number, website, year_established) FROM stdin;
1	The Athletic Edge Training Center	3	123 Main St, 	San Fransisco	CA	90001     	(408) 555-2345      	www.athleticedge.com                                                                                                                                                                                                                                           	2000
2	All-Star Sports Club	3	456 Oak St	New York	NY	10002     	(650) 555-9876      	www.allstarclub3.com                                                                                                                                                                                                                                           	2002
3	The Sports Factory	2	1819 Cedar St	Los Angles	CA	90001     	(408) 555-2345      	www.sport4factory.com                                                                                                                                                                                                                                          	2011
4	Fit Nation Sports Complex	2	2021 Chestnut Ave	Houston	TX	75002     	(510) 555-8765      	www.fitnation6.com                                                                                                                                                                                                                                             	2008
5	Velocity Sports Training Facility	1	3435 Sycamore Ln	Chicago	IL	60005     	(925) 555-3456      	www.velocitysport2.com                                                                                                                                                                                                                                         	2020
6	Elite Athletic Club	2	4041 Maplewood Dr	Austin	TX	75002     	(707) 555-6543      	www.eliteathletic5.com                                                                                                                                                                                                                                         	2018
7	The Sports Den	2	4647 Chestnut St, Anyville	San Diego	CA	90005     	(831) 555-7890      	www.sportsden9.com                                                                                                                                                                                                                                             	2011
8	The Training Grounds	2	5253 Pine Ave	Dallas	TX	75003     	(559) 555-4321      	www.traininggroundx.com                                                                                                                                                                                                                                        	2001
9	Champion Fitness & Health	2	4243 Elmwood Ln	Austin	TX	75004     	(805) 555-2109      	www.champfittnessx.com                                                                                                                                                                                                                                         	1999
10	Elite Training Academy	2	2223 Magnolia Dr	San Fransisco	CA	90001     	(323) 555-6789      	www.elitetrainingf.com                                                                                                                                                                                                                                         	2016
\.


--
-- TOC entry 3487 (class 0 OID 25330)
-- Dependencies: 234
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, instructor_id, facility_id, course_name, course_capacity, course_cost, start_date, end_date) FROM stdin;
151	2099	3004	Basketball	20	100.00	2022-10-12	2023-01-30
152	2100	3007	Basketball	20	150.00	2020-05-16	2020-11-20
153	2101	3007	Basketball	20	110.00	2022-10-14	\N
154	2102	3011	Taekwondo	50	115.00	2021-09-14	\N
155	2103	3013	Badminton	30	150.00	2023-01-01	2023-02-01
156	2104	3016	Judo	46	110.00	2022-12-02	2023-01-02
157	2105	3017	Karate	60	125.00	2023-02-28	\N
158	2106	3018	Fitness	65	120.00	2022-07-24	\N
159	2107	3018	Gymnastics	25	120.00	2022-02-11	2023-01-30
160	2108	3019	Swimming	30	160.00	2023-04-10	\N
161	2108	3019	Diving	15	200.00	2022-12-15	\N
162	2109	3021	Ice Skating	32	200.00	2022-08-14	\N
\.


--
-- TOC entry 3492 (class 0 OID 25386)
-- Dependencies: 239
-- Data for Name: course_enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_enrollment (course_id, member_id, enrollment_date) FROM stdin;
151	7011	2014-09-09
151	7012	2013-11-03
152	7020	2011-06-09
152	7022	2020-03-08
153	7021	2007-06-04
154	7033	2016-05-06
154	7034	2023-01-30
154	7035	2020-06-09
155	7038	2011-06-09
155	7039	2011-10-01
155	7040	2011-10-01
156	7045	2011-10-01
157	7048	2021-09-15
157	7049	2014-12-18
158	7050	2011-06-09
158	7051	2013-11-03
158	7052	2017-02-28
159	7053	2023-01-30
160	7055	2021-06-30
160	7056	2019-04-28
161	7057	2020-09-09
162	7060	2020-03-09
\.


--
-- TOC entry 3489 (class 0 OID 25347)
-- Dependencies: 236
-- Data for Name: course_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_schedule (schedule_id, course_id, start_time, end_time, day_of_week) FROM stdin;
100	151	17:00:00	19:00:00	Monday
101	151	17:00:00	19:00:00	Wednesday
102	152	18:00:00	20:00:00	Monday
103	152	18:00:00	20:00:00	Thursday
104	153	20:00:00	22:00:00	Saturday
105	153	20:00:00	22:00:00	Sunday
106	153	19:00:00	21:00:00	Monday
107	153	19:00:00	21:00:00	Wednesday
108	153	19:00:00	21:00:00	Friday
109	155	15:00:00	18:00:00	Saturday
110	156	19:00:00	22:00:00	Monday
111	157	19:00:00	21:00:00	Monday
112	157	19:00:00	21:00:00	Wednesday
113	157	19:00:00	21:00:00	Friday
114	158	20:00:00	00:00:00	Tuesday
115	158	20:00:00	00:00:00	Thursday
116	159	13:00:00	16:00:00	Friday
117	160	08:00:00	11:00:00	Saturday
118	160	08:00:00	11:00:00	Sunday
119	161	13:00:00	18:00:00	Friday
120	161	13:00:00	18:00:00	Saturday
121	162	15:00:00	18:00:00	Sunday
\.


--
-- TOC entry 3481 (class 0 OID 25285)
-- Dependencies: 228
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (event_id, facility_id, sponsor_id, event_name, description, start_date, end_date) FROM stdin;
551	3018	1115	Yoga class	A beginner's yoga class	2023-05-10	2023-05-15
552	3005	1113	Charity run	A 5k charity run to raise money for a local non-profit	2023-06-20	2023-06-20
553	3004	1116	Basketball tournament	A 3-on-3 basketball tournament for players of all skill levels	2023-07-05	2023-07-07
554	3019	1115	Diving challenge	A challenge with price for the one that reaches the bottom and brings up the medal first	2023-08-01	2023-08-01
555	3021	1117	Spin class	A high-energy spin class to get your heart pumping	2023-09-15	2023-09-15
556	3018	1114	Zumba party	A fun dance party featuring Zumba routines	2023-10-10	2023-10-10
557	3006	1113	Volleyball tournament	A co-ed volleyball tournament for players of all skill levels	2023-11-05	2023-11-07
558	3010	1113	Scary swim	A Halloween-themed swim event for all ages	2023-10-30	2023-10-30
559	3018	1112	Bootcamp class	A challenging bootcamp-style workout in the gymnasium	2023-11-15	2023-11-15
\.


--
-- TOC entry 3471 (class 0 OID 25206)
-- Dependencies: 218
-- Data for Name: facility; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility (facility_id, complex_id, capacity, maintenance_schedule) FROM stdin;
3001	1	50	bi-weekly
3002	1	8	monthly
3003	1	20	monthly
3004	2	22	monthly
3005	2	30	quarterly
3006	2	20	monthly
3007	3	24	monthly
3008	3	10	quarterly
3009	4	50	weekly
3010	4	60	bi-weekly
3011	5	55	bi-yearly
3012	6	30	quarterly
3013	6	60	weekly
3014	7	36	quarterly
3015	7	32	monthly
3016	8	40	monthly
3017	8	60	quarterly
3018	9	50	weekly
3019	9	40	weekly
3020	10	12	bi-weekly
3021	10	35	bi-weekly
\.


--
-- TOC entry 3477 (class 0 OID 25260)
-- Dependencies: 224
-- Data for Name: facility_amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility_amenity (facility_id, amenity_id, quantity) FROM stdin;
3001	2007	1
3001	2019	20
3001	2020	50
3002	2003	3
3003	2004	2
3004	2001	1
3004	2002	1
3004	2019	10
3004	2020	25
3005	2006	1
3006	2004	2
3007	2002	2
3009	2008	2
3009	2009	1
3010	2007	2
3010	2019	20
3010	2020	70
3011	2010	2
3012	2020	10
3013	2003	1
3013	2015	1
3013	2012	1
3013	2020	25
3014	2005	1
3014	2020	20
3016	2010	2
3017	2010	2
3017	2020	30
3018	2008	2
3018	2009	2
3018	2011	1
3018	2019	20
3018	2020	55
3019	2007	2
3019	2016	1
3019	2019	30
3019	2020	45
3020	2018	1
3021	2014	1
\.


--
-- TOC entry 3498 (class 0 OID 25545)
-- Dependencies: 245
-- Data for Name: facility_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility_rating (ranking_id, member_id, rate) FROM stdin;
4801	7001	1
4802	7002	5
4803	7003	3
4804	7004	6
4805	7005	8
4806	7006	9
4807	7007	6
4808	7008	3
4809	7009	5
4810	7010	4
4811	7011	2
4812	7012	4
4813	7013	8
4814	7014	6
4815	7015	3
4816	7016	9
4817	7017	7
4818	7018	1
4819	7019	2
4820	7020	4
4821	7021	3
4822	7022	6
4823	7023	5
4824	7024	9
4825	7025	6
4826	7026	3
4827	7027	2
4828	7028	4
4829	7029	5
4830	7030	8
4831	7031	7
4832	7032	1
4833	7033	2
4834	7034	3
4835	7035	6
4836	7036	9
4837	7037	5
4838	7038	4
4839	7039	8
4840	7040	7
4841	7041	6
4842	7042	3
4843	7043	2
4844	7044	1
4845	7045	4
4846	7046	4
4847	7047	5
4848	7048	9
4849	7049	6
4850	7050	7
4851	7051	3
4852	7052	9
4853	7053	6
4854	7054	4
4855	7055	6
4856	7056	9
4857	7057	8
4858	7058	5
4859	7059	6
4860	7060	3
4861	7061	2
\.


--
-- TOC entry 3474 (class 0 OID 25238)
-- Dependencies: 221
-- Data for Name: facility_sport_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility_sport_type (facility_id, sport_type_id) FROM stdin;
3001	5
3002	3
3003	7
3004	2
3005	1
3006	7
3007	2
3007	16
3008	13
3009	15
3010	5
3010	20
3011	10
3011	11
3012	4
3013	14
3013	3
3013	22
3014	8
3015	4
3016	9
3016	12
3017	10
3017	11
3018	15
3018	6
3018	18
3019	5
3019	19
3020	17
3021	21
\.


--
-- TOC entry 3491 (class 0 OID 25369)
-- Dependencies: 238
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (member_id, facility_id, first_name, last_name, email, phone_number, date_joined) FROM stdin;
7001	3001	Frederick	Wilson	f.wilson@randatmail.com	478-6938-77	2020-05-30
7002	3001	Edgar	Dixon	e.dixon@randatmail.com	554-0676-07	2020-06-25
7003	3001	Ned	Thomas	n.thomas@randatmail.com	990-8374-07	2020-06-09
7004	3002	Amelia	Johnson	a.johnson@randatmail.com	495-3448-02	2016-05-06
7005	3002	Jenna	Harper	j.harper@randatmail.com	453-7046-37	2017-02-28
7006	3002	Naomi	Walker	n.walker@randatmail.com	225-8328-24	2009-10-16
7007	3002	Anna	Farrell	a.farrell@randatmail.com	239-1065-08	2019-12-31
7008	3003	Byron	Smith	b.smith@randatmail.com	527-4677-97	2014-05-04
7009	3003	Luke	Sullivan	l.sullivan@randatmail.com	920-3192-14	2018-09-06
7010	3003	Jordan	Williams	j.williams@randatmail.com	149-7992-94	2020-06-03
7011	3004	Lucia	Kelley	l.kelley@randatmail.com	753-1815-59	2014-09-09
7012	3004	Aida	Richards	a.richards@randatmail.com	289-5773-92	2013-11-03
7013	3004	Owen	Myers	o.myers@randatmail.com	857-1296-72	2017-03-30
7014	3005	Roland	Morris	r.morris@randatmail.com	834-9627-89	2015-08-06
7015	3005	Joyce	Grant	j.grant@randatmail.com	991-6339-94	2020-03-28
7016	3005	Elian	Cooper	e.cooper@randatmail.com	335-8887-54	2017-02-28
7017	3006	Roland	Grant	r.grant@randatmail.com	594-7369-30	2021-10-18
7018	3006	Maximilian	Taylor	m.taylor@randatmail.com	276-8606-96	2023-01-30
7019	3007	Alfred	Mason	a.mason@randatmail.com	357-4425-41	2010-05-04
7020	3007	Samantha	Hunt	s.hunt@randatmail.com	487-9598-23	2011-06-09
7021	3007	Amanda	Wells	a.wells@randatmail.com	023-5948-60	2007-06-04
7022	3007	Alfred	Williams	a.williams@randatmail.com	467-9434-45	2020-03-08
7023	3007	Jasmine	Morgan	j.morgan@randatmail.com	322-5283-59	2019-08-09
7024	3008	Sophia	Baker	s.baker@randatmail.com	308-5662-70	2012-06-09
7025	3008	Arianna	Ellis	a.ellis@randatmail.com	890-4420-16	2011-10-01
7026	3009	Alberta	Roberts	a.roberts@randatmail.com	351-6482-32	2013-02-03
7027	3009	Kate	Thompson	k.thompson@randatmail.com	031-2714-48	2019-04-28
7028	3009	Martin	Cunningham	m.cunningham@randatmail.com	425-8761-55	2008-11-13
7029	3010	Leonardo	Russell	l.russell@randatmail.com	992-8731-96	2014-12-18
7030	3010	Evelyn	Owens	e.owens@randatmail.com	008-3280-85	2011-06-09
7031	3010	Aiden	Harper	a.harper@randatmail.com	134-7767-45	2011-10-01
7032	3010	Melissa	Foster	m.foster@randatmail.com	954-0118-64	2021-10-18
7033	3011	Justin	Gibson	j.gibson@randatmail.com	551-0929-51	2016-05-06
7034	3011	Deanna	Wilson	d.wilson@randatmail.com	544-0531-45	2023-01-30
7035	3011	Hailey	Grant	h.grant@randatmail.com	122-3620-27	2020-06-09
7036	3012	Blake	Ferguson	b.ferguson@randatmail.com	823-6533-25	2021-10-18
7037	3012	Tyler	Crawford	t.crawford@randatmail.com	020-6605-59	2017-02-28
7038	3013	Dainton	Scott	d.scott@randatmail.com	284-8577-05	2011-06-09
7039	3013	Tony	Wilson	t.wilson@randatmail.com	762-2195-30	2011-10-01
7040	3013	Byron	Chapman	b.chapman@randatmail.com	482-0430-02	2011-10-01
7041	3014	Luke	Cameron	l.cameron@randatmail.com	652-7934-59	2013-11-03
7042	3014	Henry	Alexander	h.alexander@randatmail.com	677-1515-56	2016-05-06
7043	3015	Isabella	Morris	i.morris@randatmail.com	757-9180-15	2021-09-15
7044	3015	Robert	Myers	r.myers@randatmail.com	872-2321-61	2016-10-09
7045	3016	Ashton	Fowler	a.fowler@randatmail.com	434-2243-38	2011-10-01
7046	3016	Aston	Stevens	a.stevens@randatmail.com	017-5131-33	2016-05-06
7047	3017	Julia	Kelly	j.kelly@randatmail.com	674-1068-75	2020-06-09
7048	3017	Owen	Perry	o.perry@randatmail.com	121-9323-10	2021-09-15
7049	3017	Jasmine	Davis	j.davis@randatmail.com	873-5098-30	2014-12-18
7050	3018	Dexter	West	d.west@randatmail.com	031-8981-82	2011-06-09
7051	3018	Isabella	Allen	i.allen@randatmail.com	420-1235-07	2013-11-03
7052	3018	Tara	Anderson	t.anderson@randatmail.com	829-2834-45	2017-02-28
7053	3018	Adelaide	Elliott	a.elliott@randatmail.com	611-7176-44	2023-01-30
7054	3018	Tara	Smith	t.smith@randatmail.com	758-8953-03	2011-06-09
7055	3019	Adrianna	Holmes	a.holmes@randatmail.com	857-9954-36	2021-06-30
7056	3019	Garry	Tucker	g.tucker@randatmail.com	306-9514-59	2019-04-28
7057	3019	Evelyn	Foster	e.foster@randatmail.com	761-0882-85	2020-09-09
7058	3020	Cadie	Cole	c.cole@randatmail.com	193-7495-25	2023-01-29
7059	3020	Kate	Ross	k.ross@randatmail.com	706-4799-51	2021-09-15
7060	3021	Sienna	Williams	s.williams@randatmail.com	090-3311-07	2020-03-09
7061	3021	Ted	Johnson	t.johnson@randatmail.com	673-0168-32	2014-12-18
\.


--
-- TOC entry 3494 (class 0 OID 25402)
-- Dependencies: 241
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, member_id, payment_date, amount) FROM stdin;
1601	7001	2020-05-30	100.00
1602	7001	2020-06-30	100.00
1603	7001	2020-07-15	150.00
1604	7002	2020-06-25	180.00
1605	7002	2020-07-25	150.00
1606	7002	2020-08-25	150.00
1607	7003	2020-06-09	200.00
1608	7003	2020-07-09	250.00
1609	7003	2020-08-09	225.00
1610	7003	2020-09-09	200.00
1611	7004	2016-05-06	110.00
1612	7004	2016-06-06	115.00
1613	7004	2016-07-06	125.00
1614	7005	2017-02-28	155.00
1615	7005	2017-03-28	165.00
1616	7005	2017-04-28	175.00
1617	7006	2009-10-16	75.00
1618	7006	2009-11-16	75.00
1619	7006	2009-12-16	75.00
1620	7006	2010-01-01	75.00
1621	7007	2019-12-31	100.00
1622	7007	2020-01-01	100.00
1623	7007	2020-02-01	105.00
1624	7008	2014-05-04	120.00
1625	7008	2014-05-04	120.00
1626	7008	2014-05-04	120.00
1627	7009	2018-09-06	130.00
1628	7009	2018-10-06	130.00
1629	7009	2018-11-06	130.00
1630	7009	2018-12-06	130.00
1631	7010	2020-06-03	150.00
1632	7010	2020-07-03	150.00
1633	7010	2020-08-03	160.00
1634	7010	2020-09-03	160.00
1635	7010	2020-10-03	160.00
1636	7011	2014-09-09	120.00
1637	7011	2014-10-09	120.00
1638	7011	2014-11-09	120.00
1639	7012	2013-11-03	50.00
1640	7012	2013-12-03	60.00
1641	7013	2017-03-30	110.00
1642	7013	2017-04-30	110.00
1643	7013	2017-05-30	110.00
1644	7014	2015-08-06	90.00
1645	7014	2015-09-06	90.00
1646	7014	2015-10-06	90.00
1647	7015	2020-03-28	50.00
1648	7015	2020-04-28	55.00
1649	7016	2017-02-28	90.00
1650	7016	2017-03-28	95.00
1651	7016	2017-04-28	95.00
1652	7017	2021-10-18	150.00
1653	7017	2021-11-18	155.00
1654	7017	2021-11-18	150.00
1655	7018	2023-01-30	180.00
1656	7018	2023-01-15	180.00
1657	7018	2022-12-10	180.00
1658	7019	2010-05-04	80.00
1659	7019	2010-06-04	85.00
1660	7020	2011-06-09	100.00
1661	7020	2011-07-09	100.00
1662	7021	2007-06-04	150.00
1663	7021	2007-07-04	150.00
1664	7022	2020-03-08	110.00
1665	7023	2019-08-09	180.00
1666	7024	2012-06-09	150.00
1667	7025	2011-10-01	80.00
1668	7026	2013-02-03	90.00
1669	7027	2019-04-28	110.00
1670	7028	2008-11-13	55.00
1671	7029	2014-11-18	80.00
1672	7029	2014-12-18	90.00
1673	7030	2011-06-09	90.00
1674	7030	2011-07-09	80.00
1675	7031	2011-10-01	65.00
1676	7032	2021-10-18	110.00
1677	7033	2016-05-06	85.00
1678	7034	2023-01-30	180.00
1679	7035	2020-06-09	210.00
1680	7036	2021-10-18	95.00
1681	7037	2017-02-28	85.00
1682	7038	2011-06-09	60.00
1683	7038	2011-07-09	55.00
1684	7039	2011-10-01	45.00
1685	7040	2011-10-01	50.00
1686	7041	2013-11-03	65.00
1687	7041	2013-12-03	75.00
1688	7042	2016-05-06	94.00
1689	7043	2021-09-15	100.00
1690	7044	2016-10-09	85.00
1691	7045	2011-10-01	63.00
1692	7046	2016-05-06	80.00
1693	7047	2020-06-09	150.00
1694	7047	2020-07-09	160.00
1695	7048	2021-09-15	190.00
1696	7049	2014-12-18	75.00
1697	7050	2011-06-09	50.00
1698	7051	2013-11-03	92.00
1699	7052	2017-02-28	85.00
1700	7053	2023-01-30	220.00
1701	7054	2011-06-09	50.00
1702	7055	2021-06-30	100.00
1703	7055	2021-07-30	90.00
1704	7056	2019-04-28	110.00
1705	7057	2020-09-09	150.00
1706	7058	2023-01-29	190.00
1707	7059	2021-09-15	150.00
1708	7060	2020-03-09	130.00
1709	7060	2020-04-09	135.00
1710	7061	2014-12-18	180.00
\.


--
-- TOC entry 3469 (class 0 OID 25194)
-- Dependencies: 216
-- Data for Name: social_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_media (social_media_id, complex_id, platform, url) FROM stdin;
1001	1	instagram	www.theathleticedge.intagram.com
1002	1	facebook	www.theathleticedge.facebook.com
1003	1	twitter	www.theathleticedge.twitter.com
1004	2	instagram	www.allstarsports5.instagram.com
1005	3	facebook	www.sportsfactory8.facebook.com
1006	5	instagram	www.velocitysports6.instagram.com
1007	5	facebook	www.velocitysports6.facebook.com
1008	6	instagram	www.eliteathletic9.instagram.com
1009	7	facebook	www.thesportsDen4.facebook.com
1010	8	instagram	www.trainingGrounds7.instagram.com
1011	8	facebook	www.trainingGrounds7.facebook.com
1012	9	instagram	www.championfitness78.instagram.com
\.


--
-- TOC entry 3479 (class 0 OID 25276)
-- Dependencies: 226
-- Data for Name: sponsor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sponsor (sponsor_id, sponsor_name, logo_url, website_url) FROM stdin;
1111	Fit for Life	www.125fitforlfe.com/logo.jpg	 www.125fitforlife.com
1112	Strong Body	www.1254strongbody.com/logo.jpg	www.1254strongbody.com
1113	Fit Factory	www.5816fitfactory.com/logo.jpg	 www.5816fitfactory.com
1114	Health Haven	www.785healthhaven.com/logo.jpg	 www.785healthhaven.com
1115	Dynamic Fitness	www.8778dynamicfitness.com/logo.jpg	 www.8778dynamicfitness.com
1116	Body Builders	www.bodybuilders4565.com/logo.jpg	 www.bodybuilders4565.com
1117	Train Hero	www.1234trainhero.com/logo.jpg	www.1234trainhero.com
\.


--
-- TOC entry 3473 (class 0 OID 25230)
-- Dependencies: 220
-- Data for Name: sport_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sport_types (sport_type_id, name, definition) FROM stdin;
1	Football 	Football is  a team sport played between two teams of 11 players each who primarily use their feet to propel a ball around a rectangular field called a pitch.
2	Basketball	Basketball is a game played between two teams of five players each on a rectangular court, usually indoors. Each team tries to score by tossing the ball through the opponent's goal, an elevated horizontal hoop and net called a basket.
3	Tennis	Tennis is a game in which two or four players strike a ball with rackets over a net stretched across a court.
4	Golf	Golf is a game played on a large open-air course, in which a small hard ball is struck with a club into a series of small holes in the ground, the object being to use the fewest possible strokes to complete the course.
5	Swimming	Swimming is a sport or activity of propelling oneself through water using the limbs.
6	Gymnastics	Gymnastics is a sport that involves various exercises that require strength, flexibility, and coordination, typically performed on apparatuses such as the balance beam or parallel bars.
7	Volleyball	Volleyball is a game for two teams, usually of six players, in which a large ball is hit by hand over a high net, the aim being to score points by making the ball reach the ground on the opponent's side of the court.
8	Baseball	Baseball is a team sport played on a diamond-shaped field, where players hit a ball and run around a series of bases.
9	Boxing	Boxing is a combat sport that involves two competitors throwing punches at each other within a set of rules.
10	Karate	Karate is a martial art that involves various striking, blocking, and kicking techniques.
11	Taekwondo	Taekwondo is a martial art that focuses on high kicks and fast-paced movement.
12	Judo	Judo is an individual sport that involves throwing opponents to the ground or submitting them using joint locks or chokes.
13	Table Tennis	Table Tennis a racket sport played on a table, where players use paddles to hit a lightweight ball back and forth over a net.
14	Badminton 	Badminton is a racket sport played on a court, where players hit a shuttlecock back and forth over a net.
15	Fitness	Fitness involves improving one's strength, flexibility, endurance, and overall health to perform daily activities and prevent illnesses or injuries.
16	Handball	Handball is a team sport that is similar to soccer but players use their hands to pass and shoot a ball into a goal.
17	Ice Hockey	Ice Hockey is a team sport that involves skating on ice and shooting a puck into the opposing team's goal.
18	Weightlifting 	Weightlifting is an individual sport that involves lifting weights
19	Diving	Diving is an individual or team sport that involves performing acrobatic movements while diving from a board or platform into water.
20	Water polo	Water Polo is a team sport that involves passing and shooting a ball into the opposing team's goal while treading water.
21	Ice skating	Ice skating is a sport of moving on ice, wearing ice skates 
22	Squash	Squash is a racket-and-ball sport played by two or four players in a four-walled court with a small, hollow, rubber ball.
23	Muay Thai	Muay Thai is a martial art and combat sport that originated in Thailand. It is also known as "the art of eight limbs" because it is characterized by the combined use of fists, elbows, knees, and shins.
24	Archery	Archery is the art, sport, practice, or skill of using a bow to shoot arrows
\.


--
-- TOC entry 3483 (class 0 OID 25304)
-- Dependencies: 230
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, facility_id, first_name, last_name, role, salary) FROM stdin;
1099	3004	Dylan	Scott	Coach	60000.00
1100	3007	Andrew	King	Coach	55000.00
1101	3007	Lily	Morris	Coach	65000.00
1102	3011	Claire	Cooper	Coach	40000.00
1103	3013	Aria	Collins	Coach	68000.00
1104	3016	Oliver	Adams	Coach	55000.00
1105	3017	Natalie	Adams	Coach	59000.00
1106	3018	Andrew	Parker	Trainer	46000.00
1107	3018	Jim	Beesly	Trainer	56000.00
1108	3019	Leo	Martin	Lifeguard	40000.00
1109	3019	Hannah	Wilson	Trainer	58000.00
1110	3021	Isaac	Brown	Trainer	63000.00
1111	3005	Arianna	Ryan	Referee	55000.00
1112	3009	Kristian	Douglas	Receptionist	46000.00
1113	3007	Aldus	Allen	Cleaner	40000.00
1114	3005	Deanna	Brown	Cleaner	40000.00
1115	3014	Carl	Evans	Groundskeeper	55000.00
1116	3015	Melissa	Reed	Groundskeeper	55000.00
1117	3004	Agata	Hill	Referee	55000.00
1118	3017	Madaline	Mason	Maintenance staff	46000.00
1119	3019	Victor	Martin	Maintenance staff	46000.00
1120	3016	Briony	Mitchell	Receptionist	55000.00
1121	3001	Jessica	Lloyd	Lifeguard	58000.00
1122	3006	Joyce	Richardson	Referee	50000.00
\.


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 222
-- Name: amenities_amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenities_amenity_id_seq', 1, false);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 242
-- Name: availability_availability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.availability_availability_id_seq', 1, false);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 231
-- Name: coach_coach_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coach_coach_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 233
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 235
-- Name: course_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_schedule_schedule_id_seq', 1, false);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 227
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_event_id_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 217
-- Name: facility_facility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facility_facility_id_seq', 1, false);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 244
-- Name: facility_ranking_ranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facility_ranking_ranking_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 237
-- Name: member_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_member_id_seq', 1, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 240
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 215
-- Name: social_media_social_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_media_social_media_id_seq', 1, false);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 225
-- Name: sponsor_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sponsor_sponsor_id_seq', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 219
-- Name: sport_types_sport_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sport_types_sport_type_id_seq', 1, false);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 229
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 1, false);


--
-- TOC entry 3279 (class 2606 OID 25259)
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (amenity_id);


--
-- TOC entry 3303 (class 2606 OID 25519)
-- Name: availability availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT availability_pkey PRIMARY KEY (availability_id);


--
-- TOC entry 3289 (class 2606 OID 25321)
-- Name: coach coach_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach
    ADD CONSTRAINT coach_pkey PRIMARY KEY (coach_id);


--
-- TOC entry 3291 (class 2606 OID 25323)
-- Name: coach coach_staff_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach
    ADD CONSTRAINT coach_staff_id_key UNIQUE (staff_id);


--
-- TOC entry 3299 (class 2606 OID 25390)
-- Name: course_enrollment course_enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_enrollment
    ADD CONSTRAINT course_enrollment_pkey PRIMARY KEY (course_id, member_id);


--
-- TOC entry 3293 (class 2606 OID 25335)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 3295 (class 2606 OID 25352)
-- Name: course_schedule course_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_pkey PRIMARY KEY (schedule_id, course_id);


--
-- TOC entry 3269 (class 2606 OID 24800)
-- Name: complex employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complex
    ADD CONSTRAINT employee_pkey PRIMARY KEY (complex_id);


--
-- TOC entry 3285 (class 2606 OID 25292)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);


--
-- TOC entry 3281 (class 2606 OID 25264)
-- Name: facility_amenity facility_amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_amenity
    ADD CONSTRAINT facility_amenity_pkey PRIMARY KEY (facility_id, amenity_id);


--
-- TOC entry 3273 (class 2606 OID 25211)
-- Name: facility facility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (facility_id);


--
-- TOC entry 3305 (class 2606 OID 25550)
-- Name: facility_rating facility_ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_rating
    ADD CONSTRAINT facility_ranking_pkey PRIMARY KEY (ranking_id, member_id);


--
-- TOC entry 3277 (class 2606 OID 25242)
-- Name: facility_sport_type facility_sport_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_sport_type
    ADD CONSTRAINT facility_sport_type_pkey PRIMARY KEY (facility_id, sport_type_id);


--
-- TOC entry 3297 (class 2606 OID 25374)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (member_id);


--
-- TOC entry 3301 (class 2606 OID 25407)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 3271 (class 2606 OID 25199)
-- Name: social_media social_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media
    ADD CONSTRAINT social_media_pkey PRIMARY KEY (social_media_id);


--
-- TOC entry 3283 (class 2606 OID 25283)
-- Name: sponsor sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsor
    ADD CONSTRAINT sponsor_pkey PRIMARY KEY (sponsor_id);


--
-- TOC entry 3275 (class 2606 OID 25237)
-- Name: sport_types sport_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sport_types
    ADD CONSTRAINT sport_types_pkey PRIMARY KEY (sport_type_id);


--
-- TOC entry 3287 (class 2606 OID 25309)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 3323 (class 2606 OID 25520)
-- Name: availability availability_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availability
    ADD CONSTRAINT availability_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3315 (class 2606 OID 25324)
-- Name: coach coach_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach
    ADD CONSTRAINT coach_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 3320 (class 2606 OID 25391)
-- Name: course_enrollment course_enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_enrollment
    ADD CONSTRAINT course_enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3321 (class 2606 OID 25396)
-- Name: course_enrollment course_enrollment_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_enrollment
    ADD CONSTRAINT course_enrollment_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);


--
-- TOC entry 3316 (class 2606 OID 25341)
-- Name: course course_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3317 (class 2606 OID 25336)
-- Name: course course_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.coach(coach_id);


--
-- TOC entry 3318 (class 2606 OID 25353)
-- Name: course_schedule course_schedule_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_schedule
    ADD CONSTRAINT course_schedule_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 3312 (class 2606 OID 25293)
-- Name: event event_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3313 (class 2606 OID 25298)
-- Name: event event_sponsor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_sponsor_id_fkey FOREIGN KEY (sponsor_id) REFERENCES public.sponsor(sponsor_id);


--
-- TOC entry 3310 (class 2606 OID 25270)
-- Name: facility_amenity facility_amenity_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_amenity
    ADD CONSTRAINT facility_amenity_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(amenity_id);


--
-- TOC entry 3311 (class 2606 OID 25265)
-- Name: facility_amenity facility_amenity_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_amenity
    ADD CONSTRAINT facility_amenity_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3307 (class 2606 OID 25212)
-- Name: facility facility_complex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_complex_id_fkey FOREIGN KEY (complex_id) REFERENCES public.complex(complex_id);


--
-- TOC entry 3324 (class 2606 OID 25551)
-- Name: facility_rating facility_ranking_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_rating
    ADD CONSTRAINT facility_ranking_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);


--
-- TOC entry 3308 (class 2606 OID 25243)
-- Name: facility_sport_type facility_sport_type_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_sport_type
    ADD CONSTRAINT facility_sport_type_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3309 (class 2606 OID 25248)
-- Name: facility_sport_type facility_sport_type_sport_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_sport_type
    ADD CONSTRAINT facility_sport_type_sport_type_id_fkey FOREIGN KEY (sport_type_id) REFERENCES public.sport_types(sport_type_id);


--
-- TOC entry 3319 (class 2606 OID 25375)
-- Name: member member_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


--
-- TOC entry 3322 (class 2606 OID 25408)
-- Name: payment payment_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.member(member_id);


--
-- TOC entry 3306 (class 2606 OID 25200)
-- Name: social_media social_media_complex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.social_media
    ADD CONSTRAINT social_media_complex_id_fkey FOREIGN KEY (complex_id) REFERENCES public.complex(complex_id);


--
-- TOC entry 3314 (class 2606 OID 25310)
-- Name: staff staff_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_facility_id_fkey FOREIGN KEY (facility_id) REFERENCES public.facility(facility_id);


-- Completed on 2023-04-30 22:42:51

--
-- PostgreSQL database dump complete
--

