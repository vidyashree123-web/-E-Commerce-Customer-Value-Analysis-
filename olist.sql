create database olist_ecommerce;
use olist_ecommerce;

create table customers (
    customer_id varchar(50) primary key,
    customer_unique_id varchar(50),
    customer_zip_code_prefix int,
    customer_city varchar(100),
    customer_state varchar(5)
);

show global variables like 'local_infile';
set global local_infile = 1;

use olist_ecommerce;

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_customers_dataset.csv'
into table customers
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select count(*) from customers;
show warnings;

select * from customers;


create table order_items (
    order_id varchar(50),
    order_item_id int,
    product_id varchar(50),
    seller_id varchar(50),
    shipping_limit_date datetime,
    price decimal(10,2),
    freight_value decimal(10,2),
    primary key (order_id, order_item_id)
);

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_order_items_dataset.csv'
into table order_items
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from order_items;
select count(*) from order_items;

create table payments (
    order_id varchar(50),
    payment_sequential int,
    payment_type varchar(20),
    payment_installments int,
    payment_value decimal(10,2)
);

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_order_payments_dataset.csv'
into table payments
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from payments;
select count(*) from payments;

create table reviews (
    review_id varchar(50),
    order_id varchar(50),
    review_score int,
    review_comment_title text,
    review_comment_message text,
    review_creation_date datetime,
    review_answer_timestamp datetime
);


-- reviews (depends on orders)
load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_order_reviews_dataset.csv'
into table reviews
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from reviews;
select count(*) from reviews;

create table orders (
    order_id varchar(50) primary key,
    customer_id varchar(50),
    order_status varchar(20),
    order_purchase_timestamp datetime,
    order_approved_at datetime,
    order_delivered_carrier_date datetime,
    order_delivered_customer_date datetime,
    order_estimated_delivery_date datetime,
    foreign key (customer_id) references customers(customer_id)
);

-- orders (depends on customers, which is now loaded)
load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_orders_dataset.csv'
into table orders
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from orders;
select count(*) from orders;

-- creating product table. 
create table products (
    product_id varchar(50) primary key,
    product_category_name varchar(100),
    product_name_lenght int,
    product_description_lenght int,
    product_photos_qty int,
    product_weight_g int,
    product_length_cm int,
    product_height_cm int,
    product_width_cm int
);

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_products_dataset.csv'
into table products
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from products;
select count(*) from products; 

-- creating geolocation table. 
create table geolocation (
    geolocation_zip_code_prefix int,
    geolocation_lat decimal(10,6),
    geolocation_lng decimal(10,6),
    geolocation_city varchar(100),
    geolocation_state varchar(5)
); 

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_geolocation_dataset.csv'
into table geolocation
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


select * from geolocation;
select count(*) from geolocation;

-- creating sellers table.  
create table sellers (
    seller_id varchar(50) primary key,
    seller_zip_code_prefix int,
    seller_city varchar(100),
    seller_state varchar(5)
);

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/olist_sellers_dataset.csv'
into table sellers
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from sellers;
select count(*) from sellers;
 

-- creating category table. 
create table category_translation (
    product_category_name varchar(100) primary key,
    product_category_name_english varchar(100)
); 

load data local infile 'C:/Users/LENOVO/OneDrive/Desktop/DAta Analysis/E_Commerce/Brazil_olist/product_category_name_translation.csv'
into table category_translation
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

alter table category_translation rename to category;

select count(*) from category;










