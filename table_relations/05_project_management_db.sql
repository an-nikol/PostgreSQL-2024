CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR (30),
    last_name VARCHAR(30),
    project_id INT
);

CREATE TABLE projects(
    id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(id),
    project_lead_id INT REFERENCES employees(id)
);

ALTER TABLE employees
ADD CONSTRAINT employees_projects
    FOREIGN KEY (project_id)
        REFERENCES projects(id)
;