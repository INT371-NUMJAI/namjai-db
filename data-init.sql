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