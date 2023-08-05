create table countries (
    country_id int primary key auto_increment,
    country_name varchar(255) not null,
    region_id int
);

desc countries;

-- Use IF NOT EXISTS to check whether the table already exists in database .
-- +--------------+--------------+------+-----+---------+----------------+
-- | Field        | Type         | Null | Key | Default | Extra          |
-- +--------------+--------------+------+-----+---------+----------------+
-- | country_id   | int          | NO   | PRI | NULL    | auto_increment |
-- | country_name | varchar(255) | NO   |     | NULL    |                |
-- | region_id    | int          | YES  |     | NULL    |                |
-- +--------------+--------------+------+-----+---------+----------------+
--Duplicate table based on other table .
create table dup_countries like countries;

-- Duplicate table including data as well .
create table dup1_countries as
select
    *
from
    countries;

create table jobs (
    job_id int primary key auto_increment,
    job_title varchar(255),
    min_salary int,
    max_salary int,
    constraint max_salary_check check (max_salary > 25000)
);

desc jobs;

-- +------------+--------------+------+-----+---------+----------------+
-- | Field      | Type         | Null | Key | Default | Extra          |
-- +------------+--------------+------+-----+---------+----------------+
-- | job_id     | int          | NO   | PRI | NULL    | auto_increment |
-- | job_title  | varchar(255) | YES  |     | NULL    |                |
-- | min_salary | int          | YES  |     | NULL    |                |
-- | max_salary | int          | YES  |     | NULL    |                |
-- +------------+--------------+------+-----+---------+----------------+
create table countries1(
    country_id int primary key auto_increment,
    country_name enum('India', 'China', 'Italy'),
    region_id int
);

desc countries1;

-- +--------------+-------------------------------+------+-----+---------+----------------+
-- | Field        | Type                          | Null | Key | Default | Extra          |
-- +--------------+-------------------------------+------+-----+---------+----------------+
-- | country_id   | int                           | NO   | PRI | NULL    | auto_increment |
-- | country_name | enum('India','China','Italy') | YES  |     | NULL    |                |
-- | region_id    | int                           | YES  |     | NULL    |                |
-- +--------------+-------------------------------+------+-----+---------+----------------+
-- .Write a SQL statement to create a table named job_histry including columns employee_id,
-- start_date,
-- end_date,
-- job_id
-- and department_id
-- and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.
create table job_history(
    employee_id int,
    start_date date,
    end_date date check(end_date like '__/__/____'),
    job_id int,
    department_id int
);

desc job_history;

-- +---------------+------+------+-----+---------+-------+
-- | Field         | Type | Null | Key | Default | Extra |
-- +---------------+------+------+-----+---------+-------+
-- | employee_id   | int  | YES  |     | NULL    |       |
-- | start_date    | date | YES  |     | NULL    |       |
-- | end_date      | date | YES  |     | NULL    |       |
-- | job_id        | int  | YES  |     | NULL    |       |
-- | department_id | int  | YES  |     | NULL    |       |
-- +---------------+------+------+-----+---------+-------+

