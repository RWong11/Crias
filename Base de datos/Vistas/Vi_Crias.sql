USE [pruebas]
GO

/****** Object:  View [dbo].[Vi_Crias]    Script Date: 28/10/2019 18:15:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[Vi_Crias] AS
SELECT cri_id, cla_id, cla_descripcion, cri_peso, cri_grasa, col_id, col_descripcion, est_id, est_descripcion, cor_id, cor_descripcion,
cri_alimentacion, (SELECT MAX(pro_numero) FROM Procesos_Cria WHERE pro_cria = cri_id) proceso_actual
FROM crias
INNER JOIN Cat_Clasificaciones ON cri_clasificacion = cla_id
INNER JOIN Cat_Colores ON cri_color = col_id
INNER JOIN Cat_Corrales ON cri_corral = cor_id
INNER JOIN Cat_Estados ON cri_estado = est_id
GO

