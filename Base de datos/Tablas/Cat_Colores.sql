USE [pruebas]
GO

/****** Object:  Table [dbo].[Cat_Colores]    Script Date: 28/10/2019 18:10:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
