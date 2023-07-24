USE [trainingdb]
GO

/****** Object:  Table [dbo].[pagetable]    Script Date: 24-07-2023 18:38:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pagetable](
	[pageid] [int] IDENTITY(1,1) NOT NULL,
	[pagename] [varchar](255) NULL,
	[pagedesc] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[pageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

