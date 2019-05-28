/* Create database */
CREATE DATABASE BOOKS_STORE;
GO

/* Change to the Books database */
USE BOOKS_STORE;
GO

/* Create tables */
CREATE TABLE Countries (
    CountryId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CountryName NVARCHAR(255) NOT NULL
);

CREATE TABLE Cities (
    CityName NVARCHAR(255) NOT NULL,
    CityId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CountryId INT NOT NULL

    CONSTRAINT FK_Countries_Cities FOREIGN KEY (CountryId)
    REFERENCES Countries (CountryId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Publishers (
    PublisherName NVARCHAR(255) NOT NULL,
    PublisherId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CityId INT NOT NULL

    CONSTRAINT FK_Cities_Publishers FOREIGN KEY (CityId)
    REFERENCES Cities (CityId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Universities (
    UniversityName NVARCHAR(255) NOT NULL,
    UniversityId INT IDENTITY(1,1) NOT NULL PRIMARY KEY
);


CREATE TABLE Authors (
    AuthorName NVARCHAR(255) NOT NULL,
    AuthorSurname NVARCHAR(255) NOT NULL,
    AuthorId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AuthorDateB DATETIME2,
    AuthorDateD DATETIME2,
    UniversityId INT

    CONSTRAINT FK_Universities_Authors FOREIGN KEY (UniversityId)
    REFERENCES Universities (UniversityId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE Languages (
    LanguageName NVARCHAR(255) NOT NULL,
    LanguageId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
);

CREATE TABLE Themes (
    ThemeName NVARCHAR(255) NOT NULL,
    ThemeId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
);

CREATE TABLE Formats (
    FormatName NVARCHAR(255) NOT NULL,
    FormatId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
);

CREATE TABLE Books (
    BookName NVARCHAR(255) NOT NULL,
    BookId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    BookFileName NVARCHAR(255),
    
    AuthorId INT
    CONSTRAINT FK_Authors_Books FOREIGN KEY (AuthorId)
    REFERENCES Authors (AuthorId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    ThemeId INT
    CONSTRAINT FK_Themes_Books FOREIGN KEY (ThemeId)
    REFERENCES Themes (ThemeId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    BookISBN NVARCHAR(255),
    BookYear INT,
    BookPages INT,

    PublisherId INT
    CONSTRAINT FK_Publishers_Books FOREIGN KEY (PublisherId)
    REFERENCES Publishers (PublisherId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    
    BookEdition INT,

    FormatId INT
    CONSTRAINT FK_Formats_Books FOREIGN KEY (FormatId)
    REFERENCES Formats (FormatId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

    LanguageId INT
    CONSTRAINT FK_Languages_Books FOREIGN KEY (LanguageId)
    REFERENCES Languages (LanguageId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION    
);

GO


