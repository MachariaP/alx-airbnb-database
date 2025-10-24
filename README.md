<div align="center">
    <h1 style="color:blue">🏡 DataScape</h1>
    <p style="color:blue">Mastering Database Design</p>

![GitHub repo size](https://img.shields.io/github/repo-size/MachariaP/alx-airbnb-database) 
![GitHub last commit](https://img.shields.io/github/last-commit/MachariaP/alx-airbnb-database) 
![License](https://img.shields.io/github/license/MachariaP/alx-airbnbe-database) 
</div>

## 📜 Table of Contents
- [1. Project Overview](#1-project-overview)
- [2. Team Roles and Responsibilities](#2-team-roles-and-responsibilities)
- [3. Technology Stack Overview](#3-technology-stack-overview)
- [4. Database Design Overview](#4-database-design-overview)
- [5. Feature Breakdown](#5-feature-breakdown)
- [6. API Security Overview](#6-api-security-overview)
- [7. CI/CD Pipeline Overview](#7-cicd-pipeline-overview)
- [8. Resources](#8-resources)
- [9. License](#9-license)
- [10. Created By](#10-created-by)

---

## 1. Project Overview 🌟
**Brief Description:**  
DataScape is a relational database design project for an Airbnb-like application, enabling users to sign up as hosts, guests, or admins, list properties, book accommodations, submit reviews, process payments, and exchange messages. Part of the ALX Airbnb Database Module, it delivers a scalable, 3NF-normalized database with a robust schema, optimized for data integrity and performance in a production-level environment.

**Project Goals:**  
- 🛠️ Design a comprehensive database schema to support user management, property listings, bookings, reviews, payments, and messaging.  
- 📊 Normalize to 3NF to ensure data integrity and eliminate redundancy.  
- ⚡ Optimize query performance with UUID-based primary keys, indexes, and constraints.  
- 📈 Seed the database with realistic sample data to simulate Airbnb-like functionality.  
- 📝 Document the design process and adhere to professional repository standards.

**Key Tech Stack:**  
SQL (MySQL/PostgreSQL), app.eraser.io for ER diagrams, Git/GitHub for version control.

## 2. Team Roles and Responsibilities 👥
The project assumes a collaborative team structure for a database design project of this scale. Below are the roles and their responsibilities:

| Role                | Key Responsibility                                                                 |
|---------------------|-----------------------------------------------------------------------------------|
| **Database Designer** 🗄️ | Crafts the ER diagram, normalizes the schema to 3NF, and writes SQL DDL scripts.   |
| **Backend Developer** 💻 | Develops SQL DML scripts for seeding data and tests schema functionality.         |
| **QA Engineer** ✅ | Validates schema integrity, constraints, and sample data for 3NF compliance.      |
| **DevOps Engineer** 🚀 | Manages GitHub repository, sets up CI/CD pipelines, and ensures deployment readiness. |
| **Technical Writer** ✍️ | Documents normalization, schema design, and setup instructions clearly.           |

## 3. Technology Stack Overview 🛠️
The project leverages a focused tech stack to design, implement, and document the database. Here’s how each tool contributes:

| Technology           | Purpose in the Project                                                                 |
|----------------------|--------------------------------------------------------------------------------------|
| **MySQL/PostgreSQL** 🗄️ | Relational DBMS for defining and querying the schema with high performance.          |
| **SQL (DDL/DML)** 📜 | Creates tables, constraints, indexes (DDL) and populates sample data (DML).          |
| **app.eraser.io** 🎨 | Web-based tool for crafting the Entity-Relationship Diagram to visualize entities and relationships. |
| **Git/GitHub** 📂 | Version control for managing project files and enabling team collaboration.           |
| **Markdown** 📝 | Formats documentation (e.g., `normalization.md`, `README.md`) for clarity and readability. |

## 4. Database Design Overview 🗃️
**Key Entities:**  
- **User** 👤: Represents hosts, guests, or admins. Attributes: `user_id` (PK, UUID, Indexed), `first_name` (VARCHAR, NOT NULL), `last_name` (VARCHAR, NOT NULL), `email` (VARCHAR, UNIQUE, NOT NULL), `password_hash` (VARCHAR, NOT NULL), `phone_number` (VARCHAR, NULL), `role` (ENUM: guest, host, admin, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP).  
- **Property** 🏠: Represents rentable properties. Attributes: `property_id` (PK, UUID, Indexed), `host_id` (FK to User.user_id), `name` (VARCHAR, NOT NULL), `description` (TEXT, NOT NULL), `location` (VARCHAR, NOT NULL), `pricepernight` (DECIMAL, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP), `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP).  
- **Booking** 📅: Represents guest reservations. Attributes: `booking_id` (PK, UUID, Indexed), `property_id` (FK to Property.property_id), `user_id` (FK to User.user_id), `start_date` (DATE, NOT NULL), `end_date` (DATE, NOT NULL), `total_price` (DECIMAL, NOT NULL), `status` (ENUM: pending, confirmed, canceled, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP).  
- **Payment** 💳: Represents booking transactions. Attributes: `payment_id` (PK, UUID, Indexed), `booking_id` (FK to Booking.booking_id), `amount` (DECIMAL, NOT NULL), `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP), `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL).  
- **Review** ⭐: Represents guest feedback. Attributes: `review_id` (PK, UUID, Indexed), `property_id` (FK to Property.property_id), `user_id` (FK to User.user_id), `rating` (INTEGER, CHECK: 1-5, NOT NULL), `comment` (TEXT, NOT NULL), `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP).  
- **Message** 💬: Represents communication between users. Attributes: `message_id` (PK, UUID, Indexed), `sender_id` (FK to User.user_id), `recipient_id` (FK to User.user_id), `message_body` (TEXT, NOT NULL), `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP).

**Relationships:**  
- **User to Property (One-to-Many)** 🔗: A host (`role = host`) can list multiple properties, linked via `Property.host_id` to `User.user_id`.  
- **Property to Booking (One-to-Many)** 📅: A property can have multiple bookings, linked via `Booking.property_id` to `Property.property_id`.  
- **Booking to Payment (One-to-Many)** 💳: A booking can have multiple payments, linked via `Payment.booking_id` to `Booking.booking_id`.

## 5. Feature Breakdown 🚀
- **User Sign-Up** 👤: Users register as hosts, guests, or admins with a unique `email` and secure `password_hash`, with the `role` field enabling role-specific actions.  
- **Property Listing** 🏠: Hosts create property listings with details like `location` and `pricepernight`, supporting scalable search and filtering.  
- **Booking System** 📅: Guests book properties for specific dates (`start_date`, `end_date`), with `status` tracking for efficient reservation management.  
- **Payment Processing** 💳: Processes payments for bookings with methods like credit card or PayPal, ensuring secure transaction tracking.  
- **Property Reviews** ⭐: Guests submit ratings (1-5) and comments, fostering trust and enabling quality metrics.  
- **Messaging System** 💬: Users communicate via messages, supporting host-guest interactions for bookings or inquiries.

## 6. API Security Overview 🔒
While the project focuses on database design, future API integration requires robust security measures:

- **Authentication (JWT/OAuth)** 🔑: Verifies user identity for secure access to endpoints like booking or messaging, protecting sensitive actions.  
- **Input Validation** 🛡️: Sanitizes inputs (e.g., `rating`, `message_body`) to prevent SQL injection and ensure data integrity.  
- **Rate Limiting** ⏳: Caps API requests per user to prevent abuse and maintain system performance.  
- **Data Encryption** 🔐: Encrypts sensitive data (e.g., `password_hash`) during transmission and storage to safeguard user privacy.  
- **Role-Based Access Control** 🚪: Restricts actions (e.g., property listing to `role = host`, admin tasks to `role = admin`) for proper authorization.

## 7. CI/CD Pipeline Overview ⚙️
The project employs a **GitHub Actions** CI/CD pipeline to streamline development and deployment of database scripts. The pipeline automates syntax validation of SQL scripts (`schema.sql`, `seed.sql`), checks schema integrity (e.g., foreign key constraints, ENUM values), and verifies required files (`requirements.md`, `normalization.md`). This setup ensures error-free deployments to a staging database (MySQL/PostgreSQL), provides rapid feedback to collaborators, and enhances scalability and team efficiency.

## 8. Resources 📚
- [MySQL Documentation](https://dev.mysql.com/doc/) 📖: Official guide for SQL syntax and best practices.  
- [PostgreSQL Documentation](https://www.postgresql.org/docs/) 📖: Reference for alternative RDBMS schema design.  
- [app.eraser.io](https://app.eraser.io/) 🎨: Web-based tool for creating the ER diagram.  
- [GitHub Docs](https://docs.github.com/) 📂: Guide for repository management and CI/CD setup.  
- [Database Normalization Guide](https://www.geeksforgeeks.org/normalization-process-in-dbms/) 📊: Resource for mastering 3NF principles.

## 9. License 📜
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## 10. Created By ✍️
**Phinehas Macharia**

---

✨ **Happy Coding!** ✨
