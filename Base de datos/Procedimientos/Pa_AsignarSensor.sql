USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_AsignarSensor' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_AsignarSensor
	END
GO
create procedure Pa_AsignarSensor @cri_id int, @sensor varchar(10)
AS
BEGIN
	/* Si no se le manda el sensor se da a entender que se le esta removiendo */
	IF LEN(@sensor) > 0
		UPDATE Cat_Sensores SET sen_cria = @cri_id WHERE sen_numSerie = @sensor and sen_cria is null
	ELSE
		UPDATE Cat_Sensores SET sen_cria = null WHERE sen_cria = @cri_id
END
GO