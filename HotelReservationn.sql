SELECT COUNT(*) AS total_reservations
FROM hotel_reservations;
------------------------------------------
SELECT TOP 1 type_of_meal_plan, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY type_of_meal_plan
ORDER BY total_reservations DESC;
------------------------------------------
SELECT AVG(avg_price_per_room) AS average_price_per_room_with_children
FROM hotel_reservations
WHERE no_of_children > 0;
------------------------------------------
SELECT COUNT(*) AS total_reservations_for_year
FROM hotel_reservations
WHERE YEAR(arrival_date) = 2023;

------------------------------------------
SELECT TOP 1 room_type_reserved, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY room_type_reserved
ORDER BY total_reservations DESC;
------------------------------------------
SELECT COUNT(*) AS total_weekend_reservations
FROM hotel_reservations
WHERE no_of_weekend_nights > 0;
------------------------------------------
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM hotel_reservations;

------------------------------------------
SELECT TOP 1 market_segment_type, COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY total_reservations DESC;

------------------------------------------
SELECT COUNT(*) AS confirmed_reservations
FROM hotel_reservations
WHERE booking_status = 'Confirmed';

------------------------------------------
SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children,
    SUM(no_of_adults + no_of_children) AS total_guests
FROM hotel_reservations;

------------------------------------------
SELECT AVG(no_of_weekend_nights) AS average_weekend_nights_with_children
FROM hotel_reservations
WHERE no_of_children > 0;

------------------------------------------
SELECT 
    MONTH(arrival_date) AS booking_month,
    COUNT(*) AS total_reservations
FROM hotel_reservations
GROUP BY MONTH(arrival_date)
ORDER BY booking_month;

------------------------------------------
SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights + no_of_week_nights) AS average_nights
FROM hotel_reservations
GROUP BY room_type_reserved;

------------------------------------------
WITH ChildrenReservations AS (
    SELECT TOP 1 room_type_reserved, COUNT(*) AS num_reservations
    FROM hotel_reservations
    WHERE no_of_children > 0
    GROUP BY room_type_reserved
    ORDER BY num_reservations DESC
)
SELECT cr.room_type_reserved, AVG(hr.avg_price_per_room) AS average_price
FROM ChildrenReservations cr
JOIN hotel_reservations hr ON cr.room_type_reserved = hr.room_type_reserved
GROUP BY cr.room_type_reserved;

------------------------------------------
SELECT TOP 1 market_segment_type, AVG(avg_price_per_room) AS average_price_per_room
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY average_price_per_room DESC;

