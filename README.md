# ALX Airbnb Database

## 📄 Description
This project is part of the ALX Software Engineering program. It focuses on designing and implementing a robust database for an Airbnb clone using **SQLAlchemy** and **MySQL**. The goal is to create a scalable and efficient data model to manage core application data, including users, properties, bookings, payments, reviews, and messages.

The project involves:
- Defining database entities and their relationships.
- Mapping Python classes to database tables using SQLAlchemy's ORM capabilities.
- Implementing a command-line interpreter for interacting with the database.

---

## 🗂️ Database Specification

### Entities and Attributes

#### **User**
- `user_id`: Primary Key, UUID, Indexed
- `first_name`: `VARCHAR`, NOT NULL
- `last_name`: `VARCHAR`, NOT NULL
- `email`: `VARCHAR`, UNIQUE, NOT NULL
- `password_hash`: `VARCHAR`, NOT NULL
- `phone_number`: `VARCHAR`, NULL
- `role`: `ENUM` (`guest`, `host`, `admin`), NOT NULL
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

#### **Property**
- `property_id`: Primary Key, UUID, Indexed
- `host_id`: Foreign Key, references `User(user_id)`
- `name`: `VARCHAR`, NOT NULL
- `description`: `TEXT`, NOT NULL
- `location`: `VARCHAR`, NOT NULL
- `price_per_night`: `DECIMAL`, NOT NULL
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`
- `updated_at`: `TIMESTAMP`, ON UPDATE `CURRENT_TIMESTAMP`

#### **Booking**
- `booking_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `start_date`: `DATE`, NOT NULL
- `end_date`: `DATE`, NOT NULL
- `total_price`: `DECIMAL`, NOT NULL
- `status`: `ENUM` (`pending`, `confirmed`, `canceled`), NOT NULL
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

#### **Payment**
- `payment_id`: Primary Key, UUID, Indexed
- `booking_id`: Foreign Key, references `Booking(booking_id)`
- `amount`: `DECIMAL`, NOT NULL
- `payment_date`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`
- `payment_method`: `ENUM` (`credit_card`, `paypal`, `stripe`), NOT NULL

#### **Review**
- `review_id`: Primary Key, UUID, Indexed
- `property_id`: Foreign Key, references `Property(property_id)`
- `user_id`: Foreign Key, references `User(user_id)`
- `rating`: `INTEGER`, CHECK: `rating >= 1 AND rating <= 5`, NOT NULL
- `comment`: `TEXT`, NOT NULL
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

#### **Message**
- `message_id`: Primary Key, UUID, Indexed
- `sender_id`: Foreign Key, references `User(user_id)`
- `recipient_id`: Foreign Key, references `User(user_id)`
- `message_body`: `TEXT`, NOT NULL
- `sent_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`

---

## 🔒 Constraints

### **User Table**
- Unique constraint on `email`.
- Non-null constraints on required fields.

### **Property Table**
- Foreign key constraint on `host_id`.
- Non-null constraints on essential attributes.

### **Booking Table**
- Foreign key constraints on `property_id` and `user_id`.
- `status` must be one of `pending`, `confirmed`, or `canceled`.

### **Payment Table**
- Foreign key constraint on `booking_id`, ensuring payments are linked to valid bookings.

### **Review Table**
- Constraints on `rating` values (`1-5`).
- Foreign key constraints on `property_id` and `user_id`.

### **Message Table**
- Foreign key constraints on `sender_id` and `recipient_id`.

---

## 📊 Indexing
- **Primary Keys**: Automatically indexed.
- **Additional Indexes**:
  - `email` in the **User** table.
  - `property_id` in the **Property** and **Booking** tables.
  - `booking_id` in the **Booking** and **Payment** tables.

---

## 🛠️ Technologies Used
- **SQLAlchemy**: ORM for database modeling and interaction.
- **MySQL**: Relational database for data storage.
- **Python**: Programming language for implementing the database models and command-line interpreter.

---

## 🚀 Features
- Comprehensive data model for managing users, properties, bookings, payments, reviews, and messages.
- Enforced data integrity through constraints and relationships.
- Optimized database performance with indexing and normalization.
- Scalable design to handle future growth and additional features.

---

## 📌 Future Enhancements
- Implement advanced analytics for user and property data.
- Add support for data archiving and retention policies.
- Introduce caching mechanisms for frequently accessed data.
- Enhance the command-line interpreter with more advanced query capabilities.

---

This README provides a clear and professional overview of the database design and its features. Let me know if you need further refinements!