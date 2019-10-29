USE [pruebas]
GO

/****** Object:  Table [dbo].[Cat_Clasificaciones]    Script Date: 28/10/2019 18:08:56 ******/
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