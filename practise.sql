select upper(reverse('hello'));
-- +-------------------------+
-- | upper(reverse('hello')) |
-- +-------------------------+
-- | OLLEH                   |
-- +-------------------------+




select replace(title,' ','->') as title from books;
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



select author_fname as forwards,reverse(author_lname) as backwards from books;
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



select ucase(concat(author_fname,' ',author_lname)) as 'full name in caps' from books;
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


select concat(title,' was released in year ', released_year) as blurb from books;
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
