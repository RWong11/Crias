USE [pruebas]
GO

/****** Object:  Table [dbo].[Alimentos]    Script Date: 28/10/2019 18:08:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Alimentos](
	[ali_id] [int] IDENTITY(1,1) NOT NULL,
	[ali_descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ali_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

