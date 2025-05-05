# ALX Airbnb Database Schema

## 📄 Description
This project is part of the ALX Software Engineering program and focuses on designing a robust database schema for an Airbnb clone. The schema is implemented using **SQLAlchemy** and **MySQL**, ensuring scalability, efficiency, and data integrity. It supports core functionalities such as user management, property listings, bookings, payments, reviews, and messaging.

---

## 🗂️ Database Schema Overview

### **1. User Table**
- **Purpose**: Stores user information, including authentication details and roles.
- **Attributes**:
  - `user_id`: Primary Key, UUID, Indexed
  - `first_name`: `VARCHAR`, NOT NULL
  - `last_name`: `VARCHAR`, NOT NULL
  - `email`: `VARCHAR`, UNIQUE, NOT NULL
  - `password_hash`: `VARCHAR`, NOT NULL
  - `phone_number`: `VARCHAR`, NULL
  - `role`: `ENUM` (`guest`, `host`, `admin`), NOT NULL
  - `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

### **2. Property Table**
- **Purpose**: Stores property details listed by hosts.
- **Attributes**:
  - `property_id`: Primary Key, UUID, Indexed
  - `host_id`: Foreign Key, references `User(user_id)`
  - `name`: `VARCHAR`, NOT NULL
  - `description`: `TEXT`, NOT NULL
  - `location`: `VARCHAR`, NOT NULL
  - `price_per_night`: `DECIMAL`, NOT NULL
  - `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`
  - `updated_at`: `TIMESTAMP`, ON UPDATE `CURRENT_TIMESTAMP`

### **3. Booking Table**
- **Purpose**: Manages property bookings by users.
- **Attributes**:
  - `booking_id`: Primary Key, UUID, Indexed
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `start_date`: `DATE`, NOT NULL
  - `end_date`: `DATE`, NOT NULL
  - `total_price`: `DECIMAL`, NOT NULL
  - `status`: `ENUM` (`pending`, `confirmed`, `canceled`), NOT NULL
  - `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

### **4. Payment Table**
- **Purpose**: Tracks payments for bookings.
- **Attributes**:
  - `payment_id`: Primary Key, UUID, Indexed
  - `booking_id`: Foreign Key, references `Booking(booking_id)`
  - `amount`: `DECIMAL`, NOT NULL
  - `payment_date`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`
  - `payment_method`: `ENUM` (`credit_card`, `paypal`, `stripe`), NOT NULL

### **5. Review Table**
- **Purpose**: Stores user reviews and ratings for properties.
- **Attributes**:
  - `review_id`: Primary Key, UUID, Indexed
  - `property_id`: Foreign Key, references `Property(property_id)`
  - `user_id`: Foreign Key, references `User(user_id)`
  - `rating`: `INTEGER`, CHECK: `rating >= 1 AND rating <= 5`, NOT NULL
  - `comment`: `TEXT`, NOT NULL
  - `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

### **6. Message Table**
- **Purpose**: Manages messages exchanged between users.
- **Attributes**:
  - `message_id`: Primary Key, UUID, Indexed
  - `sender_id`: Foreign Key, references `User(user_id)`
  - `recipient_id`: Foreign Key, references `User(user_id)`
  - `message_body`: `TEXT`, NOT NULL
  - `sent_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

---

## 🔒 Constraints and Relationships
- **User Table**:
  - Unique constraint on `email`.
  - Non-null constraints on required fields.
- **Property Table**:
  - Foreign key constraint on `host_id`.
- **Booking Table**:
  - Foreign key constraints on `property_id` and `user_id`.
  - `status` must be one of `pending`, `confirmed`, or `canceled`.
- **Payment Table**:
  - Foreign key constraint on `booking_id`.
- **Review Table**:
  - Constraints on `rating` values (`1-5`).
  - Foreign key constraints on `property_id` and `user_id`.
- **Message Table**:
  - Foreign key constraints on `sender_id` and `recipient_id`.

---

## 📊 Indexing
- **Primary Keys**: Automatically indexed.
- **Additional Indexes**:
  - `email` in the **User** table.
  - `property_id` in the **Property** and **Booking** tables.
  - `booking_id` in the **Booking** and **Payment** tables.

---

## 🚀 Features
- Comprehensive schema for managing users, properties, bookings, payments, reviews, and messages.
- Enforced data integrity through constraints and relationships.
- Optimized database performance with indexing and normalization.
- Scalable design to handle future growth and additional features.

---

## 📌 Future Enhancements
- Add support for advanced analytics and reporting.
- Implement caching mechanisms for frequently accessed data.
- Introduce data archiving and retention policies.
- Enhance the schema to support additional features like wishlists and promotions.

---