USE list05task05;

--DROP TABLE UserTable;
--DROP TABLE PasswordTable;

CREATE TABLE UserTable (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(200) NOT NULL,
    CONSTRAINT UC_User_Email UNIQUE (Email)
);

CREATE TABLE PasswordTable (
    PasswordID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    PasswordHash NVARCHAR(500) NOT NULL,
    Salt NVARCHAR(100) NOT NULL,
    HashRounds INT NOT NULL,
    PasswordSetDate DATETIME NOT NULL,
    CONSTRAINT FK_Password_User FOREIGN KEY (UserID) REFERENCES UserTable(UserID) ON DELETE CASCADE
);

SELECT * FROM UserTable;
SELECT * FROM PasswordTable;

-- ### ZAD 3

--DROP TABLE Roles;
--DROP TABLE UsersRoles;

CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(100) NOT NULL,
    CONSTRAINT UC_RoleName UNIQUE (RoleName)
);

CREATE TABLE UsersRoles (
    UserID INT NOT NULL,
    RoleID INT NOT NULL,
    CONSTRAINT PK_UsersRoles PRIMARY KEY (UserID, RoleID),
    CONSTRAINT FK_UsersRoles_User FOREIGN KEY (UserID) REFERENCES UserTable(UserID) ON DELETE CASCADE,
    CONSTRAINT FK_UsersRoles_Role FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) ON DELETE CASCADE
);

SELECT * FROM Roles;
SELECT * FROM UsersRoles;

--INSERT INTO Roles (RoleName)
    --VALUES ('Admin');

--INSERT INTO UsersRoles (UserID, RoleID)
    --VALUES (7, 1);

--DELETE FROM UsersRoles
	--WHERE UserID = 7 AND RoleID = 1;

-- DELETE FROM UserTable WHERE UserID = 6;

-- ### ZAD 5
ALTER TABLE PasswordTable
	ADD TwoFactorSecret NVARCHAR(100);