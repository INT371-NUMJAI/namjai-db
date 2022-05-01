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
 
CREATE TABLE fdn_categories (
  fdn_uuid VARCHAR (50)  NOT NULL,
  category_uuid VARCHAR (50) NOT NULL,
  PRIMARY KEY (fdn_uuid, category_uuid),
  FOREIGN KEY (fdn_uuid)
      REFERENCES foundations (fdn_uuid),
  FOREIGN KEY (category_uuid)
      REFERENCES categories (category_uuid)
);

CREATE TABLE volunteers_projects (
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
  target_category_uuid VARCHAR (50)  NOT NULL,
     FOREIGN KEY (fdn_uuid)
      REFERENCES foundations (fdn_uuid),
     FOREIGN KEY (target_category_uuid)
      REFERENCES target_category (target_category_uuid)
);

CREATE TABLE volunteer_lists (
  volunteer_list_uuid VARCHAR (50) PRIMARY KEY ,
  volunteer_project_uuid VARCHAR (50) NOT NULL,
  user_uuid VARCHAR (50) NOT NULL,
  FOREIGN KEY (volunteer_project_uuid)
      REFERENCES volunteers_projects (volunteer_project_uuid),
  FOREIGN KEY (user_uuid)
      REFERENCES users (user_uuid)
);

CREATE TABLE fdn_posts (
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