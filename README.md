# 🛍️ E-Commerce Platform Database Design – Marketash

Welcome to our e-commerce platform database project! This repository contains the Entity-Relationship Diagram (ERD) and SQL script that define the core structure of our platform's backend.

---

## 📌 Project Overview

This project involves the design and documentation of a robust database for an e-commerce system. Our primary tool for modeling was **[dbdiagram.io](https://dbdiagram.io)**, where we visualized and validated our schema.

The database supports various key e-commerce operations including:

- Product listings and variations
- Product attributes and media
- Bidding, logistics, and payment tracking
- AI diagnostic integration for agricultural listings (Marketash-specific)
  
---

## 1️⃣ Entity-Relationship Diagram (ERD)

We used **dbdiagram.io** to create a comprehensive ERD that captures:

- All required tables and attributes
- Relationships via foreign keys
- Constraints such as `PRIMARY KEY`, `FOREIGN KEY`, and `ENUM` values

> ✅ View the ERD here: [INSERT_DB_DIAGRAM_LINK_HERE]

---

## 2️⃣ Data Flow & Architecture

Our database was carefully planned to reflect realistic data flow:
- **Products** are created by **farms**
- Each product has **images**, **attributes**, and **variations** (size, color, grade)
- Buyers interact with **product items** via **bids**
- Upon acceptance, **logistics** and **payments** are tracked
- AI can add **diagnostic records** to products or farms for smart suggestions

We followed an **entity-centric** design with normalized relationships and expansion points for future features like blockchain tracking and recommendation engines.

---

## 3️⃣ Collaboration Workflow

This project was a team effort. We worked together through:

- Regular planning and analysis sessions
- Continuous documentation and ERD updates
- Open communication to ensure everyone understood each table and its role

We used:
- **GitHub** for version control
- **dbdiagram.io** for collaborative schema design

---

## 4️⃣ Submission Checklist

- [x] ✅ ERD created and shared (via dbdiagram.io)
- [x] ✅ SQL file exported (`ecommerce.sql`)
- [x] ✅ GitHub repository created and made public
- [x] ✅ Teamwork and responsibilities clearly outlined

---

## 🗃️ Tables Included

| Table               | Purpose                                                         |
|---------------------|-----------------------------------------------------------------|
| `product_image`     | Stores product image URLs                                       |
| `color`             | Lists all available colors                                      |
| `product_category`  | Organizes products into logical categories                      |
| `product`           | Holds main product data (name, brand, base price, etc.)         |
| `product_item`      | Represents stockable product units                              |
| `brand`             | Lists available brands                                          |
| `product_variation`| Links products to specific variations like size or color         |
| `size_category`     | Classifies different size types (e.g., weight, dimension)       |
| `size_option`       | Lists individual size labels (S, M, L, etc.)                    |
| `product_attribute` | Stores product-specific properties                              |
| `attribute_category`| Groups attributes into categories                               |
| `attribute_type`    | Defines if attributes are `text`, `number`, or `boolean`        |
| `bid`               | Manages user bids on items                                      |
| `diagnostic_record`| Logs AI-powered farm/product diagnoses                           |
| `logistics`         | Tracks delivery status and codes                                |
| `payment`           | Records payment methods and transaction references              |

---

## 💬 Teamwork Reflection

We embraced collaboration through:
- Shared roles in ERD planning and SQL writing
- Open communication and daily sync-ups
- Leveraging GitHub Issues and Commits for versioning and contribution tracking

> 💡 Everyone contributed ideas, reviewed table relationships, and ensured data flow made sense.

---

## 🔗 Resources

- [dbdiagram.io](https://dbdiagram.io)
- [MySQL Docs](https://dev.mysql.com/doc/)
- [Lucidchart](https://www.lucidchart.com/)
- [GitHub](https://github.com)

---

## ✅ Final Note

This project is part of our database design assessment. It shows our ability to structure real-world data, collaborate effectively, and create scalable e-commerce backend infrastructure.

**Team Marketash – "Fresh from the Farm, Straight to You" 🌿**

# e-commerce-Marketash-