CREATE TABLE complex(
	complex_ID Integer PRIMARY KEY,
	complex_Name VARCHAR(255) NOT NULL,
	number_of_facilities INTEGER NOT NULL,
	address VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	"state" VARCHAR(255),
	zip_code CHAR(10) NOT NULL,
	phhone_number CHAR(20),
	website CHAR(255) NOT NULL,
	year_established INTEGER
);


CREATE TABLE social_media (
  social_media_ID SERIAL PRIMARY KEY,
  complex_id INTEGER NOT NULL,
  FOREIGN KEY (complex_id) REFERENCES complex(complex_id),
  platform VARCHAR(50) NOT NULL,
  URL VARCHAR(255) NOT NULL
);


CREATE TABLE amenities(
  amenity_id SERIAL PRIMARY KEY,
  amenity_name VARCHAR(255) NOT NULL,
  age_restriction INT
);



CREATE TABLE facility (
  facility_id SERIAL PRIMARY KEY,
  complex_id INT NOT NULL,
  capacity INT,
  maintenance_schedule VARCHAR(255),
  FOREIGN KEY (complex_id) REFERENCES complex (complex_id)
);

CREATE TABLE availability (
  availability_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  available_day VARCHAR(10),
  opening_hour TIME,
  closing_hour TIME
);


CREATE TABLE availability (
  availability_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  available_day VARCHAR(10),
  opening_hour TIME,
  closing_hour TIME
);

CREATE TABLE sport_types (
  sport_type_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  definition TEXT
);


CREATE TABLE facility_sport_type (
  facility_id INT NOT NULL,
  sport_type_id INT NOT NULL,
  PRIMARY KEY (facility_id, sport_type_id),
  FOREIGN KEY (facility_id) REFERENCES facility(facility_id),
  FOREIGN KEY (sport_type_id) REFERENCES sport_types(sport_type_id)
);

CREATE TABLE facility_amenity (
  facility_id INTEGER NOT NULL,
  amenity_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (facility_id, amenity_id),
  FOREIGN KEY (facility_id) REFERENCES facility(facility_id),
  FOREIGN KEY (amenity_id) REFERENCES amenities(amenity_id)
);



CREATE TABLE sponsor (
  sponsor_id SERIAL PRIMARY KEY,
  sponsor_name VARCHAR(255) NOT NULL,
  logo_url VARCHAR(255),
  website_url VARCHAR(255)
);


CREATE TABLE event (
  event_id SERIAL PRIMARY KEY,
  facility_id INTEGER NOT NULL,
  sponsor_id INTEGER NOT NULL,
  event_name VARCHAR(255) NOT NULL,
  description TEXT,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  FOREIGN KEY (facility_id) REFERENCES facility (facility_id),
  FOREIGN KEY (sponsor_id) REFERENCES sponsor (sponsor_id)
);



CREATE TABLE staff (
  staff_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  role VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);


CREATE TABLE coach (
  coach_id SERIAL PRIMARY KEY,
  staff_id INTEGER NOT NULL UNIQUE,
  years_of_experience INTEGER,
  branch VARCHAR(50),
  FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);


CREATE TABLE course (
  course_id SERIAL PRIMARY KEY,
  instructor_id INTEGER NOT NULL REFERENCES coach(coach_id),
  facility_id INTEGER NOT NULL REFERENCES facility(facility_id),
  course_name VARCHAR(255) NOT NULL,
  course_capacity INTEGER,
  course_cost DECIMAL(10, 2),
  start_date DATE,
  end_date DATE
);

CREATE TABLE course_schedule (
  schedule_id SERIAL,
  course_id INTEGER,
  start_time TIME,
  end_time TIME,
  day_of_week VARCHAR(10),
  PRIMARY KEY (schedule_id, course_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);


CREATE TABLE member (
  member_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  membership_id INTEGER REFERENCES membership_type(membership_id),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  date_joined DATE NOT NULL
);


CREATE TABLE membership_type (
  membership_id SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE course_enrollment (
  course_id INTEGER REFERENCES course(course_id),
  member_id INTEGER REFERENCES member(member_id),
  enrollment_date DATE,
  PRIMARY KEY (course_id, member_id)
);


CREATE TABLE payment (
  payment_id SERIAL PRIMARY KEY,
  member_id INTEGER NOT NULL REFERENCES member(member_id),
  payment_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE facility_ratings (
  rating_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  member_id INTEGER REFERENCES member(member_id),
  rating INTEGER NOT NULL
);

CREATE TABLE facility_ranking
(
	ranking_id SERIAL,
	member_id INTEGER REFERENCES member(member_id),
	rate INTEGER NOT NULL,
	PRIMARY KEY(ranking_id, member_id)
)
