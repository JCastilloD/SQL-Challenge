-- DROP TABLE "employees" CASCADE; -- TEST CODE
-- DROP TABLE "departments" CASCADE;
-- DROP TABLE "dept_emp" CASCADE;
-- DROP TABLE "dept_manager" CASCADE;
-- DROP TABLE "salaries" CASCADE;
-- DROP TABLE "titles" CASCADE;

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no","dept_no"),
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no")REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("dept_no","emp_no"), -- Using a compund key to make it unique
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no")REFERENCES "departments" ("dept_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no"),
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no", "title", "from_date"), -- Using a compund key to make it unique
	FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);


