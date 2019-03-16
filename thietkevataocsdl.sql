create database bankmanagement;
use bankmanagement;
create table customers1(
	customer_ID int not null  primary key,
    full_name nvarchar(50) not null ,
    address nvarchar(50),
    email nvarchar(50),
    phone varchar(20)
);
 
 create table accounts (
	accountID int not null auto_increment primary key,
    customer_ID int not null UNIQUE ,
    account_type varchar(30),
    date_sign_in date,
    balance float,
    constraint account_type_CK check (account_type = 'VIP' or account_type = 'normal' )
);
    
    alter table accounts add constraint account_id_FK foreign key (customerID) references customers(customerID);
    
 create table transactions (
	transactionID int not null primary key,
    accountID int not null,
    Transaction_date date ,
    amount float,
	description varchar(50),
    constraint transactions_FK foreign key (accountID) references accounts(accountID)
);
 
 create table email (
	email varchar(30) not null primary key,
    customerID int not null
);

alter table email add constraint email_FK foreign key (customerID) references customers(customerID);
 
  create table phone (
	phone varchar(30) not null primary key,
    customerID int not null
);

alter table phone add constraint phone_FK foreign key (customerID) references customers(customerID);