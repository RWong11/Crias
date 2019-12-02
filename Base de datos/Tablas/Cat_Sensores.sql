USE [pruebas]
GO

/****** Object:  Table [dbo].[Cat_Sensores]    Script Date: 15/11/2019 12:06:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cat_Sensores](
	[sen_numSerie] [varchar](32) NOT NULL,
	[sen_cria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sen_numSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Cat_Sensores]  WITH CHECK ADD FOREIGN KEY([sen_cria])
REFERENCES [dbo].[Crias] ([cri_id])
GO

