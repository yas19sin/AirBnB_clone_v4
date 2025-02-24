-- creates MySQL database hbnb_dev_db only if not existing
-- and gives privileges to user hbnb_dev on 2 DB's
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';
GRANT SELECT ON performance_schema.* TO 'hbnb_dev'@'localhost';
-- additions to attempt to pass last assignment
USE hbnb_dev_db;
CREATE TABLE IF NOT EXISTS states
       (id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       created_at DATETIME(6),
       updated_at DATETIME(6),
       name varchar(128) NOT NULL,
       PRIMARY KEY (id),
       UNIQUE (id));
CREATE TABLE IF NOT EXISTS cities
       (id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       created_at DATETIME(6),
       updated_at DATETIME(6),
       name varchar(128) NOT NULL,
       state_id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
       PRIMARY KEY (id),
       UNIQUE (id),
       FOREIGN KEY (state_id) REFERENCES states(id));
CREATE TABLE IF NOT EXISTS users
       (id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       created_at DATETIME(6),
       updated_at DATETIME(6),
       email varchar(128) NOT NULL,
       password varchar(128) NOT NULL,
       first_name varchar(128),
       last_name varchar(128),
       PRIMARY KEY (id),
       UNIQUE (id));
CREATE TABLE IF NOT EXISTS amenities
       (id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       created_at DATETIME(6),
       updated_at DATETIME(6),
       name varchar(128) NOT NULL,
       PRIMARY KEY (id),
       UNIQUE (id));
CREATE TABLE IF NOT EXISTS places
       (id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       created_at DATETIME(6),
       updated_at DATETIME(6),
       name varchar(128) NOT NULL,
       city_id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       user_id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       description varchar(1024),
       number_rooms int NOT NULL DEFAULT 0,
       number_bathrooms int NOT NULL DEFAULT 0,
       max_guest int NOT NULL DEFAULT 0,
       price_by_night int NOT NULL DEFAULT 0,
       latitude float,
       longitude float,
       PRIMARY KEY (id),
       UNIQUE (id),
       FOREIGN KEY (city_id) REFERENCES cities(id),
       FOREIGN KEY (user_id) REFERENCES users(id));
CREATE TABLE IF NOT EXISTS place_amenity
       (id int NOT NULL AUTO_INCREMENT,
       place_id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       amenity_id varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
       PRIMARY KEY (id),
       FOREIGN KEY (place_id) REFERENCES places(id),
       FOREIGN KEY (amenity_id) REFERENCES amenities(id));