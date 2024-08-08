CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    continent VARCHAR(40) NOT NULL,
    currency VARCHAR(5)
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE actors(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    height INT,
    awards INT CHECK ( awards >= 0 ) DEFAULT 0 NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT fk_actors_countries
		FOREIGN KEY (country_id)
			REFERENCES countries(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE

);

CREATE TABLE productions_info(
    id SERIAL PRIMARY KEY,
    rating DECIMAL (4, 2) NOT NULL,
    duration INT CHECK ( duration > 0 ) NOT NULL,
    budget DECIMAL (10, 2),
    release_date DATE NOT NULL,
    has_subtitles BOOLEAN DEFAULT FALSE NOT NULL,
    synopsis TEXT
);

CREATE TABLE productions(
    id SERIAL PRIMARY KEY,
    title VARCHAR(70) UNIQUE NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT fk_productions_countries
		FOREIGN KEY (country_id)
			REFERENCES countries(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,

    production_info_id INT UNIQUE NOT NULL,
    CONSTRAINT fk_productions_productions_info
		FOREIGN KEY (production_info_id)
			REFERENCES productions_info(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE

);

CREATE TABLE productions_actors(
    production_id INT NOT NULL,
    actor_id INT NOT NULL,

    CONSTRAINT fk_productions_actors_productions
		FOREIGN KEY (production_id)
			REFERENCES productions(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,

    CONSTRAINT fk_productions_actors_actors
		FOREIGN KEY (actor_id)
			REFERENCES actors(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,

    CONSTRAINT pk_productions_actors
	    PRIMARY KEY(production_id, actor_id)
);

CREATE TABLE categories_productions(
    category_id INT NOT NULL,
    production_id INT NOT NULL,
    
    CONSTRAINT fk_categories_productions_categories
		FOREIGN KEY (category_id)
			REFERENCES categories(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,

    CONSTRAINT k_categories_productions_productions
		FOREIGN KEY (production_id)
			REFERENCES productions(id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,

    CONSTRAINT pk_categories_productions
	    PRIMARY KEY(category_id, production_id)
                                   
);