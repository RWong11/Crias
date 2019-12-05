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

CREATE procedure [dbo].[Pa_RegistrarCria] @cri_peso float, @cri_grasa float, @cri_color int, @cri_ciudad int, @cri_clasificacion int OUTPUT, @cri_id int OUTPUT
AS
BEGIN
	if(@cri_peso < 20)
		SET @cri_clasificacion = 1
	else if(@cri_peso < 50)
		SET @cri_clasificacion = 2
	else
		SET @cri_clasificacion = 3

	DECLARE @CriaTabla table(id int)

	begin try
		begin tran
			INSERT INTO Crias (cri_clasificacion, cri_peso, cri_grasa, cri_color, cri_ciudad)
			OUTPUT inserted.cri_id INTO @CriaTabla
			VALUES (@cri_clasificacion, @cri_peso, @cri_grasa, @cri_color, @cri_ciudad)

			SET @cri_id = (SELECT id FROM @CriaTabla)

			-- La hacemos iniciar en el proceso 1 
			INSERT INTO Procesos_Cria (pro_cria, pro_numero, pro_fechaInicio) 
			VALUES (@cri_id, 1, GETDATE())

		commit tran
	end try
	begin catch
		rollback tran
		SET @cri_id = 0
	end catch
END
GO

