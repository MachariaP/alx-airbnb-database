

# Database Seeding

## Overview

The `seed.sql` file populates the Airbnb-like database with realistic sample data for testing and development, as part of the DataScape: Mastering Database Design project. The data populates the `user`, `property`, `booking`, `payment`, `review`, and `message` tables, simulating real-world scenarios such as guests booking properties, making payments, leaving reviews, and exchanging messages. The script ensures referential integrity, complies with schema constraints, and follows best practices for realism, maintainability, and compatibility.

## Seed Data Details

- **Data Summary**:
  - **user**: 5 users (2 guests: John Mwangi, Mary Kamau; 2 hosts: Aisha Oluwaseun, Chinedu Okeke; 1 admin) with names and unique emails.
  - **property**: 3 properties in Mombasa, Nairobi, and Lagos, owned by hosts, with prices ($75–$120).
  - **booking**: 3 bookings (1 confirmed: $225, 1 pending: $240, 1 canceled: $180) with calculated total prices.
  - **payment**: 2 payments for the confirmed booking (full: $225, partial: $100) using credit card and PayPal.
  - **review**: 2 reviews by John for properties (ratings: 4, 5) with realistic comments.
  - **message**: 2 messages simulating guest-host communication about availability.

- **Real-World Usage**:
  - Reflects a context with names (e.g., Mwangi, Oluwaseun) and locations (e.g., Nairobi, Lagos).
  - Covers diverse scenarios: multiple user roles, booking statuses, payment types, and interactions.
  - Uses future dates (November–December 2025) for bookings to simulate upcoming reservations.

- **Best Practices**:
  - **Referential Integrity**: Foreign keys (e.g., `booking.property_id`, `payment.booking_id`) reference valid primary keys.
  - **Constraint Compliance**: Adheres to `NOT NULL`, `UNIQUE` (`user.email`), `CHECK` (`review.rating` 1-5, `booking.end_date > start_date`, `price_per_night >= 0`).
  - **Realism**: Uses calculated prices (e.g., 3 nights × $75 = $225) and contextually relevant data.
  - **Idempotency**: Includes optional `TRUNCATE` statement (commented out) for clean seeding, with a data loss warning.
  - **Readability**: Clear comments and dependency-ordered inserts.
  - **UUIDs**: Static UUIDs for simplicity; notes for dynamic generation (`uuid_generate_v4()` in PostgreSQL, `UUID()` in MySQL).

## Usage

To populate the database:
1. Apply the schema from Task 2 (`schema.sql`):
   ```bash
   psql -f schema.sql
```
