--Write an SQL query to find the number of employees inside the Hospital.

create table hospital ( emp_id int, action varchar(10), time TIMESTAMP );



insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');


SELECT * FROM HOSPITAL

--APPROACH 1

WITH CTE AS 
(SELECT emp_id,
MAX(CASE WHEN action='in' THEN time END) AS in_time,
MAX(CASE WHEN action='out' THEN time END) AS out_time
FROM hospital
GROUP BY emp_id)
SELECT *
FROM CTE
WHERE in_time>out_time or out_time is NULL;

--APPROACH 2

SELECT EMP_ID,
       MAX(CASE WHEN ACTION ='in' THEN time END) AS in_time,
	   MAX(CASE WHEN ACTION='out' THEN time END) AS out_time
FROM HOSPITAL
GROUP BY 1
HAVING
MAX(CASE WHEN ACTION ='in' THEN time END) >
MAX(CASE WHEN action='out' THEN time END) OR
MAX(CASE WHEN action='out' THEN time END) IS NULL;