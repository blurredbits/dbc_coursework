-- CREATE TABLE users (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   name VARCHAR(64) NOT NULL,
--   email VARCHAR(128) UNIQUE NOT NULL,
--   photo_id INTEGER
-- );

-- CREATE TABLE products (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   name VARCHAR(64) NOT NULL,
--   description VARCHAR(255) NOT NULL,
--   price INTEGER,
--   photo_id INTEGER
-- );

-- CREATE TABLE photos (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   name VARCHAR(255) NOT NULL,
--   url VARCHAR(255) NOT NULL
-- );

-- INSERT INTO photos
-- VALUES(null, 'Beautiful Portrait', 'http://portraits.com/id=43423');

-- INSERT INTO photos
-- VALUES(null, 'Kick Ass Ruby T-Shirt', 'http://rubyrules.com/id=43432');

-- INSERT INTO users
-- VALUES(null,'Mark','mmorris00@mac.com',1);

-- INSERT INTO products
-- VALUES(null,'Kick Ass Ruby T-Shirt','T-Shirt',1499,2);

-- SELECT users.name, users.email, photos.name
-- FROM photos
-- INNER JOIN users
-- ON users.photo_id = photos.id
-- WHERE users.id = 1;

-- SELECT products.name, products.description, products.price / 100, photos.url
-- FROM products
-- INNER JOIN photos
-- ON products.photo_id = photos.id
-- WHERE products.id = 1;



