# Database Normalization

Database normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. The ALX Airbnb database follows the principles of normalization to ensure efficient data storage and retrieval.

---

## Normalization Steps

### **1. First Normal Form (1NF)**
- **Objective**: Ensure that all columns contain atomic (indivisible) values and that each column contains values of a single type.
- **Implementation**:
  - Each table has a primary key to uniquely identify rows.
  - Multi-valued attributes (e.g., multiple phone numbers or emails) are split into separate rows or tables.
  - Example: A `User` table ensures that each user has a single `email` and `phone_number`.

### **2. Second Normal Form (2NF)**
- **Objective**: Ensure that all non-key attributes are fully functionally dependent on the primary key.
- **Implementation**:
  - Remove partial dependencies by splitting data into separate tables.
  - Example: The `Property` table references the `User` table via `host_id` to avoid duplicating host information.

### **3. Third Normal Form (3NF)**
- **Objective**: Ensure that all attributes are only dependent on the primary key and not on other non-key attributes.
- **Implementation**:
  - Remove transitive dependencies by creating additional tables.
  - Example: The `Booking` table references `Property` and `User` tables to avoid storing property or user details directly in the `Booking` table.

### **4. Boyce-Codd Normal Form (BCNF)**
- **Objective**: Ensure that every determinant is a candidate key.
- **Implementation**:
  - Resolve any anomalies caused by functional dependencies.
  - Example: The `Payment` table ensures that `booking_id` is the determinant for all other attributes.

### **5. Fourth Normal Form (4NF)**
- **Objective**: Ensure that there are no multi-valued dependencies.
- **Implementation**:
  - Separate independent multi-valued attributes into different tables.
  - Example: If a property can have multiple amenities, a separate `PropertyAmenities` table is created to store this relationship.

---

## Benefits of Normalization
- **Data Integrity**: Ensures consistency and accuracy of data.
- **Reduced Redundancy**: Eliminates duplicate data, saving storage space.
- **Improved Query Performance**: Simplifies queries by organizing data logically.
- **Scalability**: Makes it easier to scale the database as the application grows.
- **Ease of Maintenance**: Simplifies updates and reduces the risk of anomalies.

---

## Example of Normalization

### Unnormalized Data (UNF)
| Booking ID | User Name | Property Name | Start Date | End Date | Payment Amount |
|------------|-----------|---------------|------------|----------|----------------|
| B001       | John Doe  | Beach House   | 2025-05-01 | 2025-05-07 | $500           |
| B002       | Jane Smith| City Apartment| 2025-05-03 | 2025-05-10 | $700           |

### Normalized Data (3NF)
#### **User Table**
| User ID | Name       |
|---------|------------|
| U001    | John Doe   |
| U002    | Jane Smith |

#### **Property Table**
| Property ID | Name           |
|-------------|----------------|
| P001        | Beach House    |
| P002        | City Apartment |

#### **Booking Table**
| Booking ID | User ID | Property ID | Start Date | End Date |
|------------|---------|-------------|------------|----------|
| B001       | U001    | P001        | 2025-05-01 | 2025-05-07 |
| B002       | U002    | P002        | 2025-05-03 | 2025-05-10 |

#### **Payment Table**
| Payment ID | Booking ID | Amount |
|------------|------------|--------|
| PAY001     | B001       | $500   |
| PAY002     | B002       | $700   |

---

This normalization ensures that the database is efficient, scalable, and free from anomalies. Let me know if you need further details or examples!