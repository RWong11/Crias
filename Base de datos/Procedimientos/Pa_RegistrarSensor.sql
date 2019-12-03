USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_RegistrarSensor' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_RegistrarSensor
	END
GO
create procedure Pa_RegistrarSensor @numSerie varchar(10)
AS
BEGIN
	INSERT INTO Cat_Sensores (sen_numSerie) VALUES (@numSerie)
END
GO

