USE [pruebas]
GO

/****** Object:  Table [dbo].[Enfermedades_Cria]    Script Date: 28/10/2019 18:14:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Enfermedades_Cria](
	[enf_cria] [int] NOT NULL,
	[enf_fechaInicio] [datetime] NOT NULL,
	[enf_fechaRecupero] [datetime] NULL,
	[enf_alimentacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[enf_cria] ASC,
	[enf_fechaInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Enfermedades_Cria]  WITH CHECK ADD FOREIGN KEY([enf_alimentacion])
REFERENCES [dbo].[Alimentos] ([ali_id])
GO

ALTER TABLE [dbo].[Enfermedades_Cria]  WITH CHECK ADD  CONSTRAINT [FK__Enfermeda__enf_c__14270015] FOREIGN KEY([enf_cria])
REFERENCES [dbo].[Crias] ([cri_id])
GO

ALTER TABLE [dbo].[Enfermedades_Cria] CHECK CONSTRAINT [FK__Enfermeda__enf_c__14270015]
GO

