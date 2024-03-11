set nocount on
USE master
GO

if exists (select * from sysdatabases where name='GundamShop')
begin
  raiserror('Dropping existing GundamShop database ....',0,1)
  DROP database GundamShop
end
GO

CHECKPOINT
go

raiserror('Creating GundamShop database....',0,1)
go
   CREATE DATABASE GundamShop
GO

CHECKPOINT
GO

USE GundamShop
GO

raiserror('Creating Table TYPES....',0,1)
create table TYPES
(
  TYPE_ID VARCHAR(10) NOT NULL,
  TYPENAME VARCHAR(20) NOT NULL,
  RATIO VARCHAR(10) NOT NULL,
  HEIGHT VARCHAR(10) NOT NULL,
  PRIMARY KEY (TYPE_ID)
)
go
raiserror('Creating Table ACCOUNTROLE....',0,1)
create table ACCOUNTROLE
(
  ROLE_ID BIT check(ROLE_ID=1 OR ROLE_ID =0) NOT NULL,
  ROLEINFO VARCHAR(20) NOT NULL,
  PRIMARY KEY (ROLE_ID)
)
go
raiserror('Creating Table BRAND....',0,1)
create table BRAND
(
  BRAND_ID INT NOT NULL,
  BRANDNAME VARCHAR(20) NOT NULL,
  PRIMARY KEY (BRAND_ID)
)
go
raiserror('Creating Table PRODUCT....',0,1)
create table PRODUCT
(
  PRODUCT_ID NVARCHAR(20) NOT NULL,
  PRODUCTNAME NVARCHAR(100) NOT NULL,
  ORIGIN VARCHAR(20) NOT NULL,
  PRICE MONEY NOT NULL,
  PRODUCTDETAILS NVARCHAR(MAX) NOT NULL,
  PRODUCTMATERIAL NVARCHAR(20) NOT NULL,
  TYPE_ID VARCHAR(10) NOT NULL,
  BRAND_ID INT NOT NULL,
  PRIMARY KEY (PRODUCT_ID),
  FOREIGN KEY (TYPE_ID) REFERENCES TYPES(TYPE_ID),
  FOREIGN KEY (BRAND_ID) REFERENCES BRAND(BRAND_ID)
)
go
 raiserror('Creating Table ACCOUNT....',0,1)
create table ACCOUNT
(
  ACCOUNT_ID INT identity(1,1) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  ACCOUNTPASS VARCHAR(50) NOT NULL,
  ACCOUNT_NAME NVARCHAR(MAX) NOT NULL,
  ACCOUNT_PHONE VARCHAR(20) NOT NULL,
  ACCOUNT_ADDRESS NVARCHAR(MAX) NOT NULL,
  ROLE_ID BIT CHECK(ROLE_ID=0 OR ROLE_ID= 1) NOT NULL,
  PRIMARY KEY (ACCOUNT_ID),
  FOREIGN KEY (ROLE_ID) REFERENCES ACCOUNTROLE(ROLE_ID)
)
go
 raiserror('Creating Table ORDERS....',0,1)
create table ORDERS
(
  ORDER_ID INT IDENTITY(1,1) NOT NULL,
  ORDER_DATE DATETIME NOT NULL,
  ACCOUNT_ID INT NOT NULL,
TOTALMONEY MONEY NOT NULL,
ORDER_NOTE NVARCHAR(MAX),
PAYMENTMETHOD NVARCHAR(300) NOT NULL ,
  PRIMARY KEY(ORDER_ID),
  FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT(ACCOUNT_ID),
)
go
raiserror('Creating Table ORDERDETAILS....',0,1)
create table ORDERDETAILS
(
  ORDER_ID INT  NOT NULL,
  PRODUCT_ID  NVARCHAR(20) NOT NULL,  
  QUANTITY INT NOT NULL,
  UNITPRICE MONEY NOT NULL,
  FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
)
Go
raiserror('Creating Table DISCOUNT....',0,1)
create table DISCOUNT
(
  DISCOUNTID VARCHAR(20) NOT NULL,
DISCOUNTRATE INT NOT NULL,
PRIMARY KEY(DISCOUNTID)
  )
go

/*****************************************************/
-- Populating data into the tables
/********************/
/*data for types*/
INSERT INTO TYPES VALUES ('SD', N'SUPER DEFORM', 'None', '8-10 cm')
INSERT INTO TYPES VALUES ('HG', N'HIGH GRADE', '1/144', '13-16 cm')
INSERT INTO TYPES VALUES ('RG', N'REAL GRADE', '1/144', '13-16 cm')
INSERT INTO TYPES VALUES ('MG', N'MASTER GRADE', '1/100', '22 cm')

/*data for accountrole*/
INSERT INTO ACCOUNTROLE VALUES (1,'ADMIN')
INSERT INTO ACCOUNTROLE VALUES (0,'USER')

/*data for brand*/
INSERT INTO BRAND VALUES(1, N'Bandai Namco')
INSERT INTO BRAND VALUES(2, N'Tthong')
INSERT INTO BRAND VALUES(3, N'GDC')
/*data for product*/
INSERT INTO PRODUCT VALUES (
'SD001', 
N'Mô hình Gundam Bandai SD Liu Bei Unicorn Gundam Lưu Bị 01',
'MADE IN JAPAN', 
199.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')

INSERT INTO PRODUCT VALUES (
'SD002', 
N'Mô hình Bandai Gundam SD Sun Jian Gundam Astray Tôn Kiên 05 ',
'MADE IN JAPAN', 
180.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')

INSERT INTO PRODUCT VALUES (
'SD003', 
N'Mô Hình Gundam Bandai SD 06 Dong Zhuo Providence Gundam Đổng Trác ',
'MADE IN JAPAN', 
180.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')

INSERT INTO PRODUCT VALUES (
'SD004', 
N'Mô Hình Gundam Bandai SD Cao Cao Wing Gun Tào Tháo 04',
'MADE IN JAPAN', 
240.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')

INSERT INTO PRODUCT VALUES (
'SD005', 
N'Mô hình Gundam Bandai SD Diao Chan Kshatriya Điêu Thuyền 09 ',
'MADE IN JAPAN',
200.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
INSERT INTO PRODUCT VALUES (
'SD006', 
N'Mô Hình Gundam Bandai SD Lyu Bu Lã Bố 08 ',
'MADE IN JAPAN', 
350.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
INSERT INTO PRODUCT VALUES (
'SD007', 
N'Mô hình Gundam Bandai SD Sangoku Soketsuden Ma Chao Barbatos 10
 Mã Siêu',
'MADE IN JAPAN', 
190.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
 INSERT INTO PRODUCT VALUES (
'SD008', 
N'Mô Hình Gundam Bandai SD Zhang Fei God Gundam Trương Phi 03 ',
'MADE IN JAPAN', 
190.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
INSERT INTO PRODUCT VALUES (
'SD009', 
N'Mô hình Gundam Bandai SD ZHAOYUN 00 GUNDAM Triệu Vân 07 ',
'MADE IN JAPAN', 
280.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
INSERT INTO PRODUCT VALUES (
'SD010', 
N'Mô Hình Gundam Bandai SD Gundam Tam Quốc 20 Zhuge Liang Freedom Bandai Gia Cát Lượng  ',
'MADE IN JAPAN', 
200.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : SD [SUPER DEFORM]
Chiều cao: 8-10cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phậm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'SD',
'1')
INSERT INTO PRODUCT VALUES(
'HG001',
N'Mô Hình Lắp Ráp Gundam HG RX-78-2 Fighter Beyond Global ',
'MADE IN JAPAN',
420.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')

INSERT INTO PRODUCT VALUES(
'HG002',
N'Mô Hình lắp ráp GUNDAM HG 1/144 MS-06R Zaku II High Mobility Type “Psycho Zaku” (Thunderbolt Ver.) ',
'MADE IN JAPAN',
599.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')
INSERT INTO PRODUCT VALUES(
'HG003',
N'Mô hình Gundam HGUC R-Jarja GDC',
'MADE IN CHINA',
399.000,
N'THƯƠNG HIỆU : GDC – TRUNG QUỐC
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi GDC
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'3')
INSERT INTO PRODUCT VALUES(
'HG004',
N'Mô Hình Lắp Ráp Gundam HG IBO Barbatos Lupus B021 Iron Blooded 
Orphans',
'MADE IN JAPAN',
420.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')
INSERT INTO PRODUCT VALUES(
'HG005',
N'Mô Hình Lắp Ráp Gundam MICHAELIS HG 1 The Witch From The Mercury Tthong',
'MADE IN CHINA',
460.000,
N'THƯƠNG HIỆU : Tthong – TRUNG QUỐC
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Tthong 
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'2')
INSERT INTO PRODUCT VALUES(
'HG006',
N'Mô hình lắp ráp Gundam HG 00 Avalanche Exia 064 ',
'MADE IN JAPAN',
680.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')
INSERT INTO PRODUCT VALUES(
'HG007',
N'Mô hình lắp ráp Gundam HG BD R Nepteight Tthong ',
'MADE IN CHINA',
440.000,
N'THƯƠNG HIỆU : Tthong – TRUNG QUỐC
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Tthong 
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'2')
INSERT INTO PRODUCT VALUES(
'HG008',
N'Mô hình Gundam HG BDRE Core Gundam (Real Type Color) & Marsfour Unit Bandai ',
'MADE IN JAPAN',
690.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')
INSERT INTO PRODUCT VALUES(
'HG009',
N'Mô hình lắp ráp Gundam HG Virtue GDC  ',
'MADE IN CHINA',
420.000,
N'THƯƠNG HIỆU : GDC – TRUNG QUỐC
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi GDC
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'3')
INSERT INTO PRODUCT VALUES(
'HG010',
N'Mô hình lắp ráp Gundam HGUC MS-06 Zaku II Mass Production Type(HGUC) Bandai  ',
'MADE IN JAPAN',
299.000,
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : HG [HIGH GRADE]
Chiều cao: 13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'HG',
'1')
INSERT INTO PRODUCT VALUES (
'RG001', 
N'Mô hình lắp ráp Gundam RX-93 Nu Gundam v Gundam RG ',
'MADE IN JAPAN', 
1280.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phậm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG002', 
N'Mô hình lắp ráp Gundam XXXG-00W0 Wing Gundam Zero EW RG  ',
'MADE IN JAPAN', 
680.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG003', 
N'Mô hình lắp ráp Gundam XXXG-01W Wing Gundam RG  ',
'MADE IN JAPAN', 
880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG004', 
N'Mô hình lắp ráp Gundam GN-0000+GNR-010 00 Raiser RG ',
'MADE IN JAPAN', 
880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG005', 
N'Mô hình lắp ráp Gundam MSN-04 Sazabi RG  ',
'MADE IN JAPAN', 
1280.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG006', 
N'Mô hình lắp ráp Gundam Zeta Gundam RG  ',
'MADE IN JAPAN', 
820.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG007', 
N'Mô hình lắp ráp Gundam MBF-P01-Re2AMATU Gundam Astray Gold Frame Amatsu Mina RG ',
'MADE IN JAPAN', 
880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG008', 
N'Mô hình lắp ráp Gundam Unicorn Gundam RG ',
'MADE IN JAPAN', 
1080.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG009', 
N'Mô hình lắp ráp Gundam Full Armor Unicorn Gundam RG  ',
'MADE IN JAPAN', 
1480.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'RG010', 
N'Mô hình lắp ráp Gundam ZGMF-X20A Strike Freedom Gundam RG  ',
'MADE IN JAPAN', 
880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : RG [REAL GRADE]
Chiều cao: ``13-16cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'RG',
'1')
INSERT INTO PRODUCT VALUES (
'MG001', 
N'Mô hình lắp ráp Gundam Strike Freedom Gundam MGEX 1/100   ',
'MADE IN JAPAN', 
3680.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG002', 
N'Mô hình lắp ráp Gundam EX-S Gundam / S Gundam MG ',
'MADE IN JAPAN', 
3190.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG003', 
N'Mô hình lắp ráp Gundam NU Gundam ver. KA MG  ',
'MADE IN JAPAN', 
1880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG004', 
N'Mô hình lắp ráp Gundam Double X Gundam MG ',
'MADE IN JAPAN', 
1180.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG005', 
N'Mô hình lắp ráp Gundam  Providence Gundam MG  ',
'MADE IN JAPAN', 
1340.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG006', 
N'Mô hình lắp ráp Gundam  MVF-X08 Eclipse Gundam MG  ',
'MADE IN JAPAN', 
1350.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG007', 
N'Mô hình lắp ráp Gundam MSN-001A1 Delta Plus Gundam MG  ',
'MADE IN JAPAN', 
1240.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG008', 
N'Mô hình lắp ráp Gundam RX-78-2 Gundam Ver. One Year War 0079 Anime Color MG ',
'MADE IN JAPAN', 
880.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
INSERT INTO PRODUCT VALUES (
'MG009', 
N'Mô hình lắp ráp Gundam YMS-15 Gyan MG',
'MADE IN CHINA', 
960.000, 
N'THƯƠNG HIỆU : GDC – TRUNG QUỐC
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi GDC
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'3')
INSERT INTO PRODUCT VALUES (
'MG010', 
N'Mô hình lắp ráp Gundam Full Armor Unicorn Gundam Ver. Ka ',
'MADE IN JAPAN', 
2180.000, 
N'THƯƠNG HIỆU : BANDAI – NHẬT BẢN
PHIÊN BẢN : MG [MASTER GRADE]
Chiều cao: ``Khoảng 22cm
PHÂN LOẠI SP : LẮP RÁP
– Sản phẩm nhựa cao cấp với độ sắc nét cao
– Sản xuất bởi Bandai Namco – Nhật Bản Chính hãng
– An toàn với trẻ em
– Phát triển trí não cho trẻ hiệu quả đi đôi với niềm vui thích bất tận
– Rèn luyện tính kiên nhẫn cho người chơi
– Thông tin cơ bản :
Mô hình gundam (gunpla) là một loại mô hình nhựa được gọi là Model kit, bao gồm nhiều mảnh nhựa rời được gọi là part (bộ phận), khi lắp ráp các part lại với nhau sẽ được mô hình hoàn chỉnh. Các mảnh nhựa rời này được gắn trên khung nhựa gọi là runner.
Mỗi một hộp sản phẩm Gunpla bao gồm nhiều runner và các phụ kiện liên quan, một tập sách nhỏ (manual) bên trong giới thiệu sơ lược về mẫu Gundam trong hộp và phần hướng dẫn cách lắp ráp. o Dòng gundam với các chi tiết hoàn hảo.
Các khớp cử động linh hoạt theo ý muốn.
Người chơi sẽ thỏa sức sáng tạo và đam mê.',
N'Nhựa',
'MG',
'1')
/*data for account*/
INSERT INTO ACCOUNT VALUES ( 'son@gmail.com', '12345', N'Võ Nguyễn Trung Sơn', '0945076586', N'1 Bis, Hùng Vương, TP Hồ Chí Minh', 1 )
INSERT INTO ACCOUNT VALUES ( 'hai@gmail.com', '12345', N'Võ Nguyễn Trung Hải', '0909564749', N'2 Bis, Hùng Vương, TP Hồ Chí Minh', 1 )
INSERT INTO ACCOUNT VALUES ( 'tri@gmail.com', '12345', N'Lương Minh Trí', '0745363898', N'3 Bis, Hùng Vương, TP Hồ Chí Minh', 1 )
INSERT INTO ACCOUNT VALUES ( 'minh@gmail.com', '12345', N'Phạm Trần Hoàng Minh', '0858989432', N'4 Bis, Hùng Vương, TP Hồ Chí Minh', 1 )
INSERT INTO ACCOUNT VALUES ( 'duy@gmail.com', '12345', N'Nguyễn Anh Duy', '07564888789', N'5 Bis, Hùng Vương, TP Hồ Chí Minh', 1 )
INSERT INTO ACCOUNT VALUES ( 'a@gmail.com', '54321', N'Nguyễn Văn A', '0923456789', N'1B, Trần Hưng Đạo, TP Đà Nẵng', 0 )
INSERT INTO ACCOUNT VALUES ( 'b@gmail.com', '54321', N'Nguyễn Văn B', '0564384568', N'2B, Trần Hưng Đạo, TP Đà Nẵng', 0 )
INSERT INTO ACCOUNT VALUES ( 'c@gmail.com', '54321', N'Nguyễn Văn C', '0707684439', N'3B, Trần Hưng Đạo, TP Đà Nẵng', 0 )
INSERT INTO ACCOUNT VALUES ( 'd@gmail.com', '54321', N'Nguyễn Văn D', '0909547387', N'4B, Trần Hưng Đạo, TP Đà Nẵng', 0 )
INSERT INTO ACCOUNT VALUES ( 'e@gmail.com', '54321', N'Nguyễn Văn E', '0808546287', N'5B, Trần Hưng Đạo, TP Đà Nẵng', 0 )

INSERT INTO DISCOUNT VALUES ( 'ss10', '10')
INSERT INTO DISCOUNT VALUES ( 'ss20', '20')
INSERT INTO DISCOUNT VALUES ( 'ss30', '30')
INSERT INTO DISCOUNT VALUES ( 'ss40', '40')
INSERT INTO DISCOUNT VALUES ( 'ss50', '50')
raiserror('The GundamShop database in now ready for use....',0,1)
