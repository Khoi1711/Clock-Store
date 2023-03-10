USE [Demo2]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaNV] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [varchar](3) NOT NULL,
	[MaTK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONDATHANG]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONDATHANG](
	[MaDDH] [varchar](25) NOT NULL,
	[MaDH] [varchar](25) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [numeric](10, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [varchar](25) NOT NULL,
	[MaKH] [varchar](25) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayGiao] [datetime] NOT NULL,
	[Tinhtranggiaohang] [bit] NOT NULL,
	[DaThanhToan] [bit] NOT NULL,
	[MaPT] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongHo]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHo](
	[MaDH] [varchar](25) NOT NULL,
	[TenDH] [nvarchar](255) NOT NULL,
	[ImgUrl] [text] NULL,
	[MoTaNgan] [nvarchar](255) NOT NULL,
	[MoTaChiTiet] [nvarchar](max) NOT NULL,
	[SoLuongTon] [int] NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[GiaBan] [numeric](10, 0) NOT NULL,
	[MaHDH] [varchar](25) NOT NULL,
	[MaLoai] [varchar](25) NOT NULL,
	[MaMoTa] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangDongHo]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangDongHo](
	[MaHDH] [varchar](25) NOT NULL,
	[TenHang] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](25) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[GioiTinh] [varchar](3) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[SDT] [int] NOT NULL,
	[DiaChi] [nvarchar](255) NULL,
	[MaTK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLH] [varchar](25) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[SDT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDongHo]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDongHo](
	[MaLoai] [varchar](25) NOT NULL,
	[TenLoai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mota]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mota](
	[MaMoTa] [varchar](25) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ChatLieu] [nvarchar](255) NOT NULL,
	[Dai] [nvarchar](255) NOT NULL,
	[KichThuoc] [nvarchar](255) NOT NULL,
	[Mausac] [nvarchar](50) NOT NULL,
	[Maubanhxe] [nvarchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMoTa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[MaPT] [varchar](5) NOT NULL,
	[TenPT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] NOT NULL,
	[TenDangNhap] [varchar](20) NOT NULL,
	[MatKhau] [varchar](10) NOT NULL,
	[Permison] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 05/03/2023 18:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [varchar](25) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[Img] [text] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([MaNV], [HoTen], [GioiTinh], [MaTK]) VALUES (N'NV01', N'admin', N'Nam', 1)
GO
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (N'DDH01', N'DH01', 5, CAST(5000000 AS Numeric(10, 0)))
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (N'DDH02', N'DH02', 10, CAST(15000000 AS Numeric(10, 0)))
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (N'DDH01', N'KH01', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 1, 0, N'1')
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (N'DDH02', N'KH01', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-13T00:00:00.000' AS DateTime), 1, 1, N'2')
GO
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [MoTaChiTiet], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'DH01', N'RE-AZ004Z', N'http://127.0.0.1:5500/webdemo/assets/img/RE-AZ0004S.jpg', N'The Classic and Simple Style 38 features traditional design features such as a convex dial and domed glass.', N'The Classic and Simple Style 38 features traditional design features such as a convex dial and domed glass. The series has been a consistent best-seller over the last decade in 70 countries and regions around the world. Until now, they featured mostly 40.5-mm case diameters, however these latest models feature a more compact 38-mm case. Global watch trends are shifting from large watches with a bold presence to smaller watches that fit comfortably on the wrist. Furthermore, there has been a particular trend towards simple watches displaying only the time using ageless designs with classical looks. It features both these trends in a size that suits both men and women. This is powered by Orient’s automatic in-house 46-F6 series caliber F6724 movement providing high performance and reliability. The beautiful finishing on the movement can be admired through the see-through case back, and the domed glass and convex dial with simple bar indices create a vintage feel. ', 10, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1000000 AS Numeric(10, 0)), N'1', N'1', N'MT01')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [MoTaChiTiet], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'DH02', N'RE-AZ005Z
', N'http://127.0.0.1:5500/webdemo/assets/img/RE-AZ0005S.jpg', N'Layered Skeleton mới có mặt số hai lớp với các họa tiết kết hợp vải phù hợp. ', N'Mặt số lớp trên đại diện cho chất liệu bên ngoài của bộ đồ được thiết kế với hoa văn xương cá trong khi mặt số lớp dưới có hoa văn paisley với ánh sáng gợi nhớ đến lớp lót cupra. Các loại vải tương phản cung cấp một điểm nhấn độc đáo cho giao diện tổng thể của đồng hồ. Việc mở bán bộ xương trên mặt số có hình paisley, và thiết kế làm việc mở của màn hình dự trữ năng lượng cũng cho thấy hoạt động bên trong của bộ chuyển động cơ học. Cảm giác chiều sâu này kết hợp với các họa tiết dệt tạo nên một cái nhìn bắt mắt. Và những đường cong nhẹ nhàng của các vấu gợi lên lúm đồng tiền của cà vạt hoặc màn vải. Thiết kế mới, phong cách này cung cấp một điểm nhấn hoàn hảo cho bất kỳ dịp kinh doanh nào.', 5, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1500000 AS Numeric(10, 0)), N'2', N'2', N'MT02')
GO
INSERT [dbo].[HangDongHo] ([MaHDH], [TenHang]) VALUES (N'1', N'Simple Clock')
INSERT [dbo].[HangDongHo] ([MaHDH], [TenHang]) VALUES (N'2', N'Layered Skeleton ')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [MaTK]) VALUES (N'KH01', N'khoi', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'Nam', N'thieuanhkhoi.a7@gmail.com', 916706081, N'Quận 1', 2)
GO
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (N'1', N'Cổ điển')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (N'2', N'Thể Thao')
GO
INSERT [dbo].[Mota] ([MaMoTa], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'MT01', N'RA-AC0M01S', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[Mota] ([MaMoTa], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'MT02', N'RE-AZ005Z', N'Thép', N'Dây da ', N'41 mm', N'Đen', N'Trắng')
GO
INSERT [dbo].[PhuongThucThanhToan] ([MaPT], [TenPT]) VALUES (N'1', N'Thanh toán khi nhận hàng')
INSERT [dbo].[PhuongThucThanhToan] ([MaPT], [TenPT]) VALUES (N'2', N'Chuyển khoản')
GO
INSERT [dbo].[TaiKhoan] ([MaTK], [TenDangNhap], [MatKhau], [Permison]) VALUES (1, N'admin', N'admin', N'1')
INSERT [dbo].[TaiKhoan] ([MaTK], [TenDangNhap], [MatKhau], [Permison]) VALUES (2, N'khoi', N'khoi', N'0')
GO
INSERT [dbo].[TinTuc] ([MaTT], [TieuDe], [Img], [NoiDung]) VALUES (N'TT01', N'HÀNG TRĂM PHIÊN BẢN DÂY ĐEO KHÁC NHAU', N'https://cdn3.dhht.vn/wp-content/uploads/2023/02/10-dieu-dac-biet-o-dong-ho-casio-g-shock-rainbow-gia-noi-mua.jpg', N'Dây đeo của đồng hồ Casio G-Shock Rainbow được từ nhiều vật liệu khác nhau, chẳng hạn như cao su hoặc kim loại, tùy thuộc vào phiên bản của đồng hồ. Nhưng đều có điểm chung của chúng là sở hữu nhiều màu sắc cơ bản sẵn để người dùng có thể lựa chọn.')
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [PK_MaTK] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [PK_MaTK]
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [PK_MaDDH_CT] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [PK_MaDDH_CT]
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [PK_MaDH_CT] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DongHo] ([MaDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [PK_MaDH_CT]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [PK_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [PK_MaKH]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [PK_MaPT] FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPT])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [PK_MaPT]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [PK_MaDH] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiDongHo] ([MaLoai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [PK_MaDH]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [PK_MaHDH] FOREIGN KEY([MaHDH])
REFERENCES [dbo].[HangDongHo] ([MaHDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [PK_MaHDH]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [PK_MaMoTa] FOREIGN KEY([MaMoTa])
REFERENCES [dbo].[Mota] ([MaMoTa])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [PK_MaMoTa]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [PK_MaTK_Customers] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [PK_MaTK_Customers]
GO
