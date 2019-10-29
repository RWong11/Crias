USE [pruebas]
GO

/****** Object:  Table [dbo].[Detalle_Alimentos]    Script Date: 28/10/2019 18:14:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Detalle_Alimentos](
	[det_alimento] [int] NOT NULL,
	[det_id] [int] IDENTITY(1,1) NOT NULL,
	[det_descripcion] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[det_alimento] ASC,
	[det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

