use quan_ly_ban_hang;
create unique index idx_name on customer(name);
create view vw_list_od
as
select o.id, u.name,
       case
           when o.status = 0 then 'cho xac nhan'
           else 'dang giao hang'
       end as 'trang thai'
from orders o
join customer u
on  o.customer_id = u.id;

select * from vw_list_od;

DELIMITER //
create procedure add_new(IN na varchar(50), ca int, pri float, sale_pri float)
BEGIN
insert into product (name, category_id,price,sale_price) values (na,ca,pri,sale_pri);
END;
//

call add_new('proo', 1, 190000000, 10000000);

DELIMITER //
create procedure delete_pro(IN id_d int)
BEGIN
   delete from product where id = id_d;
END;
//

call delete_pro(6);

DELIMITER //
create procedure show_top5()
BEGIN
    select * from product order by price desc limit 3;
END;
//
call show_top5;

DELIMITER //
create procedure u_pro(IN ide int, na varchar(50), ca int, pri float, sale_pri float)
BEGIN
    select * from vw_list_od;
    update product
    set name = na, category_id = ca,price = pri,sale_price = sale_pri
    where id = ide;
END;
//