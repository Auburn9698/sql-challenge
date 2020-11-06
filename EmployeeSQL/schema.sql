-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GhBZ3Q
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE if exists employees CASCADE;

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
-- Import employees csv
SELECT * from employees;

DROP TABLE if exists departments CASCADE;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

--Import departments csv
SELECT * from departments;

DROP TABLE if exists dept_emp CASCADE;

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL
);

--Import dept_emp CSV
SELECT * from dept_emp;

DROP TABLE if exists dept_manager CASCADE;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

--Import dept_manager CSV
SELECT * from dept_manager;

DROP TABLE if exists salaries CASCADE;

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

--Import salaries CSV
SELECT * from salaries;

DROP TABLE if exists titles CASCADE;

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

--Import titles CSV
SELECT * from titles;


ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

