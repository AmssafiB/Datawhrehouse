CREATE TABLE dimDate  ( DateID  INTEGER NOT NULL IDENTITY (1,1) PRIMARY KEY,
                                                 Mounth numeric(2) Not NULL,
                                                 Quarter numeric(1) Not NULL,
						 Year numeric(4) Not NULL                                         
);

CREATE TABLE dimCarrier  ( UniqueCarrierID  VARCHAR(50 )NOT NULL PRIMARY KEY,
                         AirlineID INTEGER,
						 UniqueCarrierName varchar(100),
						 CarrierName varchar(100),
                         UniqueCarrierEntity VARCHAR(50),
						 UniqueCarrierRegion Varchar(1),  
						 Carrier Varchar(100),  	
						 CarrierGroup INTEGER,
						 CarrierGroupNew INTEGER 

);


CREATE TABLE dimAirport  ( AirportID  INTEGER NOT NULL PRIMARY KEY,
                                                 AirportSeqID INTEGER Not NULL,
						 AirportName varchar(100) Not NULL,
                         Marketcity INTEGER ,
						 City Varchar(100) Not NULL,
						 Country Varchar(100) Not NULL,
						 WCA Varchar(100) Not NULL,	

);



CREATE TABLE dimAirCraft  ( AirCraftID  INTEGER NOT NULL IDENTITY (1,1) PRIMARY KEY,
                                                 AirCraftGroupt INTEGER Not NULL,
						 AirCraftType INTEGER Not NULL,
                                                 AirCraftConfig INTEGER Not NULL,
						 

);
CREATE TABLE factFlight( 
						DateID INTEGER FOREIGN KEY REFERENCES dimDate(DateID),
						UniqueCarrierID  VARCHAR(50) FOREIGN KEY REFERENCES dimCarrier(UniqueCarrierID),
                                                OriginAirportID INTEGER FOREIGN KEY REFERENCES dimAirport(AirportID),
						DestAirportID INTEGER FOREIGN KEY REFERENCES dimAirport(AirportID),  
					        DimAirCraft INTEGER FOREIGN KEY REFERENCES dimAirCraft(AirCraftID), 
                                                DepScheduled	REAL ,
						DepPerformed	REAL ,
						Payload	REAL ,
						Seats	REAL ,
						Passengers	REAL ,
						Freight	REAL ,
						Mail	REAL ,
						Distance	REAL ,
						RampTime	REAL ,
						AirTime REAL,
						DistanceGroup Varchar(50),
						Class Varchar(50)
						
						PRIMARY KEY (DateID,UniqueCarrierID,OriginAirportID,DestAirportID,DimAirCraft)
						 

);

