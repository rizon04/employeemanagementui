USE [test5]
GO
/****** Object:  StoredProcedure [dbo].[FireEmployees]    Script Date: 11/23/2024 5:13:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[FireEmployees]
	-- Add the parameters for the stored procedure here
	@EmployeeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Account
	where employeeID = @EmployeeID

	Delete from EmployeeDetail
	where employeeID = @EmployeeID

	DECLARE @maxEmployeeID INT;
    DECLARE @maxAccountID INT;

	-- Get the maximum employeeID from EmployeeDetail
    SELECT @maxEmployeeID = ISNULL(MAX(employeeID), 0) FROM EmployeeDetail;

    -- Get the maximum accountID from Account
    SELECT @maxAccountID = ISNULL(MAX(accountID), 0) FROM Account;

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)
END
