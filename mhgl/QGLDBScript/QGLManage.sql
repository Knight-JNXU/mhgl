USE [QGLManage]
GO
/****** 对象:  Table [dbo].[ExecuteCheat]    脚本日期: 12/02/2011 12:08:01 ******/
DROP TABLE [dbo].[ExecuteCheat]
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateServiceStatus]    脚本日期: 12/02/2011 12:08:01 ******/
DROP PROCEDURE [dbo].[sp_UpdateServiceStatus]
GO
/****** 对象:  Table [dbo].[ServiceStatus]    脚本日期: 12/02/2011 12:08:00 ******/
DROP TABLE [dbo].[ServiceStatus]
GO
/****** 对象:  Table [dbo].[ServiceStatus]    脚本日期: 12/02/2011 12:08:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceStatus](
	[service_id] [smallint] NOT NULL,
	[status] [int] NOT NULL,
	[state] [int] NOT NULL,
	[last_update_time] [datetime] NOT NULL,
 CONSTRAINT [PK_ServiceStatus] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC,
	[status] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ServiceStatus] ON [dbo].[ServiceStatus] 
(
	[service_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[ExecuteCheat]    脚本日期: 12/02/2011 12:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecuteCheat](
	[exe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[target_acct_id] [bigint] NOT NULL,
	[target_char_id] [bigint] NOT NULL,
	[command] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[status] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_ExecuteCheat] PRIMARY KEY CLUSTERED 
(
	[exe_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateServiceStatus]    脚本日期: 12/02/2011 12:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateServiceStatus]
	@service_id smallint, @status int, @state int
AS

DECLARE @found smallint
SET @found = 0
SELECT @found = service_id FROM ServiceStatus WHERE service_id = @service_id AND status = @status;

IF (@found > 0)
	UPDATE ServiceStatus SET state = @state, last_update_time = GetDate() WHERE service_id = @service_id AND status = @status;
ELSE
	INSERT INTO ServiceStatus (service_id, status, state, last_update_time) VALUES (@service_id, @status, @state, GetDate());

RETURN
GO
