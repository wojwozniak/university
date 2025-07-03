USE list05task05;

IF OBJECT_ID(N'dbo.Students', N'U') IS NOT NULL 
BEGIN
    DROP TABLE Students;
END

CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Index] NVARCHAR(50) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    Surname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL 
);

INSERT INTO Students ([Index], Name, Surname, Email) VALUES
('100001', 'Mariusz', 'Pudzianowski', 'mariusz.pudzianowski@example.com'),
('100002', 'Robert', 'Mak³owicz', 'robert.maklowicz@example.com'),
('100003', 'Ksi¹dz', 'Robak', 'ksiaz.robak@example.com'),
('100004', 'Jacek', 'Sopica', 'jacek.sopica@example.com'),
('100005', 'Magda', 'Gessler', 'magda.gessler@example.com');

SELECT * FROM Students;