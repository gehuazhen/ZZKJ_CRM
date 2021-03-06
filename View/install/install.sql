
/****** Object:  Table [dbo].[Tool_batch]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tool_batch](
	[id] [varchar](50) NOT NULL,
	[batch_type] [varchar](50) NULL,
	[batch_filter] [varchar](max) NULL,
	[o_emp_id] [varchar](50) NULL,
	[c_emp_id] [varchar](50) NULL,
	[b_count] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Tool_batch] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Task_follow]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task_follow](
	[id] [varchar](50) NOT NULL,
	[task_id] [varchar](50) NULL,
	[follow_id] [varchar](50) NULL,
	[follow_time] [datetime] NULL,
	[follow_content] [nvarchar](max) NULL,
	[follow_status] [int] NULL,
 CONSTRAINT [PK_Task_follow] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Task]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[id] [varchar](50) NOT NULL,
	[task_title] [nvarchar](250) NULL,
	[task_content] [nvarchar](max) NULL,
	[task_type_id] [varchar](50) NULL,
	[customer_id] [varchar](50) NULL,
	[assign_id] [varchar](50) NULL,
	[executive_id] [varchar](50) NULL,
	[executive_time] [datetime] NULL,
	[task_status_id] [int] NULL,
	[Priority_id] [int] NULL,
	[remind_time] [datetime] NULL,
	[isCheck] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_role_emp]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_role_emp](
	[RoleID] [varchar](50) NOT NULL,
	[empID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_role]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_role](
	[id] [varchar](50) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[RoleDscript] [nvarchar](255) NULL,
	[RoleSort] [int] NULL,
	[DataAuth] [int] NULL,
	[PublicAuth] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_role] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_role] ([id], [RoleName], [RoleDscript], [RoleSort], [DataAuth], [PublicAuth], [create_id], [create_time]) VALUES (N'9C348B4A-E487-4A77-9147-FFE0EEA65E3B', N'系统管理员', N'拥有全部权限', 999, 5, 1, N'38295F35-8507-4254-B727-B8FF26E9E302', CAST(0x0000A7DE00B7F9ED AS DateTime))
INSERT [dbo].[Sys_role] ([id], [RoleName], [RoleDscript], [RoleSort], [DataAuth], [PublicAuth], [create_id], [create_time]) VALUES (N'C483A514-8209-4D78-BBEB-83407E6F6F00', N'业务员', N'查看本人数据', 10, 1, 0, N'38295F35-8507-4254-B727-B8FF26E9E302', CAST(0x0000A7DE00BFE501 AS DateTime))
/****** Object:  Table [dbo].[Sys_Param_Type]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Param_Type](
	[id] [varchar](50) NOT NULL,
	[params_name] [varchar](250) NULL,
	[params_order] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_Param_Type] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'invoice_type', N'【发票】类型', 90, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'order_status', N'【订单】状态', 80, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'pay_type', N'【支付】方式', 70, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'follow_type', N'【跟进】方式', 60, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'cus_source', N'【客户】来源', 40, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'cus_level', N'【客户】级别', 30, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'cus_type', N'【客户】类型', 20, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'task_type', N'【任务】类别', 100, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'follow_aim', N'【跟进】目的', 50, NULL, NULL)
INSERT [dbo].[Sys_Param_Type] ([id], [params_name], [params_order], [create_id], [create_time]) VALUES (N'cus_industry', N'【客户】行业', 10, NULL, NULL)
/****** Object:  Table [dbo].[Sys_Param_Provinces]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Param_Provinces](
	[id] [varchar](50) NOT NULL,
	[Provinces] [varchar](250) NULL,
	[Provinces_order] [int] NULL,
	[Provinces_type] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_Param_Provinces] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'北京市', 10, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'上海', 20, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'天津', 30, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N' 重庆', 40, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N' 黑龙江', 50, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'吉林', 60, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'辽宁', 70, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'内蒙古', 80, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'09E6B810-BB48-4C9D-A51D-392393C82CF8', N'宁夏', 90, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'新疆', 100, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'青海', 110, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'甘肃', 120, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'陕西', 130, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'河北', 140, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'B15279E1-EEFE-446C-9034-5C7376E23745', N'河南', 150, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'山东', 160, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'山西', 170, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'湖北', 180, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'湖南', 190, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'安徽', 200, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'江苏', 210, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'73A643D6-A528-46D1-933C-985A832646C7', N'浙江', 220, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'江西', 230, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'E6E267E9-12EA-4026-B830-806A502214A7', N'广东', 240, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'广西', 250, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'福建', 260, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'四川', 270, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'云南', 280, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'贵州', 290, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'西藏', 300, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'2E2C5725-CC26-491A-B3E3-92D81B585F12', N'海南', 310, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'877347E3-B5DA-4302-9268-515E5EDE2E88', N'香港', 320, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'DB047952-B531-493D-BC0B-017AD809054E', N'澳门', 330, N'sys', NULL, NULL)
INSERT [dbo].[Sys_Param_Provinces] ([id], [Provinces], [Provinces_order], [Provinces_type], [create_id], [create_time]) VALUES (N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'台湾', 340, N'sys', NULL, NULL)

/****** Object:  Table [dbo].[Sys_Param_City]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Param_City](
	[id] [varchar](50) NOT NULL,
	[Provinces_id] [varchar](50) NULL,
	[City] [varchar](250) NULL,
	[City_order] [int] NULL,
	[City_type] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_Param_City] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'177E60D7-6326-440E-A8E4-74B3180D1F4F', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'东城区', 10, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DAE939CF-F47F-4089-98C9-0AEED02A6F05', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'西城区', 20, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6BC1AFA9-AE7C-4CC4-9C2E-6809C7A84D58', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'宣武区', 30, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6D2FE75C-1122-4B9E-8340-94700ABFEA05', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'崇文区', 40, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E920CCFB-48A1-4F44-AF96-0985F8450895', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'朝阳区', 50, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D653BFAC-60E2-4442-9543-CED3FD4B65A5', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'海淀区', 60, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1503E8AD-5830-43C3-8D2B-0147D2FCBB5C', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'丰台区', 70, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C7176CFA-6802-448F-AB97-939EE3B65880', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'石景山区', 80, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1B9D7B4E-9969-49AF-8F7C-21843461ECCD', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'门头沟区', 90, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CC675B49-CDBF-4755-A7B3-CFBE3BDEB830', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'昌平区', 100, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'026F4702-4B42-44A8-8E56-4DC369CFCC19', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'大兴区', 110, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'92D21B94-ADF4-4632-8EFE-1628B47A7B88', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'怀柔区', 120, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4BCCA7A7-0128-4F75-9616-6262FBABADFE', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'密云县', 130, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FF8EF6A6-B5CE-497E-B03B-127886D73BB7', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'平谷区', 140, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8AF11CA5-E03B-4F8A-B665-2AE1502AE635', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'顺义区', 150, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'80C28E8D-3554-4753-B124-F16DA7A4DAE8', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'通州区', 160, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'25F24A79-3496-4EE2-AC73-5C2C83A0D4B8', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'延庆县', 170, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'58F25CBC-CD16-4C9A-9093-583014700219', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', N'房山区', 180, N'sys', N'E046DC72-7828-4C2E-86EC-FDD5642C0FDA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'46DB9E83-52C4-44CB-8138-FAC04E1C0D23', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'黄浦区', 10, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CF7D4D5E-3267-48E9-B432-3413CCC6F9D0', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'南市区', 20, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C04A93B1-C29D-4C4B-BE15-8ED77EDB6090', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'卢湾区', 30, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EA29EC66-2E8C-4434-825D-F993193E6504', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'徐汇区', 40, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2310720F-1EA3-4308-86CC-F6A0505D9C23', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'长宁区', 50, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5EB79320-6CA7-4E40-B7A4-B01178F1888E', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'静安区', 60, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C5985FF3-DA75-4766-B915-0BD2F88F591D', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'普陀区', 70, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'116E8B97-746B-47C4-A8DD-B296C3BE05EB', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'金山区', 80, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B4A24602-9909-4FD7-BEBE-8BD738196D5A', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'闸北区', 90, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'26719753-9C53-4908-A5B2-4ADAFDD653EB', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'虹口区', 100, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'61F2CD61-F19B-4E0C-97EC-7D5A8259B5BD', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'杨浦区', 110, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A54400A5-A153-4E0F-9500-8E354AEC97BB', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'宝山区', 120, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5FB4966E-CAB8-4EED-A9F1-5DC1607BF7DA', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'闵行区', 130, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0FD10C23-B55C-4CE8-AEBD-7370A79E1494', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'嘉定区', 140, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C2F33CD9-E371-43AA-8072-5E7F0965A853', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'松江区', 150, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6F06F964-92E1-4912-A043-DD2126C130DD', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'浦东新区', 160, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B61973BA-74DC-4271-B391-BA46492F8D27', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'青浦县', 170, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9D3F399B-A88E-4401-B84A-354759C610D2', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'奉贤县', 180, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'75024D1A-3CAF-4BA7-BD70-C9903148FD1F', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'南汇县', 190, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8DC83762-27DD-4C1C-8EC3-E6F7AFE2A660', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', N'崇明县', 200, N'sys', N'2D1FD454-4F3B-407D-988B-F589AF8A6DD8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7CCDD588-4E5F-42F0-AFB4-2A63D0A7BFBA', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'和平区', 10, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'644FBA4D-AD12-49C0-9CD8-DF8F93B4C755', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'河东区', 20, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'46053200-8D27-4418-9C8A-23F0D7E344AA', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'河西区', 30, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'98064DFF-AAAC-4CAA-837E-52EE6CE95AC5', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'河北区', 40, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'46F5CE97-0C58-44D5-A457-8BB649A90A68', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'南开区', 50, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'69E9D33D-5FA5-4740-AA40-BEC2D13BA775', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'红桥区', 60, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'97F6CA67-D5F3-4A64-BC9D-8E7FE58927BC', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'塘沽区', 70, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1F14E7C2-8724-430D-9C56-23E0E885D647', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'汉沽区', 80, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C673A084-D271-4D54-8019-D4C72DB80E1A', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'大港区', 90, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'354A5890-5589-445F-806F-BC5BB46D31C9', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'东丽区', 100, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E8732A3F-8870-4A66-8E2B-EE26EE3A22FE', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'西青区', 110, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A3C33A64-5700-4F64-80D0-3163410ACB4B', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'津南区', 120, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F90DF0D1-AC65-4DAF-9697-ED5D3705CA94', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'北辰区', 130, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'560FB77A-774A-4D76-AB5B-E2C88A132729', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N' 武清区', 140, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3B5A5D56-89C2-4861-B7C8-94E233A6B55C', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'宝坻区', 150, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2B73BDC9-4C49-4543-A352-D07EE3FDC0AA', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'蓟 县', 160, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0E582E68-B709-4F51-BC9B-0E7700F08D78', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'宁河县', 170, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3F564A61-D21E-47D3-8CA3-C10FA963FC2F', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', N'静海县', 180, N'sys', N'7C38C5CC-3008-4D9F-AC83-68AF5C8AE421', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B9814B13-37F9-4FCC-8193-A6667CEF1610', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'永川市', 10, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4694A371-D4A4-4584-B289-2754A6070543', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'黔江区', 20, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2A9AF3D9-58A1-4B22-A7C8-68AB67642A71', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'涪陵区', 30, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EF7BF8E3-38D3-45CE-9CEB-B82EC93E7E82', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'万洲区', 40, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'371788AE-EE0C-4B39-A666-A1AD036263F3', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'渝中区', 50, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'72DF1BAD-39A2-4825-BA06-1B2331E8C813', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'大渡口区', 60, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'229759FD-7E55-4394-ACA5-A4571FE579B6', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'江北区', 70, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CEBE34ED-6319-4A7B-B938-BC707AECFEFD', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'沙坪坝区', 80, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8F0D98FB-21FA-4766-8D97-3C8E063B2FB7', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'九龙坡区', 90, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B47AD8BE-FB34-443F-84F1-9DF573646A03', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'南岸区', 100, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CA838A27-A697-4024-97D1-ADF09055984D', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'北碚区', 110, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ECB2F0DB-25A1-40F3-81EF-DAB984265BD2', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N' 万盛区', 120, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'37CEA570-8789-4FF4-BCA2-38A9729A8A79', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'双桥区', 130, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'16A81045-1415-4343-8CAC-D99295EF9938', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'渝北区', 140, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D0F33393-7BF0-43E7-B751-DB5BE687BC16', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'巴南区', 150, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'27702151-3AC4-4934-AC00-E5F002CA93B8', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', N'长寿区', 160, N'sys', N'C7ABD4D6-4896-4928-89FB-FB8D8CB84D3C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'08BC671E-A223-4E03-BD70-3ED3E15422BA', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'哈尔滨', 10, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'67E28AD3-4A6F-4639-B990-9FBB1B2D75B1', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'齐齐哈尔', 20, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4BCE2A85-2FB5-4645-9708-9AD9DAA9783B', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'牡丹江', 30, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6639A4DC-416A-4EA4-B0EA-E899E2979293', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'鹤岗', 40, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8DC61E2A-C8C3-41EB-BF5D-3035A9368A62', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'双鸭山', 50, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EEB6CAB9-9B63-4633-86BE-8A2CA0E3E54B', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'鸡西', 60, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E8187930-732A-438F-8482-3665F79FBC41', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'大庆', 70, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A3002C17-4B45-48A2-868B-0B6980C6D2A9', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'伊春', 80, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'42D75FDF-02A3-4C7E-BAB5-997BD119E91F', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'佳木斯', 90, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3A7A5F1D-F0ED-42A4-86A9-70AAE0298C1D', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'七台河', 100, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'15EBDD2C-CDD4-48E4-8ABB-905E226D655C', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'黑河', 110, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3B830325-3894-4C9A-A2C1-13511A804888', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'绥化', 120, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'96B70721-9651-43B1-A119-9C6EDE6EAB61', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', N'大兴安岭地区', 130, N'sys', N'DC92D9EC-B6B5-4BC2-AE44-EB0C16522FF1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'84D42C77-3848-4C58-85F7-18E883366F99', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'长春', 10, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'60909811-1617-48A9-9C35-CD5B23E8BBD8', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'吉林', 20, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'84529288-C5EC-4513-8B9A-7F94B4A9B199', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'四平', 30, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'62508CF8-38C8-4462-BABD-F17AD72926C5', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'辽源', 40, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'33878395-580C-4500-80FA-F79A59693883', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'通化', 50, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FF27C627-6625-4697-8FD6-1FAF6509DF78', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'白山', 60, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8077097E-9F97-4D9C-AE61-D7BD21B6556E', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'松原', 70, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5453CB77-A409-48E9-9BFF-97A00B8F18ED', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'白城', 80, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6380A3C1-5383-42AC-A855-7D8438914A34', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'延边朝鲜族自治州', 90, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'597BD542-B57C-4F37-B3B4-40A70F501D45', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'高新', 100, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D29C7012-094D-430C-B0A1-5542A00A5CC5', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'延吉', 110, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D2EB50A0-219C-4190-B541-4704AEEDAB1C', N'3B496280-21BC-4EFA-9192-FF276CD173CA', N'梅河口', 120, N'sys', N'3B496280-21BC-4EFA-9192-FF276CD173CA', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6DBC39B6-BB86-437B-A19A-FF53C2A8CE87', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'沈阳', 10, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1BA2730E-7B4F-46AD-B5AF-8121E89998FB', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'大连', 20, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DEBE8B6E-4B7D-4052-BE06-A16A768BB23B', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'锦州', 30, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FD933814-DE97-4107-8DBF-30BE0EE4B931', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'鞍山', 40, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A5FD24CF-6657-46F2-B1A9-8BD9E4F40659', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'抚顺', 50, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'974B2022-3DA1-4B27-948B-707C16EC499C', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'本溪', 60, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ED5E005F-57AC-41D9-A964-83F2957406D8', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'丹东', 70, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C433FC27-76E7-436A-B60D-190DA7B06381', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'葫芦岛', 80, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3F3EF63C-C052-4245-ABF4-CFFD4AA31C91', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'营口', 90, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'852766B9-87C6-4CB5-A7DF-6499CFA3E179', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'盘锦', 100, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FE1A345A-42B6-4A0D-92E8-CE291288A704', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'阜新', 110, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'338FBBAC-2D59-4BB8-837C-9B77296EB25B', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'辽阳', 120, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A3714F10-1B9B-4392-9932-D2ADCFB3E84E', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'铁岭', 130, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0FEE4C31-85E9-49A4-B104-C8A7B09619B3', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'朝阳', 140, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0885760B-CF61-49D0-A5B9-2BA5EB7E005D', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', N'瓦房店', 150, N'sys', N'79F4174B-D73C-4DD8-A354-D005183DAFC9', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'82E81A9B-A42B-4EDE-B8AF-E1FD13566CAF', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'呼和浩特', 10, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'68DE4A6A-EC28-487B-AAB9-52C257911A94', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'包头', 20, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'47016734-2153-492D-8852-CBC51D933398', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'乌海', 30, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E3CA8BE4-7D98-44A5-A1CF-5865B7E6EE75', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'赤峰', 40, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'12B1D948-F0EF-4C1C-81DB-00FC480BEA3C', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'通辽', 50, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A8D4E81F-33B9-4945-BC4C-F5AF39C52BEF', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'鄂尔多斯', 60, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2A11AC6C-20F4-4DD0-91AA-7D1900F7B62E', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'乌兰察布盟', 70, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'99DFE7CA-B340-4365-A401-8E96598182F4', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'锡林郭勒盟', 80, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9906E66C-3BD7-4D39-9988-D4AA8A4AD5B7', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'巴彦淖尔盟', 90, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3FB0D988-D344-459B-8E6B-DA04B1510A98', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'阿拉善盟', 100, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'95914113-2E95-4E3F-805C-EDF3FCC063F9', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'兴安盟', 110, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'689C7EF9-1C17-4845-885B-2E6D06839CD4', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'巴彦淖尔', 120, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F85E2D82-B7FE-4BAF-8E68-BFFFF2835C9D', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'呼伦贝尔', 130, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'47E085CE-B399-424E-B8A7-A80C8B3D6890', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'集宁', 140, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5FE9DC2F-F369-4AD6-B494-73FF91CF9B94', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N' 乌兰浩特', 150, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'428B3624-5E0F-4E52-A9C8-3B2C11301CF7', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', N'锡林浩特', 160, N'sys', N'BCC6AA79-8379-4542-94B2-92C7C7F1CD5C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'537C83F0-0117-456D-83BC-7CEC7225B1E0', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', N'银川', 10, N'sys', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0F372126-E743-46B9-A5B5-9083DE471000', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', N'石嘴山', 20, N'sys', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'25B62499-6261-4A73-9BB5-DD9EC664DCE4', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', N'吴忠', 30, N'sys', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A33C7BEA-9454-4D27-A4B2-88C58374646C', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', N'固原', 40, N'sys', N'09E6B810-BB48-4C9D-A51D-392393C82CF8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'64B04D19-1351-4BE7-A9D9-6AE2C4B0BC54', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'乌鲁木齐', 10, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'14387481-F8BC-4E5B-878B-48054AD3CA67', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'克拉玛依', 20, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7882902A-0716-4318-8253-9003B2F7DF19', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'吐鲁番地区', 30, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9F4C2FB7-4F38-4BEE-B0EA-481E8A52385B', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'哈密地区', 40, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'62909441-A8B5-4AFA-AFE3-DE868F82A46E', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'和田地区', 50, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6A36484A-8502-473B-BBE4-B1F01066B488', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'阿克苏地区', 60, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D7D9D555-4293-4F16-9A2B-DF77B60EA626', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'喀什地区', 70, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'693699FA-8B38-4A62-B15E-08129735AE03', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'克孜勒苏柯尔克孜自治州', 80, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CB0E12D7-F74D-4E6F-B06B-F04E78024672', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'巴音郭楞蒙古自治州', 90, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A05668C0-DA5A-4FC0-8FA1-D319D467DB5B', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'昌吉回族自治州', 100, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5E196C65-47CE-4CFA-B92F-26E60C54882A', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'博尔塔拉蒙古自治州', 110, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0F7B80D6-C4EF-4EDF-901F-1D2314BDC4DD', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'伊犁哈萨克自治州', 120, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'50B730D2-3481-4B89-872E-E067B2E5DDB6', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'阿克苏', 130, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7054D477-045C-4684-A70D-FF53E822468F', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'昌吉', 140, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3091456A-1355-41E3-B9E4-852B0B6E0A71', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'哈密', 150, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1FD9C056-3A3B-4C14-A7B2-6970E463C1C4', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'和田', 160, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EE3AFDBD-F7FC-4C55-8FA5-FD6EDE2FCDB5', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'喀什', 170, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'10DB185F-73FA-4FF0-9367-C3350AF61BB9', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'克拉马依', 180, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1127DC91-C664-4EDF-86C5-AE0F7767118D', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'库尔勒', 190, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'35B239FC-19D3-4BF6-A229-EAA6023AA852', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'石河子', 200, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'252607C4-5F3E-49E4-8B81-584E2BB3F72F', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'吐鲁番', 210, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2B08C6F5-C1DD-4369-9773-D32B9411952E', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N' 乌市', 220, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3CC7835D-6892-43BF-8F73-3E803032D8CB', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'奎屯', 230, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FB808B77-C8B7-4480-AB4A-829281AED0C7', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'伊犁', 240, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5B99044E-FB90-447B-B9FD-2AD4D646D662', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', N'伊宁', 250, N'sys', N'2E94BF5D-4729-4239-BC5D-968E538F4D05', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0C32D758-02B9-4FAF-B0CC-BD9792508024', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'西宁', 10, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'54AD3CFE-D04C-4668-B21E-AFCDB1B883B1', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'海东地区', 20, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FCD88187-ECC6-4CBE-9708-6759C70C2110', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N' 海北藏族自治州', 30, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'311A2131-5A84-462F-AE25-389E32286D2A', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'黄南藏族自治州', 40, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'881E1B7A-E97C-4663-9566-F9B55205DA8A', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'海南藏族自治州', 50, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BD923569-3D5A-4A63-96E3-5AC487A0D541', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'果洛藏族自治州', 60, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9183642C-B852-4F69-A852-5A49B901C1A4', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'玉树藏族自治州', 70, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5147A693-518A-4A1D-B83C-19027E0FA1F8', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'海西蒙古族藏族自治州', 80, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5BDF4B8F-47C5-4218-B778-425BAC26DC9E', N'7610FC32-105C-4847-B802-D1ACD7BAA230', N'格尔木', 90, N'sys', N'7610FC32-105C-4847-B802-D1ACD7BAA230', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C564BD60-3D89-4D91-8D18-C35B71865464', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'兰州', 10, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'168AF7D5-0F48-4BB1-82FF-D6A4F0109FC1', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'天水', 20, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FBB0EBD4-6927-4729-9C78-848EC8293716', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'金昌', 30, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B58B4B65-24BE-45B1-ADA2-7808D13AA456', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'白银', 40, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'88287D14-A8AC-4128-AB4A-50B67D1F9B45', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'嘉峪关', 50, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'897E5AF6-23B0-4C74-B3C1-911772F48146', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'武 威 ', 60, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B7D89198-E667-44A6-92F7-4D15846F976E', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'张掖', 70, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'051D20C7-DD4F-4020-B5BD-B9F052A2DFCD', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'平凉', 80, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DBA2607F-95BE-40E1-92A0-E8A8DE847B86', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'酒泉', 90, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'65DCA5F2-566F-450A-B7BB-8ED3D83C784D', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'庆阳', 100, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F1797F39-ED8E-4BC8-B4C5-4C8B50C1C7D2', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'定西地区', 110, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'288ADAB3-5674-4ED4-A168-8FFF84485CBC', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'陇南地区', 120, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F47583B7-8D1B-42B1-B728-95DBD55A776F', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'甘南藏族自治州', 130, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8ADD0792-A84C-4A8A-B815-658C4622C1FE', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'临夏回族自治州', 140, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2A233116-DBEE-4630-A361-3C91B86958B1', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'嘉峪', 150, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'97BA540A-685F-415C-9635-37A51B6277C8', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', N'武威', 160, N'sys', N'BC4093D9-6A6E-477F-BAB4-52B330DE81D4', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DA358CD9-A2C0-445F-9093-D989D3F8A305', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'西安', 10, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A64856C7-22F8-4813-AA36-B74E6B646323', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'宝鸡', 20, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'13156EC2-8403-46B4-BAB4-D637ACB51FF6', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'延安', 30, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C309DE27-B9E2-47AD-82A7-18403AD68110', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'铜川', 40, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'15A6A62D-7E55-4899-B3F0-12900315E50E', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'咸阳', 50, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ED9CA0F7-1748-44B6-8C91-BBE203780DDB', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'渭南', 60, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E6772307-79C9-4166-A73B-67D75A380704', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'汉中', 70, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9A1E54B6-49FA-4080-97BC-76856FB3F9DE', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'榆林', 80, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'99637A5F-CB6D-4821-9695-55D49EB2A55A', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'安康', 90, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BE492688-3098-48DF-8546-8B3CABA8432B', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'商洛', 100, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9D2E82BE-858D-487F-A82C-BB5317671957', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', N'韩城', 110, N'sys', N'C4728E77-DE69-41BB-A628-0F4C02DF5D1F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CC076449-C388-45EA-BD54-A69BE9A36D73', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'石家庄', 10, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A2B25CD9-1481-4943-917A-24BB5DB3CA26', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'保定', 20, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4C53A30F-5E04-4DFC-9547-C249FF598C77', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'唐山', 30, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4B97DD83-9B46-4AA1-807C-66FEBB425796', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'秦皇岛', 40, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3B0629D4-848F-4B92-9E68-3EE792F8941A', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'邯郸', 50, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2269A173-B45B-4275-9C9D-7D7BD1CAB914', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'邢台', 60, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'96E6E8CC-52F1-4F65-BF71-1577A456D558', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'张家口', 70, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4CA7DE9C-F247-469C-BEB7-89641353D331', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'承德', 80, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8D4D8868-4B8E-4F4A-88A7-E9DD7D1A1A54', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'沧州', 90, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'461DB763-D39B-4540-9826-86530D7A850C', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'廊坊', 100, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6E868312-1F83-41B8-90A1-C95312EE9E0B', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'衡水', 110, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'036EDC09-2EF2-4501-8C7A-883A1D3C34D2', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'霸州', 120, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B2639F14-E3CB-4E5C-BA08-C2921FE63C8E', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'青县', 130, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E84700FB-8A5E-4BC0-A48D-36682E109EB4', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'任丘', 140, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'495CFBA1-AA4E-4169-ACEA-F8ED6FA6F01E', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', N'涿州', 150, N'sys', N'7C7401C9-AE5D-484F-B19E-2B69A8F2034F', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'589FAB94-7B21-4A21-83DB-4D9910F9BB3A', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'郑州', 10, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'066A143F-777A-4028-ADED-0B4B53728046', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'洛阳', 20, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CD3935B4-1D24-415A-A96F-6D2E8ECBA9EF', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'开封', 30, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'10CBAB04-0F91-4FD9-A15C-599D72E07B6F', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'平顶山', 40, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'43430D74-A806-4E79-A2ED-86A636003D12', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'焦作', 50, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6738681F-A251-453D-BE7A-DCF2CD365F82', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'鹤壁', 60, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'807C4588-60BD-4D7C-ACF4-100979B115F7', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'新乡', 70, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ABF45FE1-26FB-4550-8283-B48A54036E9B', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'安阳', 80, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7A216D17-9BC1-43E5-A63E-D5A0FFC51DB2', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'濮阳', 90, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'57F453F1-A4AD-439E-A1B4-7FE84B33108F', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'许昌', 100, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'440C6136-06A9-409A-9733-EBF9A0C9F86E', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'漯河', 110, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5E32D7EF-FBA3-46DA-8EB9-0A213E6CE8C4', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'三门峡', 120, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CE4E77A8-B212-48F8-B143-2D4E0C6B6040', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'南阳', 130, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A2C69B78-4391-43C7-9FCA-5BE7F7779794', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'商丘', 140, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B1FACB61-9AF7-4D25-A813-626201DF9847', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'信阳', 150, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'88543E26-E002-42F1-A1A3-2778B034947C', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'周口', 160, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'05CA045F-014C-43CA-912A-8CDBBD0EBD84', N'B15279E1-EEFE-446C-9034-5C7376E23745', N'驻马店', 170, N'sys', N'B15279E1-EEFE-446C-9034-5C7376E23745', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1FF282D5-2C62-4D46-A8FD-2621B80BEF06', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'济南', 10, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FAAEA999-9A74-48C7-94C0-F5A15E471D8D', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'青岛', 20, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'97B33889-FE5D-40A6-BFAF-302180ECE831', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'烟台', 30, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'42DD1B19-D9AC-41FB-B7B2-35190F6C647F', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'淄博', 40, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'24FA1FD9-4D32-444E-9B15-B0181F6DD20A', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'枣庄', 50, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'512B423A-9229-4B9D-9F8C-5B3165F750FC', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'东营', 60, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'657F4707-D7BD-44C3-B69B-958CDC898248', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'潍坊', 70, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0930A0E4-272B-4DE8-AB0A-4A4381E7D6B4', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'威海', 80, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1847B15C-62FF-471A-B753-F7807F5255F5', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'济宁', 90, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'30266761-2C3B-41DF-8461-0FA96B3590F6', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'泰安', 100, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9605C8A1-60E9-4339-825C-62396F545C8A', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'日照', 110, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EA2B874B-2E15-4112-9890-3D1D0744B14F', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'莱芜', 120, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'47F46868-C70A-44D6-A090-B1DFF4C6BD16', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'德州', 130, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C8A023D1-5DFC-425A-B557-6254C3221F68', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'临沂', 140, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'99A10855-D390-4964-ADCE-8CA1935BA86D', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'聊城', 150, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E5D46464-B6EF-4FCF-80BB-F1706E782FBA', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'滨州', 160, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'014D92D3-5C3E-4BDE-9DE2-CF28B81E4CBC', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'菏泽', 170, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'893C5C0F-2119-4E3D-AEC6-9AA3A64F0509', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'高密', 180, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A330AB1B-2886-482A-A307-D31D33092309', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'荷泽', 190, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D0654095-BD5B-4807-8454-A9E8FF96DA00', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'淮坊', 200, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'33DBBD5D-7EA3-4FD7-8C16-AAB903250AC1', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'即墨', 210, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'05CCF63C-DBEF-4DA0-8B8A-5D87661DC352', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'胶南', 220, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EBCFD1FA-5B78-4B4E-BEEE-79927B6C56E3', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'莱州', 230, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D137511B-68A0-4DE9-A5E3-E4D34AA18551', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'林沂', 240, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'926D09C3-C2FF-4EA6-8903-BC82094A5A06', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'临忻', 250, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B2C9AEFD-762C-4C7E-A454-61362AC139C9', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'龙口', 260, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8EF8CC73-21CD-4956-970A-0D616599BE62', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'蓬莱', 270, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E7413620-E2DC-4039-B010-51B60CC3D4A4', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'青州', 280, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EE89C9A3-EDE5-4E0D-9463-9C28D7DCDDA8', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'乳山', 290, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1A9C721D-BC4B-424F-89E3-F52958BA359D', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'寿光', 300, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FE2F3D58-F11B-42EE-975A-F06FC384CF8D', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'滕州', 310, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'49519E02-E4CB-4507-98AC-13EEEFE50E4D', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'文登', 320, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F6A1120E-C7FD-4340-8969-046D18B0DA51', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', N'招远', 330, N'sys', N'1F9D0136-045A-40DD-99C4-C3D80C411C6E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'94F7BBDB-2517-41C1-8EEB-94704C94EB42', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'太原', 10, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6C486CE7-5344-4FAF-8ED7-4F29F8176889', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'大同', 20, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'23520F49-4363-4267-A746-D4287F43B65E', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'朔州', 30, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A0CC8EB6-6354-4BB0-85FA-139DC11B87A3', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'阳泉', 40, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4BB88286-9D6A-45E2-A968-650735C3B1BC', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'长治', 50, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'37FD4ADB-D400-4FD0-9580-9E2F131D7594', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'晋城', 60, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'151178F3-DD2B-457B-982B-0FE628B8C091', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'忻州', 70, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D12655AE-0972-4C53-AC98-DDA9086C112A', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'晋中', 80, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ECC051F1-60DA-4283-B86E-1D1304F3FE8D', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'临汾', 90, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B3C09BF1-AF9D-4453-9304-595BE5D71132', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'运城', 100, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C63B3000-09FD-47EE-947E-4D38B28676F3', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'吕梁地区', 110, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5F891C19-BE65-4268-824B-1670B2325FD7', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'河津', 120, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D85FFD95-207C-4847-946F-0871D9369941', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'侯马', 130, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'97E08707-4E6C-44F5-84C8-F8D5112E305A', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'孝义', 140, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1D2C52E9-BCF6-41B9-AC2D-B2FC48BFAD24', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', N'榆次', 150, N'sys', N'D50E4BEA-73CF-4089-A95A-E7C88459CCC6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'69F16B7F-2722-470A-835A-5BC00153F9FA', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'武汉', 10, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6660AD3D-A4B0-4EB7-84D3-78A8104D3D68', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'黄石', 20, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A15BA46A-7F4E-4AB2-BF5E-8EE5BB6343C6', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'襄樊', 30, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'92DACAB1-1E1C-408C-8F17-4D5A847D272B', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'十堰', 40, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B2F16C85-799C-427B-95C3-73EDA3191786', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'荆州', 50, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9729D6E6-3A4C-49DF-8C6C-01F15CA03D1C', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'宜昌', 60, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'392FD321-41AA-4F05-8E5A-D160858BC5E2', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'荆门', 70, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'95C1FE96-CE91-444A-8C5B-B4BDB6111229', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'鄂州', 80, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7442ABED-3402-464D-82D9-450B52524970', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'孝感', 90, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DB02703D-B4D8-4A7E-968C-4C98BE9CEC15', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'黄冈', 100, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B52726B0-3AD2-4153-84A1-001DCFBCD993', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'咸宁', 110, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'593F47B7-4CE7-4221-9241-98B921C03936', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'随州', 120, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0D245C19-8D36-48BD-BC87-14EAF543A04B', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'恩施土家族苗族自治州', 130, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'26C3EEF7-506D-49A9-B405-B6A2C55849C8', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'安陆', 140, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'62256029-2287-4CDF-B629-4DDB2AB7BC07', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'恩施', 150, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'51A37EC0-8817-4650-93A3-B27BB82D529D', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'汉口', 160, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8D119ABF-8CBA-40CA-A5D3-9BA471957AE6', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'汉阳', 170, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4108CE3A-A345-4C88-B726-E3A50E00B509', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'潜江', 180, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BC799E2D-2E52-4A6E-9C61-17C5C80D29B4', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'仙桃', 190, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'50ABCC55-2D35-485E-9727-313FFD66ACF6', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', N'株州', 200, N'sys', N'DCEEB762-840A-4C44-8E0E-4B08672173FC', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'153142B7-7D64-4EC4-A6D6-292B606CBAC6', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'长沙', 10, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D0E04640-2BF9-4024-B2ED-3EA0EC472A06', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'株洲', 20, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4861C7A6-1CA8-4F5A-B3C5-0D98A354C195', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'湘潭', 30, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4A88E1D3-518C-425D-A05C-8971F9D5EC82', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'衡阳', 40, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'AF2DD3B6-C389-41F8-89F1-DB1D645E4D1C', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'邵阳', 50, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'422403CF-B3E9-4CFE-A460-D0B4675E12D4', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'岳阳', 60, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'76E40506-E11F-46BD-ABFA-A849D555AB19', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'常德', 70, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8C7A338F-A837-4C13-8D98-0A781D171EBF', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'张家界', 80, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'05D1FD68-60B3-400B-AF75-983FE1C9E237', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'益阳', 90, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EF36B6EC-1F7D-416D-9342-C4CC54D72A2A', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'郴州', 100, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'269E75B8-6523-4F4B-8820-306A8E748522', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'永州', 110, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0F651E8C-7B29-474D-8E17-7FC6343CE80D', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'怀化', 120, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A68A193C-9252-48B0-AB61-2C612C966225', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'娄底', 130, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1CC4B5DB-66B8-477C-B8D0-F53B75999AEC', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'湘西土家族苗族自治州', 140, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1EEB8F10-1834-4E3B-96B3-7010AFD17B91', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'株州', 150, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'32346960-B66D-4F19-B6E2-554D514C3D38', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', N'邵东', 160, N'sys', N'7F9ECCF5-884E-44F8-8CE1-50DB8D1E5219', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6238D25E-6F85-40BA-81CA-1F83BE3C9276', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'合肥', 10, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B7A8B201-5B6C-4429-B143-3196533F9D71', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'芜湖', 20, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6D3675AA-A2BA-4E7C-8252-E249EF3F20EA', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'蚌埠', 30, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F54F0A5D-E286-41C4-87B3-21CB8FEB0376', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'淮南', 40, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E5478B0F-62F6-41D8-9355-6A010DF96A94', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'马鞍山', 50, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EB3C2736-DC4F-42C6-8D15-AAFEEFBFADAA', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'淮北', 60, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'428A1DDD-34D3-46B4-BFBF-7EC94FBFF2B2', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'铜陵', 70, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E3F1B0C7-64EA-40E3-94B8-3F85B7F41396', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'安庆', 80, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EE79D77E-3C66-43CB-BCD9-F4D7E9FEE269', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'黄山', 90, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E551699D-E279-4DEC-BE25-1893774566C2', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'滁州', 100, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'97D045CC-3BA8-4800-8E8A-BB715A35DD5A', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'阜阳', 110, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BF531CF3-BC31-46F6-AB66-A4984E6C949F', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'宿州', 120, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A24EFAE5-255B-4EF7-8692-E31079C512D8', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'巢湖', 130, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'51187482-F92A-42E2-B00D-DC20DEE87F2C', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'六安', 140, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0E1E707D-D574-49BB-BC91-21F33A24D579', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'亳州', 150, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'530AD73F-F741-4561-8854-782CF090DF2F', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'池州', 160, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F5065CDA-CE93-44AC-98A9-FA0FBD84871B', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'宣城', 170, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4BB70682-9AFF-4243-AFB4-330289437A0A', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'蒙城', 180, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6647AECE-407F-4D69-BE39-32B4200329BE', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'宁国', 190, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'06F9C360-1E3D-46BE-9A90-31251B4C52F8', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', N'桐城', 200, N'sys', N'0E4F8254-AB6C-4AA3-B2CF-DEC4D1DBB5B2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'72C195D7-9C31-4268-91FE-638A310C79BC', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'南京', 10, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B52B5E2E-B5E1-4900-865D-03693612075E', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'徐州', 20, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3AADFA29-F5D0-4C36-9874-BED3BE03E61C', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'连云港', 30, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'42FB05B9-C3E1-4846-A0A7-92C2D3C49C76', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'淮安', 40, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BFE83735-05E6-4F33-9F2A-F2FBB4977FE7', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'宿迁', 50, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E9A56DAC-8B97-418F-BBA6-9283CAD67ECF', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'盐城', 60, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'584C183E-5F58-4CE1-B41B-89B429A12904', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'扬州', 70, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7F98AC57-79F7-4448-8041-786619A4A728', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'泰州', 80, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3CB0CF03-AA9F-45DD-AAD1-B9B586CD3D84', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'南通', 90, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'24FEE3AC-82F3-4D95-B010-DB4B9CD43756', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'镇江', 100, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7C74D659-EEA8-49C5-97BF-EB97647EC291', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'常州', 110, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4F02F9F0-A74B-4F21-9D08-0A202DF33B1D', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'无锡', 120, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'640BFFAA-63E2-43C3-889C-A334348208BA', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'苏州', 130, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8D544A29-A193-411F-A0F3-A9A0EE2F7A01', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'常熟', 140, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1C313911-1F51-4753-891E-FB7935D6477C', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'丹阳', 150, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'61A1D890-B0DC-4569-82F9-C83C668C5360', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'海门', 160, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4BD1496B-7AAC-4BF2-85F8-D367DC41A154', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'江都', 170, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7FF4E2D4-FA9B-4A04-8F31-D168FB58BCAB', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'江阴', 180, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F1F44D24-1C80-4140-8BFD-A0D0FA9656E2', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'靖江', 190, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E41A842A-71BE-4A0E-A945-01FFD0E7191C', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'昆山', 200, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'670CEBDE-A3E8-4D3F-A84B-A4180B229D8B', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'溧阳', 210, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7C29F843-9A06-4A0B-9381-F6DAFBDB2E93', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'太仓', 220, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6E0884DD-E9F6-4CE6-A86D-304AF4A98B90', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'泰州华', 230, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'29AD3F5C-5D41-469F-90C8-F1788C035F86', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'吴江', 240, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'493BB2D6-E76A-4C1C-BAD5-43DEAF695C14', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'吴县', 250, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0915BAB7-51DD-48FB-AE60-973FFE38A8C2', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'宜兴', 260, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A8D13F3A-CAED-408C-9CDC-EB030A69E740', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', N'张家港', 270, N'sys', N'7607DBFE-7A96-4E8D-9642-E2176794D7E2', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'918CDF3F-EE4F-415F-B0A1-129B42277347', N'73A643D6-A528-46D1-933C-985A832646C7', N'杭州', 10, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'457A3514-95E5-489D-B0BC-C175E71109E7', N'73A643D6-A528-46D1-933C-985A832646C7', N'宁波', 20, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'39BBF5FB-C063-4A10-8CB9-A1E58EA84F37', N'73A643D6-A528-46D1-933C-985A832646C7', N'温州', 30, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E335D27C-4A89-4352-861A-D535004E2B8C', N'73A643D6-A528-46D1-933C-985A832646C7', N'嘉兴', 40, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C6C7C320-A859-4C46-8A65-83F0D4216CD7', N'73A643D6-A528-46D1-933C-985A832646C7', N'湖州', 50, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'42E07090-724E-4FE2-9F60-E7B75C382C32', N'73A643D6-A528-46D1-933C-985A832646C7', N'绍兴', 60, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'99758014-AF7D-4A59-8945-80CBEB3B20F4', N'73A643D6-A528-46D1-933C-985A832646C7', N'金华', 70, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E3AADDCE-C1E9-4AA4-BC70-DE3D14D165A2', N'73A643D6-A528-46D1-933C-985A832646C7', N'衢州', 80, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'01753174-FC51-4BFF-83D0-A4C6A996360E', N'73A643D6-A528-46D1-933C-985A832646C7', N'舟山', 90, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B89EE246-F779-44D0-BCEA-BFA6A4DE24E3', N'73A643D6-A528-46D1-933C-985A832646C7', N'台州', 100, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'39D4E967-310C-4C03-8E79-F0697E69444E', N'73A643D6-A528-46D1-933C-985A832646C7', N'丽水', 110, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3AB159EC-6A7E-4C2F-AF0F-B97F0DD62FE2', N'73A643D6-A528-46D1-933C-985A832646C7', N'慈溪', 120, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ED568BF5-80E9-4690-BAF8-66F1D6BD39F5', N'73A643D6-A528-46D1-933C-985A832646C7', N'东阳', 130, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'46568E76-94A7-46F7-A648-DDA82DB943B4', N'73A643D6-A528-46D1-933C-985A832646C7', N'奉化', 140, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5E6BD9C1-E3A1-4AC5-B5A7-7B372A0BCE2F', N'73A643D6-A528-46D1-933C-985A832646C7', N'乐清', 150, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F414A4EB-0698-4B03-B015-65386BC0A84F', N'73A643D6-A528-46D1-933C-985A832646C7', N'临安', 160, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8A141BA1-90C0-4D8A-A556-F06D8BED49A8', N'73A643D6-A528-46D1-933C-985A832646C7', N'临海', 170, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6F376489-9E6B-4DC3-BB52-F0C012591D5F', N'73A643D6-A528-46D1-933C-985A832646C7', N'平湖', 180, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'AF7548DF-4E10-43C9-BB13-A7B78B7EDD80', N'73A643D6-A528-46D1-933C-985A832646C7', N'瑞安', 190, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1A1485BB-E547-460F-8047-4B1773A13933', N'73A643D6-A528-46D1-933C-985A832646C7', N'上虞', 200, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'095D3473-F4AE-4FCC-8F9B-B2A5F1B35FFA', N'73A643D6-A528-46D1-933C-985A832646C7', N'嵊州', 210, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E52A5DB3-0327-4B53-8EE3-2AD0E11F9192', N'73A643D6-A528-46D1-933C-985A832646C7', N'温岭', 220, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6FD60350-EB0C-4D08-9297-9ED7979E8677', N'73A643D6-A528-46D1-933C-985A832646C7', N'义乌', 230, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'31FDCD04-5554-4611-8611-20AFED81BB77', N'73A643D6-A528-46D1-933C-985A832646C7', N'永康', 240, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'13659825-EFE1-43E0-89B2-6C4E3B966EB4', N'73A643D6-A528-46D1-933C-985A832646C7', N'余姚', 250, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9ADE5EEA-45AB-49E6-8EE7-CCDD81D1E9BE', N'73A643D6-A528-46D1-933C-985A832646C7', N'诸暨', 260, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2107E77A-6C4A-4BA0-8319-8917271A0911', N'73A643D6-A528-46D1-933C-985A832646C7', N'新昌', 270, N'sys', N'73A643D6-A528-46D1-933C-985A832646C7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0FB62561-D34D-4C33-8667-2979671131EF', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'南昌', 10, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9EACF2E8-A7FA-467A-BB1E-6D16AA752F90', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'景德镇', 20, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DD9105C1-C1C2-40C4-A4A9-2EA65104E820', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'萍乡', 30, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'87F9EB6F-8C68-4B4B-9BC1-E0D3B8F9DE88', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'新余', 40, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'91A73151-C9E2-4855-A272-295EF723C55B', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'九江', 50, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'954C47EF-4912-427B-B5FC-66F92DEDA03B', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'鹰潭', 60, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FD2AF98E-99B9-4374-81C4-279474982993', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'赣州', 70, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'26C748AE-9422-41E9-8BF8-278C01C4CA7C', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'吉安', 80, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'3AB56842-5678-4E74-908B-58CAE4310EFA', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'宜春', 90, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FBFD80CF-B025-49BC-86E6-FF6FAEAF00DD', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'抚州', 100, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'89FDB7E4-4468-4D09-9CE6-60320900041A', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'上饶', 110, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'723745DF-F48F-4DF4-9F51-12FC1CA3AF17', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', N'高安', 120, N'sys', N'ABCE93A3-7ABF-43B6-AD2F-FC6F04E21BC1', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'11A56838-984B-4E7D-9F56-B00F80C7A484', N'E6E267E9-12EA-4026-B830-806A502214A7', N'广州', 10, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E2E09ADE-E128-4C7B-8244-79E7537C3CB2', N'E6E267E9-12EA-4026-B830-806A502214A7', N'深圳', 20, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'70B204F2-FB7E-4AA2-9FD7-D4B3E5EA2BD8', N'E6E267E9-12EA-4026-B830-806A502214A7', N'珠海', 30, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0B3A470F-A633-4AC5-9CEF-0805A4A981C9', N'E6E267E9-12EA-4026-B830-806A502214A7', N'汕头', 40, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D80971CE-2C16-4882-B965-D9DDE8E349BE', N'E6E267E9-12EA-4026-B830-806A502214A7', N'韶关', 50, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'85AB1666-6C1F-432E-BBAE-2675ACC9C3F6', N'E6E267E9-12EA-4026-B830-806A502214A7', N'河源', 60, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9BB6B347-2163-4278-AC76-A4D33A40D92A', N'E6E267E9-12EA-4026-B830-806A502214A7', N'梅州', 70, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1F2247C2-C479-4523-9E5B-F1035ADEE4CE', N'E6E267E9-12EA-4026-B830-806A502214A7', N'惠州', 80, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6FC48896-13A0-45E1-86FC-E860CCC72F44', N'E6E267E9-12EA-4026-B830-806A502214A7', N'汕尾', 90, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'44B6EEED-9FAF-4FAF-9940-C1E7DEF717BF', N'E6E267E9-12EA-4026-B830-806A502214A7', N'东莞', 100, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'CD6C7F1A-CC08-4E67-830B-51CA5F296EA6', N'E6E267E9-12EA-4026-B830-806A502214A7', N'中山', 110, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2F43F219-24F9-4BB9-9866-DBDF21E70789', N'E6E267E9-12EA-4026-B830-806A502214A7', N'江门', 120, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'51B616D4-EA6B-494D-AA72-7676DCB6283C', N'E6E267E9-12EA-4026-B830-806A502214A7', N'佛山', 130, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C46A12B9-5C22-46B0-8B3F-0ECF8FC8F743', N'E6E267E9-12EA-4026-B830-806A502214A7', N'阳江', 140, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0F939490-E8E6-491E-9F07-5CC44868A57D', N'E6E267E9-12EA-4026-B830-806A502214A7', N'湛江', 150, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5918ED46-5BF0-4DF9-BBAC-9AE0AFC4A886', N'E6E267E9-12EA-4026-B830-806A502214A7', N'茂名', 160, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B0B8B157-6653-46E6-989D-DF8686DC1AAC', N'E6E267E9-12EA-4026-B830-806A502214A7', N'肇庆', 170, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'89A5AE76-BCF3-43A8-9273-45BC01EB17C8', N'E6E267E9-12EA-4026-B830-806A502214A7', N'清远', 180, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C339EC95-63BA-49C3-87AE-9E2934164E15', N'E6E267E9-12EA-4026-B830-806A502214A7', N'潮州', 190, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'AE36E64C-662B-42C4-AC15-736060F54A12', N'E6E267E9-12EA-4026-B830-806A502214A7', N'揭阳', 200, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'48C636B2-BBAD-4360-A6D0-AEF32FCA3026', N'E6E267E9-12EA-4026-B830-806A502214A7', N'云浮', 210, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D4ED0351-1D91-429C-B250-3F4FB1F50454', N'E6E267E9-12EA-4026-B830-806A502214A7', N'花都', 220, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'ADDAE1D3-C5C6-43AE-96A1-9BF5A4D916C3', N'E6E267E9-12EA-4026-B830-806A502214A7', N'开平', 230, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BB142BCE-7AF0-46D5-9895-E5344D6A7424', N'E6E267E9-12EA-4026-B830-806A502214A7', N'南海', 240, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6F412002-CB8F-4DBE-ABF6-3516060769F4', N'E6E267E9-12EA-4026-B830-806A502214A7', N'顺德', 250, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C333FDC1-050B-4C53-8555-9FA3A2565C82', N'E6E267E9-12EA-4026-B830-806A502214A7', N'台山', 260, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1163BF0C-8E78-40C3-A41C-178C3F1BBBFA', N'E6E267E9-12EA-4026-B830-806A502214A7', N'增城', 270, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'60885793-1F45-4AE2-B0C3-14F8E68422DE', N'E6E267E9-12EA-4026-B830-806A502214A7', N'市梅', 280, N'sys', N'E6E267E9-12EA-4026-B830-806A502214A7', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'080D879D-698A-4E26-9128-CF5F453D379F', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'南宁', 10, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E93DE97D-8A70-41C6-9AEB-2095214A8626', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'柳州', 20, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'08485607-2BF1-4FB5-99B4-DBC77F9FCD12', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'桂林', 30, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D0BC29F4-CB4C-4D52-B95A-84A3705FBFFB', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'梧州', 40, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0D70258E-36A8-4D76-8D3B-D9610F3308EE', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'北海', 50, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'A349ED64-6EBE-445E-8673-925397236B97', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'防城港', 60, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'953DA42F-C943-4A4D-85D1-C0FFCDBC9061', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'钦州', 70, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'41F73C59-4E85-4357-9323-7CF7823D3698', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'贵港', 80, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'20EEAE71-8894-4BBD-BC39-24C5590BD039', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'玉林', 90, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'950EB45B-A438-4C80-A7A6-18E898D7D2DB', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'百色', 100, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'83B27031-5FD5-4C13-84EC-C477308C8A09', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'贺州', 110, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2824BC6D-00F9-4297-B647-E204755D11CA', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'河池', 120, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'AB6A89CF-F5A5-476D-B539-936D0B3A02F8', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'来宾', 130, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'07990D9A-9383-46C1-9965-4391A3A96285', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', N'崇左', 140, N'sys', N'D7EE20AC-A810-4D28-949D-0401BC30E62D', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'883F3C30-31AC-4B9B-9087-ABC5C023C485', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'福州', 10, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'69B13708-9A2B-4FE4-A29E-1900C64DE132', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'厦门', 20, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E7CA6157-BF47-4000-837A-4CFD770B1580', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'三明', 30, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'05BF0673-D977-421E-9002-37A14413E0AE', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'莆田', 40, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EA26C4F2-7795-4CB7-8EF0-4619EC1CF5AB', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'泉州', 50, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'487E6610-09A5-42E4-A570-183750E76975', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'漳州', 60, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'131D69D6-0DDD-482F-B020-F00E76D89DCD', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'南平', 70, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'817CDEBB-A6BB-4FA3-9D00-FE8328BBBC5B', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'龙岩', 80, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5D71A4CD-9674-4075-872F-190137DD636C', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'宁德', 90, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6991CD38-971E-4203-BA99-3B93A42A03A2', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'福清', 100, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E68190B2-AA53-4D23-95CE-1754E69749FA', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'建瓯', 110, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9B9467FF-9414-4A36-AFDA-64D64ED376E2', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'晋江', 120, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B0289181-C4AF-4F6F-BDA8-878C7508BCE4', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'南安', 130, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'531F25F8-90A7-4002-9714-F168CFF4DAE7', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'邵武', 140, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7F6AA4C1-45FB-4D58-A407-E0A982CE9C2D', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'石狮', 150, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'151DB41D-A826-4E03-A5D9-EE6AF2E1C692', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', N'仙游', 160, N'sys', N'3CCEC37F-01A3-46EB-8F93-1ED1A1303AE8', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'093C2C54-9749-489F-9367-F39D3EFB1305', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'成都', 10, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'55741F33-4490-482D-8D6C-40C04C86C606', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'自贡', 20, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'4E1691DF-FF5B-4DA7-A75A-B8BE978576F3', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'攀枝花', 30, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0778956F-4E6D-4B86-B410-61005A2680D7', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'泸州', 40, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'62F28FDC-B7A2-4170-9412-FC21846B5C50', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'德阳', 50, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C030D803-A14F-4960-9AB3-DDCB6454A4F1', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'绵阳', 60, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0FC5BFF4-C9B8-4D1C-9014-428A163614A1', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'广元', 70, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2AC76E58-3031-4BF2-A373-031213370F5D', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'遂宁', 80, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'78A156A3-A1A3-4794-B3C9-E4D9044302F0', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'内江', 90, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DDD8FEB8-3C53-45E6-942B-D89064073652', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'乐山', 100, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5A910978-ECD6-4EE4-A6FE-2BB888A5239F', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'南充', 110, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6E6B907B-749D-4AB8-8FB5-667A6BAE8CFA', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'宜宾', 120, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B83C64A9-ADF4-4C12-9BC5-9A86AA110522', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'广安', 130, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5C9C78C6-C65A-4779-A85D-B8486EEE0A06', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'达州', 140, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E269E5BF-ABCE-4E26-A996-84EBF385A064', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'巴中', 150, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E9BA1587-D2E1-44C5-AD29-8E9293F709CA', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'雅安', 160, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DDA1D664-2A2A-430B-BEA7-A1C4EC67A656', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'眉山', 170, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'6A4044FA-026D-48FF-9A05-47406B395A8E', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'资阳', 180, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'FD1AE823-3E34-443D-BFD1-CFBA79A4E770', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'阿坝藏族羌族自治州', 190, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'37BDACE6-99A2-4E7F-B401-40D5535B2F70', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'甘孜藏族自治州', 200, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'70FCA12E-59C6-4CBB-8D9C-DB50EB19109D', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'凉山彝族自治州', 210, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'49FAE4DF-3A08-4F1E-A2C1-AE897F267EBE', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'广汉', 220, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'078FB4A7-920B-4010-A0A4-3E9C82B13467', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'锦阳', 230, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'DCED670B-331D-4F89-B6BE-05E392B721BA', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', N'西昌', 240, N'sys', N'FB7D51BC-C94E-4C7D-9530-251B0EA45332', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7A76A4F3-EBAB-402C-9A40-275F86B697D9', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'昆明', 10, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'777C8B9B-DA52-474D-B349-AEFCE84D4F14', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'曲靖', 20, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'111DE6FF-3C83-41CB-86B1-D313F6296719', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'玉溪', 30, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'C720BA41-A646-4797-ACA2-7DAE10021EDD', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'保山', 40, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'94640EB3-6614-4223-BADC-2F840902796F', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'昭通', 50, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'21267808-746E-4391-8D5C-DE205731DE8D', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'思茅地区', 60, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'07EFA316-FEE8-4219-9F4B-E5DADF2FCCA1', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'临沧地区', 70, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'12CD2F58-A4D8-4794-8271-D5CBDED00841', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'丽江', 80, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EA50A1BE-5C01-4576-9F66-7189C05F481E', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N' 文山壮族苗族自治州', 90, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'25EBBE03-3E86-4DB3-9CCB-32B3B32B34B1', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'红河哈尼族彝族自治州', 100, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5ABEA889-AC9C-4A9D-B62C-BAB8088DB201', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'西双版纳傣族自治州', 110, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'9642ABFA-BB39-4FEC-BEE0-C80EE468971E', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'楚雄彝族自治州', 120, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5172544F-F168-40C6-8F1E-4E9A8220174E', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'大理白族自治州', 130, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'76B4EA0E-FF07-48B0-902F-ECF6DFDC2BDA', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'德宏傣族景颇族自治州', 140, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'BE3AB87E-6764-4201-B523-2E465BDF0535', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'怒江傈傈族自治州', 150, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F1EB462C-817D-4B2C-A007-CC3332383C77', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'迪庆藏族自治州', 160, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5E69326D-25F6-4282-8EDC-E32498E6C308', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', N'大理', 170, N'sys', N'F0622121-B623-48ED-9ED8-7E77109EC2F6', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'2EF0DA18-B75A-4456-B605-26A57289C583', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'贵阳', 10, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'267BEC15-372A-4100-9443-DDD0C629048A', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'六盘水', 20, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7934F0F7-BFB6-4283-A30F-A4BAC99463D5', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'遵义', 30, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'F2D72A28-6784-4A7C-8294-FEBB76768830', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'安顺', 40, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'1A578F12-3259-4979-BEC1-24FC133A6B3F', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'铜仁地区', 50, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'00D06035-BF7F-40B8-8341-42066A7D0A4D', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'毕节地区', 60, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'17C53D0F-6F09-4567-A504-9DE082E18704', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'黔西南布依族苗族自治州', 70, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'39BBD162-83F5-4824-BC50-6D8E266326F2', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'黔东南苗族侗族自治州', 80, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'AD361AE0-8A03-4258-9618-C137C016022D', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'黔南布依族苗族自治州', 90, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'0A616D38-929C-4FE2-9BF9-CD8A90D138E4', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'都匀', 100, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B45A1639-A38A-46FE-8BAD-20D0D0950707', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'贵恙', 110, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5D888EEA-DE81-4FD9-8FA8-E3B50642671F', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'凯里', 120, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D4F075E8-D541-410D-A7C0-3F1EEBCEB27A', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', N'铜仁', 130, N'sys', N'FB4D4BB6-A7E2-4748-8833-5C3D0A3F124C', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8156F04C-5758-4A6E-B8D2-662A5486A59A', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'拉萨', 10, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'5DA048D2-8412-4F1A-A521-A80C9AE6330E', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'那曲地区', 20, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'12A34F7F-2F7B-4378-AB4A-1565CAEF348E', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'昌都地区', 30, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'8430D54E-1C66-4351-8DB1-B41DDEAB18A3', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'山南地区', 40, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D30695C2-A62A-478E-98EF-450DA650D26B', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'日喀则地区', 50, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'EF64DB3A-B914-4DAB-9777-8EFA537F3E01', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'阿里地区', 60, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'7C62FA79-5584-489D-B3F2-23B075D50BE4', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', N'林芝地区', 70, N'sys', N'2E11B7F4-8108-4B25-A741-13CD307D2E71', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'D613CBA3-C072-4B45-9D9D-01D5B9AA09D8', N'2E2C5725-CC26-491A-B3E3-92D81B585F12', N'海口', 10, N'sys', N'2E2C5725-CC26-491A-B3E3-92D81B585F12', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'593CBD85-EA10-4A24-9EF1-54B33ACB3BC2', N'2E2C5725-CC26-491A-B3E3-92D81B585F12', N'三亚', 20, N'sys', N'2E2C5725-CC26-491A-B3E3-92D81B585F12', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'39E47207-9373-4922-9C0C-488A34557D81', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'台北', 10, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'94D0439C-1EB1-4D42-A4C0-128290536851', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'高雄', 20, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'196B267C-4A47-400D-9FDE-45F957774343', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'台中', 30, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'B0B6AD56-8345-45BA-80F7-C8458562B3C9', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'台南', 40, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E9DD9758-56CA-45E0-99D6-E196F0B6029C', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'基隆', 50, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'E1174EB7-7DD8-4276-A213-41AA38966F19', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', N'新竹', 60, N'sys', N'2E853679-F1CE-409E-BC4D-0AD028F3B03E', NULL)
INSERT [dbo].[Sys_Param_City] ([id], [Provinces_id], [City], [City_order], [City_type], [create_id], [create_time]) VALUES (N'499a1bc2-197e-4f00-88a3-fa6ab7acaeca', N'东城区', N'东城区', 1, N'sys', NULL, NULL)

/****** Object:  Table [dbo].[Sys_Param]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Param](
	[id] [varchar](50) NOT NULL,
	[params_name] [varchar](250) NULL,
	[params_type] [varchar](50) NULL,
	[params_order] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_Param] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_online]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_online](
	[UserID] [varchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[LastLogTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Menu_id] [varchar](50) NOT NULL,
	[Menu_name] [varchar](255) NULL,
	[parentid] [varchar](50) NULL,
	[App_id] [varchar](50) NULL,
	[Menu_url] [varchar](255) NULL,
	[Menu_icon] [varchar](50) NULL,
	[Menu_order] [int] NULL,
	[Menu_type] [varchar](50) NULL,
	[isMobile] [int] NULL,
	[m_css] [varchar](50) NULL,
	[m_color] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY NONCLUSTERED 
(
	[Menu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_cus_add', N'【客户】新增', N'report_compared', N'App_reports', N'reportform/Compared/customer_add.aspx', N'images/icon/37.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_cus_follow', N'【客户】跟进', N'report_compared', N'App_reports', N'reportform/Compared/customer_follow.aspx', N'images/icon/81.png', 50, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_cus_level', N'【客户】级别', N'report_compared', N'App_reports', N'reportform/Compared/customer_level.aspx', N'images/icon/82.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_cus_source', N'【客户】来源', N'report_compared', N'App_reports', N'reportform/Compared/customer_source.aspx', N'images/icon/83.png', 40, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_cus_type', N'【客户】类型', N'report_compared', N'App_reports', N'reportform/Compared/customer_type.aspx', N'images/icon/33.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_empcus_add', N'【员工】客户新增', N'report_compared', N'App_reports', N'reportform/Compared/emp_customer_add.aspx', N'images/icon/37.png', 60, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_empcus_contract', N'【员工】订单统计', N'report_compared', N'App_reports', N'reportform/Compared/emp_customer_order.aspx', N'images/icon/94.png', 80, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'compared_empcus_follow', N'【员工】客户跟进', N'report_compared', N'App_reports', N'reportform/Compared/emp_customer_follow.aspx', N'images/icon/38.png', 70, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'finance_invoice', N'发票管理', N'root', N'App_finance', N'finance/invoice.aspx', N'images/icon/33.png', 30, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sale_contract', N'合同管理', N'root', N'App_sale', N'sale/contract.aspx', N'images/icon/24.png', 40, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'contact_follow', N'跟进管理', N'root', N'App_CRM', N'crm/Contact/customer_follow.aspx', N'images/icon/3.png', 30, N'sys', 1, N'fa-phone', N'02b9e3')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sms', N'短信管理', N'root', N'App_sale', N'crm/contact/sms.aspx', N'images/icon/48.png', 50, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'crm_customer', N'客户管理', N'root', N'App_CRM', N'crm/Customer/customer.aspx', N'images/icon/37.png', 10, N'sys', 1, N'fa-address-card-o', N'dd524d')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'customer_contact', N'联系人管理', N'root', N'App_CRM', N'crm/Customer/customer_contact.aspx', N'images/icon/38.png', 20, N'sys', 1, N'fa-address-book-o', N'8a6de9')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'customer_map', N'客户地图', N'root', N'App_CRM', N'crm/customer/customer_map.aspx', N'images/icon/67.png', 40, N'sys', 1, N'fa-map-o', N'8a6de9')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'finance_receive', N'收款单', N'root', N'App_finance', N'finance/receive.aspx', N'images/icon/39.png', 20, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'finance_receivable', N'应收管理', N'root', N'App_finance', N'finance/receivable.aspx', N'images/icon/26.png', 10, N'sys', 1, N'fa-jpy', N'EEAD0E')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sys_params', N'参数配置', N'sys_param', N'App_sys', N'system/sysmanager/Param_SysParam.aspx', N'images/icon/77.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'Sys_role', N'角色授权', N'root', N'App_sys', N'System/sysmanager/Sys_role.aspx', N'images/icon/70.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'task_ass', N'指派任务', N'mywork_task', N'App_message', N'personal/task/Assignment.aspx', N'images/icon/1.png', 20, N'sys', 0, N'fa-check-square-o', N'cc00cc')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'task_list', N'任务管理', N'mywork_task', N'App_message', N'personal/task/task_list.aspx', N'images/icon/27.png', 30, N'sys', 0, N'fa-circle-o', N'B3EE3A')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'task_todo', N'待办任务', N'mywork_task', N'App_message', N'personal/task/todo.aspx', N'images/icon/37.png', 20, N'sys', 0, N'fa-clock-o', N'33cc99')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'tools', N'客户工具', N'root', N'App_CRM', N'', N'images/icon/71.png', 50, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'tools_batch', N'批量转客户', N'tools', N'App_CRM', N'toolbar/batch/batch.aspx', N'images/icon/64.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'tools_customer', N'客户回收', N'tools', N'App_CRM', N'toolbar/recycle/crm/customer.aspx', N'images/icon/94.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'tools_repeat', N'客户查重', N'tools', N'App_CRM', N'toolbar/Repeat.aspx', N'images/icon/37.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'hr', N'用户管理', N'root', N'App_sys', N'', N'images/icon/37.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'hr_department', N'组织架构', N'hr', N'App_sys', N'hr/hr_department.aspx', N'images/icon/67.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'hr_employee', N'员工管理', N'hr', N'App_sys', N'hr/hr_employee.aspx', N'images/icon/37.png', 40, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'hr_position', N'职务管理', N'hr', N'App_sys', N'hr/hr_position.aspx', N'images/icon/68.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'hr_post', N'岗位管理', N'hr', N'App_sys', N'hr/hr_post.aspx', N'images/icon/49.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'message', N'信息中心', N'root', N'App_message', N'', N'images/icon/56.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'message_news', N'新闻', N'message', N'App_message', N'personal/message/news.aspx', N'images/icon/57.png', 10, N'sys', 1, N'fa-rss', N'007aff')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'message_notice', N'公告', N'message', N'App_message', N'personal/message/notice.aspx', N'images/icon/58.png', 20, N'sys', 1, N'fa-bars', N'f0ad4e')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'mywork', N'个人工作', N'root', N'App_message', N'', N'images/icon/38.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'mywork_calendar', N'日程安排', N'mywork', N'App_message', N'personal/personal/Calendar.aspx', N'images/icon/29.png', 20, N'sys', 1, N'fa-calendar', N'd2e2f2')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'mywork_note', N'我的便签', N'mywork', N'App_message', N'personal/personal/notes.aspx', N'images/icon/33.png', 10, N'sys', 1, N'fa-bookmark-o', N'4cd964')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'mywork_task', N'任务中心', N'root', N'App_message', N'', N'images/icon/1.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'product_category', N'产品类别', N'root', N'App_sale', N'Product/product_category.aspx', N'images/icon/82.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'product_list', N'产品列表', N'root', N'App_sale', N'Product/product.aspx', N'images/icon/67.png', 20, N'sys', 1, N'fa-product-hunt', N'FF00FF')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_compared', N'同比与环比', N'root', N'App_reports', N'', N'images/icon/59.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_emp', N'员工分析', N'root', N'App_reports', N'', N'images/icon/93.png', 30, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_emp_contract', N'【员工】订单统计', N'report_emp', N'App_reports', N'reportform/emp/customer_order.aspx', N'images/icon/94.png', 30, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_emp_cusadd', N'【员工】客户新增', N'report_emp', N'App_reports', N'reportform/emp/customer_add.aspx', N'images/icon/37.png', 10, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_emp_follow', N'【员工】跟进统计', N'report_emp', N'App_reports', N'reportform/emp/customer_follow.aspx', N'images/icon/38.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_funnel', N'销售漏斗', N'report_funnelmanager', N'App_reports', N'reportform/funnel/CRM_Report_funnel.aspx', N'images/icon/4.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_funnelmanager', N'销售漏斗', N'root', N'App_reports', N'', N'images/icon/4.png', 15, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_year', N'数据年报', N'root', N'App_reports', N'', N'images/icon/53.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_year_customer', N'客户统计年报', N'report_year', N'App_reports', N'reportform/crm/CRM_report_year.aspx', N'images/icon/53.png', 10, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'report_year_follow', N'跟进统计年报', N'report_year', N'App_reports', N'reportform/crm/Follow_report_year.aspx', N'images/icon/54.png', 20, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sale_order', N'订单管理', N'root', N'App_sale', N'sale/Order.aspx', N'images/icon/27.png', 30, N'sys', 1, N'fa-pencil-square-o', N'9400D3')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sys_city', N'城市管理', N'sys_param', N'App_sys', N'system/sysmanager/Param_City.aspx', N'images/icon/64.png', 50, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sys_agreement', N'短信配置', N'root', N'App_sys', N'system/sysconfig/sms_config.aspx', N'images/icon/47.png', 70, N'sys', 0, N'', N'')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'Sys_info', N'系统信息', N'root', N'App_sys', N'system/sysinfo/Sys_info.aspx', N'images/icon/77.png', 60, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'Sys_log', N'日志管理', N'root', N'App_sys', N'system/sysmanager/Sys_log.aspx', N'images/icon/51.png', 40, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sys_provinces', N'省份管理', N'sys_param', N'App_sys', N'system/sysmanager/Param_Provinces.aspx', N'images/icon/64.png', 40, N'sys', NULL, NULL, NULL)
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [App_id], [Menu_url], [Menu_icon], [Menu_order], [Menu_type], [isMobile], [m_css], [m_color]) VALUES (N'sys_param', N'参数管理', N'root', N'App_sys', N'', N'images/icon/82.png', 20, N'sys', NULL, NULL, NULL)

/****** Object:  Table [dbo].[Sys_log_Err]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_log_Err](
	[id] [varchar](50) NOT NULL,
	[Err_typeid] [int] NULL,
	[Err_type] [nvarchar](250) NULL,
	[Err_time] [datetime] NULL,
	[Err_url] [varchar](500) NULL,
	[Err_message] [nvarchar](max) NULL,
	[Err_source] [varchar](500) NULL,
	[Err_trace] [nvarchar](max) NULL,
	[Err_emp_id] [varchar](50) NULL,
	[Err_emp_name] [nvarchar](250) NULL,
	[Err_ip] [varchar](250) NULL,
 CONSTRAINT [PK_Sys_log_Err] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_log]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_log](
	[id] [varchar](50) NOT NULL,
	[EventType] [nvarchar](250) NULL,
	[EventID] [varchar](50) NULL,
	[EventTitle] [nvarchar](250) NULL,
	[Log_Content] [nvarchar](max) NULL,
	[UserID] [varchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[IPStreet] [varchar](50) NULL,
	[EventDate] [datetime] NULL,
 CONSTRAINT [PK_Sys_log] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_info]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_info](
	[sys_key] [varchar](50) NOT NULL,
	[sys_value] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sys_info] PRIMARY KEY NONCLUSTERED 
(
	[sys_key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sys_guid', NEWID())
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sys_name', N'小黄豆软件')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sys_logo', N'images/logo/logo.png')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sys_version', N'v2.0.925.3')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sms_no', N'')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sms_key', N'')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'sms_done', N'0')
INSERT [dbo].[Sys_info] ([sys_key], [sys_value]) VALUES (N'mob_version', N'2.0.0')

/****** Object:  Table [dbo].[Sys_data_authority]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_data_authority](
	[Role_id] [varchar](50) NULL,
	[dep_id] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_Button]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Button](
	[Btn_id] [varchar](50) NOT NULL,
	[Btn_name] [nvarchar](255) NULL,
	[Btn_type] [varchar](50) NULL,
	[Btn_icon] [varchar](50) NULL,
	[Btn_handler] [varchar](255) NULL,
	[Menu_id] [varchar](50) NULL,
	[Menu_name] [nvarchar](255) NULL,
	[Btn_order] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sys_Button] PRIMARY KEY NONCLUSTERED 
(
	[Btn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'01D0BD07-782B-4E8F-B385-93CFD9ABD30F', N'修改', NULL, N'images/icon/33.png', N'edit()', N'sale_contract', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'739940D0-4C45-41A0-AF8B-DF78487A8139', N'新增', NULL, N'images/icon/11.png', N'add()', N'sale_contract', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'6B8EC7BE-8F6E-495D-8D23-86C99FFAD254', N'新增', NULL, N'images/icon/11.png', N'add()', N'finance_invoice', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'41370003-3370-43AE-BDCD-071671AC0F47', N'修改', NULL, N'images/icon/33.png', N'edit()', N'finance_invoice', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'2CD08163-7750-4AFB-9538-516DAA07E596', N'删除', NULL, N'images/icon/12.png', N'del()', N'sms', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'78EED529-5538-4DE0-9FC7-7A7DBBABE9B1', N'删除', NULL, N'images/icon/12.png', N'del()', N'finance_invoice', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'CF551558-C4CD-4BDE-85B5-6EBCF99AFD9B', N'新增', NULL, N'images/icon/11.png', N'add()', N'finance_receivable', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'DAC1719A-F296-4247-836E-7D2A30AF1F38', N'修改', NULL, N'images/icon/33.png', N'edit()', N'finance_receivable', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'BB712354-6287-40EC-A3D8-16591B89817E', N'新增', NULL, N'images/icon/11.png', N'add()', N'sms', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'89C9BE0D-F21C-4F63-9CD4-6E565EB10EA0', N'新增', NULL, N'images/icon/11.png', N'add()', N'hr_employee', N'员工管理', 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1D4CA3FD-7297-43FE-86AF-C3C101926508', N'删除', NULL, N'images/icon/12.png', N'del()', N'hr_employee', N'员工管理', 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'361DEB84-BE21-41DF-8579-1A7D23F9BDBB', N'修改', NULL, N'images/icon/33.png', N'edit()', N'hr_employee', N'员工管理', 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1B2D5C53-D948-485C-9CD7-448CD46975B3', N'新增', NULL, N'images/icon/11.png', N'add()', N'Sys_role', N'角色授权', 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'2EB328DD-E7F3-426D-BCD3-CA47FB6AAB30', N'删除', NULL, N'images/icon/12.png', N'del()', N'Sys_role', N'角色授权', 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'CB896640-9FAE-4754-8574-48FF74604AF0', N'修改', NULL, N'images/icon/33.png', N'edit()', N'Sys_role', N'角色授权', 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'44B75D22-852E-4E09-A7CC-D4E71C90E86B', N'操作权限', NULL, N'images/icon/91.png', N'authorized()', N'Sys_role', N'角色授权', 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'4FC40BF8-B12B-4BF0-8F31-897031A10312', N'包含人员', NULL, N'images/icon/37.png', N'role_emp()', N'Sys_role', N'角色授权', 60, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'99A93463-BEBF-4B5C-AB7D-0B679332C90F', N'跨部权限', NULL, N'images/icon/92.png', N'data_authorized()', N'Sys_role', N'角色授权', 50, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'F9837040-3A36-4161-AC53-BE3FA120348B', N'审核', NULL, N'images/icon/50.png', N'check()', N'sms', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'3D175449-0461-44B4-A400-3BA2625AA237', N'删除', NULL, N'images/icon/12.png', N'del()', N'finance_receivable', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'FDE2E0EE-D2B1-40BD-928F-AB28F58D770D', N'删除', NULL, N'images/icon/12.png', N'del()', N'product_list', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'0F1A2C1D-FC9C-4622-873D-A2A24A6C26B8', N'修改', NULL, N'images/icon/33.png', N'edit()', N'product_list', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'BFA968C8-AEA7-40A1-8192-541272932B6E', N'新增', NULL, N'images/icon/11.png', N'add()', N'hr_department', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'4E0A9A25-5608-440C-8D14-5261F6CA436D', N'删除', NULL, N'images/icon/12.png', N'del()', N'hr_department', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'A70CCF6B-CA76-474D-BF93-C9C2D33324BD', N'修改', NULL, N'images/icon/33.png', N'edit()', N'hr_department', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'6A513DCC-52F4-4150-B78D-01F84CEBD671', N'新增', NULL, N'images/icon/11.png', N'add()', N'hr_position', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'9E686C8B-A2CC-4456-988B-88205728E487', N'删除', NULL, N'images/icon/12.png', N'del()', N'hr_position', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'BB9C94AC-A3FD-4409-8468-7965BDEC0134', N'新增', NULL, N'images/icon/11.png', N'add()', N'hr_post', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1568B6C5-45D2-42C5-B3BC-788E8C0CD0D6', N'新增', NULL, N'images/icon/11.png', N'add()', N'sys_params', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'E62D7247-5759-4F9F-9954-F938A4F0CDEF', N'修改', NULL, N'images/icon/33.png', N'edit()', N'sys_params', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'B7265173-AB71-44BF-827F-C3B66F81DD51', N'删除', NULL, N'images/icon/12.png', N'del()', N'sys_params', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'3E73BFF5-87CC-44A7-94DC-7F22080C2F32', N'新增', NULL, N'images/icon/11.png', N'add()', N'sys_city', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'5156C3B8-1FA3-4B78-9ED5-71BC5C61F75F', N'修改', NULL, N'images/icon/33.png', N'edit()', N'sys_city', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'A879344D-72E3-47DE-9E78-CEBAAABDE7AD', N'删除', NULL, N'images/icon/12.png', N'del()', N'sys_city', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'4C102214-334B-4053-B896-30CD1BCA413C', N'修改', NULL, N'images/icon/33.png', N'edit()', N'sys_provinces', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'3386DD74-16B0-4E7F-9442-19766CDAE7C3', N'新增', NULL, N'images/icon/11.png', N'add()', N'message_news', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'21E3C7B0-2F43-4A5B-AD52-F882247DFA31', N'修改', NULL, N'images/icon/33.png', N'edit()', N'message_news', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'5CE532AF-69BE-4FB0-B32F-52F17A6FFD80', N'删除', NULL, N'images/icon/12.png', N'del()', N'message_news', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'31912A8C-6843-46D0-B430-D2C2DE0FBCC0', N'修改', NULL, N'images/icon/33.png', N'edit()', N'message_notice', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'D035480C-249A-409E-A6D4-12EB7068BF10', N'新增', NULL, N'images/icon/11.png', N'add()', N'product_list', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'B34D6236-66F9-4997-90F3-4453C0832CB6', N'修改', NULL, N'images/icon/33.png', N'edit()', N'hr_position', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'3754BE8F-5D53-47AD-9643-3B827F972A78', N'修改', NULL, N'images/icon/33.png', N'edit()', N'hr_post', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'02674D56-664F-4F76-98EA-E15D14F45612', N'删除', NULL, N'images/icon/12.png', N'del()', N'hr_post', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'96BA0A61-A626-462F-AED1-10AC41480AFC', N'新增', NULL, N'images/icon/11.png', N'add()', N'sys_provinces', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'D2A01338-27CF-48BC-A1E0-86232D0BB774', N'删除', NULL, N'images/icon/12.png', N'del()', N'sys_provinces', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'AC4E4B5A-849F-4F7A-96A3-F81868C8B951', N'删除', NULL, N'images/icon/12.png', N'del()', N'message_notice', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'F0CB8FAD-64AD-47D7-9A4C-F5F47C0A00A0', N'新增', NULL, N'images/icon/11.png', N'add()', N'message_notice', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'03BC7486-301F-405F-86A2-93D39C2C127D', N'新增', NULL, N'images/icon/11.png', N'add()', N'contact_follow', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'D3224307-059A-4768-A3F7-6D440614C427', N'删除', NULL, N'images/icon/12.png', N'del()', N'contact_follow', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'F30F97AC-A5C9-4BCB-AF45-7F6073080F0E', N'修改', NULL, N'images/icon/33.png', N'edit()', N'contact_follow', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'2B22EF84-A2EF-4FC1-B1A3-5F548BD81A48', N'新增', NULL, N'images/icon/11.png', N'add()', N'customer_contact', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1114131E-A934-4983-831C-A3FC448E803E', N'修改', NULL, N'images/icon/33.png', N'edit()', N'customer_contact', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'62BD8016-4684-4977-BC77-AB10F51432C4', N'删除', NULL, N'images/icon/12.png', N'del()', N'customer_contact', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1FCAA081-C1E5-49CF-B8AF-93BBF72669B7', N'新增', NULL, N'images/icon/11.png', N'add()', N'product_category', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'59347F8D-B1F4-4F7F-9499-FA9B5223AE05', N'修改', NULL, N'images/icon/33.png', N'edit()', N'product_category', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'ECD91B11-2CEF-497D-883F-C431496E68CC', N'删除', NULL, N'images/icon/12.png', N'del()', N'product_category', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'B4E86ECD-E388-4A1F-BC0F-3270EDA8C3A2', N'修改', NULL, N'images/icon/33.png', N'edit()', N'sale_order', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'C86197B3-B425-4058-8E80-15244F0E6243', N'新增', NULL, N'images/icon/11.png', N'add()', N'sale_order', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'08A15B8A-534B-417D-851E-6D528D1A9EEB', N'删除', NULL, N'images/icon/12.png', N'del()', N'sale_order', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'6DCB47D8-6639-434C-B80B-DAC8A5D173B5', N'新增', NULL, N'images/icon/11.png', N'add()', N'finance_receive', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'DB8C6367-A760-4D93-A396-DF2B67C961EA', N'修改', NULL, N'images/icon/33.png', N'edit()', N'finance_receive', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'1F6B491E-7C54-41DE-82F0-74ECF1AF0A7F', N'删除', NULL, N'images/icon/12.png', N'del()', N'finance_receive', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'5B976B4D-BCF6-433C-95BA-D17E7B38322A', N'新增', NULL, N'images/icon/11.png', N'add()', N'task_list', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'CA9FD821-BD8B-4734-ACF0-BCC9A2EACBDE', N'修改', NULL, N'images/icon/33.png', N'edit()', N'task_list', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'ACDB8A22-7330-4F0B-9E1B-5700CAC234DE', N'删除', NULL, N'images/icon/12.png', N'del()', N'task_list', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'58A8C509-735C-4453-8C4C-E4FBFCA0E802', N'新增', NULL, N'images/icon/11.png', N'add()', N'task_ass', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'8C57906E-3B92-4298-9C61-A63C2DC55719', N'修改', NULL, N'images/icon/33.png', N'edit()', N'task_ass', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'9833C0E4-6010-4C35-8B0F-F938988D7727', N'删除', NULL, N'images/icon/12.png', N'del()', N'task_ass', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'71C3079E-C114-49B2-A909-811881582B29', N'终止', NULL, N'images/icon/74.png', N'stop()', N'task_ass', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'DBA34A71-93B6-4D7F-8A76-46D627B9F227', N'新增', NULL, N'images/icon/11.png', N'add()', N'task_todo', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'BDEA4B97-0701-41F1-9623-F054DED529AC', N'修改', NULL, N'images/icon/33.png', N'edit()', N'task_todo', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'B81E9DC4-7367-4F79-81AC-E6044CD5E556', N'删除', NULL, N'images/icon/12.png', N'del()', N'task_todo', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'788D1F9A-30CC-4A16-832D-D391BEB24D6D', N'完成', NULL, N'images/icon/10.png', N'done()', N'task_todo', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'D2769CAF-8BC2-46D4-9758-7EE5EC4626C6', N'恢复', NULL, N'images/icon/2.png', N'regain()', N'tools_customer', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'08783D72-5D43-42F8-9FBD-6C637FC3376F', N'删除', NULL, N'images/icon/12.png', N'del()', N'tools_customer', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'5F532514-4B74-4DCB-B3B0-FFC105018126', N'批量转客户', NULL, N'images/icon/1.png', N'batch_cus()', N'tools_batch', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'EC5514EA-1757-465A-AE93-278093EDE31D', N'删除', NULL, N'images/icon/12.png', N'del()', N'tools_repeat', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'420BB111-95AA-42D1-B686-2EC544033D27', N'修改密码', NULL, N'images/icon/77.png', N'changepwd()', N'hr_employee', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'8D2167A0-7EB5-4312-8BA2-16EE49ADF405', N'导入', NULL, N'images/icon/46.png', N'toimport()', N'customer_contact', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'5BA51EFA-7C03-4821-BA48-56891E9ED87E', N'新增', NULL, N'images/icon/11.png', N'add()', N'crm_customer', NULL, 10, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'97B05BAF-60AD-456F-83D5-440757665EB2', N'删除', NULL, N'images/icon/12.png', N'del()', N'crm_customer', NULL, 30, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'E6DD9AE3-24E5-4019-A8B5-30EEA96E2C8D', N'导入', NULL, N'images/icon/46.png', N'toimport()', N'crm_customer', NULL, 40, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'31EACB23-07D9-4644-9029-283523DEFA47', N'修改', NULL, N'images/icon/33.png', N'edit()', N'crm_customer', NULL, 20, NULL, NULL)
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_type], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order], [create_id], [create_time]) VALUES (N'124BB10B-70A2-4564-A0A0-FFBC5025218D', N'删除', NULL, N'images/icon/12.png', N'del()', N'sale_contract', NULL, 30, NULL, NULL)

/****** Object:  Table [dbo].[Sys_authority]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_authority](
	[Role_id] [varchar](50) NOT NULL,
	[App_id] [varchar](50) NULL,
	[Auth_type] [int] NULL,
	[Auth_id] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sys_App]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_App](
	[id] [varchar](50) NOT NULL,
	[App_name] [nvarchar](100) NULL,
	[App_order] [int] NULL,
	[App_url] [varchar](250) NULL,
	[App_handler] [varchar](250) NULL,
	[App_type] [varchar](50) NULL,
	[App_icon] [varchar](250) NULL,
 CONSTRAINT [PK_Sys_App] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_message', N'办公中心', 10, NULL, N'fa-comments', NULL, N'images/icons/64X64/chat.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_CRM', N'客户管理', 20, NULL, N'fa-phone-square', NULL, N'images/icons/64X64/document.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_sale', N'销售管理', 30, NULL, N'fa-user', NULL, N'images/icons/64X64/devices.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_reports', N'报表分析', 70, NULL, N'fa-bar-chart', NULL, N'images/icons/64X64/barchart.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_sys', N'系统管理', 80, NULL, N'fa-desktop', NULL, N'images/icons/64X64/gears.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (N'App_finance', N'财务管理', 60, NULL, NULL, NULL, NULL)

/****** Object:  Table [dbo].[SMS_details]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMS_details](
	[sms_id] [varchar](50) NULL,
	[contact_id] [varchar](50) NULL,
	[mobiles] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[SMS]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMS](
	[id] [varchar](50) NOT NULL,
	[sms_title] [nvarchar](250) NULL,
	[sms_content] [nvarchar](max) NULL,
	[contact_ids] [varchar](max) NULL,
	[sms_mobiles] [varchar](max) NULL,
	[isSend] [int] NULL,
	[sendtime] [datetime] NULL,
	[check_id] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_SMS] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sale_order_details]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale_order_details](
	[order_id] [varchar](250) NULL,
	[product_id] [varchar](250) NULL,
	[agio] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
	[amount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Sale_order]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale_order](
	[id] [varchar](50) NOT NULL,
	[Serialnumber] [varchar](250) NULL,
	[Customer_id] [varchar](50) NULL,
	[Order_date] [datetime] NULL,
	[pay_type_id] [varchar](50) NULL,
	[Order_status_id] [varchar](50) NULL,
	[Order_amount] [decimal](18, 2) NULL,
	[discount_amount] [decimal](18, 2) NULL,
	[total_amount] [decimal](18, 2) NULL,
	[emp_id] [varchar](50) NULL,
	[receive_money] [decimal](18, 2) NULL,
	[arrears_money] [decimal](18, 2) NULL,
	[invoice_money] [decimal](18, 2) NULL,
	[arrears_invoice] [decimal](18, 2) NULL,
	[Order_details] [varchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Sale_order] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[public_notice]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[public_notice](
	[id] [varchar](50) NOT NULL,
	[notice_title] [varchar](250) NULL,
	[notice_content] [varchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_public_notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[public_news]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[public_news](
	[id] [varchar](50) NOT NULL,
	[news_title] [varchar](250) NULL,
	[news_content] [varchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_public_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Product_category]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_category](
	[id] [varchar](50) NOT NULL,
	[product_category] [varchar](250) NULL,
	[parentid] [varchar](50) NULL,
	[product_icon] [varchar](250) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Product_category] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Product]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [varchar](50) NOT NULL,
	[product_name] [varchar](250) NULL,
	[category_id] [varchar](50) NULL,
	[status] [varchar](250) NULL,
	[unit] [varchar](250) NULL,
	[cost] [decimal](18, 2) NULL,
	[price] [decimal](18, 2) NULL,
	[agio] [decimal](18, 2) NULL,
	[remarks] [varchar](max) NULL,
	[specifications] [varchar](250) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Personal_queckmenu]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal_queckmenu](
	[user_id] [varchar](50) NULL,
	[menu_id] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Personal_notes]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal_notes](
	[id] [varchar](50) NOT NULL,
	[emp_id] [varchar](50) NULL,
	[emp_name] [varchar](250) NULL,
	[note_content] [varchar](max) NULL,
	[note_color] [varchar](250) NULL,
	[xyz] [varchar](250) NULL,
	[note_time] [datetime] NULL,
 CONSTRAINT [PK_Personal_notes] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Personal_Calendar]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal_Calendar](
	[id] [varchar](50) NOT NULL,
	[emp_id] [varchar](50) NULL,
	[customer_id] [varchar](50) NULL,
	[Subject] [varchar](max) NULL,
	[MasterId] [int] NULL,
	[CalendarType] [tinyint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[IsAllDayEvent] [bit] NULL,
	[Category] [int] NULL,
	[InstanceType] [tinyint] NULL,
	[UPAccount] [varchar](250) NULL,
	[UPName] [varchar](250) NULL,
	[UPTime] [datetime] NULL,
 CONSTRAINT [PK_Personal_Calendar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[hr_post]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_post](
	[id] [varchar](50) NOT NULL,
	[post_name] [nvarchar](255) NULL,
	[position_id] [varchar](50) NULL,
	[dep_id] [varchar](50) NULL,
	[emp_id] [varchar](50) NULL,
	[default_post] [int] NULL,
	[note] [nvarchar](max) NULL,
	[post_descript] [nvarchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_hr_post] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[hr_position]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_position](
	[id] [varchar](50) NOT NULL,
	[position_name] [nvarchar](250) NULL,
	[position_order] [int] NULL,
	[position_level] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_hr_position] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[hr_employee]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_employee](
	[id] [varchar](50) NOT NULL,
	[uid] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[idcard] [varchar](50) NULL,
	[birthday] [varchar](50) NULL,
	[dep_id] [varchar](50) NULL,
	[post_id] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[sex] [nvarchar](50) NULL,
	[tel] [varchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[position_id] [varchar](50) NULL,
	[sort] [int] NULL,
	[EntryDate] [varchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[remarks] [nvarchar](255) NULL,
	[education] [nvarchar](50) NULL,
	[level] [varchar](50) NULL,
	[professional] [nvarchar](50) NULL,
	[schools] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[portal] [varchar](250) NULL,
	[theme] [varchar](250) NULL,
	[canlogin] [int] NULL,
	[default_city] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_hr_employee] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[hr_employee] ([id], [uid], [pwd], [name], [idcard], [birthday], [dep_id], [post_id], [email], [sex], [tel], [status], [position_id], [sort], [EntryDate], [address], [remarks], [education], [level], [professional], [schools], [title], [portal], [theme], [canlogin], [default_city], [create_id], [create_time]) VALUES (N'38295F35-8507-4254-B727-B8FF26E9E302', N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'超级管理员', N'', N'', N'0', N'0', N'', N'男', N'', NULL, N'0', NULL, NULL, N'', NULL, N'', NULL, N'', N'', N'admin.png', NULL, NULL, 1, N'长沙', NULL, NULL)

/****** Object:  Table [dbo].[hr_department]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_department](
	[id] [varchar](50) NOT NULL,
	[dep_name] [nvarchar](50) NULL,
	[parentid] [varchar](50) NULL,
	[parentname] [nvarchar](50) NULL,
	[dep_type] [nvarchar](50) NULL,
	[dep_icon] [varchar](50) NULL,
	[dep_chief] [nvarchar](50) NULL,
	[dep_tel] [varchar](50) NULL,
	[dep_fax] [varchar](50) NULL,
	[dep_add] [nvarchar](255) NULL,
	[dep_email] [varchar](50) NULL,
	[dep_descript] [nvarchar](255) NULL,
	[dep_order] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_hr_department] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Finance_Receive]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Finance_Receive](
	[id] [varchar](50) NOT NULL,
	[Receive_num] [varchar](50) NULL,
	[Pay_type_id] [varchar](50) NULL,
	[Receive_amount] [decimal](18, 2) NULL,
	[Receive_date] [datetime] NULL,
	[Payee_id] [varchar](50) NULL,
	[Receivable_id] [varchar](50) NULL,
	[Remarks] [nvarchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Finance_Receive] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Finance_Receivable]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Finance_Receivable](
	[id] [varchar](50) NOT NULL,
	[receivable_no] [varchar](50) NULL,
	[order_id] [varchar](50) NULL,
	[receivable_time] [datetime] NULL,
	[receivable_amount] [decimal](18, 2) NULL,
	[received_amount] [decimal](18, 2) NULL,
	[arrears_amount] [decimal](18, 2) NULL,
	[Remark] [nvarchar](max) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_Finance_Receivable] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Finance_Invoice]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Finance_Invoice](
	[id] [varchar](50) NOT NULL,
	[order_id] [varchar](50) NULL,
	[invoice_num] [varchar](250) NULL,
	[invoice_type_id] [varchar](50) NULL,
	[invoice_amount] [decimal](18, 2) NULL,
	[invoice_content] [varchar](max) NULL,
	[invoice_date] [datetime] NULL,
	[empid] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_invoice] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CRM_follow]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_follow](
	[id] [varchar](50) NOT NULL,
	[customer_id] [varchar](50) NULL,
	[contact_id] [varchar](50) NULL,
	[follow_aim_id] [varchar](50) NULL,
	[follow_type_id] [varchar](50) NULL,
	[follow_content] [varchar](max) NULL,
	[follow_time] [datetime] NULL,
	[employee_id] [varchar](50) NULL,
 CONSTRAINT [PK_CRM_follow] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CRM_Customer]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_Customer](
	[id] [varchar](50) NOT NULL,
	[Serialnumber] [varchar](250) NULL,
	[cus_name] [varchar](250) NULL,
	[cus_add] [varchar](250) NULL,
	[cus_tel] [varchar](250) NULL,
	[cus_fax] [varchar](250) NULL,
	[cus_website] [varchar](250) NULL,
	[cus_industry_id] [varchar](50) NULL,
	[Provinces_id] [varchar](50) NULL,
	[City_id] [varchar](50) NULL,
	[cus_type_id] [varchar](50) NULL,
	[cus_level_id] [varchar](50) NULL,
	[cus_source_id] [varchar](50) NULL,
	[DesCripe] [varchar](4000) NULL,
	[Remarks] [varchar](4000) NULL,
	[emp_id] [varchar](50) NULL,
	[isPrivate] [int] NULL,
	[lastfollow] [datetime] NULL,
	[xy] [varchar](50) NULL,
	[cus_extend] [varchar](max) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_Customer] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CRM_contract_atta]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_contract_atta](
	[id] [varchar](50) NOT NULL,
	[contract_id] [varchar](50) NULL,
	[file_name] [varchar](250) NULL,
	[real_name] [varchar](250) NULL,
	[file_size] [int] NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_contract_atta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CRM_contract]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_contract](
	[id] [varchar](50) NOT NULL,
	[Contract_name] [varchar](250) NULL,
	[Serialnumber] [varchar](250) NULL,
	[Customer_id] [varchar](50) NULL,
	[Contract_amount] [float] NULL,
	[Pay_cycle] [int] NULL,
	[Start_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[Sign_date] [datetime] NULL,
	[Customer_Contractor] [varchar](250) NULL,
	[Our_Contractor_id] [varchar](50) NULL,
	[Main_Content] [varchar](max) NULL,
	[Remarks] [varchar](max) NULL,
	[creater_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_contract] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CRM_Contact]    Script Date: 09/18/2017 12:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_Contact](
	[id] [varchar](50) NOT NULL,
	[C_name] [varchar](250) NULL,
	[C_sex] [int] NULL,
	[C_department] [varchar](250) NULL,
	[C_position] [varchar](250) NULL,
	[C_birthday] [datetime] NULL,
	[C_tel] [varchar](250) NULL,
	[C_fax] [varchar](250) NULL,
	[C_email] [varchar](250) NULL,
	[C_mob] [varchar](250) NULL,
	[C_QQ] [varchar](250) NULL,
	[C_add] [varchar](250) NULL,
	[C_hobby] [varchar](250) NULL,
	[C_remarks] [varchar](max) NULL,
	[customer_id] [varchar](50) NULL,
	[create_id] [varchar](50) NULL,
	[create_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_Contact] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

