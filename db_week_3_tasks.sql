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

