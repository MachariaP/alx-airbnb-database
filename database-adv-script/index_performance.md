

# Index Performance Analysis Report

<div align="center">

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Performance](https://img.shields.io/badge/Performance-Optimized-success?style=for-the-badge)
![Indexes](https://img.shields.io/badge/Indexes-3_Created-blue?style=for-the-badge)

**File**: `database_index.sql`  
**Task**: 3. Implement Indexes for Optimization  
**Repository**: `alx-airbnb-database`  
**Directory**: `database-adv-script`  
**Author**: Phinehas Macharia  
**Date**: 2025-10-28

</div>

---

## Objective

> **Goal**: Identify high-usage columns → Create **BTREE indexes** → Prove **performance gains** with `EXPLAIN ANALYZE`

---

## High-Usage Columns Identified

| Table       | Column         | Usage Context |
|-------------|----------------|---------------|
| `Booking`   | `user_id`      | `JOIN`, `GROUP BY`, `WHERE` |
| `Booking`   | `property_id`  | `JOIN`, `GROUP BY`, `ORDER BY` |
| `User`      | `id` (PK)      | `JOIN` key |
| `Property`  | `id` (PK)      | `JOIN` key |

> **Insight**: Foreign keys in `Booking` are **not auto-indexed** → **prime candidates**

---

## Indexes Created (`database_index.sql`)

```sql
-- Fast user lookups & aggregations
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Fast property joins & ranking
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Multi-column filter queries
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);
```
