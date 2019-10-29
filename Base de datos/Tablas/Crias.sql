USE [pruebas]
GO

/****** Object:  Table [dbo].[Crias]    Script Date: 28/10/2019 18:14:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Crias](
	[cri_id] [int] IDENTITY(1,1) NOT NULL,
	[cri_clasificacion] [int] NOT NULL,
	[cri_peso] [float] NOT NULL,
	[cri_grasa] [float] NOT NULL,
	[cri_color] [int] NOT NULL,
	[cri_estado] [int] NOT NULL CONSTRAINT [DF_Crias_cri_estado]  DEFAULT ((1)),
	[cri_corral] [int] NOT NULL CONSTRAINT [DF_Crias_cri_corral]  DEFAULT ((1)),
	[cri_alimentacion] [int] NULL,
 CONSTRAINT [PK__Crias__26C91AB112F1FDAC] PRIMARY KEY CLUSTERED 
(
	[cri_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Crias]  WITH CHECK ADD  CONSTRAINT [FK__Crias__cri_alime__0E6E26BF] FOREIGN KEY([cri_alimentacion])
REFERENCES [dbo].[Alimentos] ([ali_id])
GO

ALTER TABLE [dbo].[Crias] CHECK CONSTRAINT [FK__Crias__cri_alime__0E6E26BF]
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

