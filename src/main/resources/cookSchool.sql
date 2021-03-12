create table chefCooks(
    chefCookId int primary key,
    name varchar(30) not null
);

create table courses(
    courseId int primary key,
    title varchar(600) not null,
    price int,
    date date,
    chefCookId int references chefCooks(chefCookId) on delete cascade
);

create table articles(
    articleId int primary key,
    title varchar(600) not null,
    category varchar(300) not null,
    chefCookId int references chefCooks(chefCookId) on delete set null
);

create table recipes(
    recipeId int primary key,
    name varchar(600) not null,
    timeToPrepare int not null,
    timeToCook int not null,
    chefCookId int references chefCooks(chefCookId) on delete set null
);

create table ingredients(
    ingredientId int primary key,
    name varchar(200) not null
);

create table consistOf(
    recipeId int references recipes(recipeId) on delete cascade,
    ingredientId int references ingredients(ingredientId),
    primary key (recipeId, ingredientId)
);

create table users(
   userId int primary key,
   name varchar(100) not null,
   email varchar(100) not null unique
);

create table participate(
    userId int references users(userId) on delete cascade ,
    courseId int references courses(courseId) on delete cascade ,
    primary key (userId, courseId)
);

create table wasLiked(
    userId int references users(userId) on delete cascade,
    recipeId int references recipes(recipeId) on delete cascade,
    date date not null,
    primary key (userId, recipeId)
);

insert into chefCooks(chefCookId, name)
values (1, 'Oliver');
insert into chefCooks(chefCookId, name)
values (2, 'Ramsey');
insert into chefCooks(chefCookId, name)
values (3, 'Trotter');
insert into chefCooks(chefCookId, name)
values (4, 'Keller');
insert into chefcooks(chefCookId, name)
values (5, 'Marley');

insert into courses(courseId, title, price, date, chefCookId)
values (454, 'vegetarian lasagna', 53, '2019-05-25', 3);
insert into courses(courseId, title, price, date, chefCookId)
values (503, 'Spinach & tortellini soup', 78, '2020-02-18', 1);
insert into courses(courseId, title, price, date, chefCookId)
values (225, 'Roast turkey with lemon, parsley and garlic', 150, '2019-07-02', 2);
insert into courses(courseId, title, price, date, chefCookId)
values (397, 'Chicken arrabbiata', 53, '2020-03-16', 4);
insert into courses(courseId, title, price, date, chefCookId)
values (401, 'Breakfast Pies', 58, '2019-05-28', 3);

insert into articles(articleId, title, category, chefCookId)
values (3201, 'Jamie Cooks Italy', 'Italian food', 1);
insert into articles(articleId, title, category, chefCookId)
values (3485, 'What is a healthy diet', 'Healthy food', 2);
insert into articles(articleId, title, category, chefCookId)
values (3703, '10 Ways To Satisfy Your Sweet Tooth Without The Sugar', 'Less sugar', 3);
insert into articles(articleId, title, category, chefCookId)
values (3756, 'Dinner in 10 minutes', 'Meals you can make fast', 4);

insert into recipes(recipeId, name, timeToPrepare, timeToCook, chefCookId)
values (89886, 'Cheese and Potato Breakfast Casserole', 15, 30, 1);
insert into recipes(recipeId, name, timeToPrepare, timeToCook, chefCookId)
values (91237, 'Classic Waffles', 10, 15, 2);
insert into recipes(recipeId, name, timeToPrepare, timeToCook, chefCookId)
values (10101, 'Breakfast Pies', 20, 20, 3);
insert into recipes(recipeId, name, timeToPrepare, timeToCook, chefCookId)
values (76089, 'Quick and Easy Chicken Noodle Soup', 10, 20, 4);
insert into recipes(recipeId, name, timeToPrepare, timeToCook, chefCookId)
values (12222, 'Albina Chicken', 20, 20, 4);

insert into ingredients(ingredientId, name)
values (1, 'potatoes');
insert into ingredients(ingredientId, name)
values (2, 'Cheddar cheese');
insert into ingredients(ingredientId, name)
values (3, 'onion');
insert into ingredients(ingredientId, name)
values (4, 'pepper');
insert into ingredients(ingredientId, name)
values (5, 'eggs');
insert into ingredients(ingredientId, name)
values (6, 'cottage cheese');
insert into ingredients(ingredientId, name)
values (7, 'flour');
insert into ingredients(ingredientId, name)
values (8, 'salt');
insert into ingredients(ingredientId, name)
values (9, 'baking powder');
insert into ingredients(ingredientId, name)
values (10, 'white sugar');
insert into ingredients(ingredientId, name)
values (11, 'milk');
insert into ingredients(ingredientId, name)
values (12, 'butter');
insert into ingredients(ingredientId, name)
values (13, 'vanilla extract');
insert into ingredients(ingredientId, name)
values (14, 'spinach');
insert into ingredients(ingredientId, name)
values (15, 'celery');
insert into ingredients(ingredientId, name)
values (16, 'noodles');
insert into ingredients(ingredientId, name)
values (17, 'carrots');
insert into ingredients(ingredientId, name)
values (18, 'basil');
insert into ingredients(ingredientId, name)
values (19, 'oregano');
insert into ingredients(ingredientId, name)
values (20, 'chicken');


insert into consistOf(recipeId, ingredientId)
values (89886, 1);
insert into consistOf(recipeId, ingredientId)
values (89886, 2);
insert into consistOf(recipeId, ingredientId)
values (89886, 3);
insert into consistOf(recipeId, ingredientId)
values (89886, 4);
insert into consistOf(recipeId, ingredientId)
values (89886, 8);
insert into consistOf(recipeId, ingredientId)
values (89886, 5);
insert into consistOf(recipeId, ingredientId)
values (89886, 6);
insert into consistOf(recipeId, ingredientId)
values (91237, 7);
insert into consistOf(recipeId, ingredientId)
values (91237, 8);
insert into consistOf(recipeId, ingredientId)
values (91237, 9);
insert into consistOf(recipeId, ingredientId)
values (91237, 10);
insert into consistOf(recipeId, ingredientId)
values (91237, 11);
insert into consistOf(recipeId, ingredientId)
values (91237, 12);
insert into consistOf(recipeId, ingredientId)
values (91237, 13);
insert into consistOf(recipeId, ingredientId)
values (10101, 5);
insert into consistOf(recipeId, ingredientId)
values (10101, 4);
insert into consistOf(recipeId, ingredientId)
values (10101, 11);
insert into consistOf(recipeId, ingredientId)
values (10101, 6);
insert into consistOf(recipeId, ingredientId)
values (10101, 14);
insert into consistOf(recipeId, ingredientId)
values (10101, 8);
insert into consistOf(recipeId, ingredientId)
values (76089, 12);
insert into consistOf(recipeId, ingredientId)
values (76089, 3);
insert into consistOf(recipeId, ingredientId)
values (76089, 15);
insert into consistOf(recipeId, ingredientId)
values (76089, 20);
insert into consistOf(recipeId, ingredientId)
values (76089, 16);
insert into consistOf(recipeId, ingredientId)
values (76089, 17);
insert into consistOf(recipeId, ingredientId)
values (76089, 18);
insert into consistOf(recipeId, ingredientId)
values (76089, 19);
insert into consistOf(recipeId, ingredientId)
values (76089, 8);
insert into consistOf(recipeId, ingredientId)
values (76089, 4);
insert into consistOf(recipeId, ingredientId)
values (12222, 20);
insert into consistOf(recipeId, ingredientId)
values (12222, 16);
insert into consistOf(recipeId, ingredientId)
values (12222, 8);
insert into consistOf(recipeId, ingredientId)
values (12222, 4);
insert into consistOf(recipeId, ingredientId)
values (12222, 17);

insert into users(userId, name, email)
values (26, 'Anderson', 'donna@gmail.com');
insert into users(userId, name, email)
values (19, 'Bond', 'alex@yahoo.com');
insert into users(userId, name, email)
values (34, 'Affleck', 'benny@mail.com');
insert into users(userId, name, email)
values (44, 'Jolie', 'angelinaJoli@yandex.com');
insert into users(userId, name, email)
values (48, 'Mouse', 'mickey@gmail.ru');

insert into participate(userId, courseId)
values (19, 503);
insert into participate(userId, courseId)
values (34, 397);
insert into participate(userId, courseId)
values (44, 503);
insert into participate(userId, courseId)
values (19, 225);
insert into participate(userId, courseId)
values (19, 397);
insert into participate(userId, courseId)
values (34, 503);
insert into participate(userId, courseId)
values (19, 454);

insert into wasLiked(userId, recipeId, date)
values (26, 89886, '2019-01-25');
insert into wasLiked(userId, recipeId, date)
values (34, 89886, '2019-05-13');
insert into wasLiked(userId, recipeId, date)
values (19, 89886, '2019-01-10');
insert into wasLiked(userId, recipeId, date)
values (44, 89886, '2020-04-27');
insert into wasLiked(userId, recipeId, date)
values (44, 76089, '2020-02-07');
insert into wasLiked(userId, recipeId, date)
values (26, 91237, '2020-02-23');
insert into wasLiked(userId, recipeId, date)
values (44, 91237, '2020-02-11');
insert into wasLiked(userId, recipeId, date)
values (19, 10101, '2019-05-04');
insert into wasLiked(userId, recipeId, date)
values (44, 10101, '2020-02-23');
insert into wasLiked(userId, recipeId, date)
values (34, 10101, '2020-06-01');


-- drop table wasLiked;
-- drop table participate;
-- drop table consistOf;
-- drop table ingredients;
-- drop table courses;
-- drop table users;
-- drop table recipes;
-- drop table articles;
-- drop table chefCooks;