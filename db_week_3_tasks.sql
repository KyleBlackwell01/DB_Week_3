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
    TourName VARCHAR(5) PRIMARY KEY,
    Description VARCHAR(100)
)

CREATE TABLE Client
(
    ClientID INT PRIMARY KEY,
    Surname VARCHAR(50),
    GivenName VARCHAR(50),
    Gender VARCHAR(2)
)

CREATE TABLE Event
(
    EventYear INT,
    EventMonth VARCHAR(3),
    EventDay INT,
    EventFee INT,
    TourName VARCHAR(5),
    PRIMARY KEY (EventYear,EventMonth,EventDay,TourName),
    FOREIGN KEY (TourName) REFERENCES Tour
)

CREATE TABLE Booking
(
    DateBooked Date,
    Payment INT,
    EventYear INT,
    EventMonth VARCHAR(3),
    EventDay INT,
    TourName VARCHAR(5),
    ClientID INT,
    PRIMARY KEY(EventYear,EventMonth,EventDay,TourName,ClientID),
    FOREIGN KEY (EventYear,EventMonth,EventDay,TourName) REFERENCES Event,
    FOREIGN KEY (ClientID) REFERENCES Client
)



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
('South','Jan',9,2016,200),
('South','Jan',16,2016,200),
('West','Jan',29,2016,225);

INSERT INTO Booking (ClientID,TourName,EventMonth,EventDay,EventYear,Payment,DateBooked) VALUES
(1,'North','Jan',9,2016,200,'2015-12-10'),
(2,'North','Feb',13,2016,225,'2015-12-16'),
(3,'South','Jan',9,2016,200,'2015-08-17'),
(4,'West','Jan',29,2016,225,'2015-03-15'),
(5,'South','Jan',16,2016,200,'2015-05-12');




SELECT * From Client;