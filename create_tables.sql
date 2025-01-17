-- Create database
CREATE DATABASE hotel_test;

-- Use the database
USE hotel_test;

-- Create hotel table
CREATE TABLE hotel(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(200) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    rating FLOAT
);

-- Create room table
CREATE TABLE room(
    id INT PRIMARY KEY,
    room_number INT NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('Single', 'Double', 'Suite')),
    price_per_night FLOAT NOT NULL CHECK (price_per_night > 0),
    availability_status BIT NOT NULL DEFAULT 1,
    hotel_id INT NOT NULL,
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (hotel_id, room_number)
);

-- Create guest table
CREATE TABLE guest(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    contact VARCHAR(15),
    id_proof_type VARCHAR(50) NOT NULL,
    id_proof_number VARCHAR(50) NOT NULL
);

-- Create booking table
CREATE TABLE booking(
    id INT PRIMARY KEY,
    booking_date DATE NOT NULL, 
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Pending' 
        CHECK (status IN ('Pending', 'Confirmed', 'Canceled', 'Check-in', 'Check-out')),
    total_cost FLOAT CHECK (total_cost > 0),
    room_id INT NOT NULL,
    guest_id INT NOT NULL,
    CONSTRAINT fk_booking_room FOREIGN KEY (room_id) REFERENCES room(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_guest FOREIGN KEY (guest_id) REFERENCES guest(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_checkin_checkout CHECK (check_in_date <= check_out_date)
);

-- Create payment table
CREATE TABLE payment(
    id INT PRIMARY KEY,
    date DATE NOT NULL,
    amount FLOAT NOT NULL CHECK (amount > 0),
    method VARCHAR(50),
    booking_id INT NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES booking(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create staff table
CREATE TABLE staff(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15),
    hotel_id INT NOT NULL,
    CONSTRAINT fk_staff_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create review table
CREATE TABLE review(
    id INT PRIMARY KEY, 
    rating FLOAT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comments TEXT DEFAULT 'No comments',
    date DATE NOT NULL,
    hotel_id INT NOT NULL,
    guest_id INT NOT NULL,
    CONSTRAINT fk_review_hotel FOREIGN KEY (hotel_id) REFERENCES hotel(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_guest FOREIGN KEY (guest_id) REFERENCES guest(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);