SET NAMES 'utf8';

DROP DATABASE IF EXISTS cities;
CREATE DATABASE cities CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON cities.* TO 'web_user'@'%' IDENTIFIED BY 'Password1';
USE cities;
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (id int primary key auto_increment, city_name varchar(50), population int);
INSERT INTO cities (city_name, population) VALUES ('София', 1236047);
INSERT INTO cities (city_name, population) VALUES ('Пловдив', 343424);
INSERT INTO cities (city_name, population) VALUES ('Варна', 335177);
INSERT INTO cities (city_name, population) VALUES ('Бургас', 202766);
INSERT INTO cities (city_name, population) VALUES ('Русе', 144936);
INSERT INTO cities (city_name, population) VALUES ('Стара Загора', 136781);
INSERT INTO cities (city_name, population) VALUES ('Плевен', 98467);
INSERT INTO cities (city_name, population) VALUES ('Сливен', 87322);
INSERT INTO cities (city_name, population) VALUES ('Добрич', 85402);
INSERT INTO cities (city_name, population) VALUES ('Шумен', 76967);

DROP DATABASE IF EXISTS votingtime;

CREATE DATABASE votingtime CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON votingtime.* TO 'voter'@'%' IDENTIFIED BY 'Password1';

USE votingtime;

CREATE TABLE voteoptions (optionname VARCHAR(25) PRIMARY KEY);

INSERT INTO voteoptions VALUES ('Cats'), ('Dogs');

CREATE TABLE votecasts (id INT PRIMARY KEY AUTO_INCREMENT, voteoption VARCHAR(25));