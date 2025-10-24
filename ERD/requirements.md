# Mastering Database Design

## Entities and Relationships in ER Diagram

This document outlines the Entity-Relationship (ER) diagram for an Airbnb-like application, designed as part of the DataScape project. The ER diagram visualizes the database structure, capturing all entities, their attributes, and the relationships between them. The diagram ensures a robust and scalable relational database, adhering to industry standards for design and clarity.

### Entities and Attributes

The database comprises six core entities, each with specific attributes and constraints to model the functionality of an Airbnb-like platform. Below is a detailed breakdown of each entity and its attributes:

- **User**
  - `user_id`: UUID, Primary Key, Indexed
  - `first_name`: VARCHAR(50), NOT NULL
  - `last_name`: VARCHAR(50), NOT NULL
  - `email`: VARCHAR(100), UNIQUE, NOT NULL
  - `password_hash`: VARCHAR(255), NOT NULL
  - `phone_number`: VARCHAR(20), NULL
  - `role`: ENUM('guest', 'host', 'admin'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

- **Property**
  - `property_id`: UUID, Primary Key, Indexed
  - `host_id`: UUID, Foreign Key (references User(user_id)), NOT NULL
  - `name`: VARCHAR(100), NOT NULL
  - `description`: TEXT, NOT NULL
  - `location`: VARCHAR(100), NOT NULL
  - `pricepernight`: DECIMAL(10,2), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

- **Booking**
  - `booking_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property(property_id)), NOT NULL
  - `user_id`: UUID, Foreign Key (references User(user_id)), NOT NULL
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `total_price`: DECIMAL(10,2), NOT NULL
  - `status`: ENUM('pending', 'confirmed', 'canceled'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

- **Payment**
  - `payment_id`: UUID, Primary Key, Indexed
  - `booking_id`: UUID, Foreign Key (references Booking(booking_id)), NOT NULL
  - `amount`: DECIMAL(10,2), NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL

- **Review**
  - `review_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property(property_id)), NOT NULL
  - `user_id`: UUID, Foreign Key (references User(user_id)), NOT NULL
  - `rating`: INTEGER, NOT NULL, CHECK (rating >= 1 AND rating <= 5)
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

- **Message**
  - `message_id`: UUID, Primary Key, Indexed
  - `sender_id`: UUID, Foreign Key (references User(user_id)), NOT NULL
  - `recipient_id`: UUID, Foreign Key (references User(user_id)), NOT NULL
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Entity Relationships

The relationships between entities are defined to reflect the interactions in an Airbnb-like system. The relationships are as follows:

- **User to Property**: **One-to-Many**
  - A User (acting as a host) can own multiple Properties, but each Property is associated with exactly one host (via `host_id`).
- **User to Booking**: **One-to-Many**
  - A User (acting as a guest) can make multiple Bookings, but each Booking is linked to one User (via `user_id`).
- **Property to Booking**: **One-to-Many**
  - A Property can have multiple Bookings, but each Booking is associated with one Property (via `property_id`).
- **Booking to Payment**: **One-to-Many**
  - A Booking can have multiple Payments (e.g., partial payments), but each Payment is linked to one Booking (via `booking_id`).
- **Property to Review**: **One-to-Many**
  - A Property can have multiple Reviews, but each Review is associated with one Property (via `property_id`).
- **User to Review**: **One-to-Many**
  - A User can write multiple Reviews, but each Review is linked to one User (via `user_id`).
- **User to Message**: **Many-to-Many**
  - A User can send and receive multiple Messages, modeled through `sender_id` and `recipient_id` in the Message entity.

### Entity-Relationship Diagram

The ER diagram was created using **Draw.io** to visually represent the entities, attributes, and relationships described above. The diagram includes:

- **Entities** as rectangles, with attributes listed (primary keys underlined).
- **Relationships** as lines with cardinality indicators (e.g., 1:N for User to Property).
- **Constraints** such as UNIQUE (e.g., User.email), NOT NULL, and CHECK (e.g., Review.rating).

Below is the ER diagram for the Airbnb-like database:

![ER Diagram](erd_diagram.png)

---
