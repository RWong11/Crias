USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_SacrificarCria' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_SacrificarCria
	END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Pa_SacrificarCria] @cri_id int
AS
BEGIN
	DECLARE @cri_clasificacion int, @cri_estado int 
	SELECT @cri_clasificacion = cri_clasificacion, @cri_estado = cri_estado FROM Crias WHERE cri_id = @cri_id

	IF (@cri_clasificacion != 2 OR (@cri_estado = 3 AND 
	 (SELECT DATEDIFF(day, enf_fechaInicio, GETDATE()) FROM Enfermedades_Cria WHERE enf_cria = @cri_id AND enf_fechaRecupero is null)  > 40)) 
		UPDATE Crias SET cri_estado = 4 WHERE cri_id = @cri_id
END
GO