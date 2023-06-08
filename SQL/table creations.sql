

























/*
CREATE TABLE sport_types (
  sport_type_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  definition TEXT
);

CREATE TABLE amenities(
  amenity_id SERIAL PRIMARY KEY,
  amenity_name VARCHAR(255) NOT NULL,
  age_restriction INT
);

CREATE TABLE sponsor (
  sponsor_id SERIAL PRIMARY KEY,
  sponsor_name VARCHAR(255) NOT NULL,
  logo_url VARCHAR(255),
  website_url VARCHAR(255)
);


CREATE TABLE complex(
	complex_ID Integer PRIMARY KEY,
	complex_Name VARCHAR(255) NOT NULL,
	number_of_facilities INTEGER NOT NULL,
	address VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL,
	"state" VARCHAR(255),
	zip_code CHAR(10) NOT NULL,
	phone_number CHAR(20),
	website CHAR(255) NOT NULL,
	year_established INTEGER
);




CREATE TABLE facility (
  facility_id SERIAL PRIMARY KEY,
  complex_id INT NOT NULL,
  capacity INT,
  maintenance_schedule VARCHAR(255),
  FOREIGN KEY (complex_id) REFERENCES complex (complex_id)
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

CREATE TABLE availability (
  availability_id SERIAL PRIMARY KEY,
  facility_id INTEGER REFERENCES facility(facility_id),
  available_day VARCHAR(10),
  opening_hour TIME,
  closing_hour TIME
);
CREATE TABLE membership_type (
  membership_id SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL,
  description TEXT
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

CREATE TABLE course_enrollment (
  course_id INTEGER REFERENCES course(course_id),
  member_id INTEGER REFERENCES member(member_id),
  enrollment_date DATE,
  PRIMARY KEY (course_id, member_id)
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





CREATE TABLE facility_amenity (
  facility_id INTEGER NOT NULL,
  amenity_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (facility_id, amenity_id),
  FOREIGN KEY (facility_id) REFERENCES facility(facility_id),
  FOREIGN KEY (amenity_id) REFERENCES amenities(amenity_id)
);



CREATE TABLE facility_rating (
  rating_id SERIAL PRIMARY KEY,
  member_id INTEGER REFERENCES member(member_id),
  rating INTEGER NOT NULL
);


CREATE TABLE facility_sport_type (
  facility_id INT NOT NULL,
  sport_type_id INT NOT NULL,
  PRIMARY KEY (facility_id, sport_type_id),
  FOREIGN KEY (facility_id) REFERENCES facility(facility_id),
  FOREIGN KEY (sport_type_id) REFERENCES sport_types(sport_type_id)
);






CREATE TABLE payment (
  payment_id SERIAL PRIMARY KEY,
  member_id INTEGER NOT NULL REFERENCES member(member_id),
  payment_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE social_media (
  social_media_ID SERIAL PRIMARY KEY,
  complex_id INTEGER NOT NULL,
  FOREIGN KEY (complex_id) REFERENCES complex(complex_id),
  platform VARCHAR(50) NOT NULL,
  URL VARCHAR(255) NOT NULL
);








INSERT INTO sport_types (sport_type_id, name, definition)
VALUES
  (1, 'Football', 'Football is a team sport played between two teams of 11 players each who primarily use their feet to propel a ball around a rectangular field called a pitch.'),
  (2, 'Basketball', 'Basketball is a game played between two teams of five players each on a rectangular court, usually indoors. Each team tries to score by tossing the ball through the opponent''s goal, an elevated horizontal hoop and net called a basket.'),
  (3, 'Tennis', 'Tennis is a game in which two or four players strike a ball with rackets over a net stretched across a court.'),
  (4, 'Golf', 'Golf is a game played on a large open-air course, in which a small hard ball is struck with a club into a series of small holes in the ground, the object being to use the fewest possible strokes to complete the course.'),
  (5, 'Swimming', 'Swimming is a sport or activity of propelling oneself through water using the limbs.'),
  (6, 'Gymnastics', 'Gymnastics is a sport that involves various exercises that require strength, flexibility, and coordination, typically performed on apparatuses such as the balance beam or parallel bars.'),
  (7, 'Volleyball', 'Volleyball is a game for two teams, usually of six players, in which a large ball is hit by hand over a high net, the aim being to score points by making the ball reach the ground on the opponent''s side of the court.'),
  (8, 'Baseball', 'Baseball is a team sport played on a diamond-shaped field, where players hit a ball and run around a series of bases.'),
  (9, 'Boxing', 'Boxing is a combat sport that involves two competitors throwing punches at each other within a set of rules.'),
  (10, 'Karate', 'Karate is a martial art that involves various striking, blocking, and kicking techniques.'),
  (11, 'Taekwondo', 'Taekwondo is a martial art that focuses on high kicks and fast-paced movement.'),
  (12, 'Judo', 'Judo is an individual sport that involves throwing opponents to the ground or submitting them using joint locks or chokes.'),
  (13, 'Table Tennis', 'Table Tennis a racket sport played on a table, where players use paddles to hit a lightweight ball back and forth over a net.'),
  (14, 'Badminton', 'Badminton is a racket sport played on a court, where players hit a shuttlecock back and forth over a net.'),
  (15, 'Fitness', 'Fitness involves improving one''s strength, flexibility, endurance, and overall health to perform daily activities and prevent illnesses or injuries.'),
  (16, 'Handball', 'Handball is a team sport that is similar to soccer but players use their hands to pass and shoot a ball into a goal.'),
  (17, 'Ice Hockey', 'Ice Hockey is a team sport that involves skating on ice and shooting a puck into the opposing team''s goal.'),
  (18, 'Weightlifting', 'Weightlifting is an individual sport that involves lifting weights.'),
  (19, 'Diving', 'Diving is an individual or team sport that involves performing acrobatic movements while diving from a board or platform into water.'),
  (20, 'Water polo', 'Water Polo is a team sport that involves passing and shooting a ball into the opposing team''s goal while treading water.'),
  (21, 'Ice skating', 'Ice skating is a sport of moving on ice, wearing ice skates.'),
  (22, 'Squash', 'Squash is a racket-and-ball sport played by two or four players in a four-walled court with a small, hollow, rubber ball.'),
  (23, 'Muay Thai', 'Muay Thai is a martial art and combat sport that originated in Thailand. It is also known as "the art of eight limbs" because it is characterized by the combined use of fists, elbows, knees, and shins.'),
  (24, 'Archery', 'Archery is the art, sport, practice, or skill of using a bow to shoot arrows.');



INSERT INTO amenities (amenity_id, amenity_name, age_restriction) VALUES
(2001, 'Outdoor Basketball Court', NULL),
(2002, 'Indoor Basketball Court', NULL),
(2003, 'Tennis Court', NULL),
(2004, 'Volleyball Court', NULL),
(2005, 'Baseball Field', NULL),
(2006, 'Football Field', NULL),
(2007, 'Swimming Pool', NULL),
(2008, 'Weight Room', 16),
(2009, 'Cardio Room', 16),
(2010, 'Martial Arts Studio', 5),
(2011, 'Pilates Studio', 16),
(2012, 'Squash Court', NULL),
(2013, 'Hockey Rink', NULL),
(2014, 'Ice Skating Rink', NULL),
(2015, 'Badminton Court', NULL),
(2016, 'Diving Pool', NULL),
(2017, 'Skate Skiing Area', NULL),
(2018, 'Ice Hockey Rink', NULL),
(2019, 'Shower', NULL),
(2020, 'Locker', NULL);


INSERT INTO sponsor (sponsor_id, sponsor_name, logo_url, website_url)
VALUES
  (1111, 'Fit for Life', 'www.125fitforlfe.com/logo.jpg', 'www.125fitforlife.com'),
  (1112, 'Strong Body', 'www.1254strongbody.com/logo.jpg', 'www.1254strongbody.com'),
  (1113, 'Fit Factory', 'www.5816fitfactory.com/logo.jpg', 'www.5816fitfactory.com'),
  (1114, 'Health Haven', 'www.785healthhaven.com/logo.jpg', 'www.785healthhaven.com'),
  (1115, 'Dynamic Fitness', 'www.8778dynamicfitness.com/logo.jpg', 'www.8778dynamicfitness.com'),
  (1116, 'Body Builders', 'www.bodybuilders4565.com/logo.jpg', 'www.bodybuilders4565.com'),
  (1117, 'Train Hero', 'www.1234trainhero.com/logo.jpg', 'www.1234trainhero.com');



INSERT INTO complex (complex_id, complex_name, number_of_facilities, address, city, state, zip_code, phone_number, website, year_established) VALUES
(1, 'The Athletic Edge Training Center', 3, '123 Main St,', 'San Francisco', 'CA', '90001', '(408) 555-2345', 'www.athleticedge.com', 2000),
(2, 'All-Star Sports Club', 3, '456 Oak St', 'New York', 'NY', '10002', '(650) 555-9876', 'www.allstarclub3.com', 2002),
(3, 'The Sports Factory', 2, '1819 Cedar St', 'Los Angeles', 'CA', '90001', '(408) 555-2345', 'www.sport4factory.com', 2011),
(4, 'Fit Nation Sports Complex', 2, '2021 Chestnut Ave', 'Houston', 'TX', '75002', '(510) 555-8765', 'www.fitnation6.com', 2008),
(5, 'Velocity Sports Training Facility', 1, '3435 Sycamore Ln', 'Chicago', 'IL', '60005', '(925) 555-3456', 'www.velocitysport2.com', 2020),
(6, 'Elite Athletic Club', 2, '4041 Maplewood Dr', 'Austin', 'TX', '75002', '(707) 555-6543', 'www.eliteathletic5.com', 2018),
(7, 'The Sports Den', 2, '4647 Chestnut St, Anyville', 'San Diego', 'CA', '90005', '(831) 555-7890', 'www.sportsden9.com', 2011),
(8, 'The Training Grounds', 2, '5253 Pine Ave', 'Dallas', 'TX', '75003', '(559) 555-4321', 'www.traininggroundx.com', 2001),
(9, 'Champion Fitness & Health', 2, '4243 Elmwood Ln', 'Austin', 'TX', '75004', '(805) 555-2109', 'www.champfittnessx.com', 1999),
(10, 'Elite Training Academy', 2, '2223 Magnolia Dr', 'San Francisco', 'CA', '90001', '(323) 555-6789', 'www.elitetrainingf.com', 2016);





INSERT INTO facility (facility_id, complex_id, capacity, maintenance_schedule) VALUES
(3001, 1, 50, 'bi-weekly'),
(3002, 1, 8, 'monthly'),
(3003, 1, 20, 'monthly'),
(3004, 2, 22, 'monthly'),
(3005, 2, 30, 'quarterly'),
(3006, 2, 20, 'monthly'),
(3007, 3, 24, 'monthly'),
(3008, 3, 10, 'quarterly'),
(3009, 4, 50, 'weekly'),
(3010, 4, 60, 'bi-weekly'),
(3011, 5, 55, 'bi-yearly'),
(3012, 6, 30, 'quarterly'),
(3013, 6, 60, 'weekly'),
(3014, 7, 36, 'quarterly'),
(3015, 7, 32, 'monthly'),
(3016, 8, 40, 'monthly'),
(3017, 8, 60, 'quarterly'),
(3018, 9, 50, 'weekly'),
(3019, 9, 40, 'weekly'),
(3020, 10, 12, 'bi-weekly'),
(3021, 10, 35, 'bi-weekly');



  INSERT INTO staff (staff_id, facility_id, first_name, last_name, role, salary)
VALUES
  (1099, 3004, 'Dylan', 'Scott', 'Coach', 60000.00),
  (1100, 3007, 'Andrew', 'King', 'Coach', 55000.00),
  (1101, 3007, 'Lily', 'Morris', 'Coach', 65000.00),
  (1102, 3011, 'Claire', 'Cooper', 'Coach', 40000.00),
  (1103, 3013, 'Aria', 'Collins', 'Coach', 68000.00),
  (1104, 3016, 'Oliver', 'Adams', 'Coach', 55000.00),
  (1105, 3017, 'Natalie', 'Adams', 'Coach', 59000.00),
  (1106, 3018, 'Andrew', 'Parker', 'Trainer', 46000.00),
  (1107, 3018, 'Jim', 'Beesly', 'Trainer', 56000.00),
  (1108, 3019, 'Leo', 'Martin', 'Lifeguard', 40000.00),
  (1109, 3019, 'Hannah', 'Wilson', 'Trainer', 58000.00),
  (1110, 3021, 'Isaac', 'Brown', 'Trainer', 63000.00),
  (1111, 3005, 'Arianna', 'Ryan', 'Referee', 55000.00),
  (1112, 3009, 'Kristian', 'Douglas', 'Receptionist', 46000.00),
  (1113, 3007, 'Aldus', 'Allen', 'Cleaner', 40000.00),
  (1114, 3005, 'Deanna', 'Brown', 'Cleaner', 40000.00),
  (1115, 3014, 'Carl', 'Evans', 'Groundskeeper', 55000.00),
  (1116, 3015, 'Melissa', 'Reed', 'Groundskeeper', 55000.00),
  (1117, 3004, 'Agata', 'Hill', 'Referee', 55000.00),
  (1118, 3017, 'Madaline', 'Mason', 'Maintenance staff', 46000.00),
  (1119, 3019, 'Victor', 'Martin', 'Maintenance staff', 46000.00),
  (1120, 3016, 'Briony', 'Mitchell', 'Receptionist', 55000.00),
  (1121, 3001, 'Jessica', 'Lloyd', 'Lifeguard', 58000.00),
  (1122, 3006, 'Joyce', 'Richardson', 'Referee', 50000.00);



INSERT INTO coach (coach_id, staff_id, years_of_experience, branch) VALUES
(2099, 1099, 6, 'Basketball'),
(2100, 1100, 7, 'Handball'),
(2101, 1101, 5, 'Basketball'),
(2102, 1102, 8, 'Martial Arts'),
(2103, 1103, 4, 'Tennis'),
(2104, 1104, 6, 'Martial Arts'),
(2105, 1105, 8, 'Martial Arts'),
(2106, 1106, 5, 'Fitness'),
(2107, 1107, 6, 'Personal Trainer'),
(2108, 1109, 10, 'Swimming'),
(2109, 1110, 12, 'Ice Skating');


INSERT INTO availability (availability_id, facility_id, available_day, opening_hour, closing_hour) VALUES
(501, 3001, 'Monday', '09:00:00', '18:45:00'),
(502, 3001, 'Wednesday', '13:30:00', '22:30:00'),
(503, 3001, 'Friday', '14:30:00', '23:50:00'),
(504, 3002, 'Saturday', '09:00:00', '14:30:00'),
(505, 3002, 'Sunday', '10:30:00', '22:30:00'),
(506, 3003, 'Tuesday', '11:45:00', '21:45:00'),
(507, 3003, 'Wednesday', '12:45:00', '22:15:00'),
(508, 3004, 'Monday', '10:15:00', '23:40:00'),
(509, 3004, 'Wednesday', '07:30:00', '23:10:00'),
(510, 3005, 'Satruday', '06:45:00', '22:10:00'),
(511, 3005, 'Sunday', '12:00:00', '18:45:00'),
(512, 3006, 'Sunday', '13:00:00', '23:45:00'),
(513, 3007, 'Monday', '09:00:00', '23:00:00'),
(514, 3007, 'Friday', '07:45:00', '21:00:00'),
(515, 3008, 'Thursday', '11:30:00', '18:30:00'),
(516, 3009, 'Saturday', '06:45:00', '22:45:00'),
(517, 3009, 'Monday', '11:00:00', '19:30:00'),
(518, 3010, 'Tuesday', '11:00:00', '19:00:00'),
(519, 3010, 'Thursday', '12:00:00', '16:30:00'),
(520, 3011, 'Friday', '08:00:00', '23:00:00'),
(521, 3011, 'Monday', '08:00:00', '23:00:00'),
(522, 3011, 'Wednesday', '09:00:00', '17:30:00'),
(523, 3012, 'Saturday', '10:00:00', '16:00:00'),
(524, 3012, 'Wednesday', '14:30:00', '18:00:00'),
(525, 3012, 'Friday', '12:45:00', '18:00:00'),
(526, 3013, 'Saturday', '13:00:00', '21:00:00'),
(527, 3013, 'Sunday', '11:00:00', '20:00:00'),
(528, 3014, 'Monday', '07:30:00', '19:30:00'),
(529, 3014, 'Tuesday', '09:45:00', '22:00:00'),
(530, 3014, 'Friday', '10:30:00', '21:03:00'),
(531, 3015, 'Friday', '07:00:00', '22:00:00'),
(532, 3015, 'Monday', '06:00:00', '21:30:00'),
(533, 3016, 'Saturday', '14:10:00', '18:45:00'),
(534, 3016, 'Sunday', '12:45:00', '18:15:00'),
(535, 3017, 'Monday', '15:00:00', '22:30:00'),
(536, 3017, 'Wednesday', '14:00:00', '21:45:00'),
(537, 3018, 'Monday', '16:15:00', '23:00:00'),
(538, 3019, 'Wednesday', '08:00:00', '23:30:00'),
(539, 3020, 'Thursday', '11:30:00', '15:50:00'),
(540, 3020, 'Friday', '10:00:00', '21:00:00'),
(541, 3021, 'Tuesday', '12:00:00', '22:30:00'),
(542, 3021, 'Friday', '15:00:00', '22:45:00');



INSERT INTO member (member_id, facility_id, first_name, last_name, email, phone_number, date_joined) VALUES
(7001, 3001, 'Frederick', 'Wilson', 'f.wilson@randatmail.com', '478-6938-77', '2020-05-30'),
(7002, 3001, 'Edgar', 'Dixon', 'e.dixon@randatmail.com', '554-0676-07', '2020-06-25'),
(7003, 3001, 'Ned', 'Thomas', 'n.thomas@randatmail.com', '990-8374-07', '2020-06-09'),
(7004, 3002, 'Amelia', 'Johnson', 'a.johnson@randatmail.com', '495-3448-02', '2016-05-06'),
(7005, 3002, 'Jenna', 'Harper', 'j.harper@randatmail.com', '453-7046-37', '2017-02-28'),
(7006, 3002, 'Naomi', 'Walker', 'n.walker@randatmail.com', '225-8328-24', '2009-10-16'),
(7007, 3002, 'Anna', 'Farrell', 'a.farrell@randatmail.com', '239-1065-08', '2019-12-31'),
(7008, 3003, 'Byron', 'Smith', 'b.smith@randatmail.com', '527-4677-97', '2014-05-04'),
(7009, 3003, 'Luke', 'Sullivan', 'l.sullivan@randatmail.com', '920-3192-14', '2018-09-06'),
(7010, 3003, 'Jordan', 'Williams', 'j.williams@randatmail.com', '149-7992-94', '2020-06-03'),
(7011, 3004, 'Lucia', 'Kelley', 'l.kelley@randatmail.com', '753-1815-59', '2014-09-09'),
(7012, 3004, 'Aida', 'Richards', 'a.richards@randatmail.com', '289-5773-92', '2013-11-03'),
(7013, 3004, 'Owen', 'Myers', 'o.myers@randatmail.com', '857-1296-72', '2017-03-30'),
(7014, 3005, 'Roland', 'Morris', 'r.morris@randatmail.com', '834-9627-89', '2015-08-06'),
(7015, 3005, 'Joyce', 'Grant', 'j.grant@randatmail.com', '991-6339-94', '2020-03-28'),
(7016, 3005, 'Elian', 'Cooper', 'e.cooper@randatmail.com', '335-8887-54', '2017-02-28'),
(7017, 3006, 'Roland', 'Grant', 'r.grant@randatmail.com', '594-7369-30', '2021-10-18'),
(7018, 3006, 'Maximilian', 'Taylor', 'm.taylor@randatmail.com', '276-8606-96', '2023-01-30'),
(7019, 3007, 'Alfred', 'Mason', 'a.mason@randatmail.com', '357-4425-41', '2010-05-04'),
(7020, 3007, 'Samantha', 'Hunt', 's.hunt@randatmail.com', '487-9598-23', '2011-06-09'),
(7021, 3007, 'Amanda', 'Wells', 'a.wells@randatmail.com', '023-5948-60', '2007-06-04'),
(7022, 3007, 'Alfred', 'Williams', 'a.williams@randatmail.com', '467-9434-45', '2020-03-08'),
(7023, 3007, 'Jasmine', 'Morgan', 'j.morgan@randatmail.com', '322-5283-59', '2019-08-09'),
(7024, 3008, 'Sophia', 'Baker', 's.baker@randatmail.com', '308-5662-70', '2012-06-09'),
(7025, 3008, 'Arianna', 'Ellis', 'a.ellis@randatmail.com', '890-4420-16', '2011-10-01'),
(7026, 3009, 'Alberta', 'Roberts', 'a.roberts@randatmail.com', '351-6482-32', '2013-02-03'),
(7027, 3009, 'Kate', 'Thompson', 'k.thompson@randatmail.com', '031-2714-48', '2019-04-28'),
(7028, 3009, 'Martin', 'Cunningham', 'm.cunningham@randatmail.com', '425-8761-55', '2008-11-13'),
(7029, 3010, 'Leonardo', 'Russell', 'l.russell@randatmail.com', '992-8731-96', '2014-12-18'),
(7030, 3010, 'Evelyn', 'Owens', 'e.owens@randatmail.com', '008-3280-85', '2011-06-09'),
(7031, 3010, 'Aiden', 'Harper', 'a.harper@randatmail.com', '134-7767-45', '2011-10-01'),
(7032, 3010, 'Melissa', 'Foster', 'm.foster@randatmail.com', '954-0118-64', '2021-10-18'),
(7033, 3011, 'Justin', 'Gibson', 'j.gibson@randatmail.com', '551-0929-51', '2016-05-06'),
(7034, 3011, 'Deanna', 'Wilson', 'd.wilson@randatmail.com', '544-0531-45', '2023-01-30'),
(7035, 3011, 'Hailey', 'Grant', 'h.grant@randatmail.com', '122-3620-27', '2020-06-09'),
(7036, 3012, 'Blake', 'Ferguson', 'b.ferguson@randatmail.com', '823-6533-25', '2021-10-18'),
(7037, 3012, 'Tyler', 'Crawford', 't.crawford@randatmail.com', '020-6605-59', '2017-02-28'),
(7038, 3013, 'Dainton', 'Scott', 'd.scott@randatmail.com', '284-8577-05', '2011-06-09'),
(7039, 3013, 'Tony', 'Wilson', 't.wilson@randatmail.com', '762-2195-30', '2011-10-01'),
(7040, 3013, 'Byron', 'Chapman', 'b.chapman@randatmail.com', '482-0430-02', '2011-10-01'),
(7041, 3014, 'Luke', 'Cameron', 'l.cameron@randatmail.com', '652-7934-59', '2013-11-03'),
(7042, 3014, 'Henry', 'Alexander', 'h.alexander@randatmail.com', '677-1515-56', '2016-05-06'),
(7043, 3015, 'Isabella', 'Morris', 'i.morris@randatmail.com', '757-9180-15', '2021-09-15'),
(7044, 3015, 'Robert', 'Myers', 'r.myers@randatmail.com', '872-2321-61', '2016-10-09'),
(7045, 3016, 'Ashton', 'Fowler', 'a.fowler@randatmail.com', '434-2243-38', '2011-10-01'),
(7046, 3016, 'Aston', 'Stevens', 'a.stevens@randatmail.com', '017-5131-33', '2016-05-06'),
(7047, 3017, 'Julia', 'Kelly', 'j.kelly@randatmail.com', '674-1068-75', '2020-06-09'),
(7048, 3017, 'Owen', 'Perry', 'o.perry@randatmail.com', '121-9323-10', '2021-09-15'),
(7049, 3017, 'Jasmine', 'Davis', 'j.davis@randatmail.com', '873-5098-30', '2014-12-18'),
(7050, 3018, 'Dexter', 'West', 'd.west@randatmail.com', '031-8981-82', '2011-06-09'),
(7051, 3018, 'Isabella', 'Allen', 'i.allen@randatmail.com', '420-1235-07', '2013-11-03'),
(7052, 3018, 'Tara', 'Anderson', 't.anderson@randatmail.com', '829-2834-45', '2017-02-28'),
(7053, 3018, 'Adelaide', 'Elliott', 'a.elliott@randatmail.com', '611-7176-44', '2023-01-30'),
(7054, 3018, 'Tara', 'Smith', 't.smith@randatmail.com', '758-8953-03', '2011-06-09'),
(7055, 3019, 'Adrianna', 'Holmes', 'a.holmes@randatmail.com', '857-9954-36', '2021-06-30'),
(7056, 3019, 'Garry', 'Tucker', 'g.tucker@randatmail.com', '306-9514-59', '2019-04-28'),
(7057, 3019, 'Evelyn', 'Foster', 'e.foster@randatmail.com', '761-0882-85', '2020-09-09'),
(7058, 3020, 'Cadie', 'Cole', 'c.cole@randatmail.com', '193-7495-25', '2023-01-29'),
(7059, 3020, 'Kate', 'Ross', 'k.ross@randatmail.com', '706-4799-51', '2021-09-15'),
(7060, 3021, 'Sienna', 'Williams', 's.williams@randatmail.com', '090-3311-07', '2020-03-09'),
(7061, 3021, 'Ted', 'Johnson', 't.johnson@randatmail.com', '673-0168-32', '2014-12-18');

INSERT INTO course (course_id, instructor_id, facility_id, course_name, course_capacity, course_cost, start_date, end_date) VALUES
(151, 2099, 3004, 'Basketball', 20, 100.00, '2022-10-12', '2023-01-30'),
(152, 2100, 3007, 'Basketball', 20, 150.00, '2020-05-16', '2020-11-20'),
(153, 2101, 3007, 'Basketball', 20, 110.00, '2022-10-14', NULL),
(154, 2102, 3011, 'Taekwondo', 50, 115.00, '2021-09-14', NULL),
(155, 2103, 3013, 'Badminton', 30, 150.00, '2023-01-01', '2023-02-01'),
(156, 2104, 3016, 'Judo', 46, 110.00, '2022-12-02', '2023-01-02'),
(157, 2105, 3017, 'Karate', 60, 125.00, '2023-02-28', NULL),
(158, 2106, 3018, 'Fitness', 65, 120.00, '2022-07-24', NULL),
(159, 2107, 3018, 'Gymnastics', 25, 120.00, '2022-02-11', '2023-01-30'),
(160, 2108, 3019, 'Swimming', 30, 160.00, '2023-04-10', NULL),
(161, 2108, 3019, 'Diving', 15, 200.00, '2022-12-15', NULL),
(162, 2109, 3021, 'Ice Skating', 32, 200.00, '2022-08-14', NULL);



INSERT INTO course_enrollment (course_id, member_id, enrollment_date) VALUES
(151, 7011, '2014-09-09'),
(151, 7012, '2013-11-03'),
(152, 7020, '2011-06-09'),
(152, 7022, '2020-03-08'),
(153, 7021, '2007-06-04'),
(154, 7033, '2016-05-06'),
(154, 7034, '2023-01-30'),
(154, 7035, '2020-06-09'),
(155, 7038, '2011-06-09'),
(155, 7039, '2011-10-01'),
(155, 7040, '2011-10-01'),
(156, 7045, '2011-10-01'),
(157, 7048, '2021-09-15'),
(157, 7049, '2014-12-18'),
(158, 7050, '2011-06-09'),
(158, 7051, '2013-11-03'),
(158, 7052, '2017-02-28'),
(159, 7053, '2023-01-30'),
(160, 7055, '2021-06-30'),
(160, 7056, '2019-04-28'),
(161, 7057, '2020-09-09'),
(162, 7060, '2020-03-09');



INSERT INTO course_schedule (schedule_id, course_id, start_time, end_time, day_of_week) VALUES
(100, 151, '17:00:00', '19:00:00', 'Monday'),
(101, 151, '17:00:00', '19:00:00', 'Wednesday'),
(102, 152, '18:00:00', '20:00:00', 'Monday'),
(103, 152, '18:00:00', '20:00:00', 'Thursday'),
(104, 153, '20:00:00', '22:00:00', 'Saturday'),
(105, 153, '20:00:00', '22:00:00', 'Sunday'),
(106, 153, '19:00:00', '21:00:00', 'Monday'),
(107, 153, '19:00:00', '21:00:00', 'Wednesday'),
(108, 153, '19:00:00', '21:00:00', 'Friday'),
(109, 155, '15:00:00', '18:00:00', 'Saturday'),
(110, 156, '19:00:00', '22:00:00', 'Monday'),
(111, 157, '19:00:00', '21:00:00', 'Monday'),
(112, 157, '19:00:00', '21:00:00', 'Wednesday'),
(113, 157, '19:00:00', '21:00:00', 'Friday'),
(114, 158, '20:00:00', '00:00:00', 'Tuesday'),
(115, 158, '20:00:00', '00:00:00', 'Thursday'),
(116, 159, '13:00:00', '16:00:00', 'Friday'),
(117, 160, '08:00:00', '11:00:00', 'Saturday'),
(118, 160, '08:00:00', '11:00:00', 'Sunday'),
(119, 161, '13:00:00', '18:00:00', 'Friday'),
(120, 161, '13:00:00', '18:00:00', 'Saturday'),
(121, 162, '15:00:00', '18:00:00', 'Sunday');



INSERT INTO event (event_id, facility_id, sponsor_id, event_name, description, start_date, end_date) VALUES
(551, 3018, 1115, 'Yoga class', 'A beginner''s yoga class', '2023-05-10', '2023-05-15'),
(552, 3005, 1113, 'Charity run', 'A 5k charity run to raise money for a local non-profit', '2023-06-20', '2023-06-20'),
(553, 3004, 1116, 'Basketball tournament', 'A 3-on-3 basketball tournament for players of all skill levels', '2023-07-05', '2023-07-07'),
(554, 3019, 1115, 'Diving challenge', 'A challenge with price for the one that reaches the bottom and brings up the medal first', '2023-08-01', '2023-08-01'),
(555, 3021, 1117, 'Spin class', 'A high-energy spin class to get your heart pumping', '2023-09-15', '2023-09-15'),
(556, 3018, 1114, 'Zumba party', 'A fun dance party featuring Zumba routines', '2023-10-10', '2023-10-10'),
(557, 3006, 1113, 'Volleyball tournament', 'A co-ed volleyball tournament for players of all skill levels', '2023-11-05', '2023-11-07'),
(558, 3010, 1113, 'Scary swim', 'A Halloween-themed swim event for all ages', '2023-10-30', '2023-10-30'),
(559, 3018, 1112, 'Bootcamp class', 'A challenging bootcamp-style workout in the gymnasium', '2023-11-15', '2023-11-15');




INSERT INTO facility_amenity (facility_id, amenity_id, quantity) VALUES
(3001, 2007, 1),
(3001, 2019, 20),
(3001, 2020, 50),
(3002, 2003, 3),
(3003, 2004, 2),
(3004, 2001, 1),
(3004, 2002, 1),
(3004, 2019, 10),
(3004, 2020, 25),
(3005, 2006, 1),
(3006, 2004, 2),
(3007, 2002, 2),
(3009, 2008, 2),
(3009, 2009, 1),
(3010, 2007, 2),
(3010, 2019, 20),
(3010, 2020, 70),
(3011, 2010, 2),
(3012, 2020, 10),
(3013, 2003, 1),
(3013, 2015, 1),
(3013, 2012, 1),
(3013, 2020, 25),
(3014, 2005, 1),
(3014, 2020, 20),
(3016, 2010, 2),
(3017, 2010, 2),
(3017, 2020, 30),
(3018, 2008, 2),
(3018, 2009, 2),
(3018, 2011, 1),
(3018, 2019, 20),
(3018, 2020, 55),
(3019, 2007, 2),
(3019, 2016, 1),
(3019, 2019, 30),
(3019, 2020, 45),
(3020, 2018, 1),
(3021, 2014, 1);




INSERT INTO facility_rating (rating_id, member_id, rating) VALUES
(4801, 7001, 1),
(4802, 7002, 5),
(4803, 7003, 3),
(4804, 7004, 6),
(4805, 7005, 8),
(4806, 7006, 9),
(4807, 7007, 6),
(4808, 7008, 3),
(4809, 7009, 5),
(4810, 7010, 4),
(4811, 7011, 2),
(4812, 7012, 4),
(4813, 7013, 8),
(4814, 7014, 6),
(4815, 7015, 3),
(4816, 7016, 9),
(4817, 7017, 7),
(4818, 7018, 1),
(4819, 7019, 2),
(4820, 7020, 4),
(4821, 7021, 3),
(4822, 7022, 6),
(4823, 7023, 5),
(4824, 7024, 9),
(4825, 7025, 6),
(4826, 7026, 3),
(4827, 7027, 2),
(4828, 7028, 4),
(4829, 7029, 5),
(4830, 7030, 8),
(4831, 7031, 7),
(4832, 7032, 1),
(4833, 7033, 2),
(4834, 7034, 3),
(4835, 7035, 6),
(4836, 7036, 9),
(4837, 7037, 5),
(4838, 7038, 4),
(4839, 7039, 8),
(4840, 7040, 7),
(4841, 7041, 6),
(4842, 7042, 3),
(4843, 7043, 2),
(4844, 7044, 1),
(4845, 7045, 4),
(4846, 7046, 4),
(4847, 7047, 5),
(4848, 7048, 9),
(4849, 7049, 6),
(4850, 7050, 7),
(4851, 7051, 3),
(4852, 7052, 9),
(4853, 7053, 6),
(4854, 7054, 4),
(4855, 7055, 6),
(4856, 7056, 9),
(4857, 7057, 8),
(4858, 7058, 5),
(4859, 7059, 6),
(4860, 7060, 3),
(4861, 7061, 2);



INSERT INTO facility_sport_type (facility_id, sport_type_id) VALUES
(3001, 5),
(3002, 3),
(3003, 7),
(3004, 2),
(3005, 1),
(3006, 7),
(3007, 2),
(3007, 16),
(3008, 13),
(3009, 15),
(3010, 5),
(3010, 20),
(3011, 10),
(3011, 11),
(3012, 4),
(3013, 14),
(3013, 3),
(3013, 22),
(3014, 8),
(3015, 4),
(3016, 9),
(3016, 12),
(3017, 10),
(3017, 11),
(3018, 15),
(3018, 6),
(3018, 18),
(3019, 5),
(3019, 19),
(3020, 17),
(3021, 21);




INSERT INTO payment (payment_id, member_id, payment_date, amount)
VALUES 
  (1601, 7001, '2020-05-30', 100.00),
  (1602, 7001, '2020-06-30', 100.00),
  (1603, 7001, '2020-07-15', 150.00),
  (1604, 7002, '2020-06-25', 180.00),
  (1605, 7002, '2020-07-25', 150.00),
  (1606, 7002, '2020-08-25', 150.00),
  (1607, 7003, '2020-06-09', 200.00),
  (1608, 7003, '2020-07-09', 250.00),
  (1609, 7003, '2020-08-09', 225.00),
  (1610, 7003, '2020-09-09', 200.00),
  (1611, 7004, '2016-05-06', 110.00),
  (1612, 7004, '2016-06-06', 115.00),
  (1613, 7004, '2016-07-06', 125.00),
  (1614, 7005, '2017-02-28', 155.00),
  (1615, 7005, '2017-03-28', 165.00),
  (1616, 7005, '2017-04-28', 175.00),
  (1617, 7006, '2009-10-16', 75.00),
  (1618, 7006, '2009-11-16', 75.00),
  (1619, 7006, '2009-12-16', 75.00),
  (1620, 7006, '2010-01-01', 75.00),
  (1621, 7007, '2019-12-31', 100.00),
  (1622, 7007, '2020-01-01', 100.00),
  (1623, 7007, '2020-02-01', 105.00),
  (1624, 7008, '2014-05-04', 120.00),
  (1625, 7008, '2014-05-04', 120.00),
  (1626, 7008, '2014-05-04', 120.00),
  (1627, 7009, '2018-09-06', 130.00),
  (1628, 7009, '2018-10-06', 130.00),
  (1629, 7009, '2018-11-06', 130.00),
  (1630, 7009, '2018-12-06', 130.00),
  (1631, 7010, '2020-06-03', 150.00),
  (1632, 7010, '2020-07-03', 150.00),
  (1633, 7010, '2020-08-03', 160.00),
  (1634, 7010, '2020-09-03', 160.00),
  (1635, 7010, '2020-10-03', 160.00),
  (1636, 7011, '2014-09-09', 120.00),
  (1637, 7011, '2014-10-09', 120.00),
  (1638, 7011, '2014-11-09', 120.00),
  (1639, 7012, '2013-11-03', 50.00),
  (1640, 7012, '2013-12-03', 60.00),
  (1641, 7013, '2017-03-30', 110.00),
  (1642, 7013, '2017-04-30', 110.00),
  (1643, 7013, '2017-05-30', 110.00),
  (1644, 7014, '2015-08-06', 90.00),
  (1645, 7014, '2015-09-06', 90.00),
  (1646, 7014, '2015-10-06', 90.00),
  (1647, 7015, '2020-03-28', 50.00),
  (1648, 7015, '2020-04-28', 55.00),
  (1649, 7016, '2017-02-28', 90.00),
  (1650, 7016, '2017-03-28', 95.00),
  (1651, 7016, '2017-04-28', 95.00),
  (1652, 7017, '2021-10-18', 150.00),
  (1653, 7017, '2021-11-18', 155.00),
  (1654, 7017, '2021-11-18', 150.00),
  (1655, 7018, '2023-01-30', 180.00),
  (1656, 7018, '2023-01-15', 180.00),
  (1657, 7018, '2022-12-10', 180.00),
  (1658, 7019, '2010-05-04', 80.00),
  (1659, 7019, '2010-06-04', 85.00),
  (1660, 7020, '2011-06-09', 100.00),
  (1661, 7020, '2011-07-09', 100.00),
  (1662, 7021, '2007-06-04', 150.00),
  (1663, 7021, '2007-07-04', 150.00),
  (1664, 7022, '2020-03-08', 110.00),
  (1665, 7023, '2019-08-09', 180.00),
  (1666, 7024, '2012-06-09', 150.00),
  (1667, 7025, '2011-10-01', 80.00),
  (1668, 7026, '2013-02-03', 90.00),
  (1669, 7027, '2019-04-28', 110.00),
  (1670, 7028, '2008-11-13', 55.00),
  (1671, 7029, '2014-11-18', 80.00),
  (1672, 7029, '2014-12-18', 90.00),
  (1673, 7030, '2011-06-09', 90.00),
  (1674, 7030, '2011-07-09', 80.00),
  (1675, 7031, '2011-10-01', 65.00),
  (1676, 7032, '2021-10-18', 110.00),
  (1677, 7033, '2016-05-06', 85.00),
  (1678, 7034, '2023-01-30', 180.00),
  (1679, 7035, '2020-06-09', 210.00),
  (1680, 7036, '2021-10-18', 95.00),
  (1681, 7037, '2017-02-28', 85.00),
  (1682, 7038, '2011-06-09', 60.00),
  (1683, 7038, '2011-07-09', 55.00),
  (1684, 7039, '2011-10-01', 45.00),
  (1685, 7040, '2011-10-01', 50.00),
  (1686, 7041, '2013-11-03', 65.00),
  (1687, 7041, '2013-12-03', 75.00),
  (1688, 7042, '2016-05-06', 94.00),
  (1689, 7043, '2021-09-15', 100.00),
  (1690, 7044, '2016-10-09', 85.00),
  (1691, 7045, '2011-10-01', 63.00),
  (1692, 7046, '2016-05-06', 80.00),
  (1693, 7047, '2020-06-09', 150.00),
  (1694, 7047, '2020-07-09', 160.00),
  (1695, 7048, '2021-09-15', 190.00),
  (1696, 7049, '2014-12-18', 75.00),
  (1697, 7050, '2011-06-09', 50.00),
  (1698, 7051, '2013-11-03', 92.00),
  (1699, 7052, '2017-02-28', 85.00),
  (1700, 7053, '2023-01-30', 220.00),
  (1701, 7054, '2011-06-09', 50.00),
  (1702, 7055, '2021-06-30', 100.00),
  (1703, 7055, '2021-07-30', 90.00),
  (1704, 7056, '2019-04-28', 110.00),
  (1705, 7057, '2020-09-09', 150.00),
  (1706, 7058, '2023-01-29', 190.00),
  (1707, 7059, '2021-09-15', 150.00),
  (1708, 7060, '2020-03-09', 130.00),
  (1709, 7060, '2020-04-09', 135.00),
  (1710, 7061, '2014-12-18', 180.00);
  



  INSERT INTO social_media (social_media_id, complex_id, platform, url)
VALUES
  (1001, 1, 'instagram', 'www.theathleticedge.intagram.com'),
  (1002, 1, 'facebook', 'www.theathleticedge.facebook.com'),
  (1003, 1, 'twitter', 'www.theathleticedge.twitter.com'),
  (1004, 2, 'instagram', 'www.allstarsports5.instagram.com'),
  (1005, 3, 'facebook', 'www.sportsfactory8.facebook.com'),
  (1006, 5, 'instagram', 'www.velocitysports6.instagram.com'),
  (1007, 5, 'facebook', 'www.velocitysports6.facebook.com'),
  (1008, 6, 'instagram', 'www.eliteathletic9.instagram.com'),
  (1009, 7, 'facebook', 'www.thesportsDen4.facebook.com'),
  (1010, 8, 'instagram', 'www.trainingGrounds7.instagram.com'),
  (1011, 8, 'facebook', 'www.trainingGrounds7.facebook.com'),
  (1012, 9, 'instagram', 'www.championfitness78.instagram.com');
  
*/



