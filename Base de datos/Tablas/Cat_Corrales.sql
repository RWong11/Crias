USE [pruebas]
GO

/****** Object:  Table [dbo].[Cat_Corrales]    Script Date: 28/10/2019 18:11:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

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
