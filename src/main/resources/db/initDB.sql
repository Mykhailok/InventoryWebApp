--DROP TABLE IF EXISTS prodms.goods CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;

-- CREATE TABLE prodms.goods
-- (
--     id serial NOT NULL,
--     name TEXT,
--     manufacturer TEXT,
--     price NUMERIC(10,2),
--     description TEXT,
--     PRIMARY KEY (id)
-- );

CREATE TABLE users
(
    id SERIAL NOT NULL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE user_roles
(
    user_id INTEGER NOT NULL,
    role    VARCHAR NOT NULL,
    CONSTRAINT users_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);


GRANT SELECT ON ALL TABLES IN SCHEMA public TO "user";
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "user";
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public to "user";