create database orderscompany;
create table customers(customer_id int primary key, full_name varchar(100) not null , phone varchar(20), address varchar(200));
create table drivers(driver_id int primary key, full_name varchar(100) not null , vehicle_number varchar(50));
create table payments(payment_id int primary key,order_id int not null, amount decimal(10,2) not null, payment_date date not null,
constraint fk_payments_order foreign key (order_id) references orders(order_id));

create table orders( order_id int primary key , customer_id int not null, driver_id int , order_date date not null , status varchar(20) not null,
constraint fk_orders_customer foreign key (customer_id) references customers(customer_id),
constraint fk_orders_driver foreign key (driver_id) references drivers(driver_id),
constraint chk_orders_status check (status in ('pending','assigned','in_transit','delivered','cancelled')));
-- 4 حل طلب
select * from orders where status='delivered';
-- 5 حل طلب 
select * from drivers where driver_id not in (select distinct driver_id from orders);
-- حل اخر 
select drivers.driver_id,drivers.full_name from drivers
left join orders on orders.driver_id = drivers.driver_id and orders.status ='delivered' where orders.order_id is null; 
-- حل اخر 
select customers.customer_id,customers.full_name from customers
left join orders on orders.customer_id = customers.customer_id where orders.order_id is null;
-- 6 حل طلب 
select full_name,order_date,status from customers join orders on customers.customer_id = orders.customer_id where orders.status='delivered'; 
--حل اخر
select orders.order_id , customers.full_name as customername , drivers.full_name as drivername , orders.order_date, orders.status from orders
join customers on customers.customer_id = orders.customer_id left join drivers on drivers.driver_id = orders.driver_id where orders.status = 'delivered';



