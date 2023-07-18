USE [trainingdb]
GO

/****** Object:  Table [dbo].[userdata]    Script Date: 18-07-2023 12:19:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[userdata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](30) NULL,
	[lastname] [varchar](20) NULL,
	[mail] [varchar](20) NULL,
	[gender] [varchar](20) NULL,
	[age] [int] NULL,
	[current_location] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

