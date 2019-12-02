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
	/* Condiciones para poder sacrificar 
	 ... */
	UPDATE Crias SET cri_estado = 4 WHERE cri_id = @cri_id
END
GO