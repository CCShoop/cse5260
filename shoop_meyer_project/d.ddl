CREATE TABLE events(
    Event_ID INTEGER PRIMARY KEY,
    Event_Name TEXT,
    Event_Date DATE
);

CREATE TABLE venues(
    Venue_ID INTEGER PRIMARY KEY,
    Venue_Address TEXT,
    Chair_Num INTEGER,
    Chair_Row INTEGER,
    Event_Num INTEGER,
    FOREIGN KEY (Event_Num)
        REFERENCES events (Event_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE authors(
    Author_ID INTEGER PRIMARY KEY,
    Author_Firstname TEXT,
    Author_Lastname TEXT,
    Presentation_ID INTEGER,
    Presentation_Topic TEXT,
    Event_Num INTEGER,
    FOREIGN KEY (Event_Num)
        REFERENCES events (Event_ID)
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
