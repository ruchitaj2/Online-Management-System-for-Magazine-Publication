--Jai sri ram
--drop table Expenditure
--drop table Advertisement
--drop table Issue
--drop table AdvertTracker
--drop table Subscription
--drop table SubMagType
--drop table Magazine
--drop table Customer
--drop table States



--SELECT * FROM states
--SELECT * FROM Customer
Select * from Magazine;
Select * from SubMagType;
Select * from Issue;
Select * from Expenditure;
Select * from Customer;
Select * from States;
Select * from Advertisement;
Select * from AdvertTracker;
Select * from Subscription;

--DROP TABLE Magazine;
CREATE TABLE Magazine(
	MagazineID VARCHAR(20),
	MagazineName VARCHAR(20),
	PRIMARY KEY (MagazineID));

--DROP TABLE SubMagType
CREATE TABLE SubMagType(
	SubMagTypeID INT,
	MagID VARCHAR(20),
	SubPeriod INT,
	SubCost INT,
	PRIMARY KEY (SubMagTypeID),
	FOREIGN KEY (MagID) REFERENCES Magazine (MagazineID));


--DROP TABLE Issue;
CREATE TABLE Issue(
	IssueID INT,
	IMagazineID VARCHAR(20),
	Month VARCHAR(10),
	PRIMARY KEY (IssueID),
	FOREIGN KEY (IMagazineID) REFERENCES Magazine (MagazineID));

--DROP TABLE Expenditure;
CREATE TABLE Expenditure(
	ExpenditureID INT,
	EMagazineID VARCHAR (20) NOT NULL,
	EIssueID int not null,
	PostalCost INT NOT NULL,
	PackagingCost INT NOT NULL,
	PrintingCost INT NOT NULL,
	PaperCost INT NOT NULL,
	TransportationCost INT NOT NULL,
	PRIMARY KEY (ExpenditureID),
	FOREIGN KEY (EMagazineID) REFERENCES Magazine (MagazineID),
	FOREIGN KEY (EIssueID) REFERENCES Issue (IssueID));

--DROP TABLE States;
CREATE TABLE States(
	StateID char(2),
	StateName VARCHAR(20) NOT NULL,
	PRIMARY KEY (StateID)
	);

--Creating TABLEs
--DROP TABLE Customer;
CREATE TABLE Customer (
	CustomerID INT,
	CFName VARCHAR(80) NOT NULL,
	CMNName VARCHAR(80),
	CLName VARCHAR(80) NOT NULL,
	CType INT NOT NULL,
	CEmail VARCHAR(80) NOT NULL,
	CPhone VARCHAR(20) NOT NULL,
	CApt VARCHAR(50) NOT NULL,
	CStreet VARCHAR(80) NOT NULL,
	CCity VARCHAR(80) NOT NULL,
	CStateID char(2) NOT NULL,
	CCountry VARCHAR(80) NOT NULL,
	CZip BIGINT NOT NULL,
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (CStateID) REFERENCES States (StateID),
	CONSTRAINT chk_customer CHECK (CType in (01,10,11)),
	CONSTRAINT chk_customer1 CHECK (Czip<100000),
	CONSTRAINT chk_customer2 CHECK (CPhone<9999999999)
	);



--DROP TABLE Advertisement
CREATE TABLE Advertisement(
	AdvertID INT,
	ClientName VARCHAR(20) NOT NULL,
	ClientStateID char(2) NOT NULL
	PRIMARY KEY (AdvertID),
	FOREIGN KEY (ClientStateID) REFERENCES States (StateID)
	);

--DROP TABLE AdvertTracker
CREATE TABLE AdvertTracker(
	IssueID INT,
	AdvertID INT,
	AdvertisementCost INT,
	PRIMARY KEY (IssueID, AdvertID),
	);

--DROP TABLE Subscription
CREATE TABLE Subscription(
	SubID INT,
	SCustomerID INT,
	SSubMagtypeID INT,
	SubStartDate date,
	SubEndDate date
	PRIMARY KEY (SubID),
	FOREIGN KEY (SCustomerID) REFERENCES Customer (CustomerID),
	FOREIGN KEY (SSubMagTypeID) REFERENCES SubMagType (SubMagTypeID));

--INSERTing Data INTO the TABLEs
--States
INSERT INTO States VALUES ('NY','New York');
INSERT INTO States VALUES('AL','Alabama')
INSERT INTO States VALUES('AK','Alaska')
INSERT INTO States VALUES('AZ','Arizona')
INSERT INTO States VALUES('AR','Arkansas')
INSERT INTO States VALUES('CA','California')
INSERT INTO States VALUES('CO','Colorado')
INSERT INTO States VALUES('CT','Connecticut')
INSERT INTO States VALUES('DE','Delaware')
INSERT INTO States VALUES('DC','District of Columbia')
INSERT INTO States VALUES('FL','Florida')
INSERT INTO States VALUES('GA','Georgia')
INSERT INTO States VALUES('HI','Hawaii')
INSERT INTO States VALUES('ID','Idaho')
INSERT INTO States VALUES('IL','Illinois')
INSERT INTO States VALUES('IN','Indiana')
INSERT INTO States VALUES('IA','Iowa')
INSERT INTO States VALUES('KS','Kansas')
INSERT INTO States VALUES('KY','Kentucky')
INSERT INTO States VALUES('LA','Louisiana')
INSERT INTO States VALUES('ME','Maine')
INSERT INTO States VALUES('MT','Montana')
INSERT INTO States VALUES('NE','Nebraska')
INSERT INTO States VALUES('NV','Nevada')
INSERT INTO States VALUES('NH','New Hampshire')
INSERT INTO States VALUES('NJ','New Jersey')
INSERT INTO States VALUES('NM','New Mexico')
INSERT INTO States VALUES('NC','North Carolina')
INSERT INTO States VALUES('ND','North Dakota')
INSERT INTO States VALUES('OH','Ohio')
INSERT INTO States VALUES('OK','Oklahoma')
INSERT INTO States VALUES('OR','Oregon')
INSERT INTO States VALUES('MD','Maryland')
INSERT INTO States VALUES('MA','Massachusetts')
INSERT INTO States VALUES('MI','Michigan')
INSERT INTO States VALUES('MN','Minnesota')
INSERT INTO States VALUES('MS','Mississippi')
INSERT INTO States VALUES('MO','Missouri')
INSERT INTO States VALUES('PA','Pennsylvania')
INSERT INTO States VALUES('RI','Rhode Island')
INSERT INTO States VALUES('SC','South Carolina')
INSERT INTO States VALUES('SD','South Dakota')
INSERT INTO States VALUES('TN','Tennessee')
INSERT INTO States VALUES('TX','Texas')
INSERT INTO States VALUES('UT','Utah')
INSERT INTO States VALUES('VT','Vermont')
INSERT INTO States VALUES('VA','Virginia')
INSERT INTO States VALUES('WA','Washington')
INSERT INTO States VALUES('WV','West Virginia')
INSERT INTO States VALUES('WI','Wisconsin')
INSERT INTO States VALUES('WY','Wyoming')
select * from States

--INSERTing Data INTO the Customer TABLE
INSERT INTO Customer VALUES (1,'Axe','Sharp','Strength',1,'axe.strength@gmail.com','3152452536','3','710 South Beech St', 'Syracuse','NY', 'USA',13210);
INSERT INTO Customer VALUES(2,'Essie','Conrad','Vaill',11,'essie@vaill.com','9073450962','14225','Hancock Dr','Anchorage','AK','United States of America',99515)
INSERT INTO Customer VALUES(3,'Cruz','Cyril','Roudabush',11,'cruz@roudabush.com','6022524827','2202','S Central Ave','Phoenix','AZ','United States of America',85004)
INSERT INTO Customer VALUES(4,'Billie','Shelley','Tinnes',1,'billie@tinnes.com','2128895775','28','W 27th St','New York','NY','United States of America',10001)
INSERT INTO Customer VALUES(5,'Zackary','Rosalind','Mockus',1,'zackary@mockus.com','7324420638','286','State St ','Perth Amboy','NJ','United States of America',8861)
INSERT INTO Customer VALUES(6,'Rosemarie','Davis','Fifield',1,'rosemarie@fifield.com','8088368966','3131','N Nimitz Hwy','Honolulu','HI','United States of America',96819)
INSERT INTO Customer VALUES(7,'Bernard','Winnie','Laboy',10,'bernard@laboy.com','8154670487','22661','S Frontage Rd','Channahon','IL','United States of America',60410)
INSERT INTO Customer VALUES(8,'Sue','Trudy','Haakinson',1,'sue@haakinson.com','6029532753','9617','N Metro Pky','Phoenix','AZ','United States of America',85051)
INSERT INTO Customer VALUES(9,'Valerie','Deshawn','Pou',11,'valerie@pou.com','6103958743','7475','Hamilton Blvd ','Trexlertown','PA','United States of America',18087)
INSERT INTO Customer VALUES(10,'Lashawn','Claudio','Hasty',11,'lashawn@hasty.com','6269606738','815','S Glendora Ave','West Covina','CA','United States of America',91790)
INSERT INTO Customer VALUES(11,'Marianne','Sal','Earman',1,'marianne@earman.com','4078570431','6220','S Orange Blossom','Orlando','FL','United States of America',32809)

SELECT * FROM Customer

--INSERTING DATA INTO MAGAZINE TABLE
INSERT INTO Magazine VALUES ('VOG','VOGUE');
INSERT INTO Magazine VALUES ('VOG-E','VOGUE');

SELECT * FROM Magazine;

--Inserting data into Advertisement
INSERT INTO Advertisement VALUES (21,'AdCom Pvt Ltd','NY')
INSERT INTO Advertisement VALUES (22, 'TecAdvt Pvt Ltd', 'MI')
insert into Advertisement values (1,'Justina Pvt Ltd','TN')
insert into Advertisement values (2,'Mandy Pvt Ltd','OR')
insert into Advertisement values (3,'Conrad Pvt Ltd','OH')
insert into Advertisement values (4,'Cyril Pvt Ltd','CA')
insert into Advertisement values (5,'Shelley Pvt Ltd','TX')
insert into Advertisement values (6,'Rosalind Pvt Ltd','MN')
insert into Advertisement values (7,'Davis Pvt Ltd','OH')
insert into Advertisement values (8,'Winnie Pvt Ltd','TX')
insert into Advertisement values (9,'Trudy Pvt Ltd','CA')
insert into Advertisement values (10,'Deshawn Pvt Ltd','TX')
insert into Advertisement values (11,'Claudio Pvt Ltd','NJ')
insert into Advertisement values (12,'Sal Pvt Ltd','IN')
insert into Advertisement values (13,'Cristina Pvt Ltd','NY')
insert into Advertisement values (14,'Cary Pvt Ltd','OH')
insert into Advertisement values (15,'Haley Pvt Ltd','CO')
insert into Advertisement values (16,'Dorothea Pvt Ltd','NJ')
insert into Advertisement values (17,'Fannie Pvt Ltd','FL')
insert into Advertisement values (18,'Allyson Pvt Ltd','NJ')
insert into Advertisement values (19,'Roger Pvt Ltd','FL')
insert into Advertisement values (20,'Dollie Pvt Ltd','TX')

SELECT * FROM Advertisement

--INESSRTING DATA INTO ISSUE TABLE
INSERT INTO Issue VALUES(1,'VOG','January')
INSERT INTO Issue VALUES(2,'VOG','February')
INSERT INTO Issue VALUES(3,'VOG','March')
INSERT INTO Issue VALUES(4,'VOG','April')
INSERT INTO Issue VALUES(5,'VOG','May')
INSERT INTO Issue VALUES(6,'VOG','June')
INSERT INTO Issue VALUES(7,'VOG','July')
INSERT INTO Issue VALUES(8,'VOG','August')
INSERT INTO Issue VALUES(9,'VOG','September')
INSERT INTO Issue VALUES(10,'VOG','October')
INSERT INTO Issue VALUES(11,'VOG','November')
INSERT INTO Issue VALUES(12,'VOG','December')
INSERT INTO Issue VALUES(13,'VOG-E','January')
INSERT INTO Issue VALUES(14,'VOG-E','February')
INSERT INTO Issue VALUES(15,'VOG-E','March')
INSERT INTO Issue VALUES(16,'VOG-E','April')
INSERT INTO Issue VALUES(17,'VOG-E','May')
INSERT INTO Issue VALUES(18,'VOG-E','June')
INSERT INTO Issue VALUES(19,'VOG-E','July')
INSERT INTO Issue VALUES(20,'VOG-E','August')
INSERT INTO Issue VALUES(21,'VOG-E','September')
INSERT INTO Issue VALUES(22,'VOG-E','October')
INSERT INTO Issue VALUES(23,'VOG-E','November')
INSERT INTO Issue VALUES(24,'VOG-E','December')

SELECT * FROM Issue

--INSERTING DATA INTO ADVERTTRACKER TABLE
INSERT INTO AdvertTracker VALUES (1,1,6437)
INSERT INTO AdvertTracker VALUES (2,1,5339)
INSERT INTO AdvertTracker VALUES (3,1,8985)
INSERT INTO AdvertTracker VALUES (4,1,6473)
INSERT INTO AdvertTracker VALUES (5,2,6342)
INSERT INTO AdvertTracker VALUES (6,1,5561)
INSERT INTO AdvertTracker VALUES (7,1,5577)
INSERT INTO AdvertTracker VALUES (8,2,5917)
INSERT INTO AdvertTracker VALUES (9,1,9399)
INSERT INTO AdvertTracker VALUES (10,1,6797)
INSERT INTO AdvertTracker VALUES (11,2,9487)
INSERT INTO AdvertTracker VALUES (12,1,9125)
INSERT INTO AdvertTracker VALUES (13,1,6723)
INSERT INTO AdvertTracker VALUES (14,2,6406)
INSERT INTO AdvertTracker VALUES (15,1,7342)
INSERT INTO AdvertTracker VALUES (16,1,9096)
INSERT INTO AdvertTracker VALUES (17,2,8150)
INSERT INTO AdvertTracker VALUES (18,1,7946)
INSERT INTO AdvertTracker VALUES (19,1,8627)
INSERT INTO AdvertTracker VALUES (20,1,7661)
INSERT INTO AdvertTracker VALUES (21,1,7476)
INSERT INTO AdvertTracker VALUES (22,2,6634)
INSERT INTO AdvertTracker VALUES (23,2,6858)
INSERT INTO AdvertTracker VALUES (24,1,9466)

SELECT * FROM AdvertTracker

--INSERTING DATA INTO SUBMAGTYPE TABLE
INSERT INTO SubMagType VALUES(1,'VOG',3,69)
INSERT INTO SubMagType VALUES(2,'VOG',6,138)
INSERT INTO SubMagType VALUES(3,'VOG',12,276)
INSERT INTO SubMagType VALUES(4,'VOG-E',3,63)
INSERT INTO SubMagType VALUES(5,'VOG-E',6,126)
INSERT INTO SubMagType VALUES(6,'VOG-E',12,252)

SELECT * FROM SubMagType

--INSERTING DATA INTO SUBSCRIPTION TABLE
insert into Subscription values (1,10,2,'2018/10/11','2019/04/11')
insert into Subscription values (2,3,2,'2018/11/24','2019/05/24')
insert into Subscription values (3,6,6,'2018/07/24','2019/01/24')
insert into Subscription values (4,6,1,'2018/04/23','2018/10/23')
insert into Subscription values (5,5,4,'2018/08/08','2019/02/08')
insert into Subscription values (6,5,3,'2018/05/20','2018/11/20')
insert into Subscription values (7,10,2,'2018/03/29','2018/09/29')
insert into Subscription values (8,1,2,'2018/01/14','2018/07/14')
insert into Subscription values (9,5,3,'2018/09/08','2019/03/08')
insert into Subscription values (10,10,5,'2018/07/07','2019/01/07')
insert into Subscription values (11,6,5,'2018/08/08','2019/02/08')
insert into Subscription values (12,8,2,'2018/10/29','2019/04/29')
insert into Subscription values (13,5,5,'2018/05/21','2018/11/21')
insert into Subscription values (14,3,6,'2018/12/17','2019/06/17')
insert into Subscription values (15,4,4,'2018/05/22','2018/11/22')
insert into Subscription values (16,4,5,'2018/05/24','2018/11/24')
insert into Subscription values (17,2,4,'2018/10/02','2019/04/02')
insert into Subscription values (18,6,4,'2018/06/05','2018/12/05')
insert into Subscription values (19,10,3,'2018/06/27','2018/12/27')
insert into Subscription values (20,1,2,'2018/08/05','2019/02/05')

SELECT * FROM Subscription

--INSERT INTO SUBSCRIPTION TABLE
INSERT INTO EXPENDITURE VALUES (1,'VOG-E',487,880,1406,1900,2394)
INSERT INTO EXPENDITURE VALUES (2,'VOG',470,735,1004,1778,2191)
INSERT INTO EXPENDITURE VALUES (3,'VOG',432,528,1011,1977,2112)
INSERT INTO EXPENDITURE VALUES (4,'VOG-E',472,579,1467,1540,2162)
INSERT INTO EXPENDITURE VALUES (5,'VOG',365,860,1031,1717,2342)
INSERT INTO EXPENDITURE VALUES (6,'VOG-E',421,994,1272,1656,2216)
INSERT INTO EXPENDITURE VALUES (7,'VOG-E',356,933,1250,1666,2366)
INSERT INTO EXPENDITURE VALUES (8,'VOG-E',405,663,1317,1811,2196)
INSERT INTO EXPENDITURE VALUES (9,'VOG-E',405,687,1207,1832,2014)
INSERT INTO EXPENDITURE VALUES (10,'VOG',344,728,1142,1813,2466)
INSERT INTO EXPENDITURE VALUES (11,'VOG-E',495,873,1098,1586,2386)
INSERT INTO EXPENDITURE VALUES (12,'VOG-E',469,547,1168,1860,2025)
INSERT INTO EXPENDITURE VALUES (13,'VOG-E',356,512,1312,1595,2418)
INSERT INTO EXPENDITURE VALUES (14,'VOG-E',499,914,1064,1616,2367)
INSERT INTO EXPENDITURE VALUES (15,'VOG-E',289,742,1196,1700,2210)
INSERT INTO EXPENDITURE VALUES (16,'VOG',435,528,1435,1907,2037)
INSERT INTO EXPENDITURE VALUES (17,'VOG',363,529,1074,1734,2168)
INSERT INTO EXPENDITURE VALUES (18,'VOG-E',443,721,1443,1845,2160)
INSERT INTO EXPENDITURE VALUES (19,'VOG',497,580,1372,1566,2491)
INSERT INTO EXPENDITURE VALUES (20,'VOG-E',333,923,1238,1784,2374)

SELECT * FROM Expenditure


--Have created the expens table, start with inserting the new data