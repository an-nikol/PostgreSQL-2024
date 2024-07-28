CREATE TABLE addresses(
    id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY UNIQUE,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE clients(
    id SERIAL PRIMARY KEY UNIQUE,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drivers(
    id SERIAL PRIMARY KEY UNIQUE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT CHECK ( age > 0 ) NOT NULL,
    rating NUMERIC (10, 2) DEFAULT  5.5 -- not said that it has 10 nums
);

CREATE TABLE cars(
    id SERIAL PRIMARY KEY UNIQUE,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20),
    year INT CHECK ( year > 0 ) DEFAULT 0 NOT NULL,
    mileage INT CHECK ( mileage > 0 ) DEFAULT 0,
    condition CHAR(1) NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_cars_categories
		FOREIGN KEY(category_id)
			REFERENCES categories(id)
                 ON UPDATE CASCADE
                 ON DELETE CASCADE
);

CREATE TABLE courses(
    id SERIAL PRIMARY KEY UNIQUE,
    from_address_id INT NOT NULL,
    CONSTRAINT fk_courses_addresses
		FOREIGN KEY(from_address_id)
			REFERENCES addresses(id)
                ON UPDATE CASCADE
                ON DELETE CASCADE,

    start TIMESTAMP NOT NULL,
    bill NUMERIC(10, 2) CHECK ( bill > 0 ) DEFAULT 10,
    car_id INT NOT NULL,
    CONSTRAINT fk_courses_cars
		FOREIGN KEY(car_id)
			REFERENCES cars(id)
                ON UPDATE CASCADE
                ON DELETE CASCADE,

    client_id INT NOT NULL,
    CONSTRAINT fk_courses_clients
		FOREIGN KEY(client_id)
			REFERENCES clients(id)
                ON UPDATE CASCADE
                ON DELETE CASCADE
);

CREATE TABLE cars_drivers(
    car_id INT NOT NULL,
    driver_id INT NOT NULL,

    CONSTRAINT fk_cars_drivers_cars
		FOREIGN KEY(car_id)
			REFERENCES cars(id)
                ON UPDATE CASCADE
                ON DELETE CASCADE,

    CONSTRAINT fk_cars_drivers_drivers
		FOREIGN KEY(driver_id)
			REFERENCES drivers(id)
                ON UPDATE CASCADE
                ON DELETE CASCADE

);