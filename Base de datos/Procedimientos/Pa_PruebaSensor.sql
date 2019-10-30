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

create procedure Pa_PruebaSensor
AS
BEGIN
	DECLARE @id INT
	DECLARE @num INT
	DECLARE CriasFinas CURSOR FOR SELECT cri_id FROM Crias WHERE cri_clasificacion = 2 AND cri_estado = 1
	OPEN CriasFinas
	FETCH NEXT FROM CriasFinas INTO @id
	WHILE @@fetch_status = 0
	BEGIN
		SET @num = FLOOR(RAND()*6)
		IF @num = 3
			UPDATE Crias SET cri_estado = 2 WHERE cri_id = @id

		FETCH NEXT FROM CriasFinas INTO @id
	END
	CLOSE CriasFinas
	DEALLOCATE CriasFinas
END