create table users(
    id int primary key auto_increment,
    username varchar(255) unique not null,
    created_at timestamp default now()
);

create table photos(
    id int primary key auto_increment,
    image_url varchar(255) unique not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users(id)
);

desc photos;

-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | id         | int          | NO   | PRI | NULL              | auto_increment    |
-- | user_id    | int          | NO   | MUL | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- | image_url  | varchar(255) | NO   |     | NULL              |                   |
-- +------------+--------------+------+-----+-------------------+-------------------+
CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

desc comments;

-- +--------------+--------------+------+-----+-------------------+-------------------+
-- | Field        | Type         | Null | Key | Default           | Extra             |
-- +--------------+--------------+------+-----+-------------------+-------------------+
-- | id           | int          | NO   | PRI | NULL              | auto_increment    |
-- | comment_text | varchar(255) | NO   |     | NULL              |                   |
-- | photo_id     | int          | NO   | MUL | NULL              |                   |
-- | user_id      | int          | NO   | MUL | NULL              |                   |
-- | created_at   | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +--------------+--------------+------+-----+-------------------+-------------------+
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

desc likes;

-- +------------+-----------+------+-----+-------------------+-------------------+
-- | Field      | Type      | Null | Key | Default           | Extra             |
-- +------------+-----------+------+-----+-------------------+-------------------+
-- | user_id    | int       | NO   | PRI | NULL              |                   |
-- | photo_id   | int       | NO   | PRI | NULL              |                   |
-- | created_at | timestamp | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+-----------+------+-----+-------------------+-------------------+
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

desc follows;

-- +-------------+-----------+------+-----+-------------------+-------------------+
-- | Field       | Type      | Null | Key | Default           | Extra             |
-- +-------------+-----------+------+-----+-------------------+-------------------+
-- | follower_id | int       | NO   | PRI | NULL              |                   |
-- | followee_id | int       | NO   | PRI | NULL              |                   |
-- | created_at  | timestamp | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +-------------+-----------+------+-----+-------------------+-------------------+
CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

desc tags;

-- +------------+--------------+------+-----+-------------------+-------------------+
-- | Field      | Type         | Null | Key | Default           | Extra             |
-- +------------+--------------+------+-----+-------------------+-------------------+
-- | id         | int          | NO   | PRI | NULL              | auto_increment    |
-- | tag_name   | varchar(255) | YES  | UNI | NULL              |                   |
-- | created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
-- +------------+--------------+------+-----+-------------------+-------------------+
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

desc photo_tags;

-- +----------+------+------+-----+---------+-------+
-- | Field    | Type | Null | Key | Default | Extra |
-- +----------+------+------+-----+---------+-------+
-- | photo_id | int  | NO   | PRI | NULL    |       |
-- | tag_id   | int  | NO   | PRI | NULL    |       |
-- +----------+------+------+-----+---------+-------+
-- IG Clone Exercises ..
select
    *
from
    users
order by
    created_at
limit
    5;

-- +----+------------------+---------------------+
-- | id | username         | created_at          |
-- +----+------------------+---------------------+
-- | 80 | Darby_Herzog     | 2016-05-06 00:14:21 |
-- | 67 | Emilio_Bernier52 | 2016-05-06 13:04:30 |
-- | 63 | Elenor88         | 2016-05-08 01:30:41 |
-- | 95 | Nicole71         | 2016-05-09 17:30:22 |
-- | 38 | Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
-- +----+------------------+---------------------+
select
    dayname(created_at) as Day,
    count(*) as Count
from
    users
group by
    Day
limit
    2;

-- +----------+-------+
-- | Day      | Count |
-- +----------+-------+
-- | Thursday |    16 |
-- | Sunday   |    16 |
-- +----------+-------+
select
    username as inactive_users
from
    users
    left join photos on users.id = photos.user_id
where
    user_id is NULL;

-- +---------------------+
-- | inactive_users      |
-- +---------------------+
-- | Aniya_Hackett       |
-- | Bartholome.Bernhard |
-- | Bethany20           |
-- | Darby_Herzog        |
-- | David.Osinski47     |
-- | Duane60             |
-- | Esmeralda.Mraz57    |
-- | Esther.Zulauf61     |
-- | Franco_Keebler64    |
-- | Hulda.Macejkovic    |
-- | Jaclyn81            |
-- | Janelle.Nikolaus81  |
-- | Jessyca_West        |
-- | Julien_Schmidt      |
-- | Kasandra_Homenick   |
-- | Leslie67            |
-- | Linnea59            |
-- | Maxwell.Halvorson   |
-- | Mckenna17           |
-- | Mike.Auer39         |
-- | Morgan.Kassulke     |
-- | Nia_Haag            |
-- | Ollie_Ledner37      |
-- | Pearl7              |
-- | Rocio33             |
-- | Tierra.Trantow      |
-- +---------------------+
select
    username,
    photos.id,
    photos.image_url,
    count(*) as total
from
    photos
    join likes on likes.photo_id = photos.id
    join users on photos.user_id = users.id
group by
    photos.id
order by
    total desc
limit
    1;

-- +---------------+-----+---------------------+-------+
-- | username      | id  | image_url           | total |
-- +---------------+-----+---------------------+-------+
-- | Zack_Kemmer93 | 145 | https://jarret.name |    48 |
-- +---------------+-----+---------------------+-------+
select
    (
        (
            select
                count(*)
            from
                photos
        ) /(
            select
                count(*)
            from
                users
        )
    ) as avg_post_per_user;

-- +-------------------+
-- | avg_post_per_user |
-- +-------------------+
-- |            2.5700 |
-- +-------------------+
select
    tag_name,
    count(*) as count
from
    photo_tags
    join tags on tags.id = photo_tags.tag_id
group by
    tag_id
order by
    count desc
limit
    5;

-- +----------+-------+
-- | tag_name | count |
-- +----------+-------+
-- | smile    |    59 |
-- | beach    |    42 |
-- | party    |    39 |
-- | fun      |    38 |
-- | concert  |    24 |
-- +----------+-------+
select
    username,
    count(*) as num_likes
from
    users
    join likes on users.id = likes.user_id
group by
    username
having
    num_likes = (
        select
            count(*)
        from
            photos
    );

-- +--------------------+-----------+
-- | username           | num_likes |
-- +--------------------+-----------+
-- | Aniya_Hackett      |       257 |
-- | Bethany20          |       257 |
-- | Duane60            |       257 |
-- | Jaclyn81           |       257 |
-- | Janelle.Nikolaus81 |       257 |
-- | Julien_Schmidt     |       257 |
-- | Leslie67           |       257 |
-- | Maxwell.Halvorson  |       257 |
-- | Mckenna17          |       257 |
-- | Mike.Auer39        |       257 |
-- | Nia_Haag           |       257 |
-- | Ollie_Ledner37     |       257 |
-- | Rocio33            |       257 |
-- +--------------------+-----------+