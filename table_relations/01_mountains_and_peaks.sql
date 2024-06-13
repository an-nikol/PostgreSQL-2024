CREATE TABLE mountains (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);
CREATE TABLE peaks(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	mountain_id INT,
	CONSTRAINT fk_peaks_mountains
		FOREIGN KEY (mountain_id)
			REFERENCES mountains(id)
);




-- short syntaxis without naming a contraint

-- CREATE TABLE mountains (
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(50)
-- );
-- CREATE TABLE peaks(
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(50),
-- 	mountain_id INT REFERENCES mountains(id)
-- );



-- syntaxis to add a FK when tables are already created

-- ALTER TABLE peaks
-- ADD CONSTRAINT fk_peaks_mountains
-- 	FOREIGN KEY(mountain_id)
-- 		REFERENCES mountains(id)
-- ;
