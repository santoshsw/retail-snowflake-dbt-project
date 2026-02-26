# 🏠 Retail End-to-End Data Engineering Project 🏠

## 📄 Overview

This project implements a complete end-to-end data engineering pipeline using
modern cloud data technologies.

The solution demonstrates best practices in data warehousing using
**Snowflake**, **dbt (Data Build Tool)**, and **Azure**.

The pipeline processes Retail orders, products, users, and reviews data using a
**Medallion Architecture (Bronze, Silver, Gold)** with incremental loading and
Slowly Changing Dimensions (SCD Type 2).

---

## 🏗 Architecture

### Data Flow

Source Data (CSV) → Azure ADLS → Snowflake (Staging) → Bronze Layer → Silver Layer → Gold Layer

                                                        Raw Tables    Cleaned Data   Analytics



---

## 🧰 Technology Stack

- **Cloud Data Warehouse:** Snowflake  
- **Transformation Layer:** dbt (Data Build Tool)  
- **Cloud Storage:** Azure ADLS Gen2  
- **Orchestration:** dbt Cloud / dbt Core  
- **Version Control:** Git  
- **Programming Language:** Python 3.12  

---

## 📊 Data Model

### Medallion Architecture

#### 🥉 Bronze Layer (Raw Data)
- Raw ingested tables from Snowflake staging
- Minimal transformations
- Append-only incremental loads

#### 🥈 Silver Layer (Cleaned Data)
- Data cleansing and standardization
- Business rules applied
- Deduplication and type casting

#### 🥇 Gold Layer (Analytics-Ready)
- Fact and dimension tables
- Optimized for BI and reporting
- Aggregated metrics

---

## 🕒 Snapshots (SCD Type 2)

- Implemented using dbt snapshots
- Tracks historical changes for:
  - Products
  - Users
- Preserves previous values with validity periods

---

## 📁 Project Structure

```text
retail_analytics/
├── README.md                           # This file
├── pyproject.toml                      # Python dependencies
├── main.py                             # Main execution script
│
├── SourceData/                         # Raw CSV data files
│   ├── orders.csv
│   ├── products.csv
│   └── users.csv 
│   └── reviews.csv
│
│
└── retail_analytics/                   # Main dbt project
    ├── dbt_project.yml                 # dbt project configuration
    ├── ExampleProfiles.yml             # Snowflake connection profile
    │
    ├── models/                         # dbt models
    │   ├── sources/
    │   │   └── landing_sources.yml     # Source definitions
    │   ├── bronze/                     # Raw data layer
    │   │   ├── bronze_orders.sql
    │   │   ├── bronze_products.sql
    │   │   ├── bronze_users.sql 
    │   │   └── bronze_reviewss.sql
    │   ├── silver/                     # Cleaned data layer
    │   │   ├── silver_orders.sql
    │   │   ├── silver_products.sql
    │   │   └── silver_users.sql
    │   └── gold/                       # Analytics layer
    │       ├── gold_sales__daily.sql
    │       ├── gold_avg_rating__daily.sql
    │       └── ephemeral/              # Temporary models
    │           ├── orders.sql
    │           ├── products.sql
    │           └── users.sql
    │
    ├── macros/                         # Reusable SQL functions
    │   ├── generate_schema_name.sql    # Custom schema naming
    │   ├── multiply_columns.sql        # Math operations
    │   └── current_timestamp.sql       # Timestamp logic
    │
    ├── analyses/                       # Ad-hoc analysis queries
    │   ├── if_else.sql
    │   └── date_spine_demo.sql
    │
    ├── snapshots/                      # SCD Type 2 configurations
    │   ├── products_snapshot.sql
    │   └── users_snapshot.sql
    │
    ├── tests/                          # Data quality tests
    │   └── properties.yml
    │   └── non_negative.sql
    │
    └── seeds/                          # Static reference data
          └── product_categories.csv
