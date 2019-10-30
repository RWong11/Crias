USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_CargarCrias' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_CargarCrias
	END
GO
create procedure Pa_CargarCrias @num int
AS
BEGIN
	if(@num = 1)
		SELECT * FROM Vi_Crias
	else 
		SELECT * From Vi_Crias 
		INNER JOIN Procesos_Cria ON (cri_id = pro_cria AND proceso_actual = pro_numero)
		WHERE GETDATE() >= DATEADD(MINUTE/*MONTH*/, 5, pro_fechainicio)		
END