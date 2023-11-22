USE MASTER 
GO
DROP DATABASE IF EXISTS Bird_Farm_Shop
GO
Create database Bird_Farm_Shop
GO
use Bird_Farm_Shop

GO
CREATE TABLE Category
(
  CategoryID INT NOT NULL,
  Category_Name NVARCHAR(50) NOT NULL,
  PRIMARY KEY (CategoryID)
);

GO
CREATE TABLE Roles
(
  RoleID INT NOT NULL,
  RoleName NVARCHAR(50) NOT NULL,
  PRIMARY KEY (RoleID)
);

GO
CREATE TABLE Service
(
  ServiceID INT NOT NULL,
  ServiceName NVARCHAR(50) NOT NULL,
  PRIMARY KEY (ServiceID)
);

GO
CREATE TABLE Account
(
  AccountID NVARCHAR(50) NOT NULL,
  Password NVARCHAR(50),
  FullName NVARCHAR(50) NOT NULL,
  Email NVARCHAR(50),
  Date_created DATE NOT NULL,
  CreateBy NVARCHAR(50) NOT NULL,
  RoleID INT NOT NULL,
  Status bit NOT NULL,
  PRIMARY KEY (AccountID),
  FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

GO
CREATE TABLE Product_Type
(
  Product_TypeID INT NOT NULL,
  Product_Type_Name NVARCHAR(50),
  PRIMARY KEY (Product_TypeID)
);

GO
CREATE TABLE Products
(
  ProductID NVARCHAR(50) NOT NULL,
  Product_Name NVARCHAR(50) NOT NULL,
  CategoryID INT NOT NULL,
  Product_TypeID int,
  Dad_Bird_ID NVARCHAR(50),
  Mom_Bird_ID NVARCHAR(50),
  Image NVARCHAR(150),
  Age NVARCHAR(50),
  Color NVARCHAR(50),
  Gender NVARCHAR(50),
  Quantity_Available INT CHECK(Quantity_Available >= 0) NOT NULL,
  Quantity_AreMating INT CHECK(Quantity_AreMating >= 0),
  Quantity_Sold INT  CHECK(Quantity_Sold >= 0),
  Quantity_MaleBird INT,
  Quantity_FemaleBird INT,
  Price FLOAT NOT NULL,
  Discount FLOAT,
  Characteristics NVARCHAR(125),
  Detail NVARCHAR(max),
  Date_created DATE NOT NULL,
  Status bit NOT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
  FOREIGN KEY (Product_TypeID) REFERENCES Product_Type(Product_TypeID),
  FOREIGN KEY (Dad_Bird_ID) REFERENCES Products(ProductID),
  FOREIGN KEY (Mom_Bird_ID) REFERENCES Products(ProductID)
);

GO
CREATE TABLE Customers
(
  CustomerID NVARCHAR(50) NOT NULL,
  AccountID NVARCHAR(50) NOT NULL,
  FullName NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(20),
  Email NVARCHAR(50),
  Phone_Number NVARCHAR(50),
  Address NVARCHAR(125),
  City NVARCHAR(50),
  DOB DATE,
  Date_created DATE NOT NULL,
  Status bit NOT NULL,
  PRIMARY KEY (CustomerID),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

GO
CREATE TABLE Staffs
(
  StaffID NVARCHAR(50) NOT NULL,
  Name NVARCHAR(50),
  Email NVARCHAR(125),
  Phone_Number NVARCHAR(50),
  DOB DATE,
  Gender NVARCHAR(50),
  ManagerID NVARCHAR(50) NOT NULL,
  AccountID NVARCHAR(50) NOT NULL,
  Date_created DATE NOT NULL,
  Status bit NOT NULL,
  PRIMARY KEY (StaffID),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
  FOREIGN KEY (StaffID) REFERENCES Staffs(StaffID)
);

GO
CREATE TABLE Orders
(
  OrderID NVARCHAR(50) NOT NULL,
  ServiceID INT NOT NULL,
  AccountID NVARCHAR(50) NOT NULL,
  StaffID NVARCHAR(50),
  Form_Receipt NVARCHAR(50),
  ShipAddress NVARCHAR(125),
  ShipCity NVARCHAR(50),
  PhoneNumber NVARCHAR(50),
  ReceiptDate Date,
  Discount FLOAT CHECK(Discount >= 0) ,
  Delivery_charges FLOAT,
  Deposit_Price FLOAT NOT NULL,
  Total_Order FLOAT NOT NULL,
  Pay_with  NVARCHAR(50),
  OrderDate DATE NOT NULL,
  Note NVARCHAR(500),
  Status NVARCHAR(50) NOT NULL,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
  FOREIGN KEY (StaffID) REFERENCES Staffs(StaffID),
  FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
);

GO
CREATE TABLE Order_Details
(
  OrderID NVARCHAR(50) NOT NULL,
  ProductID NVARCHAR(50),
  Price FLOAT NOT NULL,
  Quantity_Buy INT NOT NULL CHECK(Quantity_Buy >= 0),
  PRIMARY KEY (OrderID,ProductID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
);

GO
CREATE TABLE Bird_Nest_Tracking
(
  Bird_Nest_ID NVARCHAR(50) NOT NULL,
  OrderID NVARCHAR(50) NOT NULL,
  Bird_Nest_Name NVARCHAR(50),
  Eggs_Quantity INT NOT NULL,
  Male_Babybird INT NOT NULL,
  Female_Babybird INT NOT NULL,
  AccountID NVARCHAR(50) NOT NULL,
  ServiceID INT NOT NULL,
  OrderDate DATE NOT NULL,
  LastUpdateDate Date NOT NULL,
  Status NVARCHAR(50) NOT NULL,
  PRIMARY KEY (Bird_Nest_ID),
  FOREIGN KEY (OrderID ) REFERENCES Orders(OrderID ),
  FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
  FOREIGN KEY (AccountID ) REFERENCES Account(AccountID),
);

GO
CREATE TABLE BirdNestDetail_Tracking
(
  Bird_Nest__Tracking_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Bird_Nest_ID NVARCHAR(50) NOT NULL,
  NOTE NVARCHAR(500),
  Image NVARCHAR(250),
  LastUpdateDate Date NOT NULL,
  FOREIGN KEY (Bird_Nest_ID) REFERENCES Bird_Nest_Tracking(Bird_Nest_ID),
);

INSERT INTO Roles(RoleID,RoleName) VALUES 
(1,'Admin'),(2,'Manager'),(3,'Staff'),(4,'Customer');

INSERT INTO Account(AccountID,Password,FullName,Email,Date_created,CreateBy, RoleID,Status ) VALUES 
('A100', null,'Quang Dũng', 'lequangdung232@gmail.com', CAST(N'2023/10/24' AS DATE), 'Goole', 3, 'true');
INSERT INTO Account(AccountID,Password,FullName,Email,Date_created,CreateBy, RoleID,Status ) VALUES 
('A0', null,'Bird Farm Shop', 'thebird.farm.1704@gmail.com', CAST(N'2023/10/24' AS DATE), 'Google', 1, 'true');

INSERT INTO Staffs(StaffID,AccountID,Name,Email,Phone_Number,DOB,Gender,ManagerID,Date_created,Status ) VALUES 
('S1', 'A100','Quang Dũng', 'lequangdung232@gmail.com',null,null,null,'S2', CAST(N'2023/10/24' AS DATE), 'true');


INSERT INTO Service(ServiceID, ServiceName) VALUES 
(1,'Sell product'),(2,'Pair shop birds upon request');

INSERT INTO Category (CategoryID, Category_Name) VALUES 
(1,'Parrot'),(2,'Macaw'),(3,'Pigeon'),(4,'Jenday Conure'),(5,'Parakeet'),(6,'Dove'),(7,'Conure'),(8,'Cockatiel'),
(9,'Eclectus'),(10,'Finch'),(11,'Cockatoo'),(12,'Canary'),(13,'Toucan'),(14,'Caique'),(15,'Duck'),(16,'Amazon Parrot'),(17,'Goose');

INSERT INTO Product_Type(Product_TypeID, Product_Type_Name) VALUES 
(1,'Bird'),(2,'Bird Nest');

INSERT INTO Products (ProductID,CategoryID,Product_Name,Age,Color,Gender,Image,Quantity_Available,Price,Discount,Characteristics,Detail,Date_created,Status) VALUES
('B01',1,'Turquoise parrot','Young','Yellow, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B1.jpg',10,5000000,0,'Quite','Its wings are predominantly blue with red shoulders. The female is generally duller and paler, with a pale green breast and yellow belly, and lacks the red wing patch.',CAST(N'2023/09/10' AS DATE),'true'), 
('B02',1,'Yellow-faced parrot','Baby','Yellow, Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B2.jpg',10,6000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/08/10' AS DATE),'true'), 
('B03',1,'Yellow-faced parrot','Baby','Yellow, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B3.jpg',10,6000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B04',1,'Senegal parrot','Adult','Green, Yellow, grey','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B4.jpg',10,4000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B05',1,'Fuetes parrot','Young','Green, Yellow, Grey','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B5.jpg',10,5000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B06',1,'Congo African Parrot','Baby','Greys','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B6.jpg',10,10800000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/06' AS DATE),'true'), 
('B07',1,'Parrotlet','Baby','Blue, Black','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B7.jpg',10,14200000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/07' AS DATE),'true'), 
('B08',1,'Parrotlet','Baby','White','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B8.jpg',10,17600000,5,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/08' AS DATE),'true'), 
('B09',2,'Red-and-green macaw','Adult','Rainbow','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B9.jpg',10,10000000,0,'Talking','While the breast is bright red, the upper-wing covert feathers is mostly green. In addition, the macaw has characteristic red lines around the eyes formed by rows of tiny feathers on the otherwise bare white skin patch.',CAST(N'2021/02/02' AS DATE),'true'), 
('B10',10,'Zebra Finch','Adult','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B10.jpg',10,2600000,0,'Exotic','The adult green rosella has a yellow head and underparts with blue cheeks and red band on the forehead and upper lores. The yellow feathers of the forecrown, lower lores, cheeks, chest and thighs can have red markings, while the yellow feathers of the sides and rear of the head and neck, and the underparts have dark brown bases.',CAST(N'2022/10/03' AS DATE),'true'), 
('B11',2,'Red-bellied macaw','mature','Red, Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B11.jpg',10,2000000,0,'Cute','The plumage is mostly green. The chin, throat and upper chest are greyish with some green scalloping, and the lower abdomen has a large maroon patch.',CAST(N'2023/01/01' AS DATE),'true'),
('B12',2,'Chestnut-fronted macaw','Adult','Mostly Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B12.jpg',10,4800000,0,'Cute','The chestnut-fronted or severe macaw is mostly green in colour with patches of red and blue on the wings. The head has a chestnut brown patch just above the beak. The beak is black and the patches around the eyes are white with lines of small black feathers.',CAST(N'2023/01/01' AS DATE),'true'), 
('B13',2,'Chestnut-fronted macaw','Adult','Mostly Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B13.jpg',10,4800000,0,'Cute','The chestnut-fronted or severe macaw is mostly green in colour with patches of red and blue on the wings. The head has a chestnut brown patch just above the beak. The beak is black and the patches around the eyes are white with lines of small black feathers.',CAST(N'2023/01/01' AS DATE),'true'),
('B14',2,'Scarlet macaw','Mature','Rainbow','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B14.jpg',10,9600000,0,'Fancy','The plumage is mostly scarlet, but the rump and tail-covert feathers are light blue, the greater upper wing coverts are yellow, the upper sides of the flight feathers of the wings are dark blue as are the ends of the tail feathers.',CAST(N'2023/07/24' AS DATE),'true'), 
('B15',2,'Hyacinth macaw','Mature','Blue','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B15.jpg',10,2000000,0,'Singing','The tail is long and pointed. Its feathers are entirely blue, lighter above. However, the neck feathers can sometimes be slightly grey.',CAST(N'2023/03/05' AS DATE),'true'), 
('B16',2,'Hyacinth macaw','Mature','Blue','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B16.jpg',10,2000000,0,'Singing','The tail is long and pointed. Its feathers are entirely blue, lighter above. However, the neck feathers can sometimes be slightly grey.',CAST(N'2023/03/05' AS DATE),'true'),
('B17',2,'Blue-throated macaw','Young','Blue','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B17.jpg',10,6000000,5,'Talking','The eye color of a nestling is initially black and changes to brown soon after the eyes open. Between one and three years old, the eyes will turn grey, then white. As the macaw matures, the iris turns yellow and the amount of gold increases with age after 10 years.',CAST(N'2022/12/25' AS DATE),'true'), 
('B18',2,'Mini Macaw','Baby','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B18.jpg',10,8000000,0,'Talking','The eye color of a nestling is initially black and changes to brown soon after the eyes open. Between one and three years old, the eyes will turn grey, then white. As the macaw matures, the iris turns yellow and the amount of gold increases with age after 10 years.',CAST(N'2022/12/26' AS DATE),'true'),
('B19',2,'Mini Macaw','Baby','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B19.jpg',10,8000000,0,'Talking','The eye color of a nestling is initially black and changes to brown soon after the eyes open. Between one and three years old, the eyes will turn grey, then white. As the macaw matures, the iris turns yellow and the amount of gold increases with age after 10 years.',CAST(N'2022/12/27' AS DATE),'true'),
('B20',3,'Fantail Pigeon','Baby','Blue, Green, Orange','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B20.jpg',2,60000000,15,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/24' AS DATE),'true'), 
('B21',5,'Green Parakeet','Young','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B21.jpg',5,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B22',5,'Green Parakeet','Young','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B22.jpg',2,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/26' AS DATE),'true'),
('B23',6,'Ringneck Dove','Young','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B23.jpg',10,4000000,0,'Singing','They have blue feathers on the forehead above the beak and yellow on the face and crown.',CAST(N'2021/01/30' AS DATE),'true'), 
('B24',6,'Ringneck Dove','Young','Black','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B24.jpg',10,2000000,0,'Singing','They have blue feathers on the forehead above the beak and yellow on the face and crown.',CAST(N'2021/01/31' AS DATE),'true'),
('B25',6,'Diamond Dove','Mature','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B25.jpg',20,10000000,0,'Singing','They have blue feathers on the forehead above the beak and yellow on the face and crown.',CAST(N'2021/02/01' AS DATE),'true'),
('B26',6,'Diamond Dove','Young','White, Brown','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B26.jpg',3,8000000,15,'Singing','They have blue feathers on the forehead above the beak and yellow on the face and crown.',CAST(N'2021/02/02' AS DATE),'true'),
('B27',6,'Ringneck Dove','Baby','White, Brown','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B27.jpg',2,10000000,0,'Singing','They have blue feathers on the forehead above the beak and yellow on the face and crown.',CAST(N'2021/02/02' AS DATE),'true'),
('B28',6,'Ringneck Dove','Young','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B28.jpg',2,14000000,0,'Talking','It is mainly green with some blue feathers in its wings.The green feathers are edged with a terminal black rim. Its lower face, chin and throat are rosy pink, and its forehead and eye-rings are white.',CAST(N'2022/12/25' AS DATE),'true'), 
('B29',13,'Black Toucan','Mature','Black','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B29.jpg',2,290000000,0,'Talking','It is mainly green with some blue feathers in its wings.The green feathers are edged with a terminal black rim. Its lower face, chin and throat are rosy pink, and its forehead and eye-rings are white.',CAST(N'2022/12/26' AS DATE),'true'), 
('B30',13,'Emerald Toucanet','Adult','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B30.jpg',2,20000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B31',13,'Emerald Toucanet','Adult','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B31.jpg',2,20000000,0,'Talking','It is mainly green with some blue feathers in its wings.The green feathers are edged with a terminal black rim. Its lower face, chin and throat are rosy pink, and its forehead and eye-rings are white.',CAST(N'2022/12/26' AS DATE),'true'),
('B32',7,'Jenday Conure','Adult','Yellow, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B32.jpg',2,24000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B33',7,'Jenday Conure','Mature','Yellow, Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B33.jpg',2,24000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B34',7,'Nanday Conure','Baby','Green, Black','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B34.jpg',3,10000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B35',7,'Cherry Head Conure','Adult','Green, Red','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B35.jpg',5,8000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B36',7,'Crimson Bellied Conure','Baby','Green, Red, Black','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B36.jpg',1,40000000,20,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B37',7,'Half Moon Conure','Young','Green, Black','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B37.jpg',4,6000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B38',7,'Queen of Bavaria (Golden Conure)','Baby','Yellow, Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B38.jpg',3,11200000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B39',8,'Grey Cockatiel','Young','Grey','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B39.jpg',1,20000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B40',8,'yellow Cockatiel','Young','Yellow','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B40.jpg',1,20000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B41',8,'White Cockatiel Bird','Baby','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B41.jpg',2,22000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B42',9,'Wanted Blue Eclectus','Young','White, Blue','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B42.jpg',2,24000000,15,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B43',9,'Vosmaeri Eclectus','Young','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B43.jpg',4,14000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'),
('B44',9,'Red Sided Eclectus','Mature','Red','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B44.jpg',3,18000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B45',9,'Red Sided Eclectus','Baby','Red','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B45.jpg',2,18000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B46',9,'Red Sided Eclectus','Young','Red, Blue','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B46.jpg',3,16000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B47',13,'Toco Toucan','Young','Black, White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B47.jpg',1,40000000,10,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'),
('B48',13,'Livingstone Turaco','Young','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B48.jpg',2,19980000,5,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B49',12,'Spanish Timbrado Canary','Young','Black, White','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B49.jpg',10,4000000,15,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B50',12,'Spanish Timbrado Canary','Mature','Yellow, Black','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B50.jpg',10,5000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B51',12,'Red Factor Canary Bird','Baby','Orange','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B51.jpg',3,24000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B52',12,'Red Factor Canary Bird','Baby','Orange','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B52.jpg',1,24000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B53',12,'Gorgeous Red Bronze Canary','Baby','Red','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B53.jpg',3,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B54',12,'Crested Canary','Adult','Yellow, White','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B54.jpg',3,11000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B55',13,'Spanish Timbrado Canary','Young','Black','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B55.jpg',1,20000000,30,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B56',10,'Lady Gouldian Finch','Young','White, Purple, Yellow','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B56.jpg',3,10000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B57',10,'Lady Gouldian Finch','Young','Blue, Red, Yellow','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B57.jpg',3,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B58',10,'Lady Gouldian Finch','Adult','Black, Purole, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B58.jpg',2,24000000,5,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B59',10,'Cordon Blue Finch','Baby','Black, Blue','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B59.jpg',1,8000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'), 
('B60',10,'Java Rice Finch','Young','White','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B60.jpg',10,6000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B61',10,'Java Rice Finch','Young','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B61.jpg',10,6000000,30,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), ('B62',10,'Society Finch','Adult','Brown','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B62.jpg',10,4000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B63',11,'Citron Crested Cockatoo','Adult','White','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B63.jpg',1,120000000,10,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), ('B64',11,'Rose Breasted Cockatoo','Adult','Red','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B64.jpg',2,140000000,10,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B65',11,'Triton Cockatoo','Young','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B65.jpg',2,28000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), ('B66',11,'Umbrella Cockatoo','Baby','White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B66.jpg',4,30000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B67',10,'Star Finch','Adult','Yellow','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B67.jpg',10,10000000,0,'Playful','Their face and belly are orange with red around the ears. The base of the greater wing coverts, tertials, and base of the primaries are green, while the secondaries, tips of the primaries, and most of the primary coverts are dark blue.',CAST(N'2022/12/25' AS DATE),'true'),
('B68',4,'Breeding Pair Jenday','Mature','Yellow, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B68.jpg',2,29000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B69',7,'Green Conure Varieties','Mature','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B69.jpg',2,11500000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B70',7,'Black Cap Breeding','Mature','Black, Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B70.jpg',6,11500000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B71',13,'Keel Bill Toucan Breedig','Mature','Black, Yellow','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B71.jpg',4,120000000,20,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'),
('B72',14,'Male Caique','Mature','Black, Yellow','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B72.jpg',2,30000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B73',14,'White Bellied Caique','Mature','Yellow, Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B73.jpg',2,20000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B74',1,'Medium Green Parrot','Baby','Green, Red','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B74.jpg',1,260000000,0,'Exotic, Fancy, Handfed','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B75',1,'African Grey Parrot','Baby','Grey','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B75.jpg',1,74000000,0,'QuiteCute, Fancy, Handfed, Playful','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B76',5,'Budgerigar Parakeet','Young','Grey','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B76.jpg',25,2000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B77',5,'Budgerigar Parakeet','Young','Grey','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B77.jpg',10,2000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B78',5,'Medium Blue Parakeet','Young','Blue, Green, Orange','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B78.jpg',2,32000000,0,'Cute, Exotic, Handfed','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B79',5,'Medium Blue Ringneck Parakeet ','Baby','Blue','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B79.jpg',2,29000000,0,'Cute, Exotic, Handfed','Their face and belly are orange with red around the ears. The base of the greater wing coverts, tertials, and base of the primaries are green, while the secondaries, tips of the primaries, and most of the primary coverts are dark blue.',CAST(N'2022/12/25' AS DATE),'true'), 
('B80',7,'Medium Yellow Sun Conure','Baby','Yellow','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B80.jpg',4,13000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B81',7,'Medium Yellow Sun Conure','Baby','Yellow','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B81.jpg',4,13000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B82',13,'Green Billed Toucan','Young','Black, Yellow, White','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B82.jpg',1,200000000,10,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B83',15,'Pekin Duck','Adult','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B83.jpg',20,200000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'),
('B84',15,'Pekin Duck','Adult','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B84.jpg',20,200000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B85',15,'Muscovy Ducks','Adult','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B85.jpg',10,300000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B86',15,'Muscovy Ducks','Adult','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B86.jpg',10,300000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B87',16,'Yellow Nape Amazon','Young','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B87.jpg',2,40000000,10,'Exotic, Handfed, Playful, Talking','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B88',16,'Yellow Headed Amazon Babies','Baby','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B88.jpg',2,76000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B89',16,'Yellow Headed Amazon Babies','Baby','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B89.jpg',2,76000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'), 
('B90',16,'Blue Front Amazon Parrot','Baby','Green','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B90.jpg',2,52000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B91',16,'Orange-Winged Amazon Parrot','Adult','Green','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B91.jpg',2,20000000,0,'Playful','Their face and belly are orange with red around the ears. The base of the greater wing coverts, tertials, and base of the primaries are green, while the secondaries, tips of the primaries, and most of the primary coverts are dark blue.',CAST(N'2022/12/25' AS DATE),'true'), 
('B92',17,'Goose','Young','Black','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B92.jpg',20,200000,10,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B93',17,'Sebastopol Goose','Young','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B93.jpg',10,15100000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B94',17,'Sebastopol Goose','Young','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B94.jpg',10,10000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B95',17,'Sebastopol Goose','Baby','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B95.jpg',10,10000000,0,'Exotic','Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/01/01' AS DATE),'true'),
('B96',16,'Sebastopol Goose','Baby','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B96.jpg',10,10000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'),
('B97',16,'Sebastopol Goose','Adult','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B97.jpg',10,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'), 
('B98',16,'Sebastopol Goose','Adult','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B98.jpg',10,10000000,0,'Funny','It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2021/02/02' AS DATE),'true'),
('B99',16,'Sebastopol Goose','Mature','While','Female','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B99.jpg',10,10000000,0,'Quite','Their upperparts are green with pale fringes on the mantle feathers. Their throat and breast are green with a golden-olive tinge and their belly, thighs, and undertail coverts are yellowish green, their belly has variable amounts of dull red.',CAST(N'2023/03/05' AS DATE),'true'), 
('B100',16,'Sebastopol Goose','Mature','While','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B100.jpg',10,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true'),
('B101',9,'Red Sided Eclectus','Baby','Red','Male','https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_image/B45.jpg',10,10000000,0,'Playful','The blue-fronted lorikeets usually live in pairs, but may form groups up to 10 individuals. They are feed bananas and milk.',CAST(N'2023/07/25' AS DATE),'true');;;;;;

update Products
	set Product_TypeID = 1, Quantity_AreMating = 0, Quantity_MaleBird=0,Quantity_FemaleBird=0

INSERT INTO Products (ProductID,Dad_Bird_ID,Mom_Bird_ID,Product_TypeID,Product_Name,CategoryID,Quantity_Available,Quantity_MaleBird,Quantity_FemaleBird,Price,Discount,Detail,Date_Created,Image,Status) VALUES 
('B102','B12','B13',2,'Chestnut-fronted Macaw Nest',2,1,1,2,1000000,0,'Its wings are predominantly blue with red shoulders. The female is generally duller and paler, with a pale green breast and yellow belly, and lacks the red wing patch.',CAST(N'2023/09/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Chestnut-fronted Macaw Nest.jpg','true'),
('B103','B21','B22',2,'Green Parakeet Nest',5,1,4,2,2000000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/09/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Green Parakeet Nest.jpg','true'),
('B104','B77','B76',2,'Budgerigar Parakeet Nest',5,1,3,5,3000000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/09/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Budgerigar Parakeet Nest.jpg','true'),
('B105','B23','B24',2,'Ringneck Dove Nest',6,1,3,0,1000000,0,'Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/05/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Ringneck Dove Nest.jpg','true'),
('B106','B72','B73',2,'Caique Nest',14,1,3,3,3000000,0,'Its wings are predominantly blue with red shoulders. The female is generally duller and paler, with a pale green breast and yellow belly, and lacks the red wing patch.',CAST(N'2023/05/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Caique Nest.jpg','true'),
('B107','B56','B57',2,'Gouldian Finch Nest',10,1,2,1,1000000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/05/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Gouldian Finch Nest.jpg','true'),
('B108','B61','B60',2,'Java Rice Finch Nest',10,1,3,2,1200000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/05/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Java Rice Finch Nest.jpg','true'),
('B109','B62','B58',2,'Society Finch Nest',10,1,1,2,1200000,0,'Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/10/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Society Finch Nest.jpg','true'),
('B110','B70','B69',2,'Conure Nest',7,1,2,2,1200000,0,'Its wings are predominantly blue with red shoulders. The female is generally duller and paler, with a pale green breast and yellow belly, and lacks the red wing patch.',CAST(N'2023/10/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Conure Nest.jpg','true'),
('B111','B33','B32',2,'Jenday Conure Nest',7,1,1,2,1200000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/10/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Jenday Conure Nest.jpg','true'),
('B112','B30','B31',2,'Emerald Toucanet Nest',13,1,1,0,400000,0,'It is a predominantly green and yellow-plumaged bird with a yellow head.',CAST(N'2023/10/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Emerald Toucanet Nest.jpg','true'),
('B113','B50','B49',2,'Spanish Timbrado Canary Nest',12,1,0,3,1000000,0,'Adults have a charcoal grey head, grey beak, bright yellow irises, green back and throat, and yellow underparts and rump.',CAST(N'2023/10/10' AS DATE),'https://bird-farm-shop.s3.ap-southeast-1.amazonaws.com/Bird_Nest_Image/Spanish Timbrado Canary Nest.jpg','true');;;
update Products
	set Quantity_Sold = 0, Discount = Discount/100