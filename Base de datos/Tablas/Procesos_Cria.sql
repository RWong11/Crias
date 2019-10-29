USE [pruebas]
GO

/****** Object:  Table [dbo].[Procesos_Cria]    Script Date: 28/10/2019 18:15:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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

