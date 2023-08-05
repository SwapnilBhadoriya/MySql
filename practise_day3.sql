select
    title,
    rating
from
    series
    join reviews on series.id = reviews.series_id;

-- +----------------------+--------+
-- | title                | rating |
-- +----------------------+--------+
-- | Archer               |    8.0 |
-- | Archer               |    7.5 |
-- | Archer               |    8.5 |
-- | Archer               |    7.7 |
-- | Archer               |    8.9 |
-- | Arrested Development |    8.1 |
-- | Arrested Development |    6.0 |
-- | Arrested Development |    8.0 |
-- | Arrested Development |    8.4 |
-- | Arrested Development |    9.9 |
-- | Bob's Burgers        |    7.0 |
-- | Bob's Burgers        |    7.5 |
-- | Bob's Burgers        |    8.0 |
-- | Bob's Burgers        |    7.1 |
-- | Bob's Burgers        |    8.0 |
-- | Bojack Horseman      |    7.5 |
-- | Bojack Horseman      |    7.8 |
-- | Bojack Horseman      |    8.3 |
-- | Bojack Horseman      |    7.6 |
-- | Bojack Horseman      |    8.5 |
-- | Breaking Bad         |    9.5 |
-- | Breaking Bad         |    9.0 |
-- | Breaking Bad         |    9.1 |
-- | Breaking Bad         |    9.3 |
-- | Breaking Bad         |    9.9 |
-- | Curb Your Enthusiasm |    6.5 |
-- | Curb Your Enthusiasm |    7.8 |
-- | Curb Your Enthusiasm |    8.8 |
-- | Curb Your Enthusiasm |    8.4 |
-- | Curb Your Enthusiasm |    9.1 |
-- | Fargo                |    9.1 |
-- | Fargo                |    9.7 |
-- | Freaks and Geeks     |    8.5 |
-- | Freaks and Geeks     |    7.8 |
-- | Freaks and Geeks     |    8.8 |
-- | Freaks and Geeks     |    9.3 |
-- | General Hospital     |    5.5 |
-- | General Hospital     |    6.8 |
-- | General Hospital     |    5.8 |
-- | General Hospital     |    4.3 |
-- | General Hospital     |    4.5 |
-- | Halt and Catch Fire  |    9.9 |
-- | Seinfeld             |    8.0 |
-- | Seinfeld             |    7.2 |
-- | Stranger Things      |    8.5 |
-- | Stranger Things      |    8.9 |
-- | Stranger Things      |    8.9 |
-- +----------------------+--------+
select
    title,
    avg(rating) as average_rating
from
    series
    join reviews on series.id = reviews.series_id
group by
    title
order by
    average_rating;

-- +----------------------+----------------+
-- | title                | average_rating |
-- +----------------------+----------------+
-- | General Hospital     |        5.38000 |
-- | Bob's Burgers        |        7.52000 |
-- | Seinfeld             |        7.60000 |
-- | Bojack Horseman      |        7.94000 |
-- | Arrested Development |        8.08000 |
-- | Archer               |        8.12000 |
-- | Curb Your Enthusiasm |        8.12000 |
-- | Freaks and Geeks     |        8.60000 |
-- | Stranger Things      |        8.76667 |
-- | Breaking Bad         |        9.36000 |
-- | Fargo                |        9.40000 |
-- | Halt and Catch Fire  |        9.90000 |
-- +----------------------+----------------+
select
    first_name,
    last_name,
    rating
from
    reviewers
    join reviews on reviewers.id = reviews.reviewer_id;

-- +------------+-----------+--------+
-- | first_name | last_name | rating |
-- +------------+-----------+--------+
-- | Thomas     | Stoneman  |    8.0 |
-- | Thomas     | Stoneman  |    8.1 |
-- | Thomas     | Stoneman  |    7.0 |
-- | Thomas     | Stoneman  |    7.5 |
-- | Thomas     | Stoneman  |    9.5 |
-- | Wyatt      | Skaggs    |    7.5 |
-- | Wyatt      | Skaggs    |    7.6 |
-- | Wyatt      | Skaggs    |    9.3 |
-- | Wyatt      | Skaggs    |    6.5 |
-- | Wyatt      | Skaggs    |    8.4 |
-- | Wyatt      | Skaggs    |    9.1 |
-- | Wyatt      | Skaggs    |    7.8 |
-- | Wyatt      | Skaggs    |    5.5 |
-- | Wyatt      | Skaggs    |    8.5 |
-- | Kimbra     | Masters   |    8.5 |
-- | Kimbra     | Masters   |    8.0 |
-- | Kimbra     | Masters   |    7.1 |
-- | Kimbra     | Masters   |    7.8 |
-- | Kimbra     | Masters   |    9.0 |
-- | Kimbra     | Masters   |    7.8 |
-- | Kimbra     | Masters   |    6.8 |
-- | Kimbra     | Masters   |    8.0 |
-- | Kimbra     | Masters   |    8.9 |
-- | Domingo    | Cortes    |    7.7 |
-- | Domingo    | Cortes    |    6.0 |
-- | Domingo    | Cortes    |    8.0 |
-- | Domingo    | Cortes    |    8.3 |
-- | Domingo    | Cortes    |    9.1 |
-- | Domingo    | Cortes    |    8.8 |
-- | Domingo    | Cortes    |    8.5 |
-- | Domingo    | Cortes    |    5.8 |
-- | Domingo    | Cortes    |    7.2 |
-- | Domingo    | Cortes    |    8.9 |
-- | Colt       | Steele    |    8.9 |
-- | Colt       | Steele    |    9.9 |
-- | Colt       | Steele    |    8.0 |
-- | Colt       | Steele    |    8.5 |
-- | Colt       | Steele    |    9.9 |
-- | Colt       | Steele    |    9.1 |
-- | Colt       | Steele    |    9.7 |
-- | Colt       | Steele    |    9.3 |
-- | Colt       | Steele    |    4.5 |
-- | Colt       | Steele    |    9.9 |
-- | Pinkie     | Petit     |    8.4 |
-- | Pinkie     | Petit     |    7.5 |
-- | Pinkie     | Petit     |    8.8 |
-- | Pinkie     | Petit     |    4.3 |
-- +------------+-----------+--------+
select
    title as unreviewed_series
from
    series
    left join reviews on series.id = reviews.series_id
where
    rating is null;

-- +-----------------------+
-- | unreviewed_series     |
-- +-----------------------+
-- | Malcolm In The Middle |
-- | Pushing Daisies       |
-- +-----------------------+
select
    genre,
    round(avg(rating), 2) as AVG_RATING
from
    series
    join reviews on series.id = reviews.series_id
group by
    genre
order by
    AVG_RATING;

-- +-----------+------------+
-- | genre     | AVG_RATING |
-- +-----------+------------+
-- | Animation |       7.86 |
-- | Drama     |       8.04 |
-- | Comedy    |       8.16 |
-- +-----------+------------+
select
    first_name,
    last_name,
    count(rating) as COUNT,
    ifnull(min(rating), 0) as MIN,
    ifnull(max(rating), 0) as MAX,
    case
        when COUNT (rating) = 0 then 'Inactive'
        else 'Active'
    end as 'Status'
from
    reviewers
    left join reviews on reviewers.id = reviews.reviewer_id
group by
    first_name,
    last_name;

-- +------------+-----------+-------+-----+-----+----------+
-- | first_name | last_name | COUNT | MIN | MAX | Status   |
-- +------------+-----------+-------+-----+-----+----------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | Active   |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | Active   |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 | Active   |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 | Active   |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 | Active   |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 | Active   |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 | Inactive |
-- +------------+-----------+-------+-----+-----+----------+
select
    title,
    rating,
    concat(first_name, ' ', last_name) as reviewer
from
    series
    join reviews on reviews.series_id = series.id jo in reviewers on reviewers.id = reviews.reviewer_id;

-- +----------------------+--------+-----------------+
-- | title                | rating | reviewer        |
-- +----------------------+--------+-----------------+
-- | Archer               |    8.0 | Thomas Stoneman |
-- | Arrested Development |    8.1 | Thomas Stoneman |
-- | Bob's Burgers        |    7.0 | Thomas Stoneman |
-- | Bojack Horseman      |    7.5 | Thomas Stoneman |
-- | Breaking Bad         |    9.5 | Thomas Stoneman |
-- | Archer               |    7.5 | Wyatt Skaggs    |
-- | Bojack Horseman      |    7.6 | Wyatt Skaggs    |
-- | Breaking Bad         |    9.3 | Wyatt Skaggs    |
-- | Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
-- | Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
-- | Fargo                |    9.1 | Wyatt Skaggs    |
-- | Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
-- | General Hospital     |    5.5 | Wyatt Skaggs    |
-- | Stranger Things      |    8.5 | Wyatt Skaggs    |
-- | Archer               |    8.5 | Kimbra Masters  |
-- | Arrested Development |    8.0 | Kimbra Masters  |
-- | Bob's Burgers        |    7.1 | Kimbra Masters  |
-- | Bojack Horseman      |    7.8 | Kimbra Masters  |
-- | Breaking Bad         |    9.0 | Kimbra Masters  |
-- | Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
-- | General Hospital     |    6.8 | Kimbra Masters  |
-- | Seinfeld             |    8.0 | Kimbra Masters  |
-- | Stranger Things      |    8.9 | Kimbra Masters  |
-- | Archer               |    7.7 | Domingo Cortes  |
-- | Arrested Development |    6.0 | Domingo Cortes  |
-- | Bob's Burgers        |    8.0 | Domingo Cortes  |
-- | Bojack Horseman      |    8.3 | Domingo Cortes  |
-- | Breaking Bad         |    9.1 | Domingo Cortes  |
-- | Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
-- | Freaks and Geeks     |    8.5 | Domingo Cortes  |
-- | General Hospital     |    5.8 | Domingo Cortes  |
-- | Seinfeld             |    7.2 | Domingo Cortes  |
-- | Stranger Things      |    8.9 | Domingo Cortes  |
-- | Archer               |    8.9 | Colt Steele     |
-- | Arrested Development |    9.9 | Colt Steele     |
-- | Bob's Burgers        |    8.0 | Colt Steele     |
-- | Bojack Horseman      |    8.5 | Colt Steele     |
-- | Breaking Bad         |    9.9 | Colt Steele     |
-- | Curb Your Enthusiasm |    9.1 | Colt Steele     |
-- | Fargo                |    9.7 | Colt Steele     |
-- | Freaks and Geeks     |    9.3 | Colt Steele     |
-- | General Hospital     |    4.5 | Colt Steele     |
-- | Halt and Catch Fire  |    9.9 | Colt Steele     |
-- | Arrested Development |    8.4 | Pinkie Petit    |
-- | Bob's Burgers        |    7.5 | Pinkie Petit    |
-- | Freaks and Geeks     |    8.8 | Pinkie Petit    |
-- | General Hospital     |    4.3 | Pinkie Petit    |
-- +----------------------+--------+-----------------+