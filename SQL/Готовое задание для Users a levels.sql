Задания на написание запросов к БД:


1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а
2. Удалить всех пользователей, у которых skill меньше 100000
3. Вывести все данные из таблицы user в порядке убывания по полю skill 
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000
6. Выбрать user_name всех пользователей уровня admin используя подзапрос
7. Выбрать user_name всех пользователей уровня admin используя join

CREATE TABLE users
(
    Id serial not null ,
    user_name VARCHAR(30) not null ,
    level_id INTEGER ,
    skill INTEGER,
    PRIMARY KEY (ID)
);

CREATE TABLE levels
(
    Id serial not null,
    level_name VARCHAR(30) not null,
    PRIMARY KEY (ID)
);

INSERT INTO users (user_name, level_id, skill)
VALUES ('Anton', 1, 900000),
       ('Denis', 3, 4000), 
       ('Petr', 2, 50000),
       ('Andrey', 4, 20),
       ('Olga', 1, 600000),
       ('Anna', 1, 1600000);
       
SELECT * FROM users;
     
INSERT INTO levels (level_name)
VALUES ('admin'),
       ('power_user'), 
       ('user'),
       ('guest');
      
SELECT * FROM levels;       

SELECT * FROM users
WHERE level_id = 1 AND  skill > 799000 AND user_name LIKE '%a%'; 

DELETE FROM users
WHERE skill < 100000;

SELECT * FROM users
ORDER BY skill;

SELECT id, user_name, level_id, skill
FROM users

ORDER BY skill DESC;

INSERT INTO users (user_name, level_id, skill)
VALUES ('Oleg', 4, 10);

SELECT * FROM users;

UPDATE users 
SET skill=200000
WHERE level_id<2;

SELECT * FROM users;

SELECT * FROM levels WHERE level_name= 'admin' 

SELECT user_name FROM users WHERE level_id=(SELECT id FROM levels WHERE level_name= 'admin' )

SELECT users.user_name FROM users JOIN levels On users.level_id=levels.id WHERE levels.level_name= 'admin'

SELECT u.user_name AS "имя пользователя"  FROM users as u  JOIN levels AS l On u.level_id=l.id WHERE l.level_name= 'admin'



SELECT * FROM levels WHERE level_name= 'admin' 

SELECT user_name FROM users WHERE level_id=(SELECT id FROM levels WHERE level_name= 'admin' )

SELECT users.user_name FROM users JOIN levels On users.level_id=levels.id WHERE levels.level_name= 'admin'

SELECT u.user_name AS "имя пользователя"  FROM users as u  JOIN levels AS l On u.level_id=l.id WHERE l.level_name= 'admin'




