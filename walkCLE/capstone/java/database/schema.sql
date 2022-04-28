
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;



CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('donny','$2a$10$k2T04aaHbZbgozHMDM633uUD31avWbXdug52Jd3dRmrpo5HR6cRqC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('patti','$2a$10$k2T04aaHbZbgozHMDM633uUD31avWbXdug52Jd3dRmrpo5HR6cRqC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('kate','$2a$10$k2T04aaHbZbgozHMDM633uUD31avWbXdug52Jd3dRmrpo5HR6cRqC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('payton','$2a$10$k2T04aaHbZbgozHMDM633uUD31avWbXdug52Jd3dRmrpo5HR6cRqC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('sedric','$2a$10$k2T04aaHbZbgozHMDM633uUD31avWbXdug52Jd3dRmrpo5HR6cRqC','ROLE_USER');

COMMIT TRANSACTION;




BEGIN TRANSACTION;

DROP TABLE IF EXISTS locations;
DROP SEQUENCE IF EXISTS seq_location_id;

CREATE SEQUENCE seq_location_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE locations (
	location_id int DEFAULT nextval('seq_location_id'::regclass) NOT NULL,
	name varchar(50) NOT NULL UNIQUE,
	description varchar(2000) NOT NULL,
	sunday_hour_open time NOT NULL,
	sunday_hour_closed time NOT NULL,
	monday_hour_open time NOT NULL,
	monday_hour_closed time NOT NULL,
	tuesday_hour_open time NOT NULL,
	tuesday_hour_closed time NOT NULL,
	wednesday_hour_open time NOT NULL,
	wednesday_hour_closed time NOT NULL,
	thursday_hour_open time NOT NULL,
	thursday_hour_closed time NOT NULL,
	friday_hour_open time NOT NULL,
	friday_hour_closed time NOT NULL,
	saturday_hour_open time NOT NULL,
	saturday_hour_closed time NOT NULL,
	social_media varchar(100),
	category varchar(50) NOT NULL,
	latitude numeric(20, 10) NOT NULL,
	longitude numeric(20, 10) NOT NULL,
	CONSTRAINT PK_location PRIMARY KEY (location_id)
);

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Cleveland Museum of Art', 'CMA was founded in 1913 and opened to the public on June 6, 1916, welcoming 191,547 visitors during its Inaugural Exhibition. The museum was founded by Hinman B. Hurlbut, John Huntington, and Horace Kelley. Jeptha H. Wade II donated land which the museum sits on today. The museum collection houses almost 45,000 objects. The museum offers many programs for children and adults.', '10:00:00', '17:00:00', '00:00:00', '00:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '21:00:00','10:00:00', '17:00:00', 'www.clevelandart.org', 'arts',  '41.5090', '-81.6121');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Cleveland Cultural Gardens', 'The Cleveland Cultural Gardens located along East Boulevard and Martin Luther King Jr. Drive, is a collection of 33 distinct public gardens. Part of the 254 acre Rockefeller Park, it is one of the citys oldest and most tranquil centers. The land was donated by  philanthropist John D. Rockefeller in 1896. In 1916 the cultural gardens began with the establishment of the Shakespeare Garden and have been sponsored and developed by the ethnic communities for which they are named.
','00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.culturalgardens.org', 'arts',  '41.5190', '-81.6182');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Rocket Mortgage Fieldhouse', 'Rocket Mortgage FieldHouse is home to the Cleveland Cavaliers, Cleveland Monsters and is a secondary arena for the Cleveland State Vikings. It was opened in October 1994. The seating capacity is 19.432 for its basketball configuration and for ice hockey seats up to 18,926. 
','09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www.rocketmortgagefieldhouse.com', 'sports',  '41.4965', '-81.6881');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Progressive Field', 'Home to the Cleveland Guardians baseball team, it is part of the Gateway Sports and Entertainment Complex. Originally opened as Jacobs Field in 1994 the name was changed in 2008 to Progressive Field. The original seating capacity when it opened in 1995 was 42,865, but as of 2021 after multiple renovations the seating capacity is 34, 830. 

', '09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www..mlb.com/guardians/ballpark', 'sports',  '41.4962', '-81.6852');
 
INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('First Energy Stadium', 'Home to the Cleveland Browns. It is a multipurpose stadium that opened in 1999 with a seating capacity of 67,431.  The eastern section is designated as the Dawg Pound. The playing surface consists of Kentucky Bluegrass over an extensive heating system designed to prevent freezing and to extend the surface to maximize usage.

', '09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www.firstenergystadium', 'sports',  '41.5061', '-81.6995');
 
INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Severance Hall', 'Severance Hall is a concert hall located in the University Circle section of Cleveland, Ohio. Opened in 1931, Severance Hall was named after patrons John L. Severance and his wife, Elisabeth Huntingdon DeWitt Severance, and serves as the home of The Cleveland Orchestra.

', '09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www.clevelandorchestra.com', 'theater',  '41.5060', '-81.6095');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Playhouse Square', 'Playhouse Square is Cleveland’s Theatrical Center. It is the largest performing arts center in the country outside of New York. It is home to the Cleveland Playhouse, State Theater, Ohio Theater, Allen Theater, Hanna Theater and Kennedy’s Cabaret. Playhouse Square opened in 1921 and was a successful vaudeville and silent movie venue. Post-depression era, the theaters fell into decline and disrepair. The theaters were saved by the forming of the Playhouse Square Association which was founded in 1970. Restoration began in July of 1982 to save all the theaters, adding the Hanna Building in 1999. 

', '09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Market Garden Brewery', 'American gastropub with a patio, house beers, a distillery & a menu of creative sandwiches & tacos.

', '11:00:00', '22:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','16:00:00', '22:00:00','16:00:00', '22:00:00','11:00:00', '01:00:00','11:00:00', '01:00:00', 'www.marketgardenbrewery.com', 'food',  '41.4851', '-81.7034');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Little Italy', 'In Little Italy, the main strip on Mayfield Road is full of old-school Italian cafes, bakeries and pizzerias, as well as elegant trattorias where singers perform opera arias. Indie art galleries and Italian food and wine shops are also dotted around the area. Colorful murals depict the stories of Italian immigrants.
', '09:00:00', '17:00:00', '09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00','09:00:00', '17:00:00', 'www.littleitalycle.com', 'food',  '41.5090', '-81.5987');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Edgewater', 'Edgewater park was purchased by the City of Cleveland in 1894 along the scenic shores of Lake Erie. The park spans over 130 acres of land and 9000 feet of the Lake Erie shoreline. The park features dog and swim beaches, a fishing pier and a yacht club and multiple programs and events. It provides access to boating, biking and cycling, trail access and picnicing pavillions .

', '06:00:00', '23:00:00', '06:00:00', '23:00:00','06:00:00', '23:00:00','06:00:00', '23:00:00','06:00:00', '23:00:00','06:00:00', '23:00:00','06:00:00', '23:00:00', 'www.https://clevelandmetroparks.com/parks/visit/parks/lakefront-reservation/edgewater-park', 'parks',  '41.4903', '-81.7355');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Rockefeller Park', 'Rockefeller Park is home to the Cleveland Cultural Gardens. Named after John D. Rockefeller who donated the land in 1896. The city’s eastside park spans 200 acres of land from Gordon Park to Shaker Heights. It was designed by landscape architect Ernest W. Bowditch. The park also offers many amenities including tennis courts, picnic and playground areas and the Rockefeller Park Greenhouse. 
 

', '10:00:00', '16:00:00', '10:00:00', '16:00:00','10:00:00', '16:00:00','10:00:00', '16:00:00','10:00:00', '16:00:00','10:00:00', '16:00:00','10:00:00', '16:00:00', 'www.culturalgardens.org', 'parks',  '41.5241', '-81.6238');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Lakeview Cemetery', 'Lakeview Cemetery was founded in 1869. It is one of the largest garden cemeteries in the United States. This historic scenic setting is the home to many historic buildings and monuments including the Garfield Monument and Wade Memorial Chapel as well as numerous species of trees, flowers and greenery. Lake View Cemetery offers group and school tours as well as events throughout the year.
', '07:30:00', '17:30:00', '07:30:00', '17:30:00','07:30:00', '17:30:00','07:30:00', '17:30:00','07:30:00', '17:30:00','07:30:00', '17:30:00','07:30:00', '17:30:00', 'www.lakeviewcemetery.com', 'historical',  '41.5140', '-81.5983');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('West Side Market', 'The West Side Market opened in 1840 and was added to the National Register of Historical Places on December 18, 1973. It is one of the largest indoor/outdoor markets in the City of Cleveland. The center of the Ohio City Community the market provides fresh meats, seafood and produce as well as a multiple of culturally diverse vendors. The Neo-Classical/Byzantine building houses nearly 100 stalls of vendors and features a large clock tower as well as a outdoor open air arcade that surround the north and west side of the building
', '00:00:00', '00:00:00', '08:00:00', '17:00:00','00:00:00', '00:00:00','08:00:00', '17:00:00','00:00:00', '00:00:00','08:00:00', '17:00:00','07:00:00', '17:00:00', 'www.ohiocity.org', 'historical',  '41.4847', '-81.7028');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('The Arcade', 'Built in 1890, the Arcade was one of the earliest buildings to be added to the National Register of Historic Places. The Arcade is one of the oldest shopping centers in America and includes an impressive list of restaurants, shops and a hotel. The Arcade was designed by John M. Eisenmann and George H. Smith.

', '07:00:00', '19:00:00', '07:00:00', '19:00:00','07:00:00', '19:00:00','07:00:00', '19:00:00','07:00:00', '19:00:00','07:00:00', '19:00:00','07:00:00', '19:00:00', 'www.theclevelandarcade.com', 'historical',  '41.49998', '-81.69045');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('A Christmas Story House', 'The Christmas Story House is a year-round attraction to Tremonts west side area. The house became famous during the filming of A Christmas Story which used the interior and exterior shots for the film. The home was purchased by Brian Jones, a private developer in 2004 who restored and renovated the home to a near-replica of the home in the film. The attraction now includes a home across the street which has been converted into a Christmas Story House Museum that features props and behind the scene photos and memorabilia. ', '10:00:00', '17:00:00', '10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00', 'www.achristmasstoryhouse.com', 'historical',  '41.4687', '-81.6874');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Cleveland Museum of Natural History', 'The Cleveland Museum of Natural History was founded in 1920 and features 2 distinguished exhibits. Lucy, an Australopithecus afarensis is a 130 million year old ancestor of man. The second, Haplocanthosaurus delfsi, a 150 million year old sauropod which is one of the most complete skeletons on exhibit in the world. Additional attractions include a planetarium and an observatory. The museum offers many classes and programs for children. There is an onsite wildlife center and features live animal shows. The Museum is involved in research with an active conservation program. ', '10:00:00', '17:00:00', '00:00:00', '00:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00', 'www.cmnh.org', 'historical',  '41.5115', '-81.6129');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Cleveland Metroparks Zoo', 'The Cleveland Zoo is part of the beautiful metro park system. It is open year round and features several areas of interest including: Australian Adventure, The Northern Trek, African Savanna, The Primate, Cat and Aquatic exhibits. The zoo features one of the largest primate exhibits in North America. The Zoo was founded in 1882 and spans over 183 acres. One popular feature of the Zoo is the RainForest exhibit which opened in 1992. Many educational and outreach programs are offered at the Zoo throughout the year.', '11:00:00', '22:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','16:00:00', '22:00:00','16:00:00', '22:00:00','11:00:00', '01:00:00','11:00:00', '01:00:00', 'www.clevelandmetroparks.com', 'parks',  '41.4459', '-81.7126');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Public Square', 'Public Square is one of the City of Cleveland’s park locations in the heart of downtown. Public Square’s design was based on an 18th century New England design and was added to the National Register of Historic Places in 1975. Highlights include Terminal Tower, Tower City shopping mall, RitzCarlton, Jack’s Casino, Soldiers’ and Sailors’ Monument and an outdoor amphitheater with speakers’ terrace. 
', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.clevelandpublicsquare.com', 'historical',  '41.4997', '-81.6937');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Terminal Tower/Tower City', 'The Terminal Tower is a Cleveland landmark.It has 52 floors, 508 exterior LED lights and includes shopping and movie theaters in the lower levels. It has a 63 foot flagpole at the top which brings the full height of the building to 771 feet. Graham, Anderson, Probst & White was the architecture firm. The building construction was started in 1923 and was completed in 1930 and was the tallest building outside of New York City until 1953. The exterior lights feature various themes for the holidays or specific noteworthy causes. Walkways also connect to Progressive Field and Rocket Mortgage Fieldhouse.
', '12:00:00', '17:00:00', '11:00:00', '17:00:00','11:00:00', '17:00:00','11:00:00', '17:00:00','11:00:00', '19:00:00','11:00:00', '19:00:00','11:00:00', '19:00:00', 'www.terminaltower.com', 'historical',  '41.4972', '-81.6940');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Old Stone Church', 'A Victorian Romanesque style church established in 1820.  It is one of the oldest buildings located on Cleveland’s Public Square. The church was damaged by fire in 1857 and in 1884 but was restored to its original glory from the support of it’s congregation.It is home to many beautiful highlights including 4 Louis Comfort Tiffany designed stained glass windows and features a trussed wood, barrel-vaulted ceiling and a 600 seat sanctuary. 
', '09:00:00', '12:30:00', '08:30:00', '16:30:00','08:30:00', '16:30:00','08:30:00', '16:30:00','08:30:00', '16:30:00','08:00:00', '16:30:00','00:00:00', '00:00:00', 'https://stonechurch.org', 'historical',  '39.3012', '-78.1677');



INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Mitchells Homemade Ice Cream', 'Mitchells Ice Cream started with the idea of creating memories over ice cream. And its co-founders, brothers Mike and Pete Mitchell, want to be part of the growing food scene around the West Side Market, in a neighborhood being cast as Clevelands Market District.Founded in 1999 and based in Rocky River for about eight years, Mitchells has focused on the suburbs: Bay Village, Beachwood, Rocky River, Solon, Westlake and - coming up - Avon and Strongsville.
', '11:00:00', '21:00:00', '11:00:00', '21:00:00','11:00:00', '21:00:00','11:00:00', '21:00:00','11:00:00', '21:00:00','11:00:00', '22:00:00','11:00:00', '22:00:00', 'www,mitchellshomemade.com', 'food',  '41.4847', '-81.7028');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Nates Deli', 'Classic deli sandwiches & salads, plus Mediterranean mains, served in humble, compact quarters. Fantastic Mediterranean cuisine from a family restaurant!
Menu includes: Soup & Salad, Deli Sandwiches, Combo Sandwiches, Middle Eastern Specialties, Desserts. A 2-min walk from the West Side Market.
', '00:00:00', '00:00:00', '10:00:00', '15:00:00','10:00:00', '15:00:00','10:00:00', '15:00:00','10:00:00', '15:00:00','10:00:00', '15:00:00','10:00:00', '16:00:00', 'http://natesohiocity.com', 'food',  '41.4847', '-81.7028');


INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Ohio Theater', 'The Ohio Theater opened in February, 1921 with the purpose of showcasing legitimate plays. It originally seated 1,338. It had a short lived run as a supper club before closing only to re-open as a movie theater. It survived a fire in 1964. Playhouse Square closed in 1969 and was literally saved from the wrecking ball. The Ohio Theater was reopened with 1000 seating capacity in 1982 after its renovation for the Great Lakes Shakespeare Festival.
', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('State Theater', 'The State Theater, one of the 5 theater complexes within Playhouse Square, was opened in 1921. Its original purpose was to feature movies but it was also used for Vaudeville performances. It was designed by architect Thomas W. Lamb. It can seat 3,400 people and has a 320 foot lobby, said to be the longest in the world. Playhouse Square, including the State Theater, closed in 1969. It was literally saved from the wrecking ball and was reopened in June, 1984.
', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Palace Theater', 'The Connor Palace, also known as the Palace Theater, is a part of Playhouse Square. The theater opened in 1922, as Keiths Palace Theater after B. F. Keith, founder of the Keith-Albee chain of vaudeville and movie theaters. It was designed in the French Renaissance style, and originally housed live two-a-day vaudeville shows. The $2 million theater opened in the Keith Building on November 6, 1922, seating 3,100. The interior featured Carrara marble and 154 crystal chandeliers, and the main lobby, dubbed the Great Hall, was decorated with over 30 paintings', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Hanna Theater', 'The Hanna Theater was originally opened in 1921. It was the dream of Daniel Rhodes Hanna and was designed by architect Charles A. Platt. Daniel Rhodes Hanna was inspired to build the Hanna as a tribute to his father, Marcus Hanna. The Hanna is located on 14th Street totally separate from the other four theaters that are part of Playhouse Square. The Hanna Theater can seat 1,421 people. The theater closed in 1988. It was re-opened in September, 1997, and is the current home of The Great Lakes Theater Festival.
', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Allen Theater', 'The Allen Theater was opened in April, 1921. It  was designed by architect C. Howard Crane and was originally opened as a movie theater. At the time it was opened it could seat close to 3,000 people. The Allen Theater closed in May of 1968. It has had multiple renovations; the most recent in 2012 transformed the space into the new home of the Cleveland Playhouse and Cleveland State. It also is a collaborative space for the Case Western Reserve Universities MFA Acting Program.
', '00:00:00', '00:00:00', '00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00','00:00:00', '00:00:00', 'www.playhousesquare.org', 'theater',  '41.4998', '-81.6804');

INSERT INTO locations (name, description, sunday_hour_open, sunday_hour_closed, monday_hour_open, monday_hour_closed, tuesday_hour_open, tuesday_hour_closed,
wednesday_hour_open, wednesday_hour_closed, thursday_hour_open, thursday_hour_closed, friday_hour_open, friday_hour_closed, saturday_hour_open, saturday_hour_closed,social_media, category, latitude, longitude) 
values ('Rock and Roll Hall of Fame', 'Located on the shore of Lake Erie in downtown Cleveland, the museum was designed by the famed architect I.M. Pei who also designed the Louvre Pyramid in Paris. The Rock Hall celebrates the history of rock music, its artists, producers and notable influencers and features numerous exhibits and events throughout the year. The Rock Hall collection includes memorabilia from John Lennon, Janis Joplin, Michael Jackson and Elvis to name a few, and is continuously adding to its extensive collection as well as providing multiple enrichment programs to the local communities.
', '10:00:00', '17:00:00', '10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00','10:00:00', '21:00:00','10:00:00', '17:00:00','10:00:00', '17:00:00', 'www.rockhall.com', 'arts',  '41.5085', '-81.6954');







COMMIT TRANSACTION;


BEGIN TRANSACTION;
DROP TABLE IF EXISTS user_location;


CREATE TABLE user_location (
   	user_id int NOT NULL,
    location_id int NOT NULL,
	time_stamp varchar(15) NOT NULL,
	CONSTRAINT PK_user_location PRIMARY KEY(user_id, location_id),
    CONSTRAINT FK_user_location_user FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT FK_user_location_location FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

COMMIT TRANSACTION;


BEGIN TRANSACTION;
DROP TABLE IF EXISTS user_location;


CREATE TABLE user_location (
   	user_id int NOT NULL,
    	location_id int NOT NULL,
	time_stamp varchar(50) NOT NULL,
	image_url varchar(300) NOT NULL,
	CONSTRAINT PK_user_location PRIMARY KEY(user_id, location_id),
    CONSTRAINT FK_user_location_user FOREIGN KEY(user_id) REFERENCES users(user_id),
    CONSTRAINT FK_user_location_location FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('3','1','04/20/2022', 'https://www.universitycircle.org/files/locations/slider/cmabenefitallpeoplebanners.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('4','1','04/20/2022', 'https://www.architecturalrecord.com/ext/resources/archives/projects/portfolio/2012/10/images/Cleveland-Museum-of-Art-Rafael-Vinoly-Architects-1.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('5','1','04/20/2022', 'https://www.clevelandart.org/sites/default/files/styles/banner/public/banners/2016bldg_B44_StuartPearl_2346.jpg');

INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('3','17','04/20/2022', 'https://thebettervacation.com/wp-content/uploads/2021/04/Cleveland-Zoo.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('4','17','04/20/2022', 'https://www.clevelandmetroparks.com/getmedia/70bed0be-d947-4eee-a17d-11fbb8ea948a/DSC_0321-2_1.jpg.ashx?width=1920&height=1108&ext=.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('5','17','04/20/2022', 'https://www.gannett-cdn.com/presto/2021/02/25/NABJ/90845f6f-af55-454e-938f-d569ad39c15a-orang-dome.jpg');

INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('3','3','04/20/2022', 'https://cdn.nba.com/manage/2020/10/rocket-mortgage-fieldhouse-rendering-0409.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('4','3','04/20/2022', 'https://www.nba.com/cavaliers/sites/cavaliers/files/rmfh-758x442.jpg');
INSERT INTO user_location (user_id, location_id, time_stamp, image_url) VALUES ('5','3','04/20/2022', 'https://www.rocketmortgagefieldhouse.com/assets/img/2021-22-Cavs-Seating-b695c97ef8.jpg');

COMMIT TRANSACTION;
















