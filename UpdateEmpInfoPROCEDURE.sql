USE [test5]
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmpInfo]    Script Date: 11/23/2024 4:25:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cyrile Cortes>
-- Create date: <11/22/24>
-- Description:	<Update Employee Info>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateEmpInfo] 
	-- Add the parameters for the stored procedure here
	@EmployeeID int,
	@Lastname VARCHAR(30),
    @Firstname VARCHAR(30),
    @Middlename VARCHAR(30),
    @Position VARCHAR(30),
	@Status VARCHAR(30)
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update EmployeeDetail
	Set
		lastname = @Lastname,
		firstname = @Firstname,
		middlename = @Middlename,
		position = @Position,
		[status] = @Status
	where employeeID = @EmployeeID
END
