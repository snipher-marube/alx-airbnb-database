CREATE TABLE IF NOT EXISTS User (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    role ENUM('guest', 'host', 'admin') DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE IF NOT EXISTS Property (
    property_id SERIAL PRIMARY_KEY,
    host_id FOREIGN_KEY REFERENCES User(user_id),
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
);

CREATE TABLE IF NOT EXISTS Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id FOREIGN_KEY REFERENCES User(user_id),
    property_id FOREIGN_KEY REFERENCES Property(property_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') DEFAULT 'pending' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
)

CREATE TABLE IF NOT EXISTS Payment (
    payment_id SERIAL PRIMARY_KEY,
    booking_id FOREIGN_KEY REFERENCES Booking(booking_id),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
);

CREATE TABLE IF NOT EXISTS Review (
    review_id SERIAL PRIMARY_KEY,
    property_id FOREIGN_KEY REFERENCES Property(property_id),
    user_id FOREIGN_KEY REFERENCES User(user_id),
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
)

CREATE TABLE IF NOT EXISTS Message (
    message_id SERIAL PRIMARY_KEY,
    sender_id FOREIGN_KEY REFERENCES User(user_id),
    recipient_id FOREIGN_KEY REFERENCES User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);