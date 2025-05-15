SELECT
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    Booking b 
INNER JOIN
    User u ON u.user_id = b.user_id;


SELECT
    p.name AS property_name,
    p.location,
    r.rating,
    r.comment 
FROM
    Property p 
LEFT JOIN
    Review r ON p.property_id = r.property_id;


SELECT
    u.first_name,
    u.last_name
    b.booking_id,
    b.booking_date
FROM
    User u
FULL OUTER JOIN
    Booking b ON u.user_id = b.user_id