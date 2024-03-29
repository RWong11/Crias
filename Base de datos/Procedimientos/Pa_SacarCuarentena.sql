USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_SacarCuarentena' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_SacarCuarentena
	END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Pa_SacarCuarentena] @cri_id int
AS
BEGIN
	UPDATE Enfermedades_Cria SET enf_fechaRecupero = GETDATE() WHERE enf_cria = @cri_id AND enf_fechaRecupero is null

	IF @@ROWCOUNT > 0
		UPDATE Crias SET cri_estado = 1, cri_corral = 1 WHERE cri_id = @cri_id
END
GO