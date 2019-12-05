USE [pruebas]
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_CargarLista' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_CargarLista
	END
GO
/****** Object:  StoredProcedure [dbo].[Pa_CargarLista]    Script Date: 25/10/2019 15:15:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Pa_CargarLista] @num int
AS
BEGIN
	if(@num = 1)
		SELECT col_id, col_descripcion FROM Cat_Colores
	else if(@num = 2)
		SELECT ciu_id, ciu_descripcion FROM Cat_Ciudades
	else if(@num = 3)
		SELECT cla_id, cla_descripcion FROM Cat_Clasificaciones
	else if(@num = 4)
		SELECT est_id, est_descripcion FROM Cat_Estados
END
GO


