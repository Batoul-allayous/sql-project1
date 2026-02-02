Create database TechCompany1;
Use TechCompany1;
create table OldEmployees
( Employee_ID int, First_Name nvarchar(50) , Last_Name nvarchar(50) , Department_ID int)
create table Departments
( Department_ID int, Department_Name nvarchar(50) , Manager_ID int , Location_ID int)
insert into Departments values (10,'Administration',100,120),(20,'Marketing',101,140),(30,'Shipping',102,150),(40,'IT',103,160),(50,'Sales',110,180);
insert into OldEmployees values (1,'amr','abdallah',10),(2,'abd','abdalkarim',20),(3,'amro','kamel',30),(4,'zain','rahma',40),(5,'murad','abdallah',50);
select First_Name,Department_Name from OldEmployees,Departments where OldEmployees.Department_ID = Departments.Department_ID;
select Employee_ID,Last_Name,Manager_ID from  OldEmployees,Departments where  Manager_ID IN (100, 101, 201);
select Employee_ID,Department_Name from OldEmployees,Departments where  Department_Name LIKE '%S%';
select Employee_ID,First_Name,Department_Name,Location_ID from OldEmployees,Departments where  Employee_ID<10 AND Location_ID<180;
select Employee_ID,First_Name,Location_ID  from  OldEmployees,Departments where Employee_ID>10 OR Location_ID>100;
select First_Name,Department_Name from  OldEmployees,Departments where  Department_Name NOT IN ('IT','Marketing');
select First_Name as Name from  OldEmployees; 
SELECT distinct Last_Name FROM  OldEmployees WHERE   EXISTS   (SELECT * FROM   OldEmployees,Departments  WHERE  Department_Name = 'IT'); 
select * from OldEmployees,Departments where Location_ID>120;
SELECT First_Name FROM  OldEmployees WHERE First_Name LIKE 'a%';
SELECT First_Name FROM OldEmployees WHERE First_Name LIKE 'am__' ;
insert into OldEmployees values (6,'rami','abdo',10);
SELECT First_Name,Last_Name FROM OldEmployees,Departments WHERE OldEmployees.Department_id = 10 ORDER BY First_Name,Last_Name Asc;
SELECT First_Name,Last_Name FROM OldEmployees,Departments WHERE OldEmployees.Department_id = 10 ORDER BY First_Name,Last_Name Desc;
SELECT First_Name,Last_Name FROM OldEmployees ORDER BY Department_ID ASC;
SELECT First_Name,Department_Name FROM  OldEmployees,Departments ORDER BY Department_Name DESC;
Alter table OldEmployees ADD Salary int;
select * from OldEmployees;
update OldEmployees set Salary = 10000;
select * from OldEmployees;
update OldEmployees set Salary = 100000 Where Department_ID=50;
select * from OldEmployees;
Select  First_Name  From  OldEmployees order by First_Name ASC ;
Select  COUNT(Employee_id) as count   From   OldEmployees   group by   Department_ID;
Select   SUM(Salary) as sum From  OldEmployees  group by  Department_ID;
Select   AVG(Salary) as avg From  OldEmployees;
select Department_ID,COUNT(*) as count from OldEmployees group by Department_ID;
Select  DISTINCT(Department_ID)  From OldEmployees order by Department_ID desc;
Select First_Name  From  OldEmployees where Employee_ID>4;
create table NewEmployee ( Employee_ID1 int, FirstName nvarchar(50) , LastName nvarchar(50) , Department_ID int)
insert into NewEmployee values (1,'amer','abdallah',10),(2,'sara','najjar',20),
(3,'batoul','amer',30),(4,'mahmoud','turky',40),(5,'murad','dali',50);
SELECT First_Name FROM OldEmployees 
UNION 
SELECT FirstName FROM NewEmployee;
SELECT First_Name FROM OldEmployees 
 UNION ALL
SELECT FirstName FROM NewEmployee; 
SELECT First_Name FROM OldEmployees 
 INTERSECT  
SELECT FirstName FROM NewEmployee;
SELECT First_Name FROM OldEmployees 
 EXCEPT  
SELECT FirstName FROM NewEmployee;
SELECT FirstName FROM NewEmployee 
 EXCEPT  
SELECT First_Name FROM OldEmployees;
select FirstName,First_Name,Manager_ID from NewEmployee,OldEmployees,Departments where First_Name=FirstName;
select FirstName,First_Name from NewEmployee,OldEmployees where First_Name!=FirstName;
SELECT First_Name,Department_Name
FROM OldEmployees
INNER JOIN Departments 
ON Employee_ID = Manager_ID;
SELECT FirstName,Department_Name
FROM NewEmployee 
LEFT JOIN Departments 
ON Employee_ID1 = Department_ID;
Select CHAR(66)                    -- يعيد المحرف المقابل للرقم
Select ASCII('B')                   -- يعيد الاسكي المقابل للحرف 
Select LOWER('ABCDEFGH')            -- يحول الاحرف الكبيرة الموجودة بين الاقواس الى احرف صغيرة 
Select UPPER('abs')                 -- يحول الاحرف الصغيرة الموجودة بين الاقواس الى احرف كبيرة
Select LEFT('acvbx',3)              -- يعيد جزء من السلسلة من اليسار حسب الطول المحدد في الوسيط الثاني بين الاقواس
Select RIGHT('ASDFG',4)             -- يعيد جزء من السلسلة من اليمين حسب الطول المحدد في الوسيط الثاني 
Select SUBSTRING('abcvfd',3,2)    --  يعيد جزء من السلسلة حسب البداية المحدد في الوسيط الثاني والطول المحدد في الوسيط الثالث
Select DAY('20251110')                                   --  يعيد رقم اليوم من التاريخ المعطى بين الاقواس 
Select MONTH('20251110')                                 -- يعيد رقم الشهر من التاريخ المعطى بين الاقواس 
Select YEAR('20251110')                                  -- يعيد رقم السنة من التاريخ المعطى بين الاقواس 
Select GETDATE()                                         -- يعيد الوقت والتاريخ الحالي 
Select DATEPART(DAY,GETDATE())              --  النتيجة هي رقم اليوم لان الدالة تعيد جزء من التاريخ على شكل رقم حسب اول وسيط هنا حددنا اليوم 
Select DATEPART(MONTH,GETDATE())            --  النتيجة هي رقم الشهر لان الدالة تعيد جزء من التاريخ على شكل رقم حسب اول وسيط هنا حددنا الشهر 
Select DATEPART(YEAR,GETDATE())             --النتيجة هي رقم السنة الحالي لان الدالة تعيد جزء من التاريخ على شكل رقم حسب اول وسيط هنا حددنا السنة 
Select DATENAME(MONTH,GETDATE())                    -- النتيجة هي اسم الشهر لان الدالة تعيد جزء من التاريخ على شكل اسم هنا حددنا الوسيط الاول الشهر 
Select DATENAME(WEEKDAY,GETDATE())-- النتيجة هي اسم اليوم الحالي لان الدالة تعيد جزء من التاريخ على شكل اسم هنا حددنا الوسيط الاول يوم من ايام الاسبوع