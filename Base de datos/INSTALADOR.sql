create database pruebas
use pruebas

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

INSERT INTO Cat_Clasificaciones Values ('Grasa de cobertura 1'), ('Grasa de cobertura 2'), ('Grasa de cobertura 3')

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


INSERT INTO Cat_Estados VALUES ('Sana'), ('Apunto de enfermar'), ('Enferma'), ('Sacrificada'), ('Baja')

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
