USE [pruebas]
GO

/****** Object:  Table [dbo].[Log_CriasEstados]    Script Date: 29/10/2019 17:53:46 ******/
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

