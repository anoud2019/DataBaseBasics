-- Insert data into hotel
INSERT INTO hotel (id, name, location, contact_number, rating)
VALUES (1, 'Grand Palace', 'New York', '1234567890', 4.5);

-- Insert data into room
INSERT INTO room (id, room_number, type, price_per_night, availability_status, hotel_id)
VALUES (1, 101, 'Single', 100.0, 1, 1);

-- Insert data into guest
INSERT INTO guest (id, name, email, contact, id_proof_type, id_proof_number)
VALUES (1, 'Ali Ahmed', 'ali.ahmed@example.com', '5555556666', 'National ID', 'N567890123');

-- Insert data into booking (making sure room_id 1 and guest_id 1 exist)
INSERT INTO booking (id, booking_date, check_in_date, check_out_date, status, total_cost, room_id, guest_id)
VALUES (1, '2025-01-02', '2025-01-06', '2025-01-08', 'Pending', 300.0, 1, 1);

-- Insert data into payment
INSERT INTO payment (id, date, amount, method, booking_id)
VALUES (1, '2025-01-01', 500.0, 'Credit Card', 1);

-- Insert data into staff
INSERT INTO staff (id, name, position, contact_number, hotel_id)
VALUES (1, 'Alice Johnson', 'Manager', '5557778888', 1);

-- Insert data into review
INSERT INTO review (id, rating, comments, date, hotel_id, guest_id)
VALUES (1, 5.0, 'Excellent service!', '2025-01-10', 1, 1);

-- Select all from each table
SELECT * FROM hotel;
SELECT * FROM room;
SELECT * FROM guest;
SELECT * FROM booking;
SELECT * FROM payment;
SELECT * FROM review;
