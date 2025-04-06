# Blueray Schools Database Project

# Overview

This project is a comprehensive database system designed for Blueray Schools to manage student information, course offerings, teacher assignments, and enrollment records. The database follows a relational model with proper normalization to ensure data integrity and efficient querying.

# Database Schema
The database consists of five main tables:

1. Students - Stores student personal information and academic status

2. Departments - Contains department information within the school

3. Teachers - Maintains teacher records and their department assignments

4. Courses - Tracks all courses offered by the school

5. Enrollments - Manages student course registrations

# Key Features
* Relational Structure: Well-defined relationships between entities (one-to-many, many-to-many)

* Data Integrity: Primary keys, foreign keys, and constraints ensure data consistency

* Normalization: Properly normalized schema (3NF) to minimize redundancy

* Comprehensive Documentation: Detailed schema documentation and example queries

# Installation
1. Clone this repository

2. Execute the SQL scripts in the following order:

CREATE_ALTER.txt (creates tables and establishes relationships)

INSERT.txt (populates the database with sample data)

3. Optionally run the example queries from joins.txt to test the database
