﻿create database ThucTap;

use ThucTap

create table Ao(
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	IdChatVai uniqueidentifier,
	IdLoaiAo uniqueidentifier,
	CoAo nvarchar(max),
	Tui nvarchar(max),
	TayAo nvarchar(max),
	IdFormAo uniqueidentifier,
	IdHang uniqueidentifier,
	MoTa nvarchar(255) null,
	NgayNhap date,
	GiaNhap decimal,
	GiaBan decimal,
	TrangThai int null
)

create table LoaiAo (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TenURL nvarchar(max) null,
	TrangThai int null
)

create table FormAo (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table Hang (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	DiaChi nvarchar(max) default null,
	TrangThai int null
)


create table Size (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table MauSac (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	TrangThai int null
)

create table ChatVai (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) default null,
	ThongTin nvarchar(max) null,
	IdHuongDanBaoQuan uniqueidentifier,
	TrangThai int null
)

create table HuongDanBaoQuan (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(max) null,
	ChiTiet nvarchar(max) null,
	TrangThai int null
)
	
create table AoChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdSize uniqueidentifier,
	IdMauSac uniqueidentifier,
	IdAo uniqueidentifier,
	SoLuongTon int,
	SoLuongBan int,
	TrangThai int null
)

create table Anh (
	Id uniqueidentifier primary key default newid(),
	TenURL nvarchar(max) null,
	IdAo uniqueidentifier,
	TrangThai int null
)

create table DanhGia (
	Id uniqueidentifier primary key default newid(),
	IdAoChiTiet uniqueidentifier,
	IdNguoiDung uniqueidentifier null,
	DanhGiaBinhLuan nvarchar(max) null,
	UrlVideo nvarchar(max) null,
	DanhGiaSao int null,
	NgayDanhGia DATETIME null,
	TrangThai int null
)
create table ChuongTrinhGiamGiaSanPham (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	PhanTramGiam int,
	NgayBatDau date,
	NgayKetThuc date,
	TrangThai int null
)

create table ChuongTrinhGiamGiaHoaDon (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	PhanTramGiam int,
	SoLuongSanPham int null,
	SoTienHoaDon decimal null,
	NgayBatDau date,
	NgayKetThuc date,
	TrangThai int null
)

create table ChuongTrinhGiamGiaChiTietSanPham (
	ID uniqueidentifier primary key default newid(),
	IdPggSp uniqueidentifier,
	IdSanPham uniqueidentifier,
	SoTienDaGIam decimal,
	TrangThai int null
)

create table ChuongTrinhGiamGiaChiTietHoaDon (
	Id uniqueidentifier primary key default newid(),
	IdPggHd uniqueidentifier,
	IdHD uniqueidentifier,
	SoTienDaGIam decimal,
	TrangThai int null
)

create table Users (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	Ten nvarchar(50) default null,
	NgaySinh date null,
	GioiTinh int null,
	DiaChi nvarchar(255) null,
	ThanhPho nvarchar(255) null,
	QuocGia nvarchar(255) null,
	SDT nvarchar(15) null,
	Email nvarchar(255) null,
	MatKhau nvarchar(255) null,
	Role varchar(max),
	TrangThai int null
)

create table HoaDon (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	NgayTao DATETIME null,
	NgayChoXacNhan DATETIME null,
	NgayXacNhan DATETIME null,
	NgayHoanThanh DATETIME null,
	NgayHuy DATETIME null,
	NgayThanhToan DATETIME null,
	IdNhanVien uniqueidentifier,
	IdKhachHang uniqueidentifier,
	MoTa nvarchar(255) null,
	TongTien decimal,
	GhiChu NVARCHAR(max) NULL,
	TrangThai int null,
	HinhThuc int null
)


create table HoaDonChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdHoaDon uniqueidentifier,
	IdAoChiTiet uniqueidentifier,
	SoLuong int,
	DonGia decimal,
	TrangThai int null
)


create table PhieuGiaoHang (
	Id uniqueidentifier primary key default newid(),
	IdHoaDon uniqueidentifier,
	IdKhachHang uniqueidentifier,
	IdNhanVien uniqueidentifier,
	Ten nvarchar(255) null,
	SDT nvarchar(15) null,
	DiaChi nvarchar(255) null,
	GhiChu nvarchar(255) null,
	PhiShip decimal,
	TrangThai int null
)

create table GioHang (
	Id uniqueidentifier primary key default newid(),
	Ma varchar(20) unique,
	IdKhachHang uniqueidentifier,
	NgayTao date null,
	TrangThai int null
)

create table GioHangChiTiet (
	Id uniqueidentifier primary key default newid(),
	IdGioHang uniqueidentifier,
	IdAoChiTiet uniqueidentifier,
	SoLuong int,
	DonGia decimal,
	TrangThai int null
)

create table Chat (
	Id uniqueidentifier primary key default newid(),
	IdNhanVien uniqueidentifier null,
	IdKhachHang uniqueidentifier null,
	NoiDung nvarchar(255) null,
	ThoiGian date,
	TrangThai int null
)

CREATE TABLE ChatMessage
(
    id INT IDENTITY(1,1) PRIMARY KEY,
    content NVARCHAR(MAX),
    timestamp DATETIME,
    iduser uniqueidentifier,
    bientrunggian int,
	TrangThai int null,
    FOREIGN KEY (iduser) REFERENCES Users(Id)
);


create table DemChat(
	id nvarchar(max),
	bientrunggian varchar(max)
)


create table ThoiGian(
	id INT PRIMARY KEY,
	iduser uniqueidentifier, 
	timestamp DATETIME,
)


--
alter table Ao add foreign key (IdFormAo) references FormAo(Id)

alter table Ao add foreign key (IdHang) references Hang(Id)

alter table Ao add foreign key (IdChatVai) references ChatVai(Id)

alter table Ao add foreign key (IdLoaiAo) references LoaiAo(Id)

alter table AoChiTiet add foreign key (IdSize) references Size(Id)

alter table AoChiTiet add foreign key (IdMauSac) references MauSac(Id)


alter table AoChiTiet add foreign key (IdAo) references Ao(Id)

--

alter table ChatVai add foreign key (IdHuongDanBaoQuan) references HuongDanBaoQuan(Id)

--

alter table Anh add foreign key (IdAo) references Ao(Id)

alter table DanhGia add foreign key (IdAoChiTiet) references AoChiTiet(Id)

alter table DanhGia add foreign key (IdNguoiDung) references Users(Id)

--

alter table ChuongTrinhGiamGiaChiTietSanPham add foreign key (IdPggSp) references ChuongTrinhGiamGiaSanPham(Id)

alter table ChuongTrinhGiamGiaChiTietSanPham add foreign key (IdSanPHam) references Ao(Id)

--

alter table ChuongTrinhGiamGiaChiTietHoaDon add foreign key (IdPggHd) references ChuongTrinhGiamGiaHoaDon(Id)

alter table ChuongTrinhGiamGiaChiTietHoaDon add foreign key (IdHD) references HoaDon(Id)

--

alter table HoaDon add foreign key (IdNhanVien) references Users(Id)

alter table HoaDon add foreign key (IdKhachHang) references Users(Id)

--

alter table HoaDonChiTiet add foreign key (IdHoaDon) references HoaDon(Id)

alter table HoaDonChiTiet add foreign key (IdAoChiTiet) references AoChiTiet(Id)

--

alter table PhieuGiaoHang add foreign key (IdHoaDon) references HoaDon(Id)

alter table PhieuGiaoHang add foreign key (IdKhachHang) references Users(Id)

alter table PhieuGiaoHang add foreign key (IdNhanVien) references Users(Id)

--

alter table GioHang add foreign key (IdKhachHang) references Users(Id)

--

alter table GioHangChiTIet add foreign key (IdGioHang) references GioHang(Id)

alter table GioHangChiTIet add foreign key (IdAoChiTiet) references AoChiTiet(Id)

--

alter table Chat add foreign key (IdKhachHang) references Users(Id)

alter table Chat add foreign key (IdNhanVien) references Users(Id)

---

---

alter table ThoiGian add foreign key (iduser) references Users(Id)

---
