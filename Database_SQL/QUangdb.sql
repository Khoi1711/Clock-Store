Create database Demo1
Use Demo1
go
Create table TaiKhoan( 
	TenDangNhap varchar(20) not null unique ,
	MatKhau varchar(30) not null,
	Permison bit not null
	Primary key (TenDangNhap)
)	
go
Create table Admin(
	MaNV INT IDENTITY(1,1),
	HoTen nvarchar(50) not null,
	GioiTinh varchar(3),
	TenDangNhap varchar(20) ,
	Primary key (MANV),
	Constraint PK_MaTK foreign key (TenDangNhap) references TaiKhoan on update cascade
)
go
Create table KhachHang(
	MaKH INT IDENTITY(1,1) Primary key,
	TenKH nvarchar(50) not null,
	NgaySinh datetime ,
	GioiTinh varchar(3),
	Email varchar(100) unique,
	SDT varchar(50) ,
	DiaChi nvarchar(200),
	TenDangNhap varchar(20) ,
	ConStraint PK_MaTK_Customers Foreign key (TenDangNhap) references TaiKhoan on update cascade
)
go
Create table LoaiDongHo(
	MaLoai INT IDENTITY(1,1) primary key,
	TenLoai nvarchar(20) not null
)
Create table HangDongHo(
	MaHDH INT IDENTITY(1,1) primary key,
	TenHang nvarchar(20) not null
)
Create table PhuongThucThanhToan(
	MaPT INT IDENTITY(1,1) primary key,
	TenPT nvarchar(50) not null
)
Create table TinTuc(
	MaTT INT IDENTITY(1,1) primary key,
	TieuDe nvarchar(100),
	Img text ,
	NoiDung nvarchar(max) 
)
Create table LienHe(
	MaLH varchar(10) not null primary key,
	Ten nvarchar(50) not null,
	Email varchar(50) ,
	SDT varchar(50) ,
)
Create table DonDatHang(
	MaDDH INT IDENTITY(1,1),
	MaKH INT,
	NgayDat datetime ,
	NgayGiao datetime ,
	Tinhtranggiaohang bit ,
	DaThanhToan bit ,
	MaPT INT  ,
	Primary key(MaDDH),
	ConStraint PK_MaPT Foreign key (MaPT) references PhuongThucThanhToan on update cascade,
	ConStraint PK_MaKH Foreign key (MaKH) references KhachHang on update cascade,
)
Create table DongHo(
	MaDH INT IDENTITY(1,1) ,
	TenDH nvarchar(255) not null,
	ImgUrl text,
	MoTaNgan nvarchar(255) ,
	SoLuongTon integer  ,
	NgayCapNhat datetime ,
	GiaBan numeric(10) check (GiaBan>0) ,
	MaHDH INT  ,
	MaLoai INT  ,
	NoiDung nvarchar(max) not null,
	ChatLieu nvarchar(25) ,
	Dai nvarchar(15) ,
	KichThuoc nvarchar(25) ,
	Mausac nvarchar(25) ,
	Maubanhxe nvarchar(25)
	Primary Key(MaDH),
	ConStraint PK_MaDH Foreign key (MaLoai) references LoaiDongHo on update cascade,
	ConStraint PK_MaHDH Foreign key (MaHDH) references HangDongHo on update cascade,
)
Create table CHITIETDONDATHANG(
	MaDDH INT ,
	MaDH INT ,
	SoLuong int check (SoLuong >0),
	DonGia numeric(10) Check (DonGia >=0),
	Primary key (MaDDH,MaDH),
	ConStraint PK_MaDDH_CT Foreign key (MaDDH) references DonDatHang on update cascade,
	ConStraint PK_MaDH_CT Foreign key (MaDH) references DongHo on update cascade,
)
						----- BANG TAI KHOAN -----
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'admin', N'admin', 1)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'khoi', N'khoi', 0)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'lan', N'lan', 1)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'quang', N'123', 0)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'tuan', N'123', 0)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'truong', N'123', 0)
INSERT [TaiKhoan] ([TenDangNhap], [MatKhau], [Permison]) VALUES (N'khoixomchua', N'khoixom', 1)

INSERT [PhuongThucThanhToan] ([TenPT]) VALUES ( N'Thanh toán khi nhận hàng')
INSERT [PhuongThucThanhToan] ([TenPT]) VALUES ( N'Chuyển khoản')

INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES (N'khoi', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'Nam', N'thieuanhkhoi.a7@gmail.com', N'916706081', N'Quận 1', N'khoi')
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES (N'quang', CAST(N'2003-02-02T00:00:00.000' AS DateTime), N'Nam', N'quangngo7821@gmail.com', N'123456789', N'Quận 2', N'quang')
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES (N'tuan', CAST(N'2001-04-03T00:00:00.000' AS DateTime), N'Nam', N'luutuan52002@gmail.com ', N'456789123', N'Quận 3', N'tuan')
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES (N'truong', CAST(N'2004-05-01T00:00:00.000' AS DateTime), N'Nam', N'tuthan2100@gmail.com ', N'123456770', N'Quận 4', N'truong')

INSERT [dbo].[HangDongHo] ( [TenHang]) VALUES ( N'ORIENT')


INSERT [dbo].[LoaiDongHo] ([TenLoai]) VALUES ( N'Cổ điển')
INSERT [dbo].[LoaiDongHo] ([TenLoai]) VALUES ( N'Thể Thao')
INSERT [dbo].[LoaiDongHo] ([TenLoai]) VALUES ( N'Đương đại')

INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'RE-AZ0004Z', N'http://127.0.0.1:5500/webdemo/assets/img/RE-AZ0004S.jpg', N'The Classic and Simple Style 38 features traditional design features such as a convex dial and domed glass.', 10, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1000000 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'RA-AS0103A', N'https://mediaserver.goepson.com/ImConvServlet/imconv/15af40b789c9a6e63ee61d5fddf9bde20ac84422/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AS0103A', N'Đồng hồ cơ khí cổ điển, dây da - 41.5mm ', 5, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1500000 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'RA-AC0M01S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/4b45b21d888ba4afcf31906bc28b3bc4b858b3ff/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M01S', N'Đồng hồ cơ khí cổ điển, dây da - 38.4mm', 2, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(500000 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'RA-AC0M02B', N'https://mediaserver.goepson.com/ImConvServlet/imconv/707cb1c021998989c0d423c1c928f50fc175bbce/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M02B', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm', 3, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(2000000 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'RA-AC0M03S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/df53c3869b8741eb1bf2c2dfa349b98a127d87c7/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M03S', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm', 2, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(3000000 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'RA-NB0104S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/2da01b3eb1cdc80f52feab26d998e00aeb38422a/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-NB0104S', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm', 11, CAST(N'2023-03-11T00:00:00.000' AS DateTime), CAST(3500000 AS Numeric(10, 0)), 1, 3, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'RA-NB0105S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/d98cbec2015c9dd23a5ca71cfa23b258c2532e26/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-NB0105S', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm', 6, CAST(N'2023-03-12T00:00:00.000' AS DateTime), CAST(4000000 AS Numeric(10, 0)), 1, 3,N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'RA-AC0K05G', N'https://mediaserver.goepson.com/ImConvServlet/imconv/f7b24598f7bacbc798163d0b935db33a9aede468/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0K05G', N'Đồng hồ thể thao cơ khí, dây da - Giới hạn 43,4mm', 0, CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(1300000 AS Numeric(10, 0)), 1, 2, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ( [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (N'RA-AA0E06B', N'https://mediaserver.goepson.com/ImConvServlet/imconv/a9717caeca496d89ba9aea43fec16c6750469e91/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AA0E06B', N'Đồng hồ thể thao cơ khí, dây da - 43.5mm', 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(2000010 AS Numeric(10, 0)), 1, 2, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
go


INSERT [dbo].[Admin] ( [HoTen], [GioiTinh], [TenDangNhap]) VALUES ( N'admin', N'nam', N'admin')
INSERT [dbo].[Admin] ([HoTen], [GioiTinh], [TenDangNhap]) VALUES ( N'Lan xom chua', N'nu', N'lan')
INSERT [dbo].[Admin] ([HoTen], [GioiTinh], [TenDangNhap]) VALUES ( N'khoi xom chua', N'nam', N'khoixomchua')

INSERT [dbo].[TinTuc] ( [TieuDe], [Img], [NoiDung]) VALUES (N'HÀNG TRĂM PHIÊN BẢN DÂY ĐEO KHÁC NHAU', N'https://cdn3.dhht.vn/wp-content/uploads/2023/02/10-dieu-dac-biet-o-dong-ho-casio-g-shock-rainbow-gia-noi-mua.jpg', N'Dây đeo của đồng hồ Casio G-Shock Rainbow được từ nhiều vật liệu khác nhau, chẳng hạn như cao su hoặc kim loại, tùy thuộc vào phiên bản của đồng hồ. Nhưng đều có điểm chung của chúng là sở hữu nhiều màu sắc cơ bản sẵn để người dùng có thể lựa chọn.')



/*
GO
INSERT [TaiKhoan] ( [TenDangNhap], [MatKhau], [Permison]) VALUES ( N'admin', N'admin',1)
INSERT [TaiKhoan] ( [TenDangNhap], [MatKhau], [Permison]) VALUES ( N'khoi', N'khoi',0)
INSERT [TaiKhoan] ( [TenDangNhap], [MatKhau], [Permison]) VALUES ( N'quang', N'123',0)
INSERT [TaiKhoan] ( [TenDangNhap], [MatKhau], [Permison]) VALUES ( N'tuan', N'123',0)
INSERT [TaiKhoan] ( [TenDangNhap], [MatKhau], [Permison]) VALUES ( N'truong', N'123',0);
GO
						------ BANG ADMIN -------
GO
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi]) VALUES (N'khoi', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'Nam', N'thieuanhkhoi.a7@gmail.com', 916706081, N'Quận 1', 2)
GO
INSERT [dbo].[PhuongThucThanhToan] ( [TenPT]) VALUES ( N'Thanh toán khi nhận hàng')
INSERT [dbo].[PhuongThucThanhToan] ( [TenPT]) VALUES (N'Chuyển khoản')
GO
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (N'DDH01', N'KH01', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 1, 0, N'1')
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (N'DDH02', N'KH01', CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-13T00:00:00.000' AS DateTime), 1, 1, N'2')
GO
INSERT [dbo].[LoaiDongHo] ( [TenLoai]) VALUES ( N'Cổ điển')
INSERT [dbo].[LoaiDongHo] ( [TenLoai]) VALUES ( N'Thể Thao')
INSERT [dbo].[LoaiDongHo] ([TenLoai]) VALUES ( N'Đương đại')
GO
INSERT [dbo].[HangDongHo] ( [TenHang]) VALUES ( N'ORIENT')
GO
INSERT [dbo].[Mota] ( [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[Mota] ([NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Chức năng Mặt trời & Mặt trăng minh họa sự thay đổi của ngày sang đêm trên đĩa quay 24 giờ và bộ xương bán tạo ra phong cách cổ điển. Với vỏ được làm thon gọn, pha lê hình vòm gợi lên phong cách cổ điển và sự ấm áp, và mặt số kết hợp xà cừ tuyệt đẹp với các chỉ số thanh, nó đã được tái sinh với kiểu dáng mới đơn giản.', N'Thép', N'Dây da ', N'41.5 mm', N'Trắng ', N'Xanh dương')
INSERT [dbo].[Mota] ([NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4 mm', N'Vàng', N'Trắng')
INSERT [dbo].[Mota] ([NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4 mm', N'Trắng ', N'Đen')
INSERT [dbo].[Mota] ( [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4 mm', N'Trắng ', N'Trắng')
INSERT [dbo].[Mota] ( [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Bổ sung cho thiết kế tinh xảo của nó là một chỉ số thanh thẳng kéo dài và một giờ đánh dấu kim cương giả trên mặt số. Mô hình này hỗ trợ thời gian chạy liên tục 40 giờ và khả năng chống nước là 100 mét.', N'Thép', N'Dây da', N'32.0 mm', N'Vàng ', N'Trắng')
INSERT [dbo].[Mota] ( [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Bổ sung cho thiết kế tinh xảo của nó là một chỉ số thanh thẳng kéo dài và một giờ đánh dấu kim cương giả trên mặt số. Mô hình này hỗ trợ thời gian chạy liên tục 40 giờ và khả năng chống nước là 100 mét.', N'Thép ', N'Dây da', N'32.0 mm', N'Vàng ', N'Trắng')
INSERT [dbo].[Mota] ( [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Các mô hình thiết kế thợ lặn mang tính biểu tượng của ORIENT tự hào có hơn năm mươi năm lịch sử kể từ khi được giới thiệu vào năm 1964. Đồng hồ thiết kế thợ lặn mới này thể hiện những tính năng chức năng tốt nhất của ORIENT, chẳng hạn như vỏ có đường kính 43,4mm và tinh thể sapphire. Núm vặn xuống được đặt ở vị trí 4 giờ để phù hợp với vỏ lớn được thiết kế để tạo sự thoải mái, dễ đeo và thao tác dễ dàng hơn trên cổ tay. Với khả năng chống nước 20 bar, các mẫu thiết kế thợ lặn mới lý tưởng cho các môn thể thao dưới nước, lặn với ống thở hoặc lặn với da. Mặt số chuyển màu vàng tạo nên mẫu phiên bản giới hạn kỷ niệm 70 năm chỉ 2,500 chiếc. Thiết kế chuyển màu vàng của mặt số tạo cảm giác cổ điển gợi nhớ đến mẫu Jaguar Focus, được ORIENT ra mắt vào những năm 1970, tiếp tục trở thành một trong những chiếc đồng hồ phổ biến nhất của thương hiệu.', N'Thép', N'Dây da', N'43.4 mm', N'Nâu', N'Đen')
INSERT [dbo].[Mota] ([NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES ( N'Neo Classic Sports là mẫu xe mới nhất tuân theo các thiết kế đặc biệt của Orient từ những năm 1960 và 1970, nhưng với sự thay đổi hiện đại về chuyển động và khả năng chống nước. Nó tăng cường khả năng chống nước lên 20 bar, và chuyển động tự động F6922 cỡ nòng trong nhà cung cấp độ chính xác ổn định. Tận hưởng thiết kế retro phong phú cũng như chất lượng và hiệu suất cao đương đại, Neo Classic Sports là một thế hệ đồng hồ mang tính biểu tượng mới tự hào với tất cả các đặc điểm của Orient.', N'Thép', N'Dây da', N'43.5 mm ', N'Nâu trắng', N'Đen')
GO
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'RE-AZ004Z', N'http://127.0.0.1:5500/webdemo/assets/img/RE-AZ0004S.jpg', N'The Classic and Simple Style 38 features traditional design features such as a convex dial and domed glass.', 10, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1000000 AS Numeric(10, 0)), N'1', N'1', 1)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES ( N'RA-AS0103A', N'https://mediaserver.goepson.com/ImConvServlet/imconv/15af40b789c9a6e63ee61d5fddf9bde20ac84422/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AS0103A', N'Đồng hồ cơ khí cổ điển, dây da - 41.5mm ', 5, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(1500000 AS Numeric(10, 0)), 1, 1, 2)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'RA-AC0M01S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/4b45b21d888ba4afcf31906bc28b3bc4b858b3ff/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M01S', N'Đồng hồ cơ khí cổ điển, dây da - 38.4mm',  2, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(500000 AS Numeric(10, 0)), 1, 1, 3)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'RA-AC0M02B', N'https://mediaserver.goepson.com/ImConvServlet/imconv/707cb1c021998989c0d423c1c928f50fc175bbce/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M02B', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm',  3, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(2000000 AS Numeric(10, 0)), 1, 1, 4)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES ( N'RA-AC0M03S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/df53c3869b8741eb1bf2c2dfa349b98a127d87c7/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0M03S', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm',  2, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(3000000 AS Numeric(10, 0)), 1, 1, 5)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES (N'RA-NB0104S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/2da01b3eb1cdc80f52feab26d998e00aeb38422a/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-NB0104S', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm',  11, CAST(N'2023-03-11T00:00:00.000' AS DateTime), CAST(3500000 AS Numeric(10, 0)), 1, 3, 6)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES ( N'RA-NB0105S', N'https://mediaserver.goepson.com/ImConvServlet/imconv/d98cbec2015c9dd23a5ca71cfa23b258c2532e26/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-NB0105S', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm',  6, CAST(N'2023-03-12T00:00:00.000' AS DateTime), CAST(4000000 AS Numeric(10, 0)), 1, 3, 7)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES ( N'RA-AC0K05G', N'https://mediaserver.goepson.com/ImConvServlet/imconv/f7b24598f7bacbc798163d0b935db33a9aede468/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AC0K05G', N'Đồng hồ thể thao cơ khí, dây da - Giới hạn 43,4mm',  0, CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(1300000 AS Numeric(10, 0)), 1, 2, 8)
INSERT [dbo].[DongHo] ([TenDH], [ImgUrl], [MoTaNgan],  [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [MaMoTa]) VALUES ( N'RA-AA0E06B', N'https://mediaserver.goepson.com/ImConvServlet/imconv/a9717caeca496d89ba9aea43fec16c6750469e91/1200Wx1200H?use=banner&hybrisId=B2C&assetDescr=RA-AA0E06B', N'Đồng hồ thể thao cơ khí, dây da - 43.5mm',  1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(2000010 AS Numeric(10, 0)), 1, 2, 9)
GO

delete from DongHo

INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (1, 1, 5, CAST(5000000 AS Numeric(10, 0)))
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (2, 2, 10, CAST(15000000 AS Numeric(10, 0)))
GO
INSERT [dbo].[TinTuc] ([TieuDe], [Img], [NoiDung]) VALUES (N'HÀNG TRĂM PHIÊN BẢN DÂY ĐEO KHÁC NHAU', N'https://cdn3.dhht.vn/wp-content/uploads/2023/02/10-dieu-dac-biet-o-dong-ho-casio-g-shock-rainbow-gia-noi-mua.jpg', N'Dây đeo của đồng hồ Casio G-Shock Rainbow được từ nhiều vật liệu khác nhau, chẳng hạn như cao su hoặc kim loại, tùy thuộc vào phiên bản của đồng hồ. Nhưng đều có điểm chung của chúng là sở hữu nhiều màu sắc cơ bản sẵn để người dùng có thể lựa chọn.')
GO

INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES ( N'khoi', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'Nam', N'thieuanhkhoi.a7@gmail.com', 916706081, N'Quận 1', N'khoi')
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES ( N'quang', CAST(N'2003-02-02T00:00:00.000' AS DateTime), N'Nam', N'quangngo7821@gmail.com', 123456789, N'Quận 2', N'quang')
INSERT [dbo].[KhachHang] ([TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES ( N'tuan', CAST(N'2001-04-03T00:00:00.000' AS DateTime), N'Nam', N'luutuan52002@gmail.com ', 456789123, N'Quận 3',N'tuan')
INSERT [dbo].[KhachHang] ( [TenKH], [NgaySinh], [GioiTinh], [Email], [SDT], [DiaChi], [TenDangNhap]) VALUES ( N'truong', CAST(N'2004-05-01T00:00:00.000' AS DateTime), N'Nam', N'tuthan2100@gmail.com ', 123456770, N'Quận 4', N'truong')
GO

INSERT [dbo].[DonDatHang] ([MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (1, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-12T00:00:00.000' AS DateTime), 1, 0, N'1')
INSERT [dbo].[DonDatHang] ([MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (2,CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(N'2023-03-13T00:00:00.000' AS DateTime), 1, 1, N'2')
INSERT [dbo].[DonDatHang] ( [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (2,CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(N'2023-03-24T00:00:00.000' AS DateTime), 1, 1, N'2')
INSERT [dbo].[DonDatHang] ([MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (3, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2023-03-15T00:00:00.000' AS DateTime), 0, 0, N'1')
INSERT [dbo].[DonDatHang] ( [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan], [MaPT]) VALUES (4, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime), 1, 1, N'2')
GO

INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (1, 1, 5, CAST(5000000 AS Numeric(10, 0)))
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (2, 2, 10, CAST(15000000 AS Numeric(10, 0)))
GO


			----- BANG TAI KHOAN -----
Insert into TaiKhoan(MaTK,TenDangNhap,MatKhau,Permison)values('TK01','admin',123,1)
Insert into TaiKhoan(MaTK,TenDangNhap,MatKhau,Permison)values('TK02','khoi',123,0)

			------ BANG ADMIN -------
Insert into Admin(MaTK,MaNV,HoTen,GioiTinh) values ('TK01','NV01','admin','M')

			------ BANG KHACH HANG -----
SET DATEFORMAT dmy; 
Insert into KhachHang(MaKH,TenKH,GioiTinh,NgaySinh,DiaChi,Email,SDT,MaTK) values ('KH01','khoi','M','17/11/2002','Binh Duong','thieuanhkhoi.a7@gmail.com',123456789,'TK02')

			------ BANG DONG HO ------
SET DATEFORMAT dmy; 
--Insert into DongHo(MASP,MaLoai,Name,Price,ImgUrl,Short_description,Details_desciption,DateUpdate) values 

			------ BANG TIN TUC ------
--Insert into TinTuc(MaTT,TieuDe,Img,NoiDung) values
			------ BANG TYPE-CLOCKS ------
--Insert into Type_Clock(MaLoai,Name_Clock,Sex) value

			------- BANG DON DAT HANG ------
--Insert into DonDatHang(MaDDH,MAKH,NgayDat,NgayGiao,Tinhtranghang) values

			------ CHI TIET DON DAT HANG -----
--Insert into CHITIETDONDATHANG(MaDDH,MaKH,Username,MaSP,SoLuong,DonGia) values
*/
----- DANG KI TAI KHOAN ------
create procedure Dangkitaikhoan
	
@TenDangNhap varchar(20),
@MatKhau 	varchar(10),
@Permison bit,
@MaKH 	int ,
@TenKH 	nvarchar(50),
@NgaySinh 	datetime,
@GioiTinh	varchar(3),
@Email	varchar(50),
@SDT		integer,
@DiaChi	nvarchar(255)
as
begin
insert into TaiKhoan values (@TenDangNhap,@MatKhau,@Permison)
insert into KhachHang values(@TenKH,@NgaySinh,@GioiTinh,@Email,@SDT,@DiaChi,@TenDangNhap)
end

--------- SUA MAT KHAU -----------
Create procedure Suamatkhau

@TenDangNhap varchar(20),
@MatKhau	varchar(10)
as
begin
	Update TaiKhoan 
	set MatKhau = @MatKhau
	where TenDangNhap = @TenDangNhap
end

-------- SUA THONG TIN KHACH HANG --------
Create procedure SuaThongTinKhachHang
@TenDangNhap varchar(20),	
@MaKH		INT ,
@TenKH		nvarchar(50),
@NgaySinh	datetime,
@GioiTinh	varchar(3),
@Email		varchar(50),
@SDT		integer,
@DiaChi		nvarchar(255)
as
begin
update KhachHang
Set TenKH = @TenKH, NgaySinh =@NgaySinh, GioiTinh= @GioiTinh, Email = @Email,SDT = @SDT,DiaChi = @DiaChi
where TenDangNhap = @TenDangNhap
end


------ TIM KIEM DON DAT HANG ------
create procedure TimKiemDonDatHang
	@chuoitimkiem nvarchar(50)
as
begin
	select * 
	from DonDatHang
	Where MaDDH like '%'+@chuoitimkiem+'%' or MaKH like '%'+@chuoitimkiem+'%'  or
	NgayDat like '%'+@chuoitimkiem+'%' or NgayGiao like '%'+@chuoitimkiem+'%' or Tinhtranggiaohang like '%'+@chuoitimkiem+'%' or DaThanhToan like '%'+@chuoitimkiem+'%' 
	or MaPT like '%'+@chuoitimkiem+'%'

end


----- TIM KIEM DongHo ----------
Create procedure TimKiemDongHo
	@chuoitimkiem nvarchar(50)
as
begin
	select * 
	from DongHo
	where MaDH like '%'+@chuoitimkiem+'%'  or TenDH like '%'+@chuoitimkiem+'%'  or
	ImgUrl like '%'+@chuoitimkiem+'%' or MoTaNgan like '%'+@chuoitimkiem+'%'   or
	SoLuongTon like '%'+@chuoitimkiem+'%'  or NgayCapNhat like '%'+@chuoitimkiem+'%' or
	GiaBan like '%'+@chuoitimkiem+'%' or MaHDH like '%'+@chuoitimkiem+'%' or MaLoai like '%'+@chuoitimkiem+'%'
end 


------ TIM KIEM THONG TIN KHACH HANG --------
Create procedure TimKiemThongTinKhachHang
	@chuoitimkiem	nvarchar(50)
as
begin
	select *
	from KhachHang
	where MaKH like '%'+@chuoitimkiem+'%' or TenKH  like '%'+@chuoitimkiem+'%' or NgaySinh  like '%'+@chuoitimkiem+'%' or GioiTinh  like '%'+@chuoitimkiem+'%' or 
	Email  like '%'+@chuoitimkiem+'%' or   SDT  like '%'+@chuoitimkiem+'%' or DiaChi  like '%'+@chuoitimkiem++'%' or TenDangNhap like '%'+@chuoitimkiem++'%' 
end
