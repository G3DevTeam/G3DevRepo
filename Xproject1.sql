Create database Xproject;

use Xproject;



create table Rider(

	ID_Rider int not null primary key auto_increment,

	email varchar(50) not null,
    
	userName varchar(20) not null,
    
	passcode varchar(100) not null,
    
	signedUpDate date not null ,
    
	isValid boolean not null default 0,
    
	unValidationDate date

);




create table CarBrand(
	
	IDBrand int not null primary key auto_increment,
    
	brandName varchar(30) not null

);



create table Model(
	
	IDModel int not null primary key auto_increment,
    
	IDBrand int not null references CarBrand(IDBrand),
    
	model_year year not null,
    
	modelLabel varchar(50) not null

);



create table Rider_Car(
	
	IDRiderCar int not null primary key auto_increment,
    
	ID_Rider int not null references Rider(ID_Rider),
    
	IDModel int not null references Model(IDModel),
    
	isValid boolean not null default true,
    
	unValidationDate date

);



create table Wilaya(
	
	IDWilaya int not null primary key auto_increment,
    
	wilayaCode int not null,
    
	wilayaLabel varchar(50) not null

);



create table City(
	
	IDCity int not null primary key auto_increment,
    
	IDWilaya int not null references Wilaya(IDWilaya),
    
	cityLabel varchar(50) not null

);



create table Trip(
	
	IDTrip int not null primary key auto_increment,
    
	IDRiderCar int not null references RiderCar(IDRiderCar),
    
	SP_IDCity int not null references City(IDCity),
    
	EP_IDCity int not null references City(IDCity),
    
	createDate date not null,
    
	isValid boolean not null default true,
    
	check(SP_IDCity <> EP_IDCity)

);



CREATE TRIGGER setcreationDateTrip BEFORE INSERT ON  Trip 

FOR EACH ROW 

	SET NEW.createDate = NOW()