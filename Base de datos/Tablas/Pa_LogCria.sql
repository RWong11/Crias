USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_LogCria' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_LogCria
	END
GO
create procedure Pa_LogCria @cri_id int
AS
BEGIN
	WITH CTE(Movimiento, fecha) 
	AS(
		SELECT ('Cambio de Estado: ' +est_descripcion), fecha FROM Log_CriasEstados INNER JOIN Cat_Estados ON cri_estado = est_id
		WHERE cri_id = @cri_id
		UNION ALL
		SELECT ('Entra al Proceso: ' +CAST(pro_numero as varchar(2))), pro_fechaInicio FROM Procesos_Cria WHERE pro_cria = @cri_id
	)
	SELECT * FROM CTE ORDER BY fecha
END