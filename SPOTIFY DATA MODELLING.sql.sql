CREATE TABLE Users (
  User_ID INT IDENTITY(1,1) PRIMARY KEY,
  Names VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE,
  Date_of_Birth DATE,

);

CREATE TABLE Artists (
  Artist_ID INT IDENTITY(1,1) PRIMARY KEY,
  Names VARCHAR(50) NOT NULL,
  Genre VARCHAR(50),

);

CREATE TABLE Albums (
  Album_ID INT IDENTITY(1,4) PRIMARY KEY,
  Artist_ID INT,
  Name VARCHAR(50) NOT NULL,
  Release_Date DATE,
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Tracks (
  Track_ID INT IDENTITY(1,2) PRIMARY KEY,
  Album_ID INT,
  Names VARCHAR(50) NOT NULL,
  Duration INT NOT NULL,
  FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID)
);

CREATE TABLE Playlists (
  Playlist_ID INT IDENTITY(1,3) PRIMARY KEY,
  User_ID INT,
  Names VARCHAR(50) NOT NULL,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Playlist_Tracks (
  Playlist_ID INT,
  Track_ID INT,
  PRIMARY KEY (Playlist_ID, Track_ID),
  FOREIGN KEY (Playlist_ID) REFERENCES Playlists(Playlist_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);

CREATE TABLE Followers (
  User_ID INT,
  Artist_ID INT,
  PRIMARY KEY (User_ID, Artist_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Artist_ID) REFERENCES Artists(Artist_ID)
);

CREATE TABLE Likes (
  User_ID INT,
  Track_ID INT,
  Like_Date_Time DATETIME,
  PRIMARY KEY (User_ID, Track_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Track_ID) REFERENCES Tracks(Track_ID)
);


SELECT * FROM Likes
SELECT * FROM Followers
SELECT * FROM Albums
SELECT * FROM Followers


CREATE DATABASE example;