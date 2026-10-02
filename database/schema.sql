-- Create Users Table
CREATE TABLE Users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

-- Create Events Table with CHECK constraint
CREATE TABLE Events (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    date DATETIME NOT NULL,
    location VARCHAR(150) NOT NULL,
    capacity INT CHECK (capacity > 0)
);

-- Create Registrations Table with Foreign Keys
CREATE TABLE Registrations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    event_id INT NOT NULL,
    user_id INT NULL,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(150) NOT NULL,
    registered_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Registrations_Events FOREIGN KEY (event_id) REFERENCES Events(id) ON DELETE CASCADE,
    CONSTRAINT FK_Registrations_Users FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE SET NULL
);

-- Non-Clustered Indexes on Foreign Key Columns for Performance
CREATE NONCLUSTERED INDEX IX_Registrations_event_id ON Registrations(event_id);
CREATE NONCLUSTERED INDEX IX_Registrations_user_id ON Registrations(user_id);