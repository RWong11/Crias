USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_EliminarSensor' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_EliminarSensor
	END
GO
create procedure Pa_EliminarSensor @numSerie varchar(10)
AS
BEGIN
	UPDATE Cat_Sensores SET baja = 1 WHERE sen_numSerie = @numSerie and sen_cria is null
END
GO
