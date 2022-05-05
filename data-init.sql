CREATE TABLE IF NOT EXISTS roles (
	role_uuid VARCHAR ( 50 ) PRIMARY KEY,
	role_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS resources (
	resource_uuid VARCHAR ( 50 ) PRIMARY KEY,
	file_name VARCHAR ( 50 ) NOT NULL,
    path_name VARCHAR ( 255 )
);

CREATE TABLE IF NOT EXISTS categories (
	category_uuid VARCHAR ( 50 ) PRIMARY KEY,
	category_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS fdn_status (
	status_uuid VARCHAR ( 50 ) PRIMARY KEY,
	status_name VARCHAR ( 50 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS target_categories (
	target_categoy_uuid VARCHAR ( 50 ) PRIMARY KEY,
	target_category_name VARCHAR ( 255 ) NOT NULL
 );
 
CREATE TABLE IF NOT EXISTS users (
	user_uuid VARCHAR ( 50 ) PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
    email VARCHAR ( 255 ) UNIQUE NOT NULL,
    fname VARCHAR ( 255 ) NOT NULL,
    lname VARCHAR ( 255 ) NOT NULL, 
	password VARCHAR ( 50 ) NOT NULL,
    role_uuid VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (role_uuid)
        REFERENCES roles (role_uuid)
);

CREATE TABLE IF NOT EXISTS user_posts (
	user_post_uuid VARCHAR ( 50 ) PRIMARY KEY,
	post_title VARCHAR ( 255 ) NOT NULL,
    post_detail VARCHAR ( 255 ) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    user_uuid VARCHAR ( 50 ) NOT NULL,
    resource_uuid VARCHAR ( 50 ) NOT NULL,  
    FOREIGN KEY (user_uuid)
        REFERENCES users (user_uuid),
    FOREIGN KEY (resource_uuid)
        REFERENCES resources (resource_uuid)
);

CREATE TABLE IF NOT EXISTS  foundations (
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
    status_uuid VARCHAR ( 50 ) NOT NULL,
    resource_uuid VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (status_uuid)
        REFERENCES fdn_status (status_uuid),
    FOREIGN KEY (resource_uuid)
        REFERENCES resources (resource_uuid)
);

CREATE TABLE IF NOT EXISTs  fdns_resources_documents (
	fdn_resources_doc_uuid VARCHAR ( 50 ) PRIMARY KEY,
	file_name VARCHAR ( 50 ) NOT NULL,
    file_path VARCHAR ( 255 ) NOT NULL,
    file_type VARCHAR ( 50 ) NOT NULL,
    fdn_uuid VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (fdn_uuid)
        REFERENCES foundations (fdn_uuid)
);

CREATE TABLE IF NOT EXISTs  fdn_projects (
	fdn_project_uuid VARCHAR ( 50 ) PRIMARY KEY,
	fp_name VARCHAR ( 255 ) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    goal INT NOT NULL,
    fdn_uuid VARCHAR ( 50 ) NOT NULL,
    FOREIGN KEY (fdn_uuid)
        REFERENCES foundations (fdn_uuid)
);

CREATE TABLE IF NOT EXISTS  fdn_categories (
  fdn_uuid VARCHAR (50)  NOT NULL,
  category_uuid VARCHAR (50) NOT NULL,
  PRIMARY KEY (fdn_uuid, category_uuid),
  FOREIGN KEY (fdn_uuid)
      REFERENCES foundations (fdn_uuid),
  FOREIGN KEY (category_uuid)
      REFERENCES categories (category_uuid)
);

CREATE TABLE IF NOT EXISTS  volunteers_projects (
	volunteer_projects_uuid VARCHAR (50) PRIMARY KEY,
	vp_name VARCHAR (255)  NOT NULL,
	location VARCHAR (255) NOT NULL,
	daration TIMESTAMP NOT NULL,
	people_needed INTEGER NOT NULL,
  people_register INTEGER NOT NULL,
  description  TEXT NOT NULL,
  duty TEXT NOT NULL,
  qualify TEXT NOT NULL,
  contact_detail TEXT NOT NULL,
  activity_type VARCHAR (255),
  fdn_uuid VARCHAR (50)  NOT NULL,
  target_categoy_uuid VARCHAR (50)  NOT NULL,
     FOREIGN KEY (fdn_uuid)
      REFERENCES foundations (fdn_uuid),
     FOREIGN KEY (target_categoy_uuid)
      REFERENCES target_categories (target_categoy_uuid)
);

CREATE TABLE IF NOT EXISTS  volunteer_lists (
  volunteer_list_uuid VARCHAR (50) PRIMARY KEY ,
  volunteer_projects_uuid VARCHAR (50) NOT NULL,
  user_uuid VARCHAR (50) NOT NULL,
  FOREIGN KEY (volunteer_projects_uuid)
      REFERENCES volunteers_projects (volunteer_projects_uuid),
  FOREIGN KEY (user_uuid)
      REFERENCES users (user_uuid)
);

CREATE TABLE IF NOT EXISTS  fdn_posts (
  fdn_post_uuid VARCHAR (50) PRIMARY KEY ,
  post_title VARCHAR (255) NOT NULL,
  post_detail VARCHAR (255) NOT NULL,
  create_date TIMESTAMP NOT NULL,
  resource_uuid VARCHAR (50) NOT NULL,
  fdn_uuid VARCHAR (50) NOT NULL,
  FOREIGN KEY (resource_uuid)
      REFERENCES resources (resource_uuid),
  FOREIGN KEY (fdn_uuid)
      REFERENCES foundations (fdn_uuid)
);
