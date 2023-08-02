select
    upper(reverse('hello'));

-- +-------------------------+
-- | upper(reverse('hello')) |
-- +-------------------------+
-- | OLLEH                   |
-- +-------------------------+
select
    replace(title, ' ', '->') as title
from
    books;

-- +--------------------------------------------------------------+
-- | title                                                        |
-- +--------------------------------------------------------------+
-- | The->Namesake                                                |
-- | Norse->Mythology                                             |
-- | American->Gods                                               |
-- | Interpreter->of->Maladies                                    |
-- | A->Hologram->for->the->King:->A->Novel                       |
-- | The->Circle                                                  |
-- | The->Amazing->Adventures->of->Kavalier->&->Clay              |
-- | Just->Kids                                                   |
-- | A->Heartbreaking->Work->of->Staggering->Genius               |
-- | Coraline                                                     |
-- | What->We->Talk->About->When->We->Talk->About->Love:->Stories |
-- | Where->I'm->Calling->From:->Selected->Stories                |
-- | White->Noise                                                 |
-- | Cannery->Row                                                 |
-- | Oblivion:->Stories                                           |
-- | Consider->the->Lobster                                       |
-- +--------------------------------------------------------------+
select
    author_fname as forwards,
    reverse(author_lname) as backwards
from
    books;

-- +----------+----------------+
-- | forwards | backwards      |
-- +----------+----------------+
-- | Jhumpa   | irihaL         |
-- | Neil     | namiaG         |
-- | Neil     | namiaG         |
-- | Jhumpa   | irihaL         |
-- | Dave     | sreggE         |
-- | Dave     | sreggE         |
-- | Michael  | nobahC         |
-- | Patti    | htimS          |
-- | Dave     | sreggE         |
-- | Neil     | namiaG         |
-- | Raymond  | revraC         |
-- | Raymond  | revraC         |
-- | Don      | olliLeD        |
-- | John     | kcebnietS      |
-- | David    | ecallaW retsoF |
-- | David    | ecallaW retsoF |
-- +----------+----------------+
select
    ucase(concat(author_fname, ' ', author_lname)) as 'full name in caps'
from
    books;

-- +----------------------+
-- | full name in caps    |
-- +----------------------+
-- | JHUMPA LAHIRI        |
-- | NEIL GAIMAN          |
-- | NEIL GAIMAN          |
-- | JHUMPA LAHIRI        |
-- | DAVE EGGERS          |
-- | DAVE EGGERS          |
-- | MICHAEL CHABON       |
-- | PATTI SMITH          |
-- | DAVE EGGERS          |
-- | NEIL GAIMAN          |
-- | RAYMOND CARVER       |
-- | RAYMOND CARVER       |
-- | DON DELILLO          |
-- | JOHN STEINBECK       |
-- | DAVID FOSTER WALLACE |
-- | DAVID FOSTER WALLACE |
-- +----------------------+
select
    concat(title, ' was released in year ', released_year) as blurb
from
    books;

-- +-------------------------------------------------------------------------------+
-- | blurb                                                                         |
-- +-------------------------------------------------------------------------------+
-- | The Namesake was released in year 2003                                        |
-- | Norse Mythology was released in year 2016                                     |
-- | American Gods was released in year 2001                                       |
-- | Interpreter of Maladies was released in year 1996                             |
-- | A Hologram for the King: A Novel was released in year 2012                    |
-- | The Circle was released in year 2013                                          |
-- | The Amazing Adventures of Kavalier & Clay was released in year 2000           |
-- | Just Kids was released in year 2010                                           |
-- | A Heartbreaking Work of Staggering Genius was released in year 2001           |
-- | Coraline was released in year 2003                                            |
-- | What We Talk About When We Talk About Love: Stories was released in year 1981 |
-- | Where I'm Calling From: Selected Stories was released in year 1989            |
-- | White Noise was released in year 1985                                         |
-- | Cannery Row was released in year 1945                                         |
-- | Oblivion: Stories was released in year 2004                                   |
-- | Consider the Lobster was released in year 2005                                |
-- +-------------------------------------------------------------------------------+
select
    title,
    char_length(title) as 'character count'
from
    books;

-- +-----------------------------------------------------+-----------------+
-- | title                                               | character count |
-- +-----------------------------------------------------+-----------------+
-- | The Namesake                                        |              12 |
-- | Norse Mythology                                     |              15 |
-- | American Gods                                       |              13 |
-- | Interpreter of Maladies                             |              23 |
-- | A Hologram for the King: A Novel                    |              32 |
-- | The Circle                                          |              10 |
-- | The Amazing Adventures of Kavalier & Clay           |              41 |
-- | Just Kids                                           |               9 |
-- | A Heartbreaking Work of Staggering Genius           |              41 |
-- | Coraline                                            |               8 |
-- | What We Talk About When We Talk About Love: Stories |              51 |
-- | Where I'm Calling From: Selected Stories            |              40 |
-- | White Noise                                         |              11 |
-- | Cannery Row                                         |              11 |
-- | Oblivion: Stories                                   |              17 |
-- | Consider the Lobster                                |              20 |
-- +-----------------------------------------------------+-----------------+
select
    concat(substr(title, 1, 10), '...') as short_title,
    concat(author_fname, ',', author_lname) as author,
    concat(stock_quantity, ' in stock') as quantity
from
    books;

-- +---------------+----------------------+--------------+
-- | short_title   | author               | quantity     |
-- +---------------+----------------------+--------------+
-- | The Namesa... | Jhumpa,Lahiri        | 32 in stock  |
-- | Norse Myth... | Neil,Gaiman          | 43 in stock  |
-- | American G... | Neil,Gaiman          | 12 in stock  |
-- | Interprete... | Jhumpa,Lahiri        | 97 in stock  |
-- | A Hologram... | Dave,Eggers          | 154 in stock |
-- | The Circle... | Dave,Eggers          | 26 in stock  |
-- | The Amazin... | Michael,Chabon       | 68 in stock  |
-- | Just Kids...  | Patti,Smith          | 55 in stock  |
-- | A Heartbre... | Dave,Eggers          | 104 in stock |
-- | Coraline...   | Neil,Gaiman          | 100 in stock |
-- | What We Ta... | Raymond,Carver       | 23 in stock  |
-- | Where I'm ... | Raymond,Carver       | 12 in stock  |
-- | White Nois... | Don,DeLillo          | 49 in stock  |
-- | Cannery Ro... | John,Steinbeck       | 95 in stock  |
-- | Oblivion: ... | David,Foster Wallace | 172 in stock |
-- | Consider t... | David,Foster Wallace | 92 in stock  |
-- +---------------+----------------------+--------------+
select
    title
from
    books
where
    title like '%stories%';

-- +-----------------------------------------------------+
-- | title                                               |
-- +-----------------------------------------------------+
-- | What We Talk About When We Talk About Love: Stories |
-- | Where I'm Calling From: Selected Stories            |
-- | Oblivion: Stories                                   |
-- +-----------------------------------------------------+
select
    title,
    pages
from
    books
order by
    pages desc
limit
    1;

-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |
-- +-------------------------------------------+-------+
select
    concat(title, ' - ', released_year) as summary
from
    books
order by
    released_year desc
limit
    3;

-- +---------------------------+
-- | summary                   |
-- +---------------------------+
-- | Lincoln In The Bardo - 2017 |
-- | Norse Mythology - 2016      |
-- | 10% Happier - 2014          |
-- +---------------------------+
select
    title,
    author_lname
from
    books
where
    author_lname like "% %";

-- +----------------------+----------------+
-- | title                | author_lname   |
-- +----------------------+----------------+
-- | Oblivion: Stories    | Foster Wallace |
-- | Consider the Lobster | Foster Wallace |
-- +----------------------+----------------+
select
    title,
    released_year,
    stock_quantity
from
    books
order by
    stock_quantity
limit
    3;

-- +-----------------------------------------------------+---------------+----------------+
-- | title                                               | released_year | stock_quantity |
-- +-----------------------------------------------------+---------------+----------------+
-- | Where I'm Calling From: Selected Stories            |          1989 |             12 |
-- | American Gods                                       |          2001 |             12 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
-- +-----------------------------------------------------+---------------+----------------+
select
    title,
    author_lname
from
    books
order by
    author_lname,
    title;

-- +-----------------------------------------------------+----------------+
-- | title                                               | author_lname   |
-- +-----------------------------------------------------+----------------+
-- | What We Talk About When We Talk About Love: Stories | Carver         |
-- | Where I'm Calling From: Selected Stories            | Carver         |
-- | The Amazing Adventures of Kavalier & Clay           | Chabon         |
-- | White Noise                                         | DeLillo        |
-- | A Heartbreaking Work of Staggering Genius           | Eggers         |
-- | A Hologram for the King: A Novel                    | Eggers         |
-- | The Circle                                          | Eggers         |
-- | Consider the Lobster                                | Foster Wallace |
-- | Oblivion: Stories                                   | Foster Wallace |
-- | American Gods                                       | Gaiman         |
-- | Coraline                                            | Gaiman         |
-- | Norse Mythology                                     | Gaiman         |
-- | 10% Happier                                         | Harris         |
-- | fake_book                                           | Harris         |
-- | Interpreter of Maladies                             | Lahiri         |
-- | The Namesake                                        | Lahiri         |
-- | Lincoln In The Bardo                                | Saunders       |
-- | Just Kids                                           | Smith          |
-- | Cannery Row                                         | Steinbeck      |
-- +-----------------------------------------------------+----------------+



select concat('My favourite author is ', author_fname,' ',author_lname,' !!') as yell from books order by author_lname;
select concat('My favourite author is ', ucase(author_fname),' ',ucase(author_lname),' !!') as yell from books order by author_lname;
-- +------------------------------------------------+
-- | yell                                           |
-- +------------------------------------------------+
-- | My favourite author is Raymond Carver !!       |
-- | My favourite author is Raymond Carver !!       |
-- | My favourite author is Michael Chabon !!       |
-- | My favourite author is Don DeLillo !!          |
-- | My favourite author is Dave Eggers !!          |
-- | My favourite author is Dave Eggers !!          |
-- | My favourite author is Dave Eggers !!          |
-- | My favourite author is David Foster Wallace !! |
-- | My favourite author is David Foster Wallace !! |
-- | My favourite author is Neil Gaiman !!          |
-- | My favourite author is Neil Gaiman !!          |
-- | My favourite author is Neil Gaiman !!          |
-- | My favourite author is Dan Harris !!           |
-- | My favourite author is Freida Harris !!        |
-- | My favourite author is Jhumpa Lahiri !!        |
-- | My favourite author is Jhumpa Lahiri !!        |
-- | My favourite author is George Saunders !!      |
-- | My favourite author is Patti Smith !!          |
-- | My favourite author is John Steinbeck !!       |
-- +------------------------------------------------+