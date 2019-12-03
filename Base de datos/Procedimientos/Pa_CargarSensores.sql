USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_CargarSensores' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_CargarSensores
	END
GO
create procedure Pa_CargarSensores
AS
BEGIN
	SELECT sen_numSerie FROM Cat_Sensores where baja = 0
END
GO