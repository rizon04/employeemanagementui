-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cyrile Cortes>
-- Create date: <11/23/24>
-- Description:	<Show Employee Names and Position>
-- =============================================
CREATE PROCEDURE [dbo].[ShowEmployeeNames]
	-- Add the parameters for the stored procedure here
	@employeeID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Firstname, Lastname, Middlename, Position   
	from EmployeeDetail
	Where  EmployeeID = @employeeID

		
END
GO
