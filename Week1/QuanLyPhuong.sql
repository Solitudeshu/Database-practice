CREATE DATABASE QLPhuong
GO
USE QLPhuong
GO
CREATE TABLE Phuong
(
	IDPhuong char(4),
	IDChuTich char(4),
	TenPhuong nvarchar(20)
	PRIMARY KEY (IDPhuong)
)
GO
CREATE TABLE KhuPho
(
	IDKhuPho int,
	IDTrKhuPho char(4),
	IDPhuong char(4)
	PRIMARY KEY (IDKhuPho, IDPhuong)
)
GO
CREATE TABLE Dan
(
	IDDan char(4),
	IDKhuPho int,
	Ten nvarchar(20),
	TinhTrang nvarchar(50),
	IDPhuong char(4)
	PRIMARY KEY (IDDan, IDPhuong)
)
GO
ALTER TABLE Phuong
ADD
	CONSTRAINT FK_Phuong_Dan
	FOREIGN KEY (IDChuTich, IDPhuong)
	REFERENCES Dan(IDDan, IDPhuong)
GO
ALTER TABLE KhuPho 
ADD
	CONSTRAINT FK_KhuPho_Dan
	FOREIGN KEY (IDTrKhuPho, IDPhuong)
	REFERENCES Dan(IDDan, IDPhuong)
GO
ALTER TABLE KhuPho
ADD
	CONSTRAINT FK_KhuPho_Phuong
	FOREIGN KEY (IDPhuong)
	REFERENCES Phuong(IDPhuong)
GO
ALTER TABLE Dan
ADD
	CONSTRAINT FR_Dan_KhuPho
	FOREIGN KEY (IDKhuPho, IDPhuong)
	REFERENCES KhuPho(IDKhuPho, IDPhuong)
GO
INSERT INTO Phuong(IDPhuong, TenPhuong, IDChuTich)
 VALUES ('PHA', N'Phường A', NULL)
INSERT INTO Phuong(IDPhuong, TenPhuong)
 VALUES ('PHB', N'Phường B')
INSERT INTO Phuong(IDPhuong, TenPhuong)
 VALUES ('PHC', N'Phường C')
-- DELETE FROM Phuong WHERE IDPhuong = 'PHC'
INSERT INTO KhuPho(IDKhuPho, IDPhuong)
 VALUES (1, 'PHB')
INSERT INTO KhuPho(IDKhuPho,IDPhuong)
 VALUES (2, 'PHC')
INSERT INTO KhuPho(IDKhuPho,IDPhuong)
 VALUES (4, 'PHC')
INSERT INTO KhuPho(IDKhuPho, IDPhuong)
 VALUES (1, 'PHA')
INSERT INTO KhuPho(IDKhuPho, IDPhuong)
 VALUES (2, 'PHA')
INSERT INTO Dan(IDPhuong, IDKhuPho, IDDan, Ten, TinhTrang)
 VALUES ('PHA', 2, 'NVA', N'Nguyễn Văn A', N'còn sống')
INSERT INTO Dan(IDPhuong, IDKhuPho, IDDan, Ten, TinhTrang)
 VALUES ('PHB', 1, 'NVB', N'Nguyễn Văn B', N'qua đời')
UPDATE Phuong SET IDChuTich = 'NVA'
WHERE IDPhuong = 'PHA'
UPDATE KhuPho SET IDTrKhuPho = 'NVB'
WHERE IDPhuong = 'PHB' and IDKhuPho = 1






