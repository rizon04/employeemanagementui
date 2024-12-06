create PROCEDURE editEmployee
    @employeeID INT,
    @gender NVARCHAR(10),
    @dob DATE,
    @email NVARCHAR(100),
    @phone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    -- Update the employee details in the database
    UPDATE EmployeeDetail
    SET Gender = @gender,
        DoB = @dob,
        Email = @email,
        PhoneNumber = @phone
    WHERE EmployeeID = @employeeID;
END
GO

GO
