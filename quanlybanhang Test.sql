
create database QuanlybanhangTest;
use QuanlybanhangTest;

create table DanhMucSanPham(
Category_Id char(4) primary key,
Category_Name varchar(20) not null unique,
Category_Desription text,
Category_Status bit not null
);

create table SanPham(
Product_Id char(4) primary key,
Category_Id char(4),
foreign key (Category_Id) references DanhMucSanPham(Category_Id),
Product_Name varchar(20) not null,
ImportPrice float check(ImportPrice>0),
ExportPrice float check(ExportPrice>0),
Product_Title varchar(100),
Product_Desription text,
QuantityInStock int,
Product_Status enum('Bán', 'Không bán', 'Hết hàng')
);


create table Nguoidung(
User_Id char(4) primary key,
User_Name varchar(20) not null unique,
Passwords varchar(10) not null
);

create table Khachhang(
User_Id char(4) not null,
foreign key(User_Id) references nguoidung(User_Id),
CustomerName varchar(20) not null unique,
Email varchar(20)not null,
Phone varchar(15) not null,
Address varchar(100),
Birthday date
);
create table Hoadon(
Invoice_Id char(4) primary key,
Invoice_Date date,
User_Id char(4) not null,
foreign key(User_Id) references nguoidung(User_Id),
Invoice_Status enum('Đang đặt', 'Đã duyệt', 'Đang chuyển hàng', 'Đã nhận hàng', 'Hoàn tất')
);
create table CtHoadon(
InvoiceDetail_ID int primary key auto_increment,
Invoice_Id char(4),
foreign key(Invoice_Id)references Hoadon(Invoice_Id),
Product_Id char(4),
foreign key(Product_Id)references Sanpham(Product_Id),
Product_Price float,
Quantity int,
TotaPrice float
);
create table BinhLuan(
Comment_Id char(4) primary key,
User_Id char(4),
foreign key(User_Id) references nguoidung(User_Id),
Product_Id char(4),
foreign key(Product_Id)references Sanpham(Product_Id),
CommentConten text,
Comment_Date date,
Comment_Status enum('Đang bình luận', 'Đã được duyệt')
);

-- II. Thực hiện thao tác dữ liệu sau: 
-- 1. Thêm mỗi bảng 5 dữ liệu
insert into DanhMucSanPham
values ('DM01', 'Đồ điện tử gia dụng','Mô tả Dm 1',1),
('DM02', 'Văn phòng phẩm','Mô tả Dm 2',0),
('DM03', 'Đồ dùng sinh hoạt','Mô tả Dm 3',1),
('DM04', 'Đồ ăn liền','Mô tả Dm 4',1),
('DM05', 'Quần ao','Mô tả Dm 5',1);


insert into SanPham
values ('SP01','Dm01', 'Nồi cơm điện', 2300000,2800000,'Tiêu đề 1','Mô tả Sp 1', 10, 'bán'),
('SP02','Dm02', 'Vở kẻ ô Đồng Tâm',10000,12000,'Tiêu đề 1','Mô tả Sp 1', 50, 'bán'),
('SP03','Dm03', 'Nước xả vải Commfor',35000,42000,'Tiêu đề 1','Mô tả Sp 1', 20, 'bán'),
('SP04', 'Dm04','Mì Hảo Hảo',120000,150000,'Tiêu đề 1','Mô tả Sp 1', 30, 'bán'),
('SP05','Dm05', 'Váy',230000,280000,'Tiêu đề 1','Mô tả Sp 1', 5, 'bán');

insert into Nguoidung
values ('Nd01', 'NguyenVanA','000000'),
('Nd02', 'NguyenVanB','000000'),
('Nd03', 'NguyenVanC','000000'),
('Nd04', 'NguyenVanD','000000'),
('Nd05', 'NguyenVanE','000000');

insert into Khachhang
values ('Nd01', 'Nguyễn Văn A','Nguyenvana@gmail.com','08099999999','Quận 2, Hồ Chí Minh','1997-11-02'),
('Nd02', 'Nguyễn Văn B','Nguyenvanb@gmail.com','08099999999','Quận 3, Hồ Chí Minh','1998-10-02'),
('Nd03', 'Nguyễn Văn C','Nguyenvanc@gmail.com','08099999999','Quận 4, Hồ Chí Minh','1995-09-02'),
('Nd04', 'Nguyễn Văn D','Nguyenvand@gmail.com','08099999999','Quận 5, Hồ Chí Minh','1999-05-02'),
('Nd05', 'Nguyễn Văn E','Nguyenvane@gmail.com','08099999999','Quận 6, Hồ Chí Minh','1991-07-02');



insert into Hoadon
values ('Hd01', '2023-10-12','Nd01','Đã duyệt'),
('Hd02', '2023-10-14','Nd02','Đang đặt'),
('Hd03', '2023-10-17','Nd03','Đang chuyển hàng'),
('Hd04', '2023-11-02','Nd04','Đã nhận hàng'),
('Hd05', '2023-11-05','Nd05','Hoàn tất');


insert into CtHoadon(Invoice_Id,Product_Id,Product_Price,Quantity,TotaPrice)
values ('Hd01', 'SP01',2800000,1,2800000),
('Hd02', 'SP02',12000,10,120000),
('Hd03', 'SP03',42000,1,42000),
('Hd04', 'SP04',150000,1,150000),
('Hd05', 'SP05',280000,1,280000);
select * from Hoadonchitiet;


insert into Binhluan
values ('C01', 'Nd01','Sp01','Bình luận 1','2023-10-31','Đã được duyệt'),
('C02', 'Nd02','Sp02','Bình luận 2','2023-10-31','Đang bình luận'),
('C03', 'Nd03','Sp03','Bình luận 3','2023-10-31','Đang bình luận'),
('C04', 'Nd04','Sp04','Bình luận 4','2023-10-31','Đã được duyệt'),
('C05', 'Nd05','Sp05','Bình luận 5','2023-10-31','Đã được duyệt');

-- 2. Cập nhật thông tin mỗi bảng 1 dữ liệu
update DanhMucSanPham
set Category_name= 'Đồ trẻ sơ sinh'
where Category_id='Dm05';

update SanPham
set Product_name= 'Tả giấy Pamper'
where Product_id='Sp05';

update Nguoidung
set User_name= 'Nguyenvanh'
where User_Id='Nd05';

update Khachhang
set CustomerName= 'Nguyễn Văn H'
where User_Id='Nd05';

update Hoadon
set Invoice_Status= 'Đang chuyển hàng'
where Invoice_Id='Hd05';

update cthoadon
set Quantity= 3,
TotaPrice=450000
where InvoiceDetail_ID=4;

update Binhluan
set Comment_Status= 'Đang bình luận'
where Comment_Id='c05';

-- 3. Thực hiện các truy vấn sau:
-- a. Lấy ra tất cả các sản phẩm gồm các thông tin: mã sản phẩm, tên sản phẩm,giá xuất sản phẩm, 
--    mô tả ngắn gọn, trạng thái sản phẩm, tên danh mục của sản phẩm
select sp.Product_id,sp.Product_Name,ExportPrice,Product_Desription,sp.Product_Status,sp.Category_id
from sanpham sp;


-- b. Lấy tất cả thông tin sản phẩm có ký tự thứ 2 là ‘a’
select * from sanpham sp
where sp.Product_name like '_a%';


-- c. Lấy tất cả thông tin sản phẩm có giá nhận 1 trong các giá trị sau: 100.000,350.000, 700.000

select * from sanpham sp
where sp.ExportPrice in (120000,100000,150000);


-- d. Lấy ra tất cả các sản phẩm có giá nhập trong khoảng từ 100.000 đến 500.000 và sắp xếp theo giá nhập tăng dần
select * from sanpham sp
where sp.ImportPrice between 100000 and 500000
order by sp.ImportPrice asc;

-- e. Lấy ra tất cả các bình luận của khách hàng gồm các thông tin tên người dùng, nội dung bình luận, 
--    ngày bình luận, tên sản phẩm được bình luận và được sắp xếp theo ngày bình luận giảm dần
select nd.User_Name, bl.CommentConten,bl.Comment_Date,sp.Product_Name
from Binhluan bl
inner join nguoidung nd on bl.User_id  = nd.User_id
inner join sanpham sp on bl.Product_id= sp.Product_id
order by bl.Comment_Date desc;


-- f. In thông tin 3 sản phẩm được bán nhiều nhất trong khoảng thời gian từ 2023-10-01 đến 2023-10-31
select sp.Product_Name, cthd.Quantity,hd.Invoice_Date
from cthoadon cthd
inner join hoadon hd on cthd.Invoice_Id  = hd.Invoice_Id
inner join sanpham sp on cthd.Product_id= sp.Product_id
order by cthd.Quantity desc
limit 3;

-- g. In thông tin hóa đơn có tổng tiền lớn nhất
select * from cthoadon cthd
order by cthd.TotaPrice desc
limit 1;

-- h. In ra số lượng sản phẩm của từng danh mục
select dmsp. Category_Name, count(sp.Product_id) as TotalProduct
from sanpham sp
left join Danhmucsanpham dmsp on sp.Category_id=dmsp.Category_id
group by dmsp.Category_name;


