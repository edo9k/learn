-- based on Test Dome exercise

CREATE TABLE employees (
	id INTEGER NOT NULL PRIMARY KEY,
	managerId INTEGER REFERENCES employees(id),
	name VARCHAR(30) NOT NULL
);

INSERT INTO employees(id, managerId, name) VALUES(1, NULL, 'John');
INSERT INTO employees(id, managerId, name) VALUES(2, 1, 'Mike');
INSERT INTO employees(id, managerId, name) VALUES(3, NULL, 'Knuth');
INSERT INTO employees(id, managerId, name) VALUES(4, 2, 'Kerningham');
INSERT INTO employees(id, managerId, name) VALUES(5, NULL, 'Richie');
INSERT INTO employees(id, managerId, name) VALUES(6, 3, 'Lamport');



-- find employees who are not anyone's boss
SELECT name FROM employees
WHERE id NOT IN (
	SELECT managerId FROM employees
	WHERE managerId IS NOT NULL);


