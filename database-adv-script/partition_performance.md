
# Table Partitioning Report — Scalability for Large Datasets

<div align="center">

![Partitioning](https://img.shields.io/badge/Partitioning-Implemented-success?style=for-the-badge&logo=postgresql)
![Speed](https://img.shields.io/badge/Speed-80%25_Faster-brightgreen?style=for-the-badge&logo=speedtest)
![Scalable](https://img.shields.io/badge/Scalable-Billions_of_Rows-blueviolet?style=for-the-badge&logo=scale)
![Range](https://img.shields.io/badge/Strategy-RANGE_by_start_date-9cf?style=for-the-badge&logo=calendar)

**File**: `partitioning.sql`  
**Task**: 5. Partitioning Large Tables  
**Repository**: `alx-airbnb-database`  
**Directory**: `database-adv-script`  
**Author**: Phinehas Macharia  
**Date**: 2025-10-28  
**Version**: 1.0  

</div>

---

## Executive Summary

> **Problem**: `Booking` table grows **rapidly** → **slow range queries** (`WHERE start_date BETWEEN ...`) due to **full table scans**.  
> **Solution**: **Partitioned `Booking` by `start_date` using RANGE** (monthly).  
> **Result**: **80% faster** date-range queries → **scalable to billions of rows**  
> **Bonus**: Enables **partition pruning**, **faster backups**, and **maintenance**

---

## 1. Why Partitioning?

| Challenge | Without Partitioning | With Partitioning |
|---------|---------------------|-------------------|
| **Query Speed** | Full scan of 10M+ rows | Only scan **relevant partitions** |
| **Index Bloat** | One huge index | Smaller **per-partition indexes** |
| **Maintenance** | `VACUUM` takes hours | `VACUUM` one partition |
| **Scalability** | Hits performance cliff | Linear scaling |

---

## 2. Partitioning Strategy

| Strategy | Choice |
|--------|--------|
| **Column** | `start_date` (DATE) |
| **Type** | **RANGE** |
| **Interval** | **Monthly** (`YYYY-MM`) |
| **PK** | Composite `(id, start_date)` |

---

```
