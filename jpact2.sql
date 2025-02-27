USE [jpact2]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/10/2024 9:05:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Categoryname] [nvarchar](50) NOT NULL,
	[Images] [nvarchar](500) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[videos]    Script Date: 10/10/2024 9:05:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[videos](
	[VideoId] [varchar](255) NOT NULL,
	[Active] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Views] [int] NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[videos]  WITH CHECK ADD  CONSTRAINT [FK7t06wiw587llhee3ychrp37kl] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[categories] ([CategoryId])
GO
ALTER TABLE [dbo].[videos] CHECK CONSTRAINT [FK7t06wiw587llhee3ychrp37kl]
GO
