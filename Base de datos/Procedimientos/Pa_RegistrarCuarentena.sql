USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_RegistrarCuarentena' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_RegistrarCuarentena
	END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Pa_RegistrarCuarentena] @cri_id int, @dieta varchar(256)
AS
BEGIN

	IF NOT EXISTS(SELECT enf_cria FROM Enfermedades_Cria WHERE enf_cria = @cri_id AND enf_fechaRecupero is null)
	BEGIN
		INSERT INTO Enfermedades_Cria (enf_cria, enf_fechaInicio, enf_alimentacion) 
		VALUES (@cri_id, GETDATE(), @dieta)

		UPDATE Crias SET cri_estado = 3, cri_corral = 2 WHERE cri_id = @cri_id
	END
END
GO