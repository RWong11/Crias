USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_CargarCrias' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_CargarCrias
	END
GO
create procedure Pa_CargarCrias
AS
BEGIN
	SELECT * FROM Vi_Crias
END