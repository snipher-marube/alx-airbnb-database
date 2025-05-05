INSERT INTO User (
    user_id,
    first_name,
    last_name,
    email,
    password_hash,
    phone_number,
    role,
    created_at
) VALUES
    -- For SQLite: Use randomblob(16) for UUID-like IDs
    (randomblob(16), 'John', 'Doe', 'john.doe@example.com', 'hashed_password', '1234567890', 'guest', CURRENT_TIMESTAMP),
    (randomblob(16), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '0987654321', 'guest', CURRENT_TIMESTAMP);

INSERT INTO Property (
    property_id,
    host_id,
    name,
    description,
    price_per_night,
    location,
    created_at,
    updated_at
) VALUES
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'John'), 'Cozy Apartment', 'A cozy apartment in the city center.', 100.00, 'City Center', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'Jane'), 'Beach House', 'A beautiful beach house with ocean views.', 250.00, 'Beachfront', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO Booking (
    booking_id,
    user_id,
    property_id,
    start_date,
    end_date,
    total_price,
    created_at,
    status
) VALUES
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'John'), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), '2023-10-01', '2023-10-05', 500.00, CURRENT_TIMESTAMP, 'confirmed'),
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'Jane'), (SELECT property_id FROM Property WHERE name = 'Beach House'), '2023-11-01', '2023-11-07', 1750.00, CURRENT_TIMESTAMP, 'pending');
INSERT INTO Review (
    review_id,
    property_id,
    user_id,
    rating,
    comment,
    created_at
) VALUES
    (randomblob(16), (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), (SELECT user_id FROM User WHERE first_name = 'Jane'), 5, 'Great place to stay!', CURRENT_TIMESTAMP),
    (randomblob(16), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE first_name = 'John'), 4, 'Beautiful views but a bit far from the city.', CURRENT_TIMESTAMP);

INSERT INTO Payment (
    payment_id,
    booking_id,
    amount,
    payment_date,
    payment_method,
) VALUES
    (randomblob(16), (SELECT booking_id FROM Booking WHERE user_id = (SELECT user_id FROM User WHERE first_name = 'John')), 500.00, CURRENT_TIMESTAMP, 'credit_card'),
    (randomblob(16), (SELECT booking_id FROM Booking WHERE user_id = (SELECT user_id FROM User WHERE first_name = 'Jane')), 1750.00, CURRENT_TIMESTAMP, 'paypal');
INSERT INTO Message (
    message_id,
    sender_id,
    recipient_id,
    message_body,
    sent_at
) VALUES
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'John'), (SELECT user_id FROM User WHERE first_name = 'Jane'), 'Hello Jane, I hope you enjoy your stay!', CURRENT_TIMESTAMP),
    (randomblob(16), (SELECT user_id FROM User WHERE first_name = 'Jane'), (SELECT user_id FROM User WHERE first_name = 'John'), 'Thank you, John! Looking forward to it.', CURRENT_TIMESTAMP);