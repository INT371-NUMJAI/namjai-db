CREATE TABLE roles (
	role_uuid VARCHAR ( 50 ) PRIMARY KEY,
	role_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE resources (
	resources_uuid VARCHAR ( 50 ) PRIMARY KEY,
	file_name VARCHAR ( 50 ) NOT NULL,
    path_name VARCHAR ( 255 )
);

CREATE TABLE categories (
	category_uuid VARCHAR ( 50 ) PRIMARY KEY,
	category_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE fdn_status (
	status_uuid VARCHAR ( 50 ) PRIMARY KEY,
	status_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE target_categories (
	target_categories_uuid VARCHAR ( 50 ) PRIMARY KEY,
	target_categories_name VARCHAR ( 255 ) NOT NULL
);