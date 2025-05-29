--Pregunta 1
SELECT id, title
 FROM movie
 WHERE yr=1962;
--Pregunta 2
select yr
from movie
where title = 'Citizen Kane';
--Pregunta 3
select id, title, yr 
from movie
where title like "Star Trek%"
order by yr;
--Pregunta 4
select id
from actor
where name = 'Glenn Close';
--Pregunta 5
select id from movie
where title = 'Casablanca';
--Pregunta 6
select name
from casting c left join actor a on c.actorid = a.id
where movieid=11768;
--Pregunta 7
select name
from casting c left join actor a on c.actorid = a.id
where movieid=10522;
--Pregunta 8
select title from casting 
c left join movie m on c.movieid = m.id
where actorid = (select id from actor where name = 'Harrison Ford');
--Pregunta 9
select title from casting 
c left join movie m on c.movieid = m.id
where actorid = (select id from actor where name = 'Harrison Ford') and c.ord !=1;
--Pregunta 10
select title, name from casting 
c left join movie m on c.movieid = m.id
join actor a on c.actorid = a.id
where ord = 1 and yr = 1962;
--Pregunta 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
--Pregunta 12
SELECT title, name 
FROM movie JOIN casting ON (movieid=movie.id 
AND ord=1) 
JOIN actor ON (actorid=actor.id) 
WHERE movie.id IN ( 
SELECT movieid FROM casting 
WHERE actorid IN ( 
SELECT id FROM actor 
WHERE name='Julie Andrews'));