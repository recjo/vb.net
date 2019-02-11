
/****** Object:  Table [dbo].[JobListings]    Script Date: 12/10/2008 14:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobListings](
	[RecID] [int] IDENTITY(1,1) NOT NULL,
	[Facility] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Division] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactNumber] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactEmail] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobTitle] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[JobDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Salary] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostDate] [smalldatetime] NULL,
	[ExpireDate] [smalldatetime] NULL,
	[Duites] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Requirements] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Display] [bit] NULL CONSTRAINT [DF_JobListings_Display]  DEFAULT (0),
	[RandID] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_JobListings] PRIMARY KEY CLUSTERED 
(
	[RecID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF







/****** Object:  Table [dbo].[JobApplications]    Script Date: 12/10/2008 14:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobApplications](
	[RecID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NULL,
	[FirstName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostDate] [smalldatetime] NULL,
	[CoverLetter] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Resume] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_JobApplications] PRIMARY KEY CLUSTERED 
(
	[RecID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF