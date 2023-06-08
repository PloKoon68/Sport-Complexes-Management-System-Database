/*-------------------------*/
/*1*/
/*
SELECT complex.complex_id, state, facility_rank.facility_id, avg_rating FROM facility 
INNER JOIN (SELECT facility_id, AVG(rating) AS avg_rating FROM facility_rating
INNER JOIN member ON member.member_id = facility_rating.member_id
GROUP BY facility_id) AS facility_rank ON  facility_rank.facility_id = facility.facility_id
INNER JOIN complex ON complex.complex_id = facility.complex_id
WHERE state = 'TX'
ORDER BY complex.complex_id
*/







/*2*/
/*
SELECT ((SELECT course_capacity FROM course WHERE course_name = 'Badminton') - COUNT(member_id)) 
AS spot_left FROM course_enrollment
INNER JOIN course ON course.course_id =course_enrollment.course_id
WHERE course_name = 'Badminton'
*/








/*3*/
/*
SELECT complex.complex_id, facility.facility_id, name, opening_hour, closing_hour, state FROM sport_types
INNER JOIN facility_sport_type ON facility_sport_type.sport_type_id = sport_types.sport_type_id
INNER JOIN facility ON facility.facility_id = facility_sport_type.facility_id
INNER JOIN availability ON availability.facility_id = facility.facility_id
INNER JOIN complex ON complex.complex_id = facility.complex_id
WHERE state = 'TX' AND (opening_hour < '09:00:00') AND (sport_types.name = 'Fitness' OR sport_types.name = 'Swimming')
*/






/*4*/
/*
SELECT sport_types.name,COUNT(member) FROM member
INNER JOIN facility ON facility.facility_id = member.facility_id
INNER JOIN facility_sport_type ON facility_sport_type.facility_id = facility.facility_id
INNER JOIN sport_types ON sport_types.sport_type_id = facility_sport_type.sport_type_id
WHERE member.date_joined BETWEEN '2020-01-01' AND '2020-12-30' AND sport_types.name = 'Swimming'
GROUP BY sport_types.name;
*/








/*5*/
/*
SELECT course_id, course_name, course_cost FROM course
INNER JOIN facility on facility.facility_id = course.facility_id
INNER JOIN complex ON complex.complex_id = facility.complex_id
WHERE state = 'CA'
ORDER BY course_cost
LIMIT 1 OFFSET 1
*/









/*6*/
/*
SELECT course_id, course_name FROM course
WHERE end_date IS NULL AND course_cost > 100 AND course_cost < 150
*/









/*7*/
/*
SELECT facility_id, COUNT(event_name) AS num_of_events 
FROM event
GROUP BY facility_id
ORDER BY num_of_events DESC
LIMIT 1
*/












/*8*/
/*
SELECT * FROM payment
WHERE payment_date BETWEEN '2021-01-01' AND '2021-12-31'
*/













/*9*/
/*
SELECT * FROM coach
WHERE years_of_experience >=8
*/











/*10*/
/*
SELECT facility.facility_id, COUNT(member_id) FROM member
INNER JOIN facility ON facility.facility_id = member.facility_id
WHERE date_joined >= '2020-01-01'
GROUP BY facility.facility_id
*/
/*------------------------------------*/
