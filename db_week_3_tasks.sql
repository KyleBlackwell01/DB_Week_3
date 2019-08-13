/* Student Name: Kyle Blackwell Student ID: 102472889 */

/*
Tour(TourName,Description)
PRIMARY KEY (TourName)

Client(ClientID,Surname,GivenName,Gender)
PRIMARY KEY (ClientID)

Event(EventYear,EventMonth,EventDay,Fee,TourName)
PRIMARY KEY (EventYear,EventMonth,EventDay,TourName)
FOREIGN KEY (TourName) REFERENCES Tour

Booking(DateBooked,Payment,EventYear,EventMonth,EventDay,TourName,ClientID)
PRIMARY KEY (EventYear,EventMonth,EventDay,TourName,ClientID)
FOREIGN KEY (EventYear,EventMonth,EventDay,TourName) REFERENCES Event
FOREIGN KEY (ClientID) REFERENCES Client

*/

DROP TABLE IF EXISTS dbo.Booking;
DROP TABLE IF EXISTS dbo.Event;
DROP TABLE IF EXISTS dbo.Client;
DROP TABLE IF EXISTS dbo.Tour;

CREATE TABLE Tour 
(
    TourName VARCHAR(100) PRIMARY KEY,
    Description VARCHAR(500)
);

CREATE TABLE Client
(
    ClientID INT PRIMARY KEY,
    Surname VARCHAR(100) NOT NULL,
    GivenName VARCHAR(100) NOT NULL,
    Gender VARCHAR(1) NULL, 
    CONSTRAINT Check_Gender
    CHECK (Gender IN ('M', 'F', 'I'))
);

CREATE TABLE Event
(
    EventYear INT,
    EventMonth VARCHAR(3),
    EventDay INT,
    EventFee MONEY NOT NULL,
    TourName VARCHAR(100),
    PRIMARY KEY (EventYear,EventMonth,EventDay,TourName),
    FOREIGN KEY (TourName) REFERENCES Tour,
    CONSTRAINT Check_Month
    CHECK (EventMonth IN ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')),
    CONSTRAINT Check_Money
    CHECK (EventFee > 0),
    CONSTRAINT Check_Day
    CHECK (EventDay >= 1 AND EventDay <= 31),
    CONSTRAINT Check_Year
    CHECK (LEN(EventYear) =4)
);

CREATE TABLE Booking
(
    DateBooked Date NOT NULL,
    Payment MONEY NULL,
    EventYear INT,
    EventMonth VARCHAR(3),
    EventDay INT,
    TourName VARCHAR(100),
    ClientID INT,
    PRIMARY KEY(EventYear,EventMonth,EventDay,TourName,ClientID),
    FOREIGN KEY (EventYear,EventMonth,EventDay,TourName) REFERENCES Event,
    FOREIGN KEY (ClientID) REFERENCES Client,
    CONSTRAINT Check_MonthB
    CHECK (EventMonth IN ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')),
    CONSTRAINT Check_DayB
    CHECK (EventDay >= 1 AND EventDay <= 31),
    CONSTRAINT Check_YearB
    CHECK (LEN(EventYear) = 4),
    CONSTRAINT Check_Payment
    CHECK (Payment > 0)
);



INSERT INTO Tour (TourName,Description) VALUES
('North','Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South','Tour of wineries and outlets of Mornington Penisula'),
('West','Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Client (ClientID,Surname,GivenName,Gender) VALUES
(1,'Price','Taylor','M'),
(2,'Gamble','Ellyse','F'),
(3,'Tan','Tilly','F'),
(4,'Blackwell','Kyle','M'),
(5,'Johnson','Cave','M');

INSERT INTO Event (TourName,EventMonth,EventDay,EventYear,EventFee) VALUES
('North','Jan',9,2016,200),
('North','Feb',13,2016,225),
('South','Jan',3,2016,200),
('South','Jan',16,2016,200),
('West','Jan',29,2016,225);

INSERT INTO Booking (ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES
(1,'North','Jan',9,2016,200,'2015-12-10'),
(2,'North','Feb',13,2016,225,'2015-12-16'),
(3,'South','Jan',3,2016,200,'2015-08-17'),
(4,'West','Jan',29,2016,225,'2015-03-15'),
(5,'South','Jan',16,2016,200,'2015-05-12');




Select * From Client;



-- SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
-- FROM INFORMATION_SCHEMA.TABLES
-- GO




-- Query #1
Select c.GivenName, c.Surname, t.TourName, t.Description, e.EventYear, e.EventMonth, e.EventDay, e.EventFee, b.DateBooked, b.Payment
FROM (((Event e
INNER JOIN Tour t
ON e.TourName = t.TourName)
INNER JOIN Booking b
ON e.EventYear = b.EventYear
AND e.EventMonth = b.EventMonth
AND e.EventDay = b.EventDay)
INNER JOIN Client c
ON b.ClientID = c.ClientID)


-- Query #2
Select EventMonth, TourName, Count(ClientID) as "Num Bookings"
From Booking
GROUP BY EventMonth, TourName;


-- Query #3
Select *
FROM Booking
Where Payment > (Select AVG(Payment)
                FROM Booking);



DROP VIEW Task5;

CREATE VIEW Task5 AS
Select c.GivenName, c.Surname, t.TourName, t.Description, e.EventYear, e.EventMonth, e.EventDay, e.EventFee, b.DateBooked, b.Payment
FROM (((Event e
INNER JOIN Tour t
ON e.TourName = t.TourName)
INNER JOIN Booking b
ON e.EventYear = b.EventYear
AND e.EventMonth = b.EventMonth
AND e.EventDay = b.EventDay)
INNER JOIN Client c
ON b.ClientID = c.ClientID)

SELECT * FROM Task5;



Select Count(ClientID) as "Client ID"
From Booking;

-- By counting the amount of rows for client ID from query 1 we get the exact amount of values for test data.


Select Count(DateBooked) as "Num Booking"
From Booking;

-- By counting the amount of rows for Num Booking from query 2 we get the exact amount of values for test data.


Select Avg(Payment)
From Booking;

-- By calculating the average total of payments for bookings we can get the correct value that is greater than the average calculated.