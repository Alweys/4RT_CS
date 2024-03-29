USE [room_management]
GO
/****** Object:  User [room_mng]    Script Date: 17.4.2023. 12:57:33 ******/
CREATE USER [room_mng] FOR LOGIN [room_mng] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [room_mng]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [room_mng]
GO
/****** Object:  Table [dbo].[Ponavljanja]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ponavljanja](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Vrsta] [varchar](50) NULL,
 CONSTRAINT [PK_Ponavljanja] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prava]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prava](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
 CONSTRAINT [PK_Prava] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prostorija]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prostorija](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prostorija] [varchar](50) NULL,
 CONSTRAINT [PK_Prostorija] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacije](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NULL,
	[UserID] [int] NULL,
	[PocetakID] [int] NULL,
	[KrajID] [int] NULL,
	[ProstorijaID] [int] NULL,
	[PonavljanjeID] [int] NULL,
	[Aktivno] [bit] NULL,
 CONSTRAINT [PK_Rezervacije] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrava]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrava](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PravoID] [int] NULL,
	[Aktivno] [bit] NULL,
 CONSTRAINT [PK_UserPrava] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FullName] [varchar](100) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vremena]    Script Date: 17.4.2023. 12:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vremena](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Pocetak] [datetime] NULL,
 CONSTRAINT [PK_Vremena] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ponavljanja] ON 

INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (1, N'Nema')
INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (2, N'Tjedno')
INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (3, N'Mjesečno')
SET IDENTITY_INSERT [dbo].[Ponavljanja] OFF
GO
SET IDENTITY_INSERT [dbo].[Prava] ON 

INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (1, N'Rezerviranje prostorije')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (2, N'Brisanje rezervacija')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (3, N'Pregled rezervacija')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (4, N'Dodavanje korisnika')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (5, N'Brisanje korisnika')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (6, N'Uređivanje korisnika')
SET IDENTITY_INSERT [dbo].[Prava] OFF
GO
SET IDENTITY_INSERT [dbo].[Prostorija] ON 

INSERT [dbo].[Prostorija] ([ID], [Prostorija]) VALUES (1, N'R31')
INSERT [dbo].[Prostorija] ([ID], [Prostorija]) VALUES (2, N'R32')
SET IDENTITY_INSERT [dbo].[Prostorija] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacije] ON 

INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (1, CAST(N'2023-03-20' AS Date), 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (2, CAST(N'2023-03-19' AS Date), 1, 2, 3, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (3, CAST(N'2023-03-20' AS Date), 3, 2, 3, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (4, CAST(N'2023-04-02' AS Date), 3, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (5, CAST(N'2023-04-03' AS Date), 3, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (6, CAST(N'2023-04-03' AS Date), 3, 3, 4, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (7, CAST(N'2023-04-03' AS Date), 3, 4, 5, 1, 1, 0)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (9, CAST(N'2023-04-03' AS Date), 1, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (10, CAST(N'2023-04-04' AS Date), 1, 1, 2, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (11, CAST(N'2023-04-17' AS Date), 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (12, CAST(N'2023-03-19' AS Date), 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (13, CAST(N'2023-04-17' AS Date), 1, 2, 3, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (15, CAST(N'2023-04-17' AS Date), 53, 3, 4, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (16, CAST(N'2023-04-18' AS Date), 53, 1, 2, 1, 2, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (17, CAST(N'2023-04-17' AS Date), 53, 4, 9, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (18, CAST(N'2023-04-19' AS Date), 53, 1, 2, 1, 3, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (19, CAST(N'2023-04-19' AS Date), 1, 2, 5, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (20, CAST(N'2023-04-17' AS Date), 1, 10, 11, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (21, CAST(N'2023-04-17' AS Date), 1, 11, 12, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (24, CAST(N'2023-04-17' AS Date), 22, 7, 2, 2, 1, 0)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (25, CAST(N'2023-04-17' AS Date), 53, 13, 14, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (26, CAST(N'2023-04-17' AS Date), 1, 6, 8, 2, 2, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (27, CAST(N'1900-01-01' AS Date), 60, 6, 8, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (28, CAST(N'2023-04-17' AS Date), 60, 2, 4, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Rezervacije] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPrava] ON 

INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (2, 1, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (3, 1, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (4, 1, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (5, 1, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (6, 1, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (7, 10, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (8, 11, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (9, 13, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (10, 14, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (11, 20, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (12, 22, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (13, 35, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (14, 35, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (15, 37, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (16, 37, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (17, 37, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (18, 38, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (19, 38, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (20, 38, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (21, 38, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (22, 38, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (23, 38, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (24, 39, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (25, 40, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (26, 41, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (27, 42, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (28, 44, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (29, 45, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (30, 45, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (31, 46, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (32, 47, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (33, 48, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (34, 50, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (35, 51, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (36, 52, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (37, 52, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (38, 52, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (39, 53, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (40, 53, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (41, 53, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (42, 53, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (43, 53, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (44, 53, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (45, 54, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (46, 54, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (47, 54, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (48, 55, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (49, 55, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (50, 56, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (51, 56, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (52, 56, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (53, 56, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (54, 56, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (55, 56, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (56, 57, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (57, 60, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (58, 61, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (59, 61, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (60, 61, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (61, 61, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (62, 61, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (63, 61, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (64, 60, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (65, 60, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (66, 60, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (67, 60, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (68, 60, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (75, 69, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (76, 69, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (77, 69, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (78, 69, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (79, 69, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (80, 69, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (81, 70, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (82, 70, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (83, 70, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (84, 70, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (85, 70, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (86, 70, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (87, 71, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (88, 71, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (89, 71, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (90, 71, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (91, 71, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (92, 71, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (93, 64, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (94, 64, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (95, 64, 3, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (96, 64, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (97, 64, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (98, 64, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (99, 75, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (100, 75, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (101, 75, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (102, 77, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (103, 77, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (104, 77, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (105, 77, 4, 0)
GO
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (106, 77, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (107, 77, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (108, 79, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (109, 79, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (110, 79, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (111, 79, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (112, 79, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (113, 79, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (114, 80, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (115, 80, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (116, 80, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (117, 80, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (118, 80, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (119, 80, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (120, 81, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (121, 81, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (122, 81, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (123, 81, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (124, 81, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (125, 81, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (126, 82, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (127, 82, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (128, 82, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (129, 82, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (130, 82, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (131, 82, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (132, 83, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (133, 83, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (134, 83, 2, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (135, 83, 4, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (136, 83, 5, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (137, 83, 6, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (138, 82, 1, 0)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (139, 82, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (140, 82, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (141, 82, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (142, 82, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (143, 82, 6, 0)
SET IDENTITY_INSERT [dbo].[UserPrava] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (1, N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'Administrator', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (2, N'Pota', N'4QrcOUm6Wau+VuBX8g+IPg==', N'Toni Babic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (3, N'test123', N'zAPnR6avu8v4vnZorP6+5Q==', N'Test User', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (4, N'test124', N'rSryV4tNVbX3g4MCQnD4Ug==', N'Test1 User1', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (6, N'jura', N'rtrFcRSGO0MUI5wXOM98xw==', N'jura', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (7, N'jura2', N'rtrFcRSGO0MUI5wXOM98xw==', N'jura2', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (8, N'jura3', N'GlpWPjVcXKPTjYNweqVt8w==', N'jura3', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (10, N'jura4', N'ZaZ/y/lvkBDV6pCyZaLT6g==', N'jura4', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (11, N'jura5', N'l45HvCeulNFXFvi6liq2gQ==', N'jura5', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (13, N'jura6', N'TP6WqJucDbdMmqfNQc90AQ==', N'jura6', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (14, N'jura7', N'LEar6OQmwx5eSV8cI1i7ZQ==', N'jura7', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (15, N'fakeBabic', N'12345', N'NijeBabic', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (16, N'fakebabic1', N'12345', N'NijeBabic1', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (17, N'bavic', N'sdadsad', N'babic', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (18, N'drugi ', N'xjTrzmTzJ1s+vJS4I4TKEQ==', N'babic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (19, N'Fakebabic2', N'HQKDeOEspr2vo7iyG8Wp6g==', N'NijeBabic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (20, N'lolelo', N'4QrcOUm6Wau+VuBX8g+IPg==', N'Lovro Latin', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (21, N'sven', N'tzKyCdvEWlD5WviCX3OfxQ==', N'svenresetar', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (22, N'fran', N'LCDLVVhiZUChcEsf5STqmg==', N'fran', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (24, N'asdds', N'tEfCegDjo0iIGwAwF3AAzQ==', N'nune', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (25, N'patrik', N'oHx5FSPVxj10dOHvG/vcMA==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (26, N'asdasd', N'v/FJoLh/Ww4A2d02Tp3aoA==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (27, N'adtrik', N'Sh29USTS/wZ0DFXqPsifIg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (29, N'asdad', N'BW8y7lz0lARgfjaL2NPyrw==', N'dlfjhjgdd', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (31, N'fffff', N'Ed268zhq6h8pdO7phFQhUg==', N'giadjflskdf', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (33, N'adsda', N'tbA3p4UiZxuJosGyHZuAxg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (35, N'korisnik123', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Korisnik', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (37, N'sdsdsa', N'tbA3p4UiZxuJosGyHZuAxg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (38, N'admin2', N'yEJY6cOQWaiat32Ebdq5CQ==', N'Lovro', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (39, N'K1', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Jedan', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (40, N'guest', N'CE4DQ6BIb/BVMN9scFyLtA==', N'Guest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (41, N'K2', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Dva', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (42, N'K3', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Tri', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (43, N'bot', N'+fym5ZQZ8xe0ulRDnEUGag==', N'bot
', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (44, N'K4', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Cetiri', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (45, N'K5', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Pet', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (46, N'K6', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Sest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (47, N'K7', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Sedam', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (48, N'K8', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Osam', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (49, N'paco', N'MRAgZmpXdsV9JlrOaC3EbQ==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (50, N'K9', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Devet', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (51, N'bot2', N'nlf5SXD2xMqnkskJWfVmjA==', N'bot2', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (52, N'lovro2', N'7tN09tgopDDvI2RIQ9LsXQ==', N'lovro2', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (53, N'lukas', N'fAhLdzRTRHqGua8WwmJU4g==', N'Lukas', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (54, N'K10', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Deset', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (55, N'K11', N'1B2M2Y8AsgTpgAmY7PhCfg==', N'Korisnik Jedanaest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (56, N'Bot4', N'76DldPJdFe7MJizEYdqJZA==', N'Bot4', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (57, N'K12', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Dvanaest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (58, N'Stefan', N'dc647eb65e6711e155375218212b3964', N'Stefan', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (60, N'Stefan1', N'21232f297a57a5a743894a0e4a801fc3', N'Stefan', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (61, N'Bot5', N'M19LqsKn8J8R/M54gPUm5w==', N'Bot5', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (62, N'testic1212', N'ISMvKXpXpadDiUoOSoAfww==', N'TestIme', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (63, N'testic123123', N'ISMvKXpXpadDiUoOSoAfww==', N'test', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (64, N'FAkeBabic78', N'e10adc3949ba59abbe56e057f20f883e', N'vqqrc', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (65, N'bwvw', N'3830bf15a3270274304b07e1c301c7b3', N'qetv', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (66, N'etbw', N'fac42c3971aa09e8725c7e9fad59be0f', N'qev', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (67, N'novi', N'ICy5YqxZB1uWSwcVLSNLcA==', N'Novi Novcat', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (68, N'test123111', N'CY9rzUYh03PK3k6DJie09g==', N'Test Korisnik', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (69, N'pota111111', N'CY9rzUYh03PK3k6DJie09g==', N'korsuni aaba', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (70, N'Stefan2', N'21232f297a57a5a743894a0e4a801fc3', N'rbtwtvwv', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (71, N'Stefan3', N'21232f297a57a5a743894a0e4a801fc3', N'rwwrzbwrezn', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (72, N'test21312313', N'A3HvzPCUAovTSL74c7XOkA==', N'adasda', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (73, N'test5555', N'ISMvKXpXpadDiUoOSoAfww==', N'test', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (74, N'test4444', N'ISMvKXpXpadDiUoOSoAfww==', N'test', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (75, N'Stefan4', N'21232f297a57a5a743894a0e4a801fc3', N'vt4gqevt4', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (76, N'test12322', N'ISMvKXpXpadDiUoOSoAfww==', N'test', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (77, N'fran10', N'TtPT6dgdsXD0ClN0704i3A==', N'fran10', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (79, N'franpetkovic', N'XhNBiBuB6Odpt2KT/Abfmw==', N'franpetkovic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (80, N'jurapura', N'7wl9BUDEyDMWFiwbVvgy5w==', N'jurapura', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (81, N'adfadsf', N's69Am7hCMYfHXmx/W2g5CA==', N'f', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (82, N'a3fasdf', N'9r+F67+0cwNcjovvk9LndQ==', N'3adf', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (83, N'aifaifeji', N'PqYs0Fj7llRnDFARdlThgQ==', N'jgsrjj', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (84, N'dado', N'ICy5YqxZB1uWSwcVLSNLcA==', N'david t', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vremena] ON 

INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (1, CAST(N'2023-03-27T07:20:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (2, CAST(N'2023-03-27T08:10:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (3, CAST(N'2023-03-27T09:00:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (4, CAST(N'2023-03-27T10:00:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (5, CAST(N'2023-03-27T10:50:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (6, CAST(N'2023-03-27T11:40:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (7, CAST(N'2023-03-27T12:25:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (8, CAST(N'2023-03-27T13:15:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (9, CAST(N'2023-03-27T14:05:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (10, CAST(N'2023-03-27T14:55:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (11, CAST(N'2023-03-27T15:55:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (12, CAST(N'2023-03-27T16:45:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (13, CAST(N'2023-03-27T17:35:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (14, CAST(N'2023-03-27T18:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vremena] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Username]    Script Date: 17.4.2023. 12:57:33 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Ponavljanja] FOREIGN KEY([PonavljanjeID])
REFERENCES [dbo].[Ponavljanja] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Ponavljanja]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Prostorija] FOREIGN KEY([ProstorijaID])
REFERENCES [dbo].[Prostorija] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Prostorija]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Users]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Vremena] FOREIGN KEY([PocetakID])
REFERENCES [dbo].[Vremena] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Vremena]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Vremena1] FOREIGN KEY([KrajID])
REFERENCES [dbo].[Vremena] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Vremena1]
GO
ALTER TABLE [dbo].[UserPrava]  WITH CHECK ADD  CONSTRAINT [FK_UserPrava_Prava] FOREIGN KEY([PravoID])
REFERENCES [dbo].[Prava] ([ID])
GO
ALTER TABLE [dbo].[UserPrava] CHECK CONSTRAINT [FK_UserPrava_Prava]
GO
ALTER TABLE [dbo].[UserPrava]  WITH CHECK ADD  CONSTRAINT [FK_UserPrava_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserPrava] CHECK CONSTRAINT [FK_UserPrava_Users]
GO
