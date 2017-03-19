DELETE FROM product;
DELETE FROM users;
DELETE FROM user_roles;

ALTER SEQUENCE product_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;

INSERT INTO product
(name,owner,manufacturer,price,description)
VALUES
-- 	('Abacuses','ASRock',100,'Cases'),
-- 	('Bags','Compaq',200,'Laptop computer cases'),
-- 	('Capacitors','Dell',300,'Motherboards'),
-- 	('Detectors','Foxconn',400,'Chipsets for motherboards'),
	('Test','User','Manufacturer',100,'Description');

INSERT INTO users (username, password) VALUES
  ('admin', '$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm'), -- password = '1111'
	('user', '$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm');  -- password = '1111'

INSERT INTO user_roles (role, user_id) VALUES
	('ROLE_ADMIN', 1),
	('ROLE_USER', 1),
	('ROLE_USER', 2);