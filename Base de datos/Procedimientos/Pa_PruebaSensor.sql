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
	DECLARE @id INT, @num INT
	SET @count = 0
	DECLARE CriasFinas CURSOR FOR SELECT sen_cria FROM Cat_Sensores INNER JOIN Crias ON (sen_cria = cri_id) WHERE cri_clasificacion = 2 AND cri_estado = 1
	OPEN CriasFinas
	FETCH NEXT FROM CriasFinas INTO @id
	WHILE @@fetch_status = 0
	BEGIN
		SET @num = FLOOR(RAND()*6)
		IF @num = 3
		BEGIN
			UPDATE Crias SET cri_estado = 2 WHERE cri_id = @id
			SET @count = @count +1
		END
		FETCH NEXT FROM CriasFinas INTO @id
	END
	CLOSE CriasFinas
	DEALLOCATE CriasFinas
END