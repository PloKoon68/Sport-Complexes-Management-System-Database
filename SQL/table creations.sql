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



CREATE TABLE facility (
  facility_id SERIAL PRIMARY KEY,
  complex_id INT NOT NULL,
  facility_name VARCHAR(100) NOT NULL,
  capacity INT,
  maintenance_schedule VARCHAR(255),
  FOREIGN KEY (complex_id) REFERENCES complex (complex_id)
);

CREATE TABLE availability (
  availability_id SERIAL,
  facility_id INTEGER NOT NULL,
  availability_day VARCHAR(10) NOT NULL,
  availability_hour INTEGER NOT NULL,
  PRIMARY KEY (availability_id, facility_id),
  FOREIGN KEY (facility_id) REFERENCES facility (facility_id)
);


CREATE TABLE sport_types (
  sport_type_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  definition TEXT
);
