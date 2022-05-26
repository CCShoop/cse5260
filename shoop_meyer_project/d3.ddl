CREATE TABLE events(
    Event_ID INTEGER PRIMARY KEY,
    Event_Name TEXT,
    Event_Date DATE
);

CREATE TABLE venues(
    Venue_ID INTEGER PRIMARY KEY,
    Venue_Address TEXT,
    Event_Num INTEGER,
    FOREIGN KEY (Event_Num)
        REFERENCES events (Event_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE chairs(
    Chair_Num INTEGER PRIMARY KEY,
    Chair_Row INTEGER,
    Venue_ID INTEGER,
    FOREIGN KEY (Venue_ID)
	REFERENCES venues (Venue_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE authors(
    Author_ID INTEGER PRIMARY KEY,
    Author_Name TEXT,
    Event_Num INTEGER,
    FOREIGN KEY (Event_Num)
        REFERENCES events (Event_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE presentations(
    Presentation_ID INTEGER,
    Presentation_Topic TEXT,
    Author_ID INTEGER,
    FOREIGN KEY (Author_ID)
	REFERENCES authors (Author_ID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE papers(
    Paper_ID INTEGER PRIMARY KEY,
    Paper_Title TEXT,
    Author_Num INTEGER,
    FOREIGN KEY (Author_Num)
        REFERENCES authors (Author_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE reviewers(
    Reviewer_Firstname TEXT,
    Reviewer_Lastname TEXT,
    Paper_Num INTEGER,
    FOREIGN KEY (Paper_Num)
        REFERENCES papers (Paper_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
