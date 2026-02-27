# 🏠 Retail End-to-End Data Engineering Project

## 📄 Overview

This project implements a complete end-to-end Retail data engineering pipeline using modern cloud-native technologies.

The solution follows analytics engineering best practices using **Snowflake**, **dbt (Data Build Tool)**, and **Azure**, and is designed around the **Medallion Architecture (Bronze, Silver, Gold)**.

The pipeline processes retail **orders, products, users, and reviews** data with incremental loading, transformations, and Slowly Changing Dimensions (SCD Type 2).

---

## 🏗 Architecture

### High-Level Data Flow
Source Data (CSV) → Azure ADLS → Snowflake (Staging) → Bronze Layer → Silver Layer → Gold Layer
                                                           ↓              ↓           ↓
                                                      Raw Tables    Cleaned Data   Analytics

---

## 🧰 Technology Stack

- Cloud Data Warehouse: Snowflake
- Transformation Layer: dbt (Data Build Tool)
- Cloud Storage: Azure ADLS Gen2
- Orchestration: dbt Core / dbt Cloud
- Version Control: Git
- Programming Language: Python 3.12

---

## 📊 Data Model

### Medallion Architecture

#### 🥉 Bronze Layer (Raw Data)
- Raw ingested data from Snowflake landing tables
- Minimal transformations
- Append-only incremental loads

#### 🥈 Silver Layer (Cleaned Data)
- Data cleansing and standardization
- Deduplication and type casting
- Business rules applied

#### 🥇 Gold Layer (Analytics-Ready)
- Fact and dimension tables
- Aggregated metrics
- Optimized for reporting and BI tools

---

## 🕒 Snapshots (SCD Type 2)

Snapshots are implemented using dbt snapshots to track historical changes.

Tracked entities:
- Products
- Users

Features:
- Historical versioning
- Valid from and valid to timestamps
- Full audit trail of changes

---

## 📁 Project Structure

```text
retail_analytics/
├── README.md
├── pyproject.toml
├── main.py
│
├── SourceData/
│   ├── orders.csv
│   ├── products.csv
│   ├── users.csv
│   └── reviews.csv
│
└── retail_analytics/
    ├── dbt_project.yml
    ├── ExampleProfiles.yml
    │
    ├── models/
    │   ├── sources/
    │   │   └── landing_sources.yml
    │   │
    │   ├── bronze/
    │   │   ├── bronze_orders.sql
    │   │   ├── bronze_products.sql
    │   │   ├── bronze_users.sql
    │   │   └── bronze_reviews.sql
    │   │
    │   ├── silver/
    │   │   ├── silver_orders.sql
    │   │   ├── silver_products.sql
    │   │   └── silver_users.sql
    │   │
    │   └── gold/
    │       ├── gold_sales__daily.sql
    │       ├── gold_avg_rating__daily.sql
    │       └── ephemeral/
    │           ├── orders.sql
    │           ├── products.sql
    │           └── users.sql
    │
    ├── macros/
    │   ├── generate_schema_name.sql
    │   ├── multiply_columns.sql
    │   └── current_timestamp.sql
    │
    ├── analyses/
    │   ├── if_else.sql
    │   └── date_spine_demo.sql
    │
    ├── snapshots/
    │   ├── products_snapshot.sql
    │   └── users_snapshot.sql
    │
    ├── tests/
    │   ├── properties.yml
    │   └── non_negative.sql
    │
    └── seeds/
        └── product_categories.csv

