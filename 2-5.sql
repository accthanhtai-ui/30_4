CREATE DATABASE CineMagic;
USE CineMagic;
CREATE TABLE movies(
	m_id INT PRIMARY KEY AUTO_INCREMENT,
    m_title VARCHAR(255) NOT NULL,
    m_duration_minutes iNT CHECK(m_duration_minutes > 0),
    m_age_restriction INT DEFAULT 0 CHECK(m_age_restriction IN(0,13,16,18))
);

CREATE TABLE rooms(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(100) NOT NULL,
    room_max_seats INT CHECK(room_max_seats > 0),
    room_status VARCHAR(20) DEFAULT 'active' CHECK(room_status IN ('active','maintenance'))
);
CREATE TABLE showtimes(
	sho_id INT PRIMARY KEY AUTO_INCREMENT,
    m_id INT,
    room_id INT,
    sho_showtimes DATETIME,
    sho_ticket_price DECIMAL(10,2) CHECK (sho_ticket_price >= 0),
    -- khóa ngoại cần nhớ
    FOREIGN KEY (m_id) REFERENCES movies(m_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
-- bookings: id, showtime_id, customer_name, phone, booking_date.
CREATE TABLE bookings(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    sho_id INT,
    book_customer_name VARCHAR(255) NOT NULL,
    book_phone VARCHAR(15),
    book_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- KHÓA NGOẠI
    FOREIGN KEY (sho_id) REFERENCES showtimes(sho_id)
);
USE CineMagic;
UPDATE rooms
SET room_status = 'maintenance'
WHERE room_id = 1;

UPDATE showtimes
SET room_id = 1
WHERE room_id = 2;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM bookings
WHERE book_phone = '0987654321';

DELETE FROM movies
WHERE m_id = 3;

























