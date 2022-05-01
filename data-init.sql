CREATE TABLE users (
	user_uuid VARCHAR ( 50 ) PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
    email VARCHAR ( 255 ) UNIQUE NOT NULL,
    fname VARCHAR ( 255 ) NOT NULL,
    lname VARCHAR ( 255 ) NOT NULL, 
	password VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (role_uuid)
        REFERENCES roles (role_uuid)
);

CREATE TABLE user_posts (
	user_post_uuid VARCHAR ( 50 ) PRIMARY KEY,
	post_title VARCHAR ( 255 ) NOT NULL,
    post_detail VARCHAR ( 255 ) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    FOREIGN KEY (resource_uuid)
        REFERENCES resources (resource_uuid),
    FOREIGN KEY (user_uuid)
        REFERENCES users (user_uuid)
);

CREATE TABLE foundations (
	fdn_uuid VARCHAR ( 50 ) PRIMARY KEY,
	name VARCHAR ( 255 ) UNIQUE NOT NULL,
    address_no VARCHAR ( 255 ) NOT NULL,
    street_no INT NOT NULL,
    street_name VARCHAR ( 255 ) NOT NULL,
    sub_district VARCHAR ( 255 ) NOT NULL,
    district VARCHAR ( 255 ) NOT NULL,
    province VARCHAR ( 255 ) NOT NULL,
    postalcode INT NOT NULL,
    founder_name VARCHAR ( 255 ) NOT NULL,
    fdn_detail TEXT NOT NULL,
    fdn_size VARCHAR ( 255 ) NOT NULL,
    establish_date DATE NOT NULL,
    email VARCHAR ( 50 ) UNIQUE NOT NULL,
    contact_num VARCHAR ( 20 ) NOT NULL,
    FOREIGN KEY (status_uuid)
        REFERENCES fdn_status (status_uuid)
    FOREIGN KEY (resource_uuid)
        REFERENCES resources (resource_uuid),
);

CREATE TABLE fdns_resources_documents (
	fdn_resources_doc_uuid VARCHAR ( 50 ) PRIMARY KEY,
	file_name VARCHAR ( 50 ) NOT NULL,
    file_path VARCHAR ( 255 ) NOT NULL,
    file_type VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (fdn_uuid)
        REFERENCES foundations (fdn_uuid)
);

CREATE TABLE fdn_projects (
	fdn_project_uuid VARCHAR ( 50 ) PRIMARY KEY,
	fp_name VARCHAR ( 255 ) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    goal INT NOT NULL,
    FOREIGN KEY (fdn_uuid)
        REFERENCES foundations (fdn_uuid)
);