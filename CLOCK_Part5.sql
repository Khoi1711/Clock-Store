Create database Sell_Clock_test1
Use Sell_Clock_test1

go
Create table TaiKhoan(
	MaTK integer not null primary key,
	TenDangNhap varchar(20) not null,
	MatKhau varchar(10) not null,
	Permison char(1) not null
)
go
Create table Admin(
	MaNV varchar(20) not null,
	HoTen nvarchar(50) not null,
	GioiTinh varchar(3) not null,
	MaTK integer not null,
	Primary key (MANV),
	Constraint PK_MaTK foreign key (MaTK) references TaiKhoan on update cascade
)
go
Create table KhachHang(
	MaKH varchar(25) not null Primary key,
	TenKH nvarchar(50) not null,
	NgaySinh datetime not null,
	GioiTinh varchar(3) not null,
	Email varchar(50) not null,
	SDT integer not null,
	DiaChi nvarchar(255),
	MaTK integer not null,
	ConStraint PK_MaTK_Customers Foreign key (MaTK) references TaiKhoan on update cascade
)
Create table LoaiDongHo(
	MaLoai integer not null primary key,
	TenLoai nvarchar(255) not null,
	MoTaTL nvarchar(max) not null
)
Create table HangDongHo(
	MaHDH integer not null primary key,
	TenHang nvarchar(200)
)
Create table DongHo(
	MaDH integer not null ,
	TenDH nvarchar(255) not null,
	ImgUrl text,
	MoTaNgan nvarchar(255) not null,
	MoTaChiTiet nvarchar(max) not null,
	SoLuongTon integer ,
	NgayCapNhat datetime not null,
	GiaBan numeric(10) not null,
	MaHDH integer not null,
	MaLoai integer not null,
	MaMoTa integer not null
	Primary Key(MaDH),
	ConStraint PK_MaDH Foreign key (MaLoai) references LoaiDongHo on update cascade,
	ConStraint PK_MaHDH Foreign key (MaHDH) references HangDongHo on update cascade,
	ConStraint PK_MaMoTa Foreign key (MaMoTa) references Mota on update cascade
)
Create table PhuongThucThanhToan(
	MaPT varchar(5) not null primary key,
	TenPT nvarchar(50)
)
Create table Mota(
	MaMoTa integer not null primary key,
	NoiDung nvarchar(max),
	ChatLieu nvarchar(255) not null,
	Dai nvarchar(255) not null,
	KichThuoc nvarchar(255) not null,
	Mausac nvarchar(50) not null,
	Maubanhxe nvarchar(55) not null

)
drop table Mota
Create table DonDatHang(
	MaDDH varchar(25) not null,
	MaKH varchar(25) not null,
	NgayDat datetime not null,
	NgayGiao datetime not null,
	Tinhtranggiaohang bit not null,
	DaThanhToan bit not null,
	MaPT varchar(5) not null,
	Primary key(MaDDH),
	ConStraint PK_MaPT Foreign key (MaPT) references PhuongThucThanhToan on update cascade,
	ConStraint PK_MaKH Foreign key (MaKH) references KhachHang on update cascade,
)
Create table CHITIETDONDATHANG(
	MaDDH varchar(25) not null,
	MaDH integer not null,
	SoLuong int,
	DonGia numeric(10),
	Primary key (MaDDH,MaDH),
	ConStraint PK_MaDDH_CT Foreign key (MaDDH) references DonDatHang on update cascade,
	ConStraint PK_MaDH_CT Foreign key (MaDH) references DongHo on update cascade,
)
Create table TinTuc(
	MaTT integer not null primary key,
	TieuDe nvarchar(100),
	Img text not null,
	NoiDung nvarchar(max) not null 
)
Create table LienHe(
	MaLH integer not null primary key,
	Ten nvarchar(50) not null,
	Email varchar(50) not null,
	SDT integer not null,
)

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

----- DANG KI TAI KHOAN ------
create procedure Dangkitaikhoan

@MaTK	integer,	
@TenDangNhap varchar(20),
@MatKhau 	varchar(10),
@MaKH 	varchar(25),
@TenKH 	varchar(50),
@NgaySinh 	datetime,
@GioiTinh	varchar(3),
@Email	varchar(50),
@SDT		integer,
@DiaChi	nvarchar(255)
as
begin
insert into TaiKhoan values (@MaTK,@TenDangNhap,@MatKhau,0)
insert into KhachHang values(@MaKH,@TenKH,@NgaySinh,@GioiTinh,@Email,@SDT,@DiaChi,@MaTK)
end

--------- SUA MAT KHAU -----------
Create procedure Suamatkhau

@MaTK integer,
@TenDangNhap varchar(20),
@MatKhau	varchar(10)
as
begin
	Update TaiKhoan 
	set MatKhau = @MatKhau
	where MaTK = @MaTK
end

-------- SUA THONG TIN KHACH HANG --------
Create procedure SuaThongTinKhachHang
	
@MaTK	integer,	
@MaKH		varchar(25),
@TenKH		nvarchar(50),
@NgaySinh	datetime,
@GioiTinh	varchar(3),
@Email		varchar(50),
@SDT		integer,
@DiaChi		nvarchar(255)
as
begin
update KhachHang
Set MaKH = @MaKH, TenKH = @TenKH, NgaySinh =@NgaySinh, GioiTinh= @GioiTinh, Email = @Email,SDT = @SDT,DiaChi = @DiaChi
where MaTK = @MaTK
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
	ImgUrl like '%'+@chuoitimkiem+'%' or MoTaNgan like '%'+@chuoitimkiem+'%' or MoTaChiTiet like '%'+@chuoitimkiem+'%'  or
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
	Email  like '%'+@chuoitimkiem+'%' or   SDT  like '%'+@chuoitimkiem+'%' or DiaChi  like '%'+@chuoitimkiem++'%' or MaTK like '%'+@chuoitimkiem++'%' 
end
