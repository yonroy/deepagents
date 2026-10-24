-- Self-join: ghép mỗi nhân viên e với quản lý m qua quan hệ ReportsTo. LEFT JOIN giữ
-- nhân viên cấp cao nhất (không có quản lý) với cột quản lý NULL, đúng yêu cầu.
SELECT e.FirstName, e.LastName, m.FirstName AS manager_first, m.LastName AS manager_last FROM Employee e LEFT JOIN Employee m ON m.ReportsTo = e.EmployeeId;
