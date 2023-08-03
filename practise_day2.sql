-- Aggregate Functions Exercise .
select
    count(*) as 'Number of Books'
from
    books;

-- +-----------------+
-- | Number of Books |
-- +-----------------+
-- |              19 |
-- +-----------------+
select
    released_year,
    count(*) as 'Book Count'
from
    books
group by
    released_year;

-- +---------------+------------+
-- | released_year | Book Count |
-- +---------------+------------+
-- |          2003 |          2 |
-- |          2016 |          1 |
-- |          2001 |          3 |
-- |          1996 |          1 |
-- |          2012 |          1 |
-- |          2013 |          1 |
-- |          2000 |          1 |
-- |          2010 |          1 |
-- |          1981 |          1 |
-- |          1989 |          1 |
-- |          1985 |          1 |
-- |          1945 |          1 |
-- |          2004 |          1 |
-- |          2005 |          1 |
-- |          2014 |          1 |
-- |          2017 |          1 |
-- +---------------+------------+
select
    sum(stock_quantity) as 'Total Books in stock'
from
    books;

-- +----------------------+
-- | Total Books in stock |
-- +----------------------+
-- |                 2450 |
-- +----------------------+
select
    concat(author_fname, ' ', author_lname) as author,
    avg(released_year) as average_release_year
from
    books
group by
    author _lname,
    author_fname;

-- +----------------------+----------------------+
-- | author               | average_release_year |
-- +----------------------+----------------------+
-- | Jhumpa Lahiri        |            1999.5000 |
-- | Neil Gaiman          |            2006.6667 |
-- | Dave Eggers          |            2008.6667 |
-- | Michael Chabon       |            2000.0000 |
-- | Patti Smith          |            2010.0000 |
-- | Raymond Carver       |            1985.0000 |
-- | Don DeLillo          |            1985.0000 |
-- | John Steinbeck       |            1945.0000 |
-- | David Foster Wallace |            2004.5000 |
-- | Dan Harris           |            2014.0000 |
-- | Freida Harris        |            2001.0000 |
-- | George Saunders      |            2017.0000 |
-- +----------------------+----------------------+
select
    concat(author_fname, ' ', author_lname) as author
from
    books
where
    pages = (
        Select
            max(pages)
        from
            books
    );

-- +----------------+
-- | author         |
-- +----------------+
-- | Michael Chabon |
-- +----------------+
select
    released_year,
    count(*) as 'Total Books',
    avg(pages) as 'Avg Pages'
from
    books
group by
    released_year
order by
    released_year;

-- +---------------+-------------+-------------+
-- | released_year | Total Books | Avg Pages   |
-- +---------------+-------------+-------------+
-- |          1945 |           1 |    181.0000 |
-- |          1981 |           1 |    176.0000 |
-- |          1985 |           1 |    320.0000 |
-- |          1989 |           1 |    526.0000 |
-- |          1996 |           1 |    198.0000 |
-- |          2000 |           1 |    634.0000 |
-- |          2001 |           3 |    443.3333 |
-- |          2003 |           2 |    249.5000 |
-- |          2004 |           1 |    329.0000 |
-- |          2005 |           1 |    343.0000 |
-- |          2010 |           1 |    304.0000 |
-- |          2012 |           1 |    352.0000 |
-- |          2013 |           1 |    504.0000 |
-- |          2014 |           1 |    256.0000 |
-- |          2016 |           1 |    304.0000 |
-- |          2017 |           1 |    367.0000 |
-- +---------------+-------------+-------------+
select
    curtime() as currenTime,
    curdate() as currentDate,
    now() as current_dt;

-- +------------+-------------+---------------------+
-- | currenTime | currentDate | current_dt          |
-- +------------+-------------+---------------------+
-- | 12:41:45   | 2023-08-03  | 2023-08-03 12:41:45 |
-- +------------+-------------+---------------------+
select
    dayofweek(curdate());

-- +----------------------+
-- | dayofweek(curdate()) |
-- +----------------------+
-- |                    5 |
-- +----------------------+
select
    dayname(curdate());

-- +--------------------+
-- | dayname(curdate()) |
-- +--------------------+
-- | Thursday           |
-- +--------------------+
select
    date_format(Now(), '%c/%d/%y %r');

-- +----------------------------------+
-- | date_format(Now(),'%c/%d/%y %r') |
-- +----------------------------------+
-- | 8/03/23 12:50:01 PM              |
-- +----------------------------------+
select
    date_format(now(), '%M %D at %H:%i');

-- +-------------------------------------+
-- | date_format(now(),'%M %D at %H:%i') |
-- +-------------------------------------+
-- | August 3rd at 12:54                 |
-- +-------------------------------------+
create table tweets (
    username varchar(100),
    content varchar(255),
    created_at timestamp default current_timestamp
);

desc tweets;

-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | username   | varchar(100) | YES  |     | NULL              |                   |
-- | content    | varchar(255) | YES  |     | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------+
insert into
    tweets
values
    ('Swapnil', 'Tweet content');

select
    *
from
    tweets;

-- +----------+---------------+---------------------+
-- | username | content       | created_at          |
-- +----------+---------------+---------------------+
-- | Swapnil  | Tweet content | 2023-08-03 12:58:47 |
-- +----------+---------------+---------------------+
select
    *
from
    books
where
    released_year < 1980;

-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- |      14 | Cannery Row | John         | Steinbeck    |          1945 |             95 |   181 |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
select
    *
from
    books
where
    author_lname in ('Eggers', 'Chabon');

-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
-- |       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
-- |       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
-- |       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
-- +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
select
    *
from
    books
where
    author_lname = 'Lahiri'
    and released_year > 2000;

-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title        | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
-- |       1 | The Namesake | Jhumpa       | Lahiri       |          2003 |             32 |   291 |
-- +---------+--------------+--------------+--------------+---------------+----------------+-------+
select
    *
from
    books
where
    pages between 100
    and 200;

-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri       |          1996 |             97 |   198 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
-- |      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
select
    *
from
    books
where
    author_lname like 'C%'
    or author_lname like 'S%';

select
    *
from
    books
where
    substr(author_lname, 1, 1) in ('C', 'S');

-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
-- |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon       |          2000 |             68 |   634 |
-- |       8 | Just Kids                                           | Patti        | Smith        |          2010 |             55 |   304 |
-- |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
-- |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver       |          1989 |             12 |   526 |
-- |      14 | Cannery Row                                         | John         | Steinbeck    |          1945 |             95 |   181 |
-- |      19 | Lincoln In The Bardo                                | George       | Saunders     |          2017 |           1000 |   367 |
-- +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
select
    title,
    author_lname,
    case
        when title like '%stories%' then 'Short Stories'
        when title like '%Just Kids%'
        or title like '%A Heart Breaking Work%' then 'Memoir'
        else 'Novel'
    end as Type
from
    books;

-- +-----------------------------------------------------+----------------+---------------+
-- | title                                               | author_lname   | Type          |
-- +-----------------------------------------------------+----------------+---------------+
-- | The Namesake                                        | Lahiri         | Novel         |
-- | Norse Mythology                                     | Gaiman         | Novel         |
-- | American Gods                                       | Gaiman         | Novel         |
-- | Interpreter of Maladies                             | Lahiri         | Novel         |
-- | A Hologram for the King: A Novel                    | Eggers         | Novel         |
-- | The Circle                                          | Eggers         | Novel         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
-- | Just Kids                                           | Smith          | Memoir        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         | Novel         |
-- | Coraline                                            | Gaiman         | Novel         |
-- | What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
-- | Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
-- | White Noise                                         | DeLillo        | Novel         |
-- | Cannery Row                                         | Steinbeck      | Novel         |
-- | Oblivion: Stories                                   | Foster Wallace | Short Stories |
-- | Consider the Lobster                                | Foster Wallace | Novel         |
-- | 10% Happier                                         | Harris         | Novel         |
-- | fake_book                                           | Harris         | Novel         |
-- | Lincoln In The Bardo                                | Saunders       | Novel         |
-- +-----------------------------------------------------+----------------+---------------+
select
    author_fname,
    author_lname,
    concat(count(*), ' books') as 'Count'
from
    books
group by
    author_fname,
    author_lname;

-- +--------------+----------------+---------+
-- | author_fname | author_lname   | Count   |
-- +--------------+----------------+---------+
-- | Jhumpa       | Lahiri         | 2 books |
-- | Neil         | Gaiman         | 3 books |
-- | Dave         | Eggers         | 3 books |
-- | Michael      | Chabon         | 1 books |
-- | Patti        | Smith          | 1 books |
-- | Raymond      | Carver         | 2 books |
-- | Don          | DeLillo        | 1 books |
-- | John         | Steinbeck      | 1 books |
-- | David        | Foster Wallace | 2 books |
-- | Dan          | Harris         | 1 books |
-- | Freida       | Harris         | 1 books |
-- | George       | Saunders       | 1 books |
-- +--------------+----------------+---------+
create table students (
    id int primary key auto_increment,
    first_name Varchar(50)
);

create table papers (
    title varchar(50),
    grade int,
    student_id int not null,
    foreign key (student_id) references students(id)
);

select
    first_name,
    title,
    grade
from
    students
    join papers on students.id = papers.student_id;

-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- +------------+---------------------------------------+-------+
select
    first_name,
    title,
    grade
from
    students
    left join papers on students.id = papers.student_id;

-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | NULL                                  |  NULL |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | NULL                                  |  NULL |
-- +------------+---------------------------------------+-------+
select
    first_name,
    ifnull(title, 'MISSING') as title,
    ifnull(grade, 0) as grade
from
    students
    left join papers on students.id = papers.student_id;

-- +------------+---------------------------------------+-----------------+
-- | first_name | title                                 | grade           |                   
-- +------------+---------------------------------------+-----------------+
-- | Caleb      | My First Book Report                  |              60 |
-- | Caleb      | My Second Book Report                 |              75 |
-- | Samantha   | Russian Lit Through The Ages          |              94 |
-- | Samantha   | De Montaigne and The Art of The Essay |              98 |
-- | Raj        | MISSING                               |               0 |
-- | Carlos     | Borges and Magical Realism            |              89 |
-- | Lisa       | MISSING                               |               0 |
-- +------------+---------------------------------------+-----------------+
select
    first_name,
    ifnull(avg(grade), 0) as Average_Grade
from
    students
    left join papers on students.id = papers.student_id
group by
    first_name;

-- +------------+---------------+
-- | first_name | Average_Grade |
-- +------------+---------------+
-- | Caleb      |       67.5000 |
-- | Samantha   |       96.0000 |
-- | Raj        |        0.0000 |
-- | Carlos     |       89.0000 |
-- | Lisa       |        0.0000 |
-- +------------+---------------+
select
    first_name,
    ifnull(avg(grade), 0) as Average_Grade,
case
        when avg(grade) > 75 then 'PASSING'
        else 'FAILING'
    end as Passing_Status
from
    students
    left join papers on students.id = papers.student_id
group by
    first_name
order by
    Average_Grade desc;

-- +------------+---------------+----------------+
-- | first_name | Average_Grade | Passing_Status |
-- +------------+---------------+----------------+
-- | Samantha   |       96.0000 | PASSING        |
-- | Carlos     |       89.0000 | PASSING        |
-- | Caleb      |       67.5000 | FAILING        |
-- | Raj        |        0.0000 | FAILING        |
-- | Lisa       |        0.0000 | FAILING        |
-- +------------+---------------+----------------+