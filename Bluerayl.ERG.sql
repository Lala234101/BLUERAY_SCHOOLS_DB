-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.courses
(
    course_id serial NOT NULL,
    code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    credits integer NOT NULL,
    department_id integer,
    teacher_id integer,
    CONSTRAINT courses_pkey PRIMARY KEY (course_id),
    CONSTRAINT courses_code_key UNIQUE (code)
);

CREATE TABLE IF NOT EXISTS public.department
(
    department_id serial NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    head_teacher_id integer,
    description text COLLATE pg_catalog."default",
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS public.enrollments
(
    enrollment_id serial NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date DEFAULT CURRENT_DATE,
    status character varying(20) COLLATE pg_catalog."default" DEFAULT 'Enrolled'::character varying,
    CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id),
    CONSTRAINT enrollments_student_id_course_id_key UNIQUE (student_id, course_id)
);

CREATE TABLE IF NOT EXISTS public.students
(
    student_id serial NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    phone character varying(15) COLLATE pg_catalog."default",
    enrollment_date date DEFAULT CURRENT_DATE,
    status character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT students_pkey PRIMARY KEY (student_id),
    CONSTRAINT students_email_key UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS public.teachers
(
    teacher_id serial NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    phone character varying(15) COLLATE pg_catalog."default",
    hire_date date DEFAULT CURRENT_DATE,
    qualification text COLLATE pg_catalog."default",
    department_id integer,
    CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id),
    CONSTRAINT teachers_email_key UNIQUE (email)
);

ALTER TABLE IF EXISTS public.courses
    ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id)
    REFERENCES public.department (department_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.courses
    ADD CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id)
    REFERENCES public.teachers (teacher_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.enrollments
    ADD CONSTRAINT fk_course_id FOREIGN KEY (course_id)
    REFERENCES public.courses (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.enrollments
    ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id)
    REFERENCES public.students (student_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.teachers
    ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id)
    REFERENCES public.department (department_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;