create database pruebas
GO
use pruebas
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cat_Clasificaciones](
	[cla_id] [int] IDENTITY(1,1) NOT NULL,
	[cla_descripcion] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cla_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO Cat_Clasificaciones Values ('Grasa de cobertura-1'), ('Grasa de cobertura-2'), ('Grasa de cobertura-3')

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cat_Colores](
	[col_id] [int] IDENTITY(1,1) NOT NULL,
	[col_descripcion] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[col_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO Cat_Colores Values ('Verde'), ('Rojo'), ('Azul')

CREATE TABLE [dbo].[Cat_Corrales](
	[cor_id] [int] IDENTITY(1,1) NOT NULL,
	[cor_descripcion] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO Cat_Corrales VALUES ('Corral General'), ('Corral Cuarentena')

CREATE TABLE [dbo].[Cat_Estados](
	[est_id] [int] IDENTITY(1,1) NOT NULL,
	[est_descripcion] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[est_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


INSERT INTO Cat_Estados VALUES ('Sana'), ('Apunto de enfermar'), ('En Cuarentena'), ('Sacrificada'), ('Baja')

CREATE TABLE [dbo].[Crias](
	[cri_id] [int] IDENTITY(1,1) NOT NULL,
	[cri_clasificacion] [int] NOT NULL,
	[cri_peso] [float] NOT NULL,
	[cri_grasa] [float] NOT NULL,
	[cri_color] [int] NOT NULL,
	[cri_estado] [int] NOT NULL CONSTRAINT [DF_Crias_cri_estado]  DEFAULT ((1)),
	[cri_corral] [int] NOT NULL CONSTRAINT [DF_Crias_cri_corral]  DEFAULT ((1))
 CONSTRAINT [PK__Crias__26C91AB112F1FDAC] PRIMARY KEY CLUSTERED 
(
	[cri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Crias]  WITH CHECK ADD  CONSTRAINT [FK__Crias__cri_clasi__0A9D95DB] FOREIGN KEY([cri_clasificacion])
REFERENCES [dbo].[Cat_Clasificaciones] ([cla_id])
GO

ALTER TABLE [dbo].[Crias] CHECK CONSTRAINT [FK__Crias__cri_clasi__0A9D95DB]
GO

ALTER TABLE [dbo].[Crias]  WITH CHECK ADD  CONSTRAINT [FK__Crias__cri_color__0B91BA14] FOREIGN KEY([cri_color])
REFERENCES [dbo].[Cat_Colores] ([col_id])
GO

ALTER TABLE [dbo].[Crias] CHECK CONSTRAINT [FK__Crias__cri_color__0B91BA14]
GO

ALTER TABLE [dbo].[Crias]  WITH CHECK ADD  CONSTRAINT [FK__Crias__cri_corra__0D7A0286] FOREIGN KEY([cri_corral])
REFERENCES [dbo].[Cat_Corrales] ([cor_id])
GO

ALTER TABLE [dbo].[Crias] CHECK CONSTRAINT [FK__Crias__cri_corra__0D7A0286]
GO

ALTER TABLE [dbo].[Crias]  WITH CHECK ADD  CONSTRAINT [FK__Crias__cri_estad__0C85DE4D] FOREIGN KEY([cri_estado])
REFERENCES [dbo].[Cat_Estados] ([est_id])
GO

ALTER TABLE [dbo].[Crias] CHECK CONSTRAINT [FK__Crias__cri_estad__0C85DE4D]
GO

CREATE TABLE [dbo].[Enfermedades_Cria](
	[enf_cria] [int] NOT NULL,
	[enf_fechaInicio] [datetime] NOT NULL,
	[enf_fechaRecupero] [datetime] NULL,
	[enf_alimentacion] varchar(256) not NULL,
PRIMARY KEY CLUSTERED 
(
	[enf_cria] ASC,
	[enf_fechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Enfermedades_Cria]  WITH CHECK ADD  CONSTRAINT [FK__Enfermeda__enf_c__14270015] FOREIGN KEY([enf_cria])
REFERENCES [dbo].[Crias] ([cri_id])
GO

ALTER TABLE [dbo].[Enfermedades_Cria] CHECK CONSTRAINT [FK__Enfermeda__enf_c__14270015]
GO

CREATE TABLE [dbo].[Procesos_Cria](
	[pro_cria] [int] NOT NULL,
	[pro_numero] [int] NOT NULL,
	[pro_fechaInicio] [datetime] NOT NULL,
	[pro_fechaTermino] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[pro_cria] ASC,
	[pro_numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Procesos_Cria]  WITH CHECK ADD  CONSTRAINT [FK__Procesos___pro_c__114A936A] FOREIGN KEY([pro_cria])
REFERENCES [dbo].[Crias] ([cri_id])
GO

ALTER TABLE [dbo].[Procesos_Cria] CHECK CONSTRAINT [FK__Procesos___pro_c__114A936A]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Log_CriasEstados](
	[cri_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cri_estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cri_id] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Log_CriasEstados]  WITH CHECK ADD FOREIGN KEY([cri_estado])
REFERENCES [dbo].[Cat_Estados] ([est_id])
GO

ALTER TABLE [dbo].[Log_CriasEstados]  WITH CHECK ADD FOREIGN KEY([cri_id])
REFERENCES [dbo].[Crias] ([cri_id])
GO


/****** Object:  View [dbo].[Vi_Crias]    Script Date: 28/10/2019 18:15:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[Vi_Crias] AS
SELECT cri_id, cla_id, cla_descripcion, cri_peso, cri_grasa, col_id, col_descripcion, est_id, est_descripcion, cor_id, cor_descripcion,
COALESCE((SELECT enf_alimentacion FROM Enfermedades_Cria WHERE cri_id = enf_cria AND enf_fechaRecupero is null), 'Sin dieta') dieta,
(SELECT MAX(pro_numero) FROM Procesos_Cria WHERE pro_cria = cri_id) proceso_actual
FROM crias
INNER JOIN Cat_Clasificaciones ON cri_clasificacion = cla_id
INNER JOIN Cat_Colores ON cri_color = col_id
INNER JOIN Cat_Corrales ON cri_corral = cor_id
INNER JOIN Cat_Estados ON cri_estado = est_id
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
END
GO

IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_PruebaSensor' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_PruebaSensor
	END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure Pa_PruebaSensor
AS
BEGIN
	DECLARE @id INT
	DECLARE @num INT
	DECLARE CriasFinas CURSOR FOR SELECT cri_id FROM Crias WHERE cri_clasificacion = 2 AND cri_estado = 1
	OPEN CriasFinas
	FETCH NEXT FROM CriasFinas INTO @id
	WHILE @@fetch_status = 0
	BEGIN
		SET @num = FLOOR(RAND()*6)
		IF @num = 3
			UPDATE Crias SET cri_estado = 2 WHERE cri_id = @id

		FETCH NEXT FROM CriasFinas INTO @id
	END
	CLOSE CriasFinas
	DEALLOCATE CriasFinas
END
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
	INSERT INTO Enfermedades_Cria (enf_cria, enf_fechaInicio, enf_alimentacion) 
	VALUES (@cri_id, GETDATE(), @dieta)

	UPDATE Crias SET cri_estado = 3, cri_corral = 2 WHERE cri_id = @cri_id
END
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
	UPDATE Crias SET cri_estado = 4 WHERE cri_id = @cri_id
END
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
GO
IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'Pa_SubirProceso' AND xtype = 'P')
	BEGIN 
		DROP PROCEDURE dbo.Pa_SubirProceso
	END
GO
create procedure Pa_SubirProceso @cri_id int
AS
BEGIN
	DECLARE @FechaActual datetime = GETDATE()
	DECLARE @proceso int
	SELECT @proceso = proceso_actual FROM Vi_Crias WHERE cri_id = @cri_id

	if(@proceso = 1)
	BEGIN
		IF EXISTS(SELECT cri_id FROM Vi_Crias
					INNER JOIN Procesos_Cria ON (cri_id = pro_cria AND pro_numero = proceso_actual) 
					WHERE cri_id = @cri_id AND est_id = 1 AND @FechaActual >= DATEADD(MINUTE/*MONTH*/, 5, pro_fechainicio))
		BEGIN
			UPDATE Procesos_Cria SET pro_fechaTermino = @FechaActual WHERE pro_cria = @cri_id AND pro_numero = @proceso
			INSERT INTO Procesos_Cria (pro_cria, pro_numero, pro_fechaInicio) VALUES (@cri_id, @proceso + 1, @FechaActual)
		END
	END
	else if(@proceso = 2)
	BEGIN
		SELECT -1
	END	
	else if(@proceso = 3)
	BEGIN
		SELECT -1
	END	
	else if(@proceso = 4)
	BEGIN
		SELECT -1
	END	
END
GO
CREATE TRIGGER Tri_CriasEstados ON Crias AFTER UPDATE
AS
BEGIN
	DECLARE @viejo INT
	DECLARE @nuevo INT
	SELECT @viejo = cri_estado FROM deleted
	SELECT @nuevo = cri_estado FROM inserted

	if @nuevo<>@viejo
		INSERT INTO Log_CriasEstados
		SELECT cri_id, GETDATE(), @nuevo from inserted
END
GO