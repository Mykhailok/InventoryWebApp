DELETE FROM product;
DELETE FROM users;
DELETE FROM user_roles;
DELETE FROM owner_product;
DELETE FROM owners;

ALTER SEQUENCE product_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE owners_id_seq RESTART WITH 1;

INSERT INTO product
(name,owner,manufacturer,price,description)
VALUES
-- 	('Abacuses','ASRock',100,'Cases'),
-- 	('Bags','Compaq',200,'Laptop computer cases'),
-- 	('Capacitors','Dell',300,'Motherboards'),
-- 	('Detectors','Foxconn',400,'Chipsets for motherboards'),
	('Notebook',1,'Asus',100,'Black'),
	('Phone',2,'Meizu',200,'Good Phone');

INSERT INTO users (username, password) VALUES
  ('admin', '$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm'), -- password = '1111'
	('user', '$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm');  -- password = '1111'

INSERT INTO user_roles (role, user_id) VALUES
	('ROLE_ADMIN', 1),
	('ROLE_USER', 1),
	('ROLE_USER', 2);

INSERT INTO owners (firstname, lastname) VALUES 
	('Mike', 'Kosynskyi'),
	('Elena', 'Kosynskaya');

INSERT INTO owner_product (owner_id, product_id) VALUES
	(1,1),
	(2,2);
