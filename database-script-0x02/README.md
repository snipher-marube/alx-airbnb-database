# ALX Airbnb Database - Data Insertion Scripts

## 📄 Description
This directory contains scripts designed to populate the **ALX Airbnb Database** with initial data based on the defined schema. These scripts ensure that the database is seeded with meaningful and consistent data for testing and development purposes.

---

## 🗂️ Scripts Overview

### **1. User Data Insertion**
- **Script**: `insert_users.sql`
- **Purpose**: Inserts sample user data into the `User` table.
- **Details**:
  - Includes users with different roles (`guest`, `host`, `admin`).
  - Ensures unique email addresses and valid data for all required fields.

### **2. Property Data Insertion**
- **Script**: `insert_properties.sql`
- **Purpose**: Inserts sample property listings into the `Property` table.
- **Details**:
  - Associates properties with valid `host_id` values from the `User` table.
  - Includes diverse property types, locations, and price ranges.

### **3. Booking Data Insertion**
- **Script**: `insert_bookings.sql`
- **Purpose**: Inserts sample booking records into the `Booking` table.
- **Details**:
  - Links bookings to valid `property_id` and `user_id` values.
  - Includes various booking statuses (`pending`, `confirmed`, `canceled`).

### **4. Payment Data Insertion**
- **Script**: `insert_payments.sql`
- **Purpose**: Inserts sample payment records into the `Payment` table.
- **Details**:
  - Associates payments with valid `booking_id` values.
  - Includes different payment methods (`credit_card`, `paypal`, `stripe`).

### **5. Review Data Insertion**
- **Script**: `insert_reviews.sql`
- **Purpose**: Inserts sample reviews into the `Review` table.
- **Details**:
  - Links reviews to valid `property_id` and `user_id` values.
  - Includes ratings between 1 and 5, along with sample comments.

### **6. Message Data Insertion**
- **Script**: `insert_messages.sql`
- **Purpose**: Inserts sample messages into the `Message` table.
- **Details**:
  - Links messages to valid `sender_id` and `recipient_id` values.
  - Includes sample text for message bodies.

---

## 🛠️ How to Use the Scripts

1. **Set Up the Database**:
   - Ensure the database schema is created and all tables are in place.
   - Use the schema defined in the [ALX Airbnb Database Schema](../README.md).

2. **Run the Scripts**:
   - Execute the scripts in the following order to maintain data integrity:
     1. `insert_users.sql`
     2. `insert_properties.sql`
     3. `insert_bookings.sql`
     4. `insert_payments.sql`
     5. `insert_reviews.sql`
     6. `insert_messages.sql`
   - Example command to run a script:
     ```bash
     mysql -u <username> -p <database_name> < insert_users.sql
     ```

3. **Verify the Data**:
   - Query the tables to ensure the data has been inserted correctly.
   - Example query:
     ```sql
     SELECT * FROM User;
     ```

---

## 🚀 Features
- Provides realistic sample data for testing and development.
- Maintains data integrity by adhering to foreign key constraints.
- Covers all core entities in the database schema.

---

## 📌 Notes
- Ensure that the database user executing the scripts has the necessary permissions (e.g., `INSERT`).
- Modify the scripts as needed to customize the data for specific use cases.
- Use these scripts in a development or testing environment only.

---

