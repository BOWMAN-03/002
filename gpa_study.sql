--SELECT *
--FROM gpa_study_hours

	--find the averages of each stat


--	-- verifying the data set (there was an error found)
--Select *
--FROM gpa_study_hours
--where gpa > 4 or gpa <0 or gpa is null or study_hours is null

--	-- deleting the faulty data point
--DELETE 
--FROM gpa_study_hours
--Where gpa > 4.0

--	--to find and verify the total count of students
--SELECT study_hours, COUNT(study_hours) AS count, SUM(COUNT(study_hours)) OVER() AS 'count all students'
--FROM gpa_study_hours GROUP BY study_hours


	--to find averages
select *
FROM GPA_study_hours

select avg(gpa) as avg_gpa, avg(study_hours) as avg_hour
FROM GPA_study_hours

	--to find data on the most frequent study hour.
SELECT top 1 
	study_hours as 'study hours',
	count(study_hours) as 'these students',
	count(study_hours) * 100/(select count(study_hours) from gpa_study_hours) as '% of all students', 
	avg(gpa) as 'gpa avg'
FROM gpa_study_hours
GROUP BY study_hours
ORDER by 'these students' desc

	--shows avg gpa per study hours
SELECT study_hours, AVG(gpa) AS avg_gpa
FROM gpa_study_hours
GROUP BY study_hours

	--shows avg hours per pga
SELECT gpa, AVG(study_hours) AS avg_hour
FROM gpa_study_hours
GROUP BY gpa

	-- grouping into A, B, C grades and showing them based off study hours
	-- note: there are no C's
	SELECT study_hours,
	COUNT(case WHEN gpa between 3.55 and 4.0 then 1 else NULL END) as 'A',
	COUNT(case WHEN gpa between 2.55 and 3.55 then 1 else NULL end) as 'B',
	COUNT(case WHEN gpa < 2.55 then 1 else Null end) as 'C'
FROM gpa_study_hours
GROUP BY study_hours

-- comprehensive table to show # of students with a GPA and how they compare to average
SELECT gpa, count(gpa) as 'students',
gpa * 100/(SELECT avg(gpa) FROM gpa_study_hours) as '% compared to avg'
From gpa_study_hours
GROUP BY gpa
ORDER by '% compared to avg' desc