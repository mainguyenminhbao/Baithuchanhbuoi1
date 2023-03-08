--a. Tạo các login; tạo các user khai thác CSDL AdventureWorks2008R2 cho các nhân viên nêu
--trên (tên login trùng tên user). (1đ)
-- Tạo login
Create 
CREATE LOGIN [John] WITH PASSWORD = 'password123';

-- Tạo user và kết nối với login
CREATE USER [John] FOR LOGIN [John];
--tạo trưởng user Trnhóm và QL
CREATE LOGIN [TN TruongNhom] WITH PASSWORD = 'password';
CREATE USER [TN TruongNhom] FOR LOGIN [TN TruongNhom];


CREATE LOGIN [QL QuanLy] WITH PASSWORD = 'password';
CREATE USER [QL QuanLy] FOR LOGIN [QL QuanLy];

--b. Phân quyền để các nhân viên hoàn thành nhiệm vụ được phân công. Lưu ý : Admin chỉ cấp
--quyền cho trưởng nhóm TN và quản lý QL. Quyền của nhân viên NV được trưởng nhóm cấp.
--(1.5đ)

--1.Cấp quyền cho trưởng nhóm
GRANT SELECT, UPDATE ON Sales.Store TO [TN TruongNhom];
--2.Cấp quyền cho quản lý
GRANT SELECT, INSERT, UPDATE, DELETE ON Sales.Store TO [QL QuanLy];
--3.Cho phép trưởng nhóm TN cấp quyền cho nhân viên NV
GRANT SELECT, UPDATE ON Sales.Store TO [TN TruongNhom] WITH GRANT OPTION;
/*
c. Đăng nhập phù hợp, mở cửa sổ query tương ứng và viết lệnh để:
- trưởng nhóm TN sửa 1 dòng dữ liệu tùy ý,
- nhân viên NV xóa 1 dòng dữ liệu tùy ý và
- nhân viên QL xem lại kết quả thực hiện của 2 user trên.
(Lưu ý: Đặt tên các cửa sổ query làm việc ứng với các nhân viên là TN, NV, QL và lưu các query
này vào thư mục bài làm) (3đ)
*/
--đăng nhập với tài khoản của nhóm trưởng
USE AdventureWorks2008R2;
GO
EXECUTE AS LOGIN = 'TN TruongNhom';
GO
--Trưởng nhóm TN sửa 1 dòng dữ liệu tùy ý:
USE AdventureWorks2008R2;
GO
UPDATE Sales.Store
SET Name = 'New Name'
WHERE BusinessEntityID = 1;
GO
--Nhân viên NV xóa 1 dòng dữ liệu tùy ý:
USE AdventureWorks2008R2;
GO
DELETE FROM Sales.Store
WHERE BusinessEntityID = 2;
GO
--Nhân viên QL xem lại kết quả thực hiện của 2 user trên
USE AdventureWorks2008R2;
GO
SELECT * FROM Sales.Store;
GO