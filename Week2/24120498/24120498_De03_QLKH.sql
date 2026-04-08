CREATE DATABASE QLKH
GO
USE QLKH
GO
CREATE TABLE BaiBao
(
	IDBaiBao char(10),
	TenBaiBao nvarchar(50),
	IDTruong char(10),
	IDPhanBien char(10)
	PRIMARY KEY (IDBaiBao, IDTruong)
)
GO
CREATE TABLE NhaKhoaHoc
(
	IDNhaKhoaHoc char(10),
	IDTruong char(10),
	HoTen nvarchar(50),
	NgaySinh datetime
	PRIMARY KEY (IDNhaKhoaHoc, IDTruong)
)
GO
CREATE TABLE THAMGIA
(
	IDBaiBao char(10),
	IDNhaKhoaHoc char (10),
	IDTruong char(10),
	ThanhTich nvarchar(50)
	PRIMARY KEY (IDBaiBao, IDNhaKhoaHoc, IDTruong)
)
GO
ALTER TABLE BaiBao
ADD 
	CONSTRAINT FK_BaiBao_NhaKhoaHoc
	FOREIGN KEY (IDPhanBien, IDTruong)
	REFERENCES NhaKhoaHoc(IDNhaKhoaHoc, IDTruong)
GO
ALTER TABLE THAMGIA
ADD
	CONSTRAINT FK_THAMGIA_BaiBao
	FOREIGN KEY (IDBaiBao, IDTruong)
	REFERENCES BaiBao(IDBaiBao, IDTruong)
GO
ALTER TABLE THAMGIA
ADD
	CONSTRAINT FK_THAMGIA_NhaKhoaHoc
	FOREIGN KEY (IDNhaKhoaHoc, IDTruong)
	REFERENCES NhaKhoaHoc(IDNhaKhoaHoc, IDTruong)
GO
INSERT INTO NhaKhoaHoc(IDNhaKhoaHoc, IDTruong, HoTen, NgaySinh)
VALUES ('N2', 'TN', N'Nguyễn', '1984-07-15')
INSERT INTO NhaKhoaHoc(IDNhaKhoaHoc, IDTruong, HoTen, NgaySinh)
VALUES ('N2', 'BK', N'Tín', '1983-09-26')
INSERT INTO NhaKhoaHoc(IDNhaKhoaHoc, IDTruong, HoTen, NgaySinh)
VALUES ('N1', 'BK', N'Hà', '1984-10-18')
INSERT INTO NhaKhoaHoc(IDNhaKhoaHoc, IDTruong, HoTen, NgaySinh)
VALUES ('N1', 'TN', N'Hữu', '1984-12-09')
INSERT INTO NhaKhoaHoc(IDNhaKhoaHoc, IDTruong, HoTen, NgaySinh)
VALUES ('N3', 'BK', N'Nhân', '1982-12-01')
GO
INSERT INTO BaiBao(IDBaiBao, IDTruong, TenBaiBao, IDPhanBien)
VALUES ('B1', 'TN', N'Phát triển TPTM', 'N2')
INSERT INTO BaiBao(IDBaiBao, IDTruong, TenBaiBao, IDPhanBien)
VALUES ('B1', 'BK', N'Nghiên cứu BI', 'N2')
INSERT INTO BaiBao(IDBaiBao, IDTruong, TenBaiBao, IDPhanBien)
VALUES ('B2', 'BK', N'Xử lý ngôn ngữ', 'N2')
GO
INSERT INTO THAMGIA(IDBaiBao, IDTruong, IDNhaKhoaHoc, ThanhTich)
VALUES ('B1', 'TN', 'N1', N'Giỏi')
INSERT INTO THAMGIA(IDBaiBao, IDTruong, IDNhaKhoaHoc, ThanhTich)
VALUES ('B1', 'BK', 'N1', N'Xuất sắc')
INSERT INTO THAMGIA(IDBaiBao, IDTruong, IDNhaKhoaHoc, ThanhTich)
VALUES ('B1', 'BK', 'N3', N'Khá')
INSERT INTO THAMGIA(IDBaiBao, IDTruong, IDNhaKhoaHoc, ThanhTich)
VALUES ('B2', 'BK', 'N1', N'Trung bình')
INSERT INTO THAMGIA(IDBaiBao, IDTruong, IDNhaKhoaHoc, ThanhTich)
VALUES ('B2', 'BK', 'N3', N'Khá')
GO

