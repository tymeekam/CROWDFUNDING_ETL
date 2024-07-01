﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE "TITLES" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" TEXT   NOT NULL,
    CONSTRAINT "pk_TITLES" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "DEPARTMENTS" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" TEXT   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "EMPLOYEES" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "DEPARTMENT_MGR" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "DEPARTMENT_EMPLYEE" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL
);

CREATE TABLE "SALARIES" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "TITLES" ("title_id");

ALTER TABLE "DEPARTMENT_MGR" ADD CONSTRAINT "fk_DEPARTMENT_MGR_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPARTMENT_EMPLYEE" ADD CONSTRAINT "fk_DEPARTMENT_EMPLYEE_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

ALTER TABLE "DEPARTMENT_EMPLYEE" ADD CONSTRAINT "fk_DEPARTMENT_EMPLYEE_dept_no" FOREIGN KEY("dept_no")
REFERENCES "DEPARTMENTS" ("dept_no");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_emp_no" FOREIGN KEY("emp_no")
REFERENCES "EMPLOYEES" ("emp_no");

