USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_RegistrarCria' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_RegistrarCria
	END
GO
/****** Object:  StoredProcedure [dbo].[Pa_RegistrarCria]    Script Date: 25/10/2019 15:14:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Pa_RegistrarCria] @cri_peso float, @cri_grasa float, @cri_color int
AS
BEGIN
	DECLARE @cri_clasificacion int
	if(@cri_peso < 20)
		SET @cri_clasificacion = 1
	else if(@cri_peso < 50)
		SET @cri_clasificacion = 2
	else
		SET @cri_clasificacion = 3

	SELECT @cri_clasificacion as Clasificacion /* Seleccionamos la clasificacion para retornarla desde la aplicación */
	INSERT INTO Crias (cri_clasificacion, cri_peso, cri_grasa, cri_color)
	VALUES (@cri_clasificacion, @cri_peso, @cri_grasa, @cri_color)

	/* La hacemos iniciar en el proceso 1 */
	DECLARE @cri_id int = scope_identity()
	INSERT INTO Procesos_Cria (pro_cria, pro_numero, pro_fechaInicio) 
	VALUES (@cri_id, 1, GETDATE())
END
GO

select * from Procesos_Cria


