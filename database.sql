USE [sent2me]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [varchar](20) NOT NULL,
	[emp_name] [varchar](50) NULL,
	[emp_add] [nvarchar](100) NULL,
	[title_id] [varchar](10) NOT NULL,
	[branch_id] [varchar](10) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_id] [varchar](10) NOT NULL,
	[branch_name] [varchar](50) NULL,
	[branch_add] [nvarchar](100) NULL,
	[emp_id] [varchar](20) NULL,
	[latlong] [varchar](50) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BranchManager_view]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BranchManager_view]
AS
SELECT        dbo.Branch.branch_id AS รหัสสาขา, dbo.Branch.branch_name AS ชื่อสาขา, dbo.Branch.branch_add AS ที่อยู่สาขา, dbo.Branch.emp_id AS รหัสผู้จัดการสาขา, dbo.Branch.latlong AS พิกัด
FROM            dbo.Branch INNER JOIN
                         dbo.Employee ON dbo.Branch.emp_id = dbo.Employee.emp_id AND dbo.Branch.branch_id = dbo.Employee.branch_id
GO
/****** Object:  Table [dbo].[Title]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[title_id] [varchar](10) NOT NULL,
	[title_name] [varchar](50) NULL,
	[title_desc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_login]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_login](
	[uid] [int] IDENTITY(1000,1) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password] [varchar](25) NOT NULL,
	[emp_id] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Web_login] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[login_view]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[login_view]
AS
SELECT        dbo.Web_login.uid, dbo.Web_login.username, dbo.Web_login.password, dbo.Employee.emp_id, dbo.Employee.title_id, dbo.Title.title_name
FROM            dbo.Web_login INNER JOIN
                         dbo.Employee ON dbo.Web_login.emp_id = dbo.Employee.emp_id INNER JOIN
                         dbo.Title ON dbo.Employee.title_id = dbo.Title.title_id
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[dev_id] [varchar](20) NOT NULL,
	[package_id] [int] NOT NULL,
	[branch_id] [varchar](10) NOT NULL,
	[status] [bit] NOT NULL,
	[dev_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[dev_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package_type]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package_type](
	[package_type_id] [varchar](20) NOT NULL,
	[package_type_name] [nvarchar](50) NULL,
	[package_desc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Package_type] PRIMARY KEY CLUSTERED 
(
	[package_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[package_id] [int] IDENTITY(1000,1) NOT NULL,
	[regis_date] [datetime] NOT NULL,
	[emp_id] [varchar](20) NOT NULL,
	[branch_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package_detail]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package_detail](
	[package_id] [int] NOT NULL,
	[package_name] [nvarchar](50) NOT NULL,
	[sender_name] [nvarchar](50) NULL,
	[sender_add] [nvarchar](100) NULL,
	[rec_name] [nvarchar](50) NOT NULL,
	[rec_add] [nvarchar](100) NOT NULL,
	[package_type_id] [varchar](20) NOT NULL,
	[weight] [float] NOT NULL,
 CONSTRAINT [PK_Package_detail] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC,
	[package_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[package_detail_view]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[package_detail_view]
AS
SELECT        dbo.Delivery.dev_id, dbo.Delivery.package_id, dbo.Package_detail.package_name, dbo.Branch.branch_id, dbo.Branch.branch_name, dbo.Package.regis_date, dbo.Package.emp_id, dbo.Employee.emp_name, 
                         dbo.Package_detail.sender_name, dbo.Package_detail.sender_add, dbo.Package_detail.rec_name, dbo.Package_detail.rec_add, dbo.Package_detail.package_type_id, dbo.Package_type.package_type_name
FROM            dbo.Delivery INNER JOIN
                         dbo.Package ON dbo.Delivery.package_id = dbo.Package.package_id INNER JOIN
                         dbo.Branch ON dbo.Delivery.branch_id = dbo.Branch.branch_id INNER JOIN
                         dbo.Package_detail ON dbo.Package.package_id = dbo.Package_detail.package_id INNER JOIN
                         dbo.Employee ON dbo.Package.emp_id = dbo.Employee.emp_id INNER JOIN
                         dbo.Package_type ON dbo.Package_detail.package_type_id = dbo.Package_type.package_type_id
GO
/****** Object:  View [dbo].[package_view]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[package_view]
AS
SELECT        TOP (100) PERCENT dbo.Package.package_id AS รหัสพัสดุ, dbo.Package.regis_date AS เวลาลงทะเบียน, dbo.Package_detail.package_name AS [ชื่อพัสดุ(ถ้ามี)], dbo.Package_detail.sender_name AS ชื่อผู้ส่ง, 
                         dbo.Package_detail.sender_add AS ที่อยู่ผู้ส่ง, dbo.Package_detail.rec_name AS ชื่อผู้รับ, dbo.Package_detail.rec_add AS ที่อยู่ผู้รับ, dbo.Package_detail.package_type_id AS รหัสชนิดพัสดุ, 
                         dbo.Package_type.package_type_name AS ชื่อชนิดพัสดุ, dbo.Employee.emp_id AS รหัสพนักงานรับผิดชอบ, dbo.Employee.emp_name AS ชื่อพนักงารับผิดชอบ, dbo.Employee.title_id AS รหัสตำแหน่ง, dbo.Title.title_name AS ตำแหน่ง
FROM            dbo.Package INNER JOIN
                         dbo.Package_detail ON dbo.Package.package_id = dbo.Package_detail.package_id INNER JOIN
                         dbo.Package_type ON dbo.Package_detail.package_type_id = dbo.Package_type.package_type_id INNER JOIN
                         dbo.Employee ON dbo.Package.emp_id = dbo.Employee.emp_id INNER JOIN
                         dbo.Title ON dbo.Employee.title_id = dbo.Title.title_id
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bil_id] [int] IDENTITY(2000,1) NOT NULL,
	[package_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
	[dev_id] [varchar](20) NOT NULL,
	[id] [int] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[bil_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cus_id] [int] IDENTITY(1,3000) NOT NULL,
	[cus_name] [varchar](50) NOT NULL,
	[cus_id_card] [varchar](13) NOT NULL,
	[num_of_services] [int] NOT NULL,
	[tel_num] [varchar](10) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_desciption]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_desciption](
	[dev_des_id] [int] NOT NULL,
	[des_text] [varchar](50) NULL,
 CONSTRAINT [PK_Delivery_desciption] PRIMARY KEY CLUSTERED 
(
	[dev_des_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_detail]    Script Date: 12/19/2017 7:48:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_detail](
	[dev_id] [varchar](20) NOT NULL,
	[package_id] [int] NOT NULL,
	[branch_id] [varchar](10) NOT NULL,
	[status] [bit] NOT NULL,
	[dev_des_id] [int] NOT NULL,
	[emp_id] [varchar](20) NOT NULL,
	[time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package_price]    Script Date: 12/19/2017 7:48:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package_price](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[package_type_id] [varchar](20) NOT NULL,
	[branch_id] [varchar](10) NOT NULL,
	[weight_rate] [float] NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_Package_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Branch] ([branch_id], [branch_name], [branch_add], [emp_id], [latlong]) VALUES (N'B000', N'Bangkok', N'จ.กรุงเทพ', N'EMP301', N'8.189292, 98.296568')
INSERT [dbo].[Branch] ([branch_id], [branch_name], [branch_add], [emp_id], [latlong]) VALUES (N'B001', N'Changmai', N'จ.เชียงใหม่', N'EMP101', N'8.189292, 98.296568')
INSERT [dbo].[Branch] ([branch_id], [branch_name], [branch_add], [emp_id], [latlong]) VALUES (N'B002', N'Pukage', N'จ.ภูเก็ต', N'EMP301', N'8.189292, 98.296568')
INSERT [dbo].[Branch] ([branch_id], [branch_name], [branch_add], [emp_id], [latlong]) VALUES (N'B003', N'Chonburi', N'จ.ชลบุรี', N'EMP301', N'8.189292, 98.296568')
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([cus_id], [cus_name], [cus_id_card], [num_of_services], [tel_num]) VALUES (6001, N'NoName', N'1111111111111', 3, N'1111111111')
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Delivery] ([dev_id], [package_id], [branch_id], [status], [dev_datetime]) VALUES (N'DEV1121', 1121, N'B000', 0, CAST(N'2017-12-19T07:34:26.447' AS DateTime))
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (1, N'รับเข้าระบบ')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (2, N'บรรจุ')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (3, N'ขนส่ง')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (4, N'รอจ่าย')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (5, N'กำลังจ่าย')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (6, N'จ่ายแล้ว')
INSERT [dbo].[Delivery_desciption] ([dev_des_id], [des_text]) VALUES (7, N'ไม่สามารถส่งถึงมือผู้รับ')
INSERT [dbo].[Delivery_detail] ([dev_id], [package_id], [branch_id], [status], [dev_des_id], [emp_id], [time]) VALUES (N'DEV1121', 1121, N'B000', 0, 1, N'EMP304', CAST(N'2017-12-19T07:34:26.447' AS DateTime))
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP000', N'Ken Muiy', N'Brazil', N'HBOSS', N'B000')
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP101', N'Jutamas', N'Bangkok', N'HR', N'B001')
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP301', N'Jimy', N'Chang Mai', N'HR', N'B003')
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP302', N'Jade', N'Chang Mai', N'R', N'B003')
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP303', N'test', N'test', N'BOSS', N'B000')
INSERT [dbo].[Employee] ([emp_id], [emp_name], [emp_add], [title_id], [branch_id]) VALUES (N'EMP304', N'TEST', N'TEST', N'S', N'B000')
SET IDENTITY_INSERT [dbo].[Package] ON 

INSERT [dbo].[Package] ([package_id], [regis_date], [emp_id], [branch_id]) VALUES (1121, CAST(N'2017-12-19T07:34:26.447' AS DateTime), N'EMP304', N'B000')
SET IDENTITY_INSERT [dbo].[Package] OFF
INSERT [dbo].[Package_detail] ([package_id], [package_name], [sender_name], [sender_add], [rec_name], [rec_add], [package_type_id], [weight]) VALUES (1121, N'ไม่ระบุ', N'กรุณาใส่ชื่อผู้ส่ง', N'กรุณาใส่ที่อยู่ผู้ส่ง', N'กรุณาใส่ชื่อผู้รับ', N'กรุณาใส่ที่อยู่ผู้รับ', N'A', 0)
SET IDENTITY_INSERT [dbo].[Package_price] ON 

INSERT [dbo].[Package_price] ([id], [package_type_id], [branch_id], [weight_rate], [cost]) VALUES (1002, N'A', N'B000', 500, 10.0000)
INSERT [dbo].[Package_price] ([id], [package_type_id], [branch_id], [weight_rate], [cost]) VALUES (1003, N'A', N'B000', 1000, 20.0000)
SET IDENTITY_INSERT [dbo].[Package_price] OFF
INSERT [dbo].[Package_type] ([package_type_id], [package_type_name], [package_desc]) VALUES (N'A', N'ธรรมดา', NULL)
INSERT [dbo].[Package_type] ([package_type_id], [package_type_name], [package_desc]) VALUES (N'E', N'ด่วนพิเศษ', NULL)
INSERT [dbo].[Package_type] ([package_type_id], [package_type_name], [package_desc]) VALUES (N'R', N'ลงทะเบียน', NULL)
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'BOSS', N'Head Branch', N'ผู้จัดการสาขา')
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'HBOSS', N'Big Boss', N'ผู้จัดการใหญ่')
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'HR', N'Head of Register Staff', N'หัวหน้าแผนกลงทะเบียน')
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'P', N'Payroll Staff', N'พนักงานนำจ่าย')
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'R', N'Register Package Staff ', N'พนักงานลงทะเบียน')
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'S', N'admin', NULL)
INSERT [dbo].[Title] ([title_id], [title_name], [title_desc]) VALUES (N'T', N'Transport Staff', N'พนักงานขนส่ง')
SET IDENTITY_INSERT [dbo].[Web_login] ON 

INSERT [dbo].[Web_login] ([uid], [username], [password], [emp_id]) VALUES (1000, N'waveblur', N'029818524', N'EMP000')
INSERT [dbo].[Web_login] ([uid], [username], [password], [emp_id]) VALUES (1006, N'TEST', N'test', N'EMP101')
INSERT [dbo].[Web_login] ([uid], [username], [password], [emp_id]) VALUES (1013, N'admin', N'1234', N'EMP303')
INSERT [dbo].[Web_login] ([uid], [username], [password], [emp_id]) VALUES (1014, N'su', N'1234', N'EMP304')
SET IDENTITY_INSERT [dbo].[Web_login] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customers] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customers] ([cus_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customers]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Package] FOREIGN KEY([package_id])
REFERENCES [dbo].[Package] ([package_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Package]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Package_price] FOREIGN KEY([id])
REFERENCES [dbo].[Package_price] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Package_price]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FK_Branch_Employee]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Branch]
GO
ALTER TABLE [dbo].[Delivery_detail]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_detail_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Delivery_detail] CHECK CONSTRAINT [FK_Delivery_detail_Branch]
GO
ALTER TABLE [dbo].[Delivery_detail]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_detail_Delivery] FOREIGN KEY([dev_id])
REFERENCES [dbo].[Delivery] ([dev_id])
GO
ALTER TABLE [dbo].[Delivery_detail] CHECK CONSTRAINT [FK_Delivery_detail_Delivery]
GO
ALTER TABLE [dbo].[Delivery_detail]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_detail_Delivery_desciption] FOREIGN KEY([dev_des_id])
REFERENCES [dbo].[Delivery_desciption] ([dev_des_id])
GO
ALTER TABLE [dbo].[Delivery_detail] CHECK CONSTRAINT [FK_Delivery_detail_Delivery_desciption]
GO
ALTER TABLE [dbo].[Delivery_detail]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_detail_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Delivery_detail] CHECK CONSTRAINT [FK_Delivery_detail_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Branch]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Title] FOREIGN KEY([title_id])
REFERENCES [dbo].[Title] ([title_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Title]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Branch]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Employee]
GO
ALTER TABLE [dbo].[Package_detail]  WITH CHECK ADD  CONSTRAINT [FK_Package_detail_Package] FOREIGN KEY([package_id])
REFERENCES [dbo].[Package] ([package_id])
GO
ALTER TABLE [dbo].[Package_detail] CHECK CONSTRAINT [FK_Package_detail_Package]
GO
ALTER TABLE [dbo].[Package_detail]  WITH CHECK ADD  CONSTRAINT [FK_Package_detail_Package_type] FOREIGN KEY([package_type_id])
REFERENCES [dbo].[Package_type] ([package_type_id])
GO
ALTER TABLE [dbo].[Package_detail] CHECK CONSTRAINT [FK_Package_detail_Package_type]
GO
ALTER TABLE [dbo].[Package_price]  WITH CHECK ADD  CONSTRAINT [FK_Package_price_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Package_price] CHECK CONSTRAINT [FK_Package_price_Branch]
GO
ALTER TABLE [dbo].[Package_price]  WITH CHECK ADD  CONSTRAINT [FK_Package_price_Package_type] FOREIGN KEY([package_type_id])
REFERENCES [dbo].[Package_type] ([package_type_id])
GO
ALTER TABLE [dbo].[Package_price] CHECK CONSTRAINT [FK_Package_price_Package_type]
GO
ALTER TABLE [dbo].[Web_login]  WITH CHECK ADD  CONSTRAINT [FK_Web_login_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Web_login] CHECK CONSTRAINT [FK_Web_login_Employee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Branch"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 43
               Left = 442
               Bottom = 173
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BranchManager_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BranchManager_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Web_login"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 8
               Left = 310
               Bottom = 138
               Right = 480
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 19
               Left = 572
               Bottom = 132
               Right = 742
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'login_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'login_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Delivery"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Package"
            Begin Extent = 
               Top = 0
               Left = 436
               Bottom = 130
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Branch"
            Begin Extent = 
               Top = 166
               Left = 391
               Bottom = 296
               Right = 561
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Package_detail"
            Begin Extent = 
               Top = 35
               Left = 795
               Bottom = 165
               Right = 971
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 195
               Left = 725
               Bottom = 325
               Right = 895
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Package_type"
            Begin Extent = 
               Top = 96
               Left = 1064
               Bottom = 209
               Right = 1260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_detail_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_detail_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_detail_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Package"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Package_detail"
            Begin Extent = 
               Top = 1
               Left = 373
               Bottom = 131
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Package_type"
            Begin Extent = 
               Top = 39
               Left = 764
               Bottom = 152
               Right = 960
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 139
               Left = 369
               Bottom = 269
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Title"
            Begin Extent = 
               Top = 162
               Left = 646
               Bottom = 275
               Right = 816
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2010
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'package_view'
GO
