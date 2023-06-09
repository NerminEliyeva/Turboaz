USE [TurboazDb]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarMarkId] [int] NULL,
	[CarModelId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserId] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarkId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[MarkName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModelMarkId] [int] NULL,
	[ModelName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](14) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PersonRoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (1, 1, 1, CAST(22000 AS Decimal(18, 0)), N'Images/2018_hyundai_accent_sedan_limited_fq_oem_14_815.jpg', CAST(N'2023-04-04T02:39:02.243' AS DateTime), 1, 1)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (2, 2, 5, CAST(25000 AS Decimal(18, 0)), N'Images/2020_kia_optima_sedan_sx_fq_oem_3_815.jpg', CAST(N'2023-04-04T02:39:02.243' AS DateTime), 1, 1)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (3, 3, 9, CAST(20000 AS Decimal(18, 0)), N'Images/2021_mercedes-benz_gls-class_4dr-suv_amg-gls-63_fq_oem_2_815.jpg', CAST(N'2023-04-04T02:39:02.243' AS DateTime), 1, 1)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (4, 1, 4, CAST(15000 AS Decimal(18, 0)), N'/Images/20230404024018774car1.jpg', CAST(N'2023-04-04T02:40:18.773' AS DateTime), 2, 0)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (5, 3, 10, CAST(22000 AS Decimal(18, 0)), N'/Images/20230404025232590car2.jpg', CAST(N'2023-04-04T02:52:32.590' AS DateTime), 2, 1)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (6, 3, 11, CAST(38000 AS Decimal(18, 0)), N'/Images/20230404030422026car3.jpg', CAST(N'2023-04-04T03:04:22.027' AS DateTime), 2, 0)
INSERT [dbo].[Cars] ([Id], [CarMarkId], [CarModelId], [Price], [ImagePath], [CreatedDate], [CreatedUserId], [Status]) VALUES (7, 5, 13, CAST(38000 AS Decimal(18, 0)), N'/Images/20230404030451146car6.jpg', CAST(N'2023-04-04T03:04:51.147' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (1, CAST(N'2022-12-22T14:48:41.387' AS DateTime), N'Hyundai')
INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (2, CAST(N'2022-12-22T14:48:41.387' AS DateTime), N'Kia')
INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (3, CAST(N'2022-12-22T14:48:41.387' AS DateTime), N'Mercedes Benz')
INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (4, CAST(N'2022-12-22T14:48:41.387' AS DateTime), N'Range Rover')
INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (5, CAST(N'2022-12-22T14:48:41.387' AS DateTime), N'BMW')
INSERT [dbo].[Marks] ([MarkId], [CreatedDate], [MarkName]) VALUES (15, CAST(N'2023-01-31T14:42:21.347' AS DateTime), N'Nissan')
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (1, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 1, N'Sonata')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (2, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 1, N'Accent')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (3, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 1, N'IX35')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (4, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 1, N'H1')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (5, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 2, N'Optima')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (6, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 2, N'K5')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (7, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 2, N'Rio')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (8, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 2, N'Sportage')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (9, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 3, N'GLS')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (10, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 3, N'S Class')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (11, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 3, N'E Class')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (12, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 4, N'Vogue')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (13, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 5, N'530')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (14, CAST(N'2022-12-22T14:54:52.560' AS DateTime), 5, N'X5')
INSERT [dbo].[Models] ([ModelId], [CreatedDate], [ModelMarkId], [ModelName]) VALUES (15, CAST(N'2023-01-08T21:15:37.167' AS DateTime), 2, N'yenikia')
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Name], [Email], [Phone], [Password], [PersonRoleId]) VALUES (1, N'admin', N'admin@gmail.com', N'0513333333', N'admin', 1)
INSERT [dbo].[Person] ([Id], [Name], [Email], [Phone], [Password], [PersonRoleId]) VALUES (2, N'user', N'user@gmail.com', N'0517777777', N'user', 2)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Person__A9D1053471CF0B11]    Script Date: 04/04/2023 03:10:44 ******/
ALTER TABLE [dbo].[Person] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[FilterTable]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FilterTable]
    @Mark int  null,
    @Model int null,
    @MinPrice DECIMAL null,
    @MaxPrice DECIMAL null
AS
BEGIN
    SET NOCOUNT ON;

  select Id,MarkName,ModelName,Price,ImagePath,Cars.CreatedDate from cars 
inner join Marks on Cars.CarMarkId=Marks.MarkId 
inner join Models on Cars.CarModelId=Models.ModelId 
where Cars.Status=1 and 
        (@Mark IS NULL OR CarMarkId = @Mark) AND
        (@Model IS NULL OR CarModelId = @Model) AND
        (@MinPrice IS NULL OR Price >= @MinPrice) AND
        (@MaxPrice IS NULL OR Price <= @MaxPrice)
END
GO
/****** Object:  StoredProcedure [dbo].[GetCarsAppeals]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCarsAppeals]
as
select Id,MarkName,ModelName,Price,ImagePath,Cars.CreatedDate from cars 
inner join Marks on Cars.CarMarkId=Marks.MarkId 
inner join Models on Cars.CarModelId=Models.ModelId 
where Cars.Status=2
GO
/****** Object:  StoredProcedure [dbo].[GetMarks]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetMarks] 
as
select MarkId,MarkName from Marks 
GO
/****** Object:  StoredProcedure [dbo].[GetModels]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetModels] @MarkId int
as
select ModelId,ModelName from Models 
where ModelMarkId=@MarkId
GO
/****** Object:  StoredProcedure [dbo].[InsertCar]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCar]
    @CarMarkId int,
    @CarModelId int,
    @Price int,
    @ImagePath nvarchar(max),
	@CreatedDate datetime,
	@CreatedUserId int,
	@Status int
AS
BEGIN
    INSERT INTO Cars (CarMarkId, CarModelId, Price, ImagePath, CreatedDate, CreatedUserId, [Status])
	VALUES (@CarMarkId, @CarModelId, @Price, @ImagePath, @CreatedDate, @CreatedUserId, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPerson]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPerson]
    @Name nVARCHAR(50),
    @Email nVARCHAR(50),
    @Phone nVARCHAR(14),
	@Password nVARCHAR(50),
    @PersonRoleId int 
AS
BEGIN
    INSERT INTO Person(Name, Email, Phone, Password, PersonRoleId)
	VALUES (@Name, @Email, @Phone, @Password, @PersonRoleId)
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCars]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SelectAllCars]
as
select Id,MarkName,ModelName,Price,ImagePath,Cars.CreatedDate from cars 
inner join Marks on Cars.CarMarkId=Marks.MarkId 
inner join Models on Cars.CarModelId=Models.ModelId 
where Cars.Status=1
GO
/****** Object:  StoredProcedure [dbo].[UpdateCarStatus]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateCarStatus] 
@Id int,@newStatus int
as
begin 
update Cars set Status = @newStatus where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserAndGetRole]    Script Date: 04/04/2023 03:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidateUserAndGetRole]
    @email nVARCHAR(50),
    @Password nVARCHAR(50)
	AS
BEGIN
select person.Id, Name,Email,Phone,password,RoleName from person
inner join role on personRoleId = RoleId
where email = @email and password = @Password
END
GO
