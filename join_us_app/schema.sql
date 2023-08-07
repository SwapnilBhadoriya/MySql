create database if not exists join_us_db;

use join_us_db;

CREATE TABLE users(
    email varchar(255) primary key,
    created_at timestamp default now()
);

--  desc users;
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | email      | varchar(255) | NO   | PRI | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------+
select
    date_format(created_at, '%M %D %Y') as earliest_date
from
    users
order by
    created_at limi t 1;

-- +-----------------+
-- | earliest_date   |
-- +-----------------+
-- | August 5th 2022 |
-- +-----------------+
select
    email,
    created_at
from
    users
where
    created_at = (
        select
            min(created_at)
        from
            users
    );

-- +------------------------------+---------------------+
-- | email                        | created_at          |
-- +------------------------------+---------------------+
-- | Jaquelin_Nader63@hotmail.com | 2022-08-05 16:04:57 |
-- +------------------------------+---------------------+
select
    monthname(created_at) as month,
    count(*) as Count
from
    users
group by
    month
order by
    Count desc;

-- +-----------+-------+
-- | month     | Count |
-- +-----------+-------+
-- | January   |    55 |
-- | September |    51 |
-- | May       |    51 |
-- | July      |    45 |
-- | December  |    42 |
-- | November  |    41 |
-- | August    |    40 |
-- | June      |    37 |
-- | March     |    36 |
-- | February  |    36 |
-- | April     |    34 |
-- | October   |    32 |
-- +-----------+-------+
select
    count(*) as yahoo_mails
from
    users
where
    email like '%yahoo.com';

-- +-------------+
-- | yahoo_mails |
-- +-------------+
-- |         180 |
-- +-------------+
select
    case
        when email like '%gmail.com' then 'gmail'
        when email like '%yahoo.com' then 'yahoo'
        when email like '%hotmail.com' then 'hotmail'
        else 'Other'
    end as Providers,
    count(*) as user_count
from
    users
group by
    providers
order by
    user_count desc;

-- +-----------+------------+
-- | Providers | user_count |
-- +-----------+------------+
-- | yahoo     |        180 |
-- | gmail     |        169 |
-- | hotmail   |        151 |
-- +-----------+------------+