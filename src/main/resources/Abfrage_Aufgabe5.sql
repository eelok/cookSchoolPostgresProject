--a)
--Bestimme Sie inactive Users
-- (Users die keinen Kurs besucht haben und kein Rezept mit like markiert haben)
select users.userid, users.name from users,
((select u.userid from users u) except (select p.userid from participate p)
intersect
(select u.userid from users u) except (select w.userid from wasliked w)) as inactive
where users.userid = inactive.userid;

-- b)
-- Welche Recipes bestehen aus welche Ingredients
select r.name, i.name from recipes r, ingredients i, consistof c
where r.recipeid = c.recipeid
and i.ingredientid = c.ingredientid;


---Welche chef Cook welches Course bietet

select cook.chefcookid, cook.name, c.title
from chefcooks cook
join courses c
on cook.chefcookid = c.chefcookid;

--c)
---Welches Rezept hat die längste Kochzeit (timetocook)
select recipeid, name, timetocook
from recipes
where timetocook >= all (select timetocook from recipes);

--Welche Users keinen Cours besucht haben.
select u.userid, u.name from users u
where u.userid not in
(select p.userid from participate p);

--d) wie viele Courses hat jeder Cook gemacht
select recipeid, name, max(timetoprepare)
from recipes
GROUP BY name, recipeid
ORDER BY name ASC;

select name, recipeid , timetoprepare
from recipes
where timetoprepare = (select max(timetoprepare) from recipes)
GROUP BY name, recipeid
ORDER BY name ASC;

-- suche nach einem populärsten (am meisten besuchten) Cours (id, title),
-- zeige wie viele Teilnehmer hat den Curse besucht
select c.courseid, c.title, count(c.courseid) as amount_of_participant
from courses c, participate p
where c.courseid = p.courseid
group by c.courseid, c.title order by amount_of_participant desc limit 1;

---e)
-- Welche Rezepte (id, name) haben 3 und mehr likes bekommen
select r.recipeid, r.name, count(*)
from recipes r, wasliked w
where r.recipeid = w.recipeid
group by r.recipeid, r.name
having count(*) >= 3;

--Welche User haben mehr als 3 Kurse besucht
select u.userid, u.name, count(*) from users u, participate p
where u.userid = p.userid
group by u.userid, u.name
having count(*) >= 3;


