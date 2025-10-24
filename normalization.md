
# Database Normalization

This document outlines the normalization process applied to the Airbnb-like database designed for the DataScape project. The goal is to ensure the database adheres to the Third Normal Form (3NF) by reviewing the schema for redundancies or violations of normalization principles and making adjustments if necessary. The provided schema was analyzed, and the steps to confirm or achieve 1NF, 2NF, and 3NF are detailed below.

## First Normal Form (1NF)

**Objective**: Ensure all attributes are atomic, there are no repeating groups, and each table has a primary key.

**Analysis**:
- **Atomic Attributes**: All attributes in the provided schema are atomic (e.g., `email` in User is VARCHAR(100), `pricepernight` in Property is DECIMAL(10,2)). No multi-valued attributes or repeating groups exist.
- **Primary Keys**: Each table has a unique primary key (UUID) that uniquely identifies each record:
  - User: `user_id`
  - Property: `property_id`
  - Booking: `booking_id`
  - Payment: `payment_id`
  - Review: `review_id`
  - Message: `message_id`
- **No Repeating Groups**: The schema does not include nested or repeating groups (e.g., no arrays or lists within columns).

**Conclusion**: The schema satisfies 1NF, as all attributes are atomic, each table has a primary key, and there are no repeating groups.

## Second Normal Form (2NF)

**Objective**: Ensure the schema is in 1NF, and all non-key attributes fully depend on the entire primary key (no partial dependencies).

**Analysis**:
- **Single-Column Primary Keys**: All tables (User, Property, Booking, Payment, Review, Message) use a single-column primary key (UUID). Since there are no composite keys, partial dependencies are not possible.
- **Dependency Check**:
  - In the **User** table, attributes like `first_name`, `last_name`, and `email` depend entirely on `user_id`.
  - In the **Property** table, attributes like `name`, `description`, and `pricepernight` depend on `property_id`, not on the foreign key `host_id`.
  - Similar checks confirm that non-key attributes in Booking, Payment, Review, and Message depend fully on their respective primary keys.

**Conclusion**: The schema satisfies 2NF, as all non-key attributes depend fully on their single-column primary keys, and no partial dependencies exist.

## Third Normal Form (3NF)

**Objective**: Ensure the schema is in 2NF, and no non-key attributes depend on other non-key attributes (no transitive dependencies).

**Analysis**:
- **Transitive Dependency Check**:
  - **User**: Attributes like `first_name`, `last_name`, `email`, and `role` depend only on `user_id`. The `email` attribute has a UNIQUE constraint, but this does not introduce transitive dependencies.
  - **Property**: Attributes like `name`, `description`, `location`, and `pricepernight` depend on `property_id`. The `host_id` (foreign key) references User, but no non-key attribute depends on `host_id` (e.g., `location` is not derived from `host_id`).
  - **Booking**: Attributes like `start_date`, `end_date`, `total_price`, and `status` depend on `booking_id`. Foreign keys (`property_id`, `user_id`) ensure referential integrity, but no transitive dependencies exist (e.g., `total_price` is not derived from `start_date`).
  - **Payment**: Attributes like `amount` and `payment_method` depend on `payment_id`, not on the foreign key `booking_id`.
  - **Review**: Attributes like `rating` and `comment` depend on `review_id`. The CHECK constraint on `rating` (1-5) is independent of other attributes.
  - **Message**: Attributes like `message_body` and `sent_at` depend on `message_id`, not on `sender_id` or `recipient_id`.
- **Potential Redundancies**:
  - The `location` attribute in Property (VARCHAR(100)) is atomic and does not include composite data (e.g., city, country). If it did, a separate Location table might be needed to eliminate transitive dependencies. In this case, no such split is required.
  - No other non-key attributes depend on other non-key attributes across the schema.

**Conclusion**: The schema satisfies 3NF, as no transitive dependencies were identified, and all non-key attributes depend solely on their respective primary keys.

## Adjustments Made

No adjustments were necessary, as the provided schema is already in 3NF. The design effectively minimizes redundancy and ensures data integrity through:
- Appropriate use of primary keys (UUID) and foreign keys for referential integrity.
- Constraints like UNIQUE (e.g., User.email), NOT NULL, and CHECK (e.g., Review.rating).
- Atomic attributes, preventing the need for further decomposition.

## Summary

The Airbnb-like database schema complies with 1NF, 2NF, and 3NF:
- **1NF**: All attributes are atomic, tables have primary keys, and no repeating groups exist.
- **2NF**: No partial dependencies exist, as all tables use single-column primary keys.
- **3NF**: No transitive dependencies were found, and the schema is optimized for data integrity and efficiency.

The schema is well-structured for scalability and performance, ready for implementation in the subsequent tasks of schema creation and data seeding.

---
