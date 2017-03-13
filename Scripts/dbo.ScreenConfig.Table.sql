USE [LarcoOld]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScreenConfig](
	[ScreenConfigId] [int] IDENTITY(1,1) NOT NULL,
	[PastDueText] [varchar](50) NOT NULL,
	[UrgentText] [varchar](50) NOT NULL,
	[TaskId] [int] NOT NULL,
	[ShowPastDueInTask] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowPastDueInTask]  DEFAULT ((0)),
	[ShowPastDueBeforeTask] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowPastDueBeforeTask]  DEFAULT ((0)),
	[ShowUrgent] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowUrgent]  DEFAULT ((0)),
	[ShowBanner] [bit] NOT NULL CONSTRAINT [DF_ScreenConfig_ShowBanner]  DEFAULT ((0)),
	[BannerText] [varchar](100) NULL,
	[BannerTime] [int] NULL CONSTRAINT [DF_ScreenConfig_BannerTime]  DEFAULT ((0)),
	[UpdatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_ScreenConfig_UpdatedDate]  DEFAULT (getdate()),
	[MinimumTimeInTask] [int] NULL DEFAULT ((1)),
	[DetailTime] [int] NULL DEFAULT ((10)),
PRIMARY KEY CLUSTERED 
(
	[ScreenConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_TaskId] UNIQUE NONCLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
