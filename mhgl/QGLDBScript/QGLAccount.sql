USE [QGLAccount]
GO
/****** 对象:  Table [dbo].[depositGift]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[depositGift]
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateYBT]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[sp_UpdateYBT]
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateYuanBao]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[sp_UpdateYuanBao]
GO
/****** 对象:  StoredProcedure [dbo].[Csp_DepositGame]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[Csp_DepositGame]
GO
/****** 对象:  StoredProcedure [dbo].[Csp_SendGift]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[Csp_SendGift]
GO
/****** 对象:  StoredProcedure [dbo].[sp_GetColNames]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[sp_GetColNames]
GO
/****** 对象:  StoredProcedure [dbo].[sp_NewAccount]    脚本日期: 12/02/2011 12:01:11 ******/
DROP PROCEDURE [dbo].[sp_NewAccount]
GO
/****** 对象:  Table [dbo].[firstDeposit]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[firstDeposit]
GO
/****** 对象:  Table [dbo].[InactiveAccount]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[InactiveAccount]
GO
/****** 对象:  Table [dbo].[DepositLog]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[DepositLog]
GO
/****** 对象:  Table [dbo].[Account]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[Account]
GO
/****** 对象:  Table [dbo].[GiftBox]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[GiftBox]
GO
/****** 对象:  Table [dbo].[SendGiftLog]    脚本日期: 12/02/2011 12:01:11 ******/
DROP TABLE [dbo].[SendGiftLog]
GO
/****** 对象:  User [gmtools]    脚本日期: 12/02/2011 12:01:11 ******/
DROP USER [gmtools]
GO
/****** 对象:  User [check]    脚本日期: 12/02/2011 12:01:11 ******/
DROP USER [check]
GO
/****** 对象:  User [boss]    脚本日期: 12/02/2011 12:01:11 ******/
DROP USER [boss]
GO
/****** 对象:  User [gmtools]    脚本日期: 12/02/2011 12:01:11 ******/
CREATE USER [gmtools] FOR LOGIN [gmtools] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  User [check]    脚本日期: 12/02/2011 12:01:11 ******/
CREATE USER [check] FOR LOGIN [check] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  User [boss]    脚本日期: 12/02/2011 12:01:11 ******/
CREATE USER [boss] FOR LOGIN [boss] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  Table [dbo].[depositGift]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[depositGift](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[bMoney] [int] NULL,
	[eMoney] [int] NULL,
	[itemid] [int] NULL,
	[itemtype] [int] NULL,
	[itemnum] [int] NULL,
	[serialNo] [nchar](16) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_depositGift] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateYBT]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateYBT]
	@acct_id bigint, @changeYBT bigint, @ratioPerYBT int
AS

DECLARE @NowYuan bigint, @NowYBT bigint, @TranName VARCHAR(20), @TempYB bigint, @TempYBT bigint;
SELECT @TranName = 'TransactionYBT';

BEGIN TRANSACTION @TranName
SET @NowYuan = 0
SET @NowYBT = 0
SELECT @NowYuan = yuanbao, @NowYBT = yuanbaoTicket FROM Account WHERE acct_id = @acct_id;

SET @TempYBT = @NowYBT + @changeYBT
SET @TempYB = @NowYuan - (@changeYBT * @ratioPerYBT)

IF (@TempYBT >= 0 AND @TempYB >= 0)
	BEGIN
		SELECT @TempYB, @TempYBT, 1 ;
		UPDATE Account SET yuanbao = @TempYB, yuanbaoTicket = @TempYBT WHERE acct_id = @acct_id;
	END
ELSE
	BEGIN
		SELECT @NowYuan, @NowYBT, 0 ;
	END
COMMIT TRANSACTION @TranName
GO
/****** 对象:  StoredProcedure [dbo].[sp_UpdateYuanBao]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateYuanBao]
	@acct_id bigint, @change bigint
AS

DECLARE @NowYuan bigint, @TranName VARCHAR(20);
SELECT @TranName = 'MyTransaction';

BEGIN TRANSACTION @TranName
SET @NowYuan = 0
SELECT @NowYuan = yuanbao FROM Account WHERE acct_id = @acct_id;

IF (@NowYuan + @change >= 0)
	BEGIN
		SELECT @NowYuan + @change, 1 ;
		UPDATE Account SET yuanbao = yuanbao + @change WHERE acct_id = @acct_id;	
	END
ELSE
	BEGIN
		SELECT @NowYuan, 0 ;
	END
COMMIT TRANSACTION @TranName
GO
/****** 对象:  Table [dbo].[Account]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[acct_id] [int] IDENTITY(1,1) NOT NULL,
	[loginName] [nchar](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[password_hash] [nchar](64) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[disconnect_time] [datetime] NULL CONSTRAINT [DF__Account__disconn__07020F21]  DEFAULT (getdate()),
	[offLnTime] [bigint] NOT NULL CONSTRAINT [DF__Account__offLnTi__07F6335A]  DEFAULT ((0)),
	[onLnTime] [bigint] NOT NULL CONSTRAINT [DF__Account__onLnTim__08EA5793]  DEFAULT ((0)),
	[yuanbao] [bigint] NOT NULL CONSTRAINT [DF__Account__yuanbao__09DE7BCC]  DEFAULT ((0)),
	[banTime] [datetime] NULL,
	[addictType] [tinyint] NOT NULL CONSTRAINT [DF__Account__addictT__0AD2A005]  DEFAULT ((0)),
	[yuanbaoLock] [tinyint] NOT NULL CONSTRAINT [DF__Account__yuanbao__0BC6C43E]  DEFAULT ((0)),
	[assetLockPassword] [nchar](64) COLLATE Chinese_PRC_CI_AS NOT NULL CONSTRAINT [DF__Account__assetLo__0CBAE877]  DEFAULT (N''),
	[forceUnlockDate] [datetime] NULL,
	[yuanbaoTicket] [bigint] NOT NULL CONSTRAINT [DF__Account__yuanbao__0DAF0CB0]  DEFAULT ((0)),
 CONSTRAINT [PK__Account__68487DD7] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Account1] ON [dbo].[Account] 
(
	[loginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[SendGiftLog]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SendGiftLog](
	[sendId] [int] IDENTITY(1,1) NOT NULL,
	[transferId] [bigint] NOT NULL,
	[loginname] [nchar](16) COLLATE Chinese_PRC_CI_AS NULL,
	[itemId] [int] NULL,
	[itemType] [smallint] NULL,
	[itemNum] [smallint] NULL,
	[sendType] [char](2) COLLATE Chinese_PRC_CI_AS NULL,
	[serialNo] [char](16) COLLATE Chinese_PRC_CI_AS NULL,
	[sendStatus] [char](2) COLLATE Chinese_PRC_CI_AS NULL,
	[sendTime] [datetime] NULL CONSTRAINT [DF__SendGiftL__sendT__108B795B]  DEFAULT (getdate()),
	[updateTime] [nchar](10) COLLATE Chinese_PRC_CI_AS NULL,
 CONSTRAINT [PK_SendGiftLog] PRIMARY KEY CLUSTERED 
(
	[sendId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_TRANSFER_ID] ON [dbo].[SendGiftLog] 
(
	[transferId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[InactiveAccount]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InactiveAccount](
	[acct_id] [bigint] NOT NULL,
	[loginName] [nchar](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[password_hash] [nchar](64) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[banTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[GiftBox]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiftBox](
	[gift_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[item_id] [int] NOT NULL,
	[itemtype] [smallint] NOT NULL CONSTRAINT [DF__GiftBox__itemtyp__145C0A3F]  DEFAULT ((0)),
	[quantity] [smallint] NOT NULL CONSTRAINT [DF__GiftBox__quantit__15502E78]  DEFAULT ((1)),
	[serialNo] [char](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
 CONSTRAINT [PK__GiftBox__173876EA] PRIMARY KEY CLUSTERED 
(
	[gift_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  StoredProcedure [dbo].[sp_GetColNames]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetColNames]
	@dbName sysname, @tblName sysname, @colnames nvarchar(3000) OUTPUT
AS

DECLARE @colcur CURSOR, @colname sysname, @sql nvarchar(100)

IF OBJECT_ID('_syscol', 'SN') IS NOT NULL 
	DROP SYNONYM _syscol

SET @sql = N'CREATE SYNONYM _syscol for ' + @dbName + N'..syscolumns'
EXEC sp_executesql @sql

SET @colcur = CURSOR SCROLL DYNAMIC
	FOR SELECT name from _syscol where id = object_id(@dbName + N'..' + @tblName)

SET @colnames = N''
OPEN @colcur

FETCH NEXT FROM @colcur INTO @colname
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @colnames = N''
		SET @colnames = @colname
	ELSE
		SET @colnames = @colnames + N', ' + @colname
    FETCH NEXT FROM @colcur INTO @colname
END

/* PRINT STR(LEN(@colnames)) + ' ' + @colnames */

CLOSE @colcur;
DEALLOCATE @colcur;
DROP SYNONYM _syscol
GO
/****** 对象:  Table [dbo].[firstDeposit]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[firstDeposit](
	[loginname] [nvarchar](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[depositqty] [int] NULL,
 CONSTRAINT [PK_firstDespoit] PRIMARY KEY CLUSTERED 
(
	[loginname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[DepositLog]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DepositLog](
	[depositId] [int] IDENTITY(1,1) NOT NULL,
	[billingId] [bigint] NOT NULL,
	[loginName] [nchar](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[amount] [bigint] NOT NULL,
	[balanceBefore] [bigint] NOT NULL,
	[balanceAfter] [bigint] NOT NULL,
	[depositType] [char](2) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[depositStatus] [char](2) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[depositTime] [datetime] NULL CONSTRAINT [DF__DepositLo__depos__7F60ED59]  DEFAULT (getdate()),
	[updateTime] [datetime] NULL,
 CONSTRAINT [PK_DepositLog] PRIMARY KEY CLUSTERED 
(
	[depositId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_LOGINNAME] ON [dbo].[DepositLog] 
(
	[loginName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_BILLING_ID] ON [dbo].[DepositLog] 
(
	[billingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** 对象:  StoredProcedure [dbo].[sp_NewAccount]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NewAccount]
	@name varchar(10), @sex smallint, @cclass smallint, @endAcc int
AS

DECLARE @i int, @j int, @friends int, @chars int, @acct_id bigint, @char_id bigint, @charlevel int, @randmap int, @randint int

set Nocount ON
INSERT INTO Account (loginName, password_hash) values (@name, N'64B138032C26059879DFFB7009979136A2D1ADC5785BED0C1DD29B5661DDBE43')

SELECT @acct_id = @@IDENTITY
SELECT @charlevel = FLOOR(RAND()*4)
SELECT @i = 1, @chars = 2, @friends = 10

WHILE (@i <= @chars)
BEGIN

IF @cclass = 1
	BEGIN
	IF @charlevel = 0
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(1, @name,@acct_id,9,13,12,8,13,224,224,224,142,142,142,111,111,200,200,200,100,100,100,20200,45,333,1,3,2,1,20102,21,86,0,1,3,0, 0);
	ELSE IF @charlevel = 1
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(1, @name,@acct_id,29,33,32,28,33,368,368,368,238,238,238,251,251,200,200,200,100,100,100,20200,45,333,2,1,1,2,20102,21,86,0,1,3,20, 100);
	ELSE IF @charlevel = 2
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(1, @name,@acct_id,49,53,52,48,53,512,512,512,334,334,334,391,391,200,200,200,100,100,100,20200,45,333,2,2,1,2,20102,21,86,0,1,3,40, 200);
	ELSE
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(1, @name,@acct_id,69,73,72,68,73,656,656,656,430,430,430,531,531,200,200,200,100,100,100,20200,45,333,1,2,1,3,20102,21,86,0,1,3,60, 300);
	END
ELSE IF @cclass = 2
	BEGIN
	IF @charlevel = 0
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(2, @name,@acct_id,11,10,11,14,9,248,248,248,114,114,114,83,83,200,200,200,100,100,100,20200,110,55,2,1,1,2,20102,21,86,0,1,3,0, 0);
	ELSE IF @charlevel = 1
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(2, @name,@acct_id,31,30,31,34,29,408,408,408,190,190,190,223,223,200,200,200,100,100,100,20200,110,55,3,1,2,1,20102,21,86,0,1,3,20, 100);
	ELSE IF @charlevel = 2
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(2, @name,@acct_id,51,50,51,54,49,568,568,568,266,266,266,363,363,200,200,200,100,100,100,20200,110,55,3,2,2,1,20102,21,86,0,1,3,40, 200);
	ELSE
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(2, @name,@acct_id,71,70,71,74,69,728,728,728,342,342,342,503,503,200,200,200,100,100,100,20200,110,55,2,2,1,2,20102,21,86,0,1,3,60, 300);
	END
ELSE IF @cclass = 3
	BEGIN
	IF @charlevel = 0
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(3, @name,@acct_id,10,13,13,8,11,250,250,250,126,126,126,97,97,200,200,200,100,100,100,20200,123,221,3,3,2,3,20102,21,86,0,1,3,0, 0);
	ELSE IF @charlevel = 1
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(3, @name,@acct_id,30,33,33,28,31,430,430,430,210,210,210,237,237,200,200,200,100,100,100,20200,123,221,3,2,2,2,20102,21,86,0,1,3,20, 100);
	ELSE IF @charlevel = 2
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(3, @name,@acct_id,50,53,53,48,51,610,610,610,294,294,294,377,377,200,200,200,100,100,100,20200,123,221,1,1,2,1,20102,21,86,0,1,3,40, 200);
	ELSE
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(3, @name,@acct_id,70,73,73,68,71,790,790,790,378,378,378,517,517,200,200,200,100,100,100,20200,123,221,3,2,1,3,20102,21,86,0,1,3,60, 300);
	END
ELSE IF @cclass = 4
	BEGIN
	IF @charlevel = 0
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(4, @name,@acct_id,14,11,12,10,8,283,283,283,105,105,105,76,76,200,200,200,100,100,100,20200,84,324,1,1,1,3,20102,21,86,0,1,3,0, 0);
	ELSE IF @charlevel = 1
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(4, @name,@acct_id,34,31,32,30,28,459,459,459,169,169,169,216,216,200,200,200,100,100,100,20200,84,324,3,1,1,3,20102,21,86,0,1,3,20, 100);
	ELSE IF @charlevel = 2
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(4, @name,@acct_id,54,51,52,50,48,635,635,635,233,233,233,356,356,200,200,200,100,100,100,20200,84,324,1,2,2,3,20102,21,86,0,1,3,40, 200);
	ELSE
		INSERT INTO Character(cclass, nickName, acct_id, STR, CON, STA, AGI, SPR, maxHP,mHP,HP, maxSP,mSP,SP, maxVP,VP, maxDP,mDP,DP, maxWC,WC,WcExp, map_id, map_x, map_y, org_hairStyle1, org_hairColor, org_eq_cloth, org_eq_clothColor, reborn_map, reborn_x, reborn_y, sex, maxPet, maxPartner, level, attrPoint) VALUES(4, @name,@acct_id,74,71,72,70,68,811,811,811,297,297,297,496,496,200,200,200,100,100,100,20200,84,324,3,3,1,2,20102,21,86,0,1,3,60, 300);
	END

SELECT @char_id = @@IDENTITY

IF @sex = 1
	UPDATE Character SET sex=@sex where char_id=@char_id;
	
IF @charlevel = 1
	BEGIN
		SELECT @randmap = FLOOR(RAND()*15);
		IF @randmap = 0
			UPDATE Character SET map_id=20301, map_x=9, map_y=180 WHERE char_id=@char_id;
		ELSE IF @randmap = 1
			UPDATE Character SET map_id=20301, map_x=74, map_y=215 WHERE char_id=@char_id;
		ELSE IF @randmap = 2
			UPDATE Character SET map_id=20301, map_x=62, map_y=80 WHERE char_id=@char_id;
		ELSE IF @randmap = 3
			UPDATE Character SET map_id=20302, map_x=25, map_y=75 WHERE char_id=@char_id;
		ELSE IF @randmap = 4
			UPDATE Character SET map_id=20303, map_x=16, map_y=71 WHERE char_id=@char_id;
		ELSE IF @randmap = 5
			UPDATE Character SET map_id=20304, map_x=18, map_y=40 WHERE char_id=@char_id;
		ELSE IF @randmap = 6
			UPDATE Character SET map_id=20305, map_x=19, map_y=43 WHERE char_id=@char_id;
		ELSE IF @randmap = 7
			UPDATE Character SET map_id=20306, map_x=18, map_y=69 WHERE char_id=@char_id;
		ELSE IF @randmap = 8
			UPDATE Character SET map_id=20307, map_x=21, map_y=71 WHERE char_id=@char_id;
		ELSE IF @randmap = 9
			UPDATE Character SET map_id=20308, map_x=27, map_y=64 WHERE char_id=@char_id;
		ELSE IF @randmap = 10
			UPDATE Character SET map_id=20309, map_x=26, map_y=43 WHERE char_id=@char_id;
		ELSE IF @randmap = 11
			UPDATE Character SET map_id=20310, map_x=23, map_y=107 WHERE char_id=@char_id;
		ELSE IF @randmap = 12
			UPDATE Character SET map_id=20311, map_x=17, map_y=60 WHERE char_id=@char_id;
		ELSE IF @randmap = 13
			UPDATE Character SET map_id=40100, map_x=14, map_y=45 WHERE char_id=@char_id;
		ELSE
			UPDATE Character SET map_id=40101, map_x=17, map_y=54 WHERE char_id=@char_id;
	END
ELSE IF @charlevel = 2
	BEGIN
		SELECT @randmap = FLOOR(RAND()*5);
		IF @randmap = 0
			UPDATE Character SET map_id=801, map_x=24, map_y=56 WHERE char_id=@char_id;
		ELSE IF @randmap = 1
			UPDATE Character SET map_id=1100, map_x=45, map_y=161 WHERE char_id=@char_id;
		ELSE IF @randmap = 2
			UPDATE Character SET map_id=20400, map_x=78, map_y=71 WHERE char_id=@char_id;
		ELSE IF @randmap = 3
			UPDATE Character SET map_id=20401, map_x=19, map_y=67 WHERE char_id=@char_id;
		ELSE
			UPDATE Character SET map_id=20402, map_x=17, map_y=47 WHERE char_id=@char_id;
	END
ELSE IF @charlevel = 3
	BEGIN
		SELECT @randmap = FLOOR(RAND()*7);
		IF @randmap = 0
			UPDATE Character SET map_id=20600, map_x=33, map_y=36 WHERE char_id=@char_id;
		ELSE IF @randmap = 1
			UPDATE Character SET map_id=20601, map_x=22, map_y=46 WHERE char_id=@char_id;
		ELSE IF @randmap = 2
			UPDATE Character SET map_id=20301, map_x=62, map_y=80 WHERE char_id=@char_id;
		ELSE IF @randmap = 3
			UPDATE Character SET map_id=20302, map_x=25, map_y=75 WHERE char_id=@char_id;
		ELSE IF @randmap = 4
			UPDATE Character SET map_id=20303, map_x=16, map_y=71 WHERE char_id=@char_id;
		ELSE IF @randmap = 5
			UPDATE Character SET map_id=20304, map_x=18, map_y=40 WHERE char_id=@char_id;
		ELSE
			UPDATE Character SET map_id=20402, map_x=17, map_y=47 WHERE char_id=@char_id;
	END

SELECT @randint = FLOOR(RAND()*1000000);
UPDATE Character SET money=@randint WHERE char_id=@char_id
SELECT @randint = FLOOR(RAND()*1000000);
UPDATE Account SET yuanbao=@randint WHERE acct_id=@acct_id
SELECT @randint = FLOOR(RAND()*1000000);
UPDATE Character SET bankMoney=@randint WHERE char_id=@char_id

INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51089, @char_id, 0, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51205, @char_id, 1, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51220, @char_id, 2, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51221, @char_id, 3, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51222, @char_id, 4, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(51223, @char_id, 5, 1, 1)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(32000, @char_id, 6, 1, 50)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(32010, @char_id, 7, 1, 50)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(32020, @char_id, 8, 1, 50)
INSERT INTO Item (item_id, owner_id, bagIndex, remain, stack) values
	(32030, @char_id, 9, 1, 50)

SELECT @j = 0
WHILE (@j < @friends)
BEGIN
	INSERT Messenger (player_char_id, friend_char_id, friend_relation, friend_group) values (@char_id, ((@char_id + @chars - 1 + @j) % (@chars * @endAcc)) + 1, 1, (@j % 4) + 1)
	SELECT @j = @j + 1
END

SELECT @i = @i + 1
SELECT @cclass = ((@cclass + 1) % 4) + 1, @sex = (@sex + 1) % 2, @name = @name + '_' + LTRIM(STR(@i))

END
set Nocount OFF

RETURN
GO
/****** 对象:  StoredProcedure [dbo].[Csp_SendGift]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Csp_SendGift] 
	-- Add the parameters for the stored procedure here
	@TransferId bigint,
	@LoginName nvarchar(16),
	@ItemId	int,
	@ItemType smallint,
	@ItemNums smallint,
	@SendType char(2),
	@SerialNo char(16),
	@ResultCode int output
AS
DECLARE 
@RESULT_SUCCESS int,--成功代码
@RESULT_ERROR int,--失败代码
@TEMP_SEND_STATUS CHAR(2),--发送状态临时
@SENDSTATUS_SUCCESS CHAR(2),--发送状态成功
@SENDSTATUS_ERROR	CHAR(2),--发送状态失败
@SENDSTATUS_DEFAULT char(2),--发送状态默认
@RECORD_NUMS INT,--存在记录数
@SEND_TRANS VARCHAR(20),
@RESEND_TRANS VARCHAR(20),

@AcctId	bigint

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @SENDSTATUS_DEFAULT='01'
	SET @SENDSTATUS_SUCCESS='02'
	SET @SENDSTATUS_ERROR='03'
	SET @RESULT_SUCCESS=0
	SET @RESULT_ERROR=-1
	SET @RECORD_NUMS=0
	SET @ResultCode=@RESULT_SUCCESS
	SET @SEND_TRANS = 'SENDGIFT'
	SET @RESEND_TRANS = 'RESENDGIFT'

	select @AcctId=acct_id 
	from account 
	where loginname=@LoginName

    --判断是否已经存在发放记录
    IF EXISTS (SELECT 1 FROM SendGiftLog WHERE transferId=@TransferId)
		BEGIN
			--判断发放状态
			SELECT @TEMP_SEND_STATUS=sendStatus				
				FROM SendGiftLog 
				WHERE transferId=@TransferId
				
			
			IF @TEMP_SEND_STATUS = @SENDSTATUS_SUCCESS
				BEGIN
					--成功直接返回
					SET @ResultCode=@RESULT_SUCCESS
					RETURN;
				END
			ELSE
				BEGIN
					--失败则进行发放
					BEGIN TRANSACTION @RESEND_TRANS
					INSERT INTO [GiftBox]
					   ([acct_id],[item_id],[itemtype]
					   ,[quantity],[serialNo])
				 VALUES
					   (@AcctId ,@ItemId ,@ItemType
					   ,@ItemNums,@SerialNo)
					
					UPDATE SendGiftLog
					SET
					UPDATETIME=GETDATE(),
					sendstatus=@SENDSTATUS_SUCCESS
					WHERE transferId=@TransferId					
					
					COMMIT TRANSACTION @RESEND_TRANS
					
					IF @@ERROR<>0 
					SET @ResultCode=@RESULT_ERROR
					
					RETURN;
				END		
		END
    ELSE
		BEGIN
			BEGIN TRANSACTION @SEND_TRANS
			INSERT INTO [SendGiftLog]
				   ([transferId],[loginname] ,[itemId]
				   ,[itemType],[itemNum] ,[sendType]
				   ,[serialNo],[sendStatus])
			 VALUES
				   (@TransferId,@LoginName,@ItemId
				   ,@ItemType ,@ItemNums,@SendType
				   ,@SerialNo ,@SENDSTATUS_DEFAULT)

			
			INSERT INTO [GiftBox]
			   ([acct_id],[item_id],[itemtype]
			   ,[quantity],[serialNo])
			VALUES
			   (@AcctId ,@ItemId ,@ItemType
			   ,@ItemNums,@SerialNo)

			UPDATE SendGiftLog
			SET
				UPDATETIME=GETDATE(),
				sendstatus=@SENDSTATUS_SUCCESS
			WHERE transferId=@TransferId	
			
			
		
			COMMIT TRANSACTION @SEND_TRANS
			
			IF @@ERROR<>0 
			SET @ResultCode=@RESULT_ERROR
					
			RETURN;
		END
	
END
GO
/****** 对象:  StoredProcedure [dbo].[Csp_DepositGame]    脚本日期: 12/02/2011 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Csp_DepositGame] 
	-- Add the parameters for the stored procedure here
	@BillingId bigint,
	@LoginName nvarchar(16),
	@Amount	bigint,
	@DepositType char(2),
	@ResultCode int output
AS
DECLARE 
@RESULT_SUCCESS int,--成功代码
@RESULT_ERROR int,--失败代码
@TEMP_DEPOSIT_STATUS CHAR(2),--充值状态临时
@DEPOSITSTATUS_SUCCESS CHAR(2),--充值状态成功
@DEPOSITSTATUS_ERROR	CHAR(2),--充值状态失败
@DEPOSITSTATUS_DEFAULT char(2),--充值状态默认
@RECORD_NUMS INT,--存在记录数
@BALANCE_BEFORE BIGINT,--充值前元宝余额
@BALANCE_AFTER	BIGINT,--充值后元宝余额
@DEPOSIT_TRANS VARCHAR(20),
@REDEPOSIT_TRANS VARCHAR(20),
@AMOUNT_NOTSEND BIGINT

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @DEPOSITSTATUS_DEFAULT='01'
	SET @DEPOSITSTATUS_SUCCESS='02'
	SET @DEPOSITSTATUS_ERROR='03'
	SET @RESULT_SUCCESS=0
	SET @RESULT_ERROR=-1
	SET @RECORD_NUMS=0
	SET @ResultCode=@RESULT_SUCCESS
	SET @DEPOSIT_TRANS = 'DEPOSIT'
	SET @REDEPOSIT_TRANS = 'REDEPOSIT'
    --判断是否已经存在充值记录
    IF EXISTS (SELECT 1 FROM DEPOSITLOG WHERE BILLINGID=@BillingId)
		BEGIN
			--判断充值状态
			SELECT @TEMP_DEPOSIT_STATUS=depositStatus,
				@AMOUNT_NOTSEND=AMOUNT
				FROM DEPOSITLOG 
				WHERE BILLINGID=@BillingId
				
			
			IF @TEMP_DEPOSIT_STATUS = @DEPOSITSTATUS_SUCCESS
				BEGIN
					--成功直接返回
					SET @ResultCode=@RESULT_SUCCESS
					RETURN;
				END
			ELSE
				BEGIN
					--失败则进行发放
					BEGIN TRANSACTION @REDEPOSIT_TRANS
					UPDATE ACCOUNT
					SET YUANBAO=YUANBAO+@AMOUNT_NOTSEND,
					@BALANCE_BEFORE=YUANBAO,
					@BALANCE_AFTER=YUANBAO+@AMOUNT_NOTSEND
					WHERE LOGINNAME=@LoginName
					
					UPDATE DEPOSITLOG
					SET BALANCEAFTER= @BALANCE_AFTER,
					BALANCEBEFORE=@BALANCE_BEFORE,
					UPDATETIME=GETDATE(),
					DEPOSITSTATUS=@DEPOSITSTATUS_SUCCESS
					WHERE BILLINGID=@BillingId					
					
					COMMIT TRANSACTION @REDEPOSIT_TRANS
					
					IF @@ERROR<>0 
					SET @ResultCode=@RESULT_ERROR
					
					RETURN;
				END		
		END
    ELSE
		BEGIN
			BEGIN TRANSACTION @DEPOSIT_TRANS
			INSERT INTO DEPOSITLOG(BILLINGID,
			LOGINNAME,AMOUNT,BALANCEBEFORE,
			BALANCEAFTER,DEPOSITTYPE,DEPOSITSTATUS)
			VALUES
			(
			@BillingId,
			@LoginName,	@Amount,0,
			0,@DepositType,@DEPOSITSTATUS_DEFAULT
			)		
			
			
			UPDATE ACCOUNT
			SET YUANBAO=YUANBAO+@Amount,
			@BALANCE_BEFORE=YUANBAO,
			@BALANCE_AFTER=YUANBAO+@Amount
			WHERE LOGINNAME=@LoginName 				
			
			UPDATE DEPOSITLOG
			SET BALANCEAFTER= @BALANCE_AFTER,
			BALANCEBEFORE=@BALANCE_BEFORE,
			UPDATETIME=GETDATE(),
			DEPOSITSTATUS=@DEPOSITSTATUS_SUCCESS
			WHERE BILLINGID=@BillingId
			COMMIT TRANSACTION @DEPOSIT_TRANS
			
			IF @@ERROR<>0 
			SET @ResultCode=@RESULT_ERROR
					
			RETURN;
		END
	
END
GO
GRANT ALTER ON [dbo].[Csp_SendGift] TO [boss]
GO
GRANT EXECUTE ON [dbo].[Csp_SendGift] TO [boss]
GO
GRANT ALTER ON [dbo].[Csp_DepositGame] TO [boss]
GO
GRANT EXECUTE ON [dbo].[Csp_DepositGame] TO [boss]
GO
