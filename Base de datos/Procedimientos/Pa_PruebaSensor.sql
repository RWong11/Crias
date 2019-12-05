USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_PruebaSensor' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_PruebaSensor
	END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure Pa_PruebaSensor @count INT OUTPUT
AS
BEGIN
	INSERT INTO DatosSensor 
	SELECT sen_numSerie, sen_cria, GETDATE(), (ABS(CHECKSUM(NewId())) % 11)+35 FROM Cat_Sensores WHERE sen_cria is not null

	DECLARE @FechaHoy varchar(32) = convert(varchar, GETDATE(), 111)
	UPDATE Crias SET cri_estado = 2 WHERE cri_id IN (
	--DECLARE @FechaHoy varchar(32) = convert(varchar, GETDATE(), 111) -- DECLARE @FechaHoy varchar(32) = convert(varchar, DATEADD(day, 1, GETDATE()), 111)
			SELECT ds_cria FROM DatosSensor
			INNER JOIN Crias ON (ds_cria = cri_id)
			WHERE cri_estado = 1
			GROUP BY ds_numSerie, ds_cria, convert(varchar, ds_fecha, 111)
			HAVING convert(varchar, ds_fecha, 111) = @FechaHoy AND AVG(ds_temperatura) >= 40
		)

	SELECT @count = COUNT(cri_id) FROM Crias WHERE cri_estado = 2
END

