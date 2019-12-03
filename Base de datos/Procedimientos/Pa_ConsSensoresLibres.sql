USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_ConsSensoresLibres' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_ConsSensoresLibres
	END
GO
create procedure Pa_ConsSensoresLibres
AS
BEGIN
	SELECT Sen_NumSerie FROM Cat_Sensores where Sen_Cria is null
END