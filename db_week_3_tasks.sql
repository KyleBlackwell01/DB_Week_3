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