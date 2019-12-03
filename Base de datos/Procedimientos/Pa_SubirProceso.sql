USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_SubirProceso' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_SubirProceso
	END
GO
create procedure Pa_SubirProceso @cri_id int
AS
BEGIN
	DECLARE @FechaActual datetime = GETDATE()
	DECLARE @proceso int
	SELECT @proceso = proceso_actual FROM Vi_Crias WHERE cri_id = @cri_id

	if(@proceso = 1)
	BEGIN
		IF EXISTS(SELECT cri_id FROM Vi_Crias
					INNER JOIN Procesos_Cria ON (cri_id = pro_cria AND pro_numero = proceso_actual) 
					WHERE cri_id = @cri_id AND est_id = 1 AND @FechaActual >= DATEADD(MINUTE/*MONTH*/, 5, pro_fechainicio))
		BEGIN
			BEGIN TRY
				BEGIN TRAN
					UPDATE Procesos_Cria SET pro_fechaTermino = @FechaActual WHERE pro_cria = @cri_id AND pro_numero = @proceso
					INSERT INTO Procesos_Cria (pro_cria, pro_numero, pro_fechaInicio) VALUES (@cri_id, @proceso + 1, @FechaActual)
				COMMIT TRAN
			END TRY
			BEGIN CATCH
				ROLLBACK TRAN
			END CATCH
		END
	END
	/*else if(@proceso = 2)
	BEGIN
	END	
	else if(@proceso = 3)
	BEGIN
	END	
	else if(@proceso = 4)
	BEGIN
	END	*/
END