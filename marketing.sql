-- CREATE TABLES

CREATE TABLE Users (

    user_id NUMBER PRIMARY KEY,

    name VARCHAR2(100) NOT NULL,

    email VARCHAR2(100) UNIQUE NOT NULL,

    password VARCHAR2(100) NOT NULL

);



CREATE TABLE Interests (

    interest_id NUMBER PRIMARY KEY,

    name VARCHAR2(100) NOT NULL

);

CREATE TABLE Categories (

    category_id NUMBER PRIMARY KEY,

    name VARCHAR2(100) NOT NULL

);

CREATE TABLE Platforms (

    platform_id NUMBER PRIMARY KEY,

    name VARCHAR2(100) NOT NULL,

    type VARCHAR2(50)

);

CREATE TABLE Campaigns (

    campaign_id NUMBER PRIMARY KEY,

    title VARCHAR2(100) NOT NULL,

    budget NUMBER CHECK (budget > 0),

    start_date DATE,

    end_date DATE,

    user_id NUMBER,


---------------
    CONSTRAINT fk_campaign_user
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id)

);

------------------?? ???? ????? ???? ??????? ??? ?????.-----

------------------------------------------------------------------
CREATE TABLE Ads (

    ad_id NUMBER PRIMARY KEY,

    content VARCHAR2(500) NOT NULL,

    campaign_id NUMBER,

    CONSTRAINT fk_ads_campaign
    FOREIGN KEY (campaign_id)
    REFERENCES Campaigns(campaign_id)

);


CREATE TABLE Influencers (

    influencer_id NUMBER PRIMARY KEY,

    name VARCHAR2(100) NOT NULL,

    followers_count NUMBER CHECK (followers_count >= 0),

    category_id NUMBER,

    CONSTRAINT fk_influencer_category
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)

);



CREATE TABLE Interactions (

    interaction_id NUMBER PRIMARY KEY,

    type VARCHAR2(50)
    CHECK (type IN ('Like','Share','Comment')),

    user_id NUMBER,

    ad_id NUMBER,

    CONSTRAINT fk_interaction_user
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    CONSTRAINT fk_interaction_ad
    FOREIGN KEY (ad_id)
    REFERENCES Ads(ad_id)

);


CREATE TABLE User_Interests (

    user_id NUMBER,

    interest_id NUMBER,

    PRIMARY KEY (user_id, interest_id),

    CONSTRAINT fk_ui_user
    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    CONSTRAINT fk_ui_interest
    FOREIGN KEY (interest_id)
    REFERENCES Interests(interest_id)

);



CREATE TABLE Ad_Platforms (

    ad_id NUMBER,

    platform_id NUMBER,

    PRIMARY KEY (ad_id, platform_id),

    CONSTRAINT fk_ap_ad
    FOREIGN KEY (ad_id)
    REFERENCES Ads(ad_id),

    CONSTRAINT fk_ap_platform
    FOREIGN KEY (platform_id)
    REFERENCES Platforms(platform_id)

);


CREATE TABLE Campaign_Influencers (

    campaign_id NUMBER,

    influencer_id NUMBER,

    PRIMARY KEY (campaign_id, influencer_id),

    CONSTRAINT fk_ci_campaign
    FOREIGN KEY (campaign_id)
    REFERENCES Campaigns(campaign_id),

    CONSTRAINT fk_ci_influencer
    FOREIGN KEY (influencer_id)
    REFERENCES Influencers(influencer_id)

);
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INSERT

INSERT INTO Users VALUES (1,'Moemen','moemen@gmail.com','1234');
INSERT INTO Users VALUES (2,'Ahmed','ahmed@gmail.com','1234');
INSERT INTO Users VALUES (3,'Sara','sara@gmail.com','1234');
INSERT INTO Users VALUES (4,'Ali','ali@gmail.com','1234');
INSERT INTO Users VALUES (5,'Mona','mona@gmail.com','1234');
INSERT INTO Users VALUES (6,'Omar','omar@gmail.com','1234');
INSERT INTO Users VALUES (7,'Youssef','youssef@gmail.com','1234');
INSERT INTO Users VALUES (8,'Salma','salma@gmail.com','1234');
INSERT INTO Users VALUES (9,'Nour','nour@gmail.com','1234');
INSERT INTO Users VALUES (10,'Tarek','tarek@gmail.com','1234');



INSERT INTO Interests VALUES (1,'Technology');
INSERT INTO Interests VALUES (2,'Gaming');
INSERT INTO Interests VALUES (3,'Sports');
INSERT INTO Interests VALUES (4,'Movies');
INSERT INTO Interests VALUES (5,'Programming');
INSERT INTO Interests VALUES (6,'Fitness');
INSERT INTO Interests VALUES (7,'Travel');
INSERT INTO Interests VALUES (8,'Fashion');
INSERT INTO Interests VALUES (9,'Music');
INSERT INTO Interests VALUES (10,'Photography');



INSERT INTO Categories VALUES (1,'Tech');
INSERT INTO Categories VALUES (2,'Fitness');
INSERT INTO Categories VALUES (3,'Fashion');
INSERT INTO Categories VALUES (4,'Gaming');
INSERT INTO Categories VALUES (5,'Education');
INSERT INTO Categories VALUES (6,'Sports');
INSERT INTO Categories VALUES (7,'Travel');
INSERT INTO Categories VALUES (8,'Music');
INSERT INTO Categories VALUES (9,'Food');
INSERT INTO Categories VALUES (10,'Business');



INSERT INTO Platforms VALUES (1,'Facebook','Social Media');
INSERT INTO Platforms VALUES (2,'Instagram','Social Media');
INSERT INTO Platforms VALUES (3,'YouTube','Video');
INSERT INTO Platforms VALUES (4,'TikTok','Video');
INSERT INTO Platforms VALUES (5,'Twitter','Social Media');
INSERT INTO Platforms VALUES (6,'LinkedIn','Professional');
INSERT INTO Platforms VALUES (7,'Snapchat','Social Media');
INSERT INTO Platforms VALUES (8,'Reddit','Forum');
INSERT INTO Platforms VALUES (9,'Pinterest','Images');
INSERT INTO Platforms VALUES (10,'Discord','Community');



INSERT INTO Campaigns VALUES (1,'Summer Campaign',5000,TO_DATE('2026-05-01','YYYY-MM-DD'),TO_DATE('2026-06-01','YYYY-MM-DD'),1);

INSERT INTO Campaigns VALUES (2,'Gaming Ads',8000,TO_DATE('2026-06-01','YYYY-MM-DD'),TO_DATE('2026-07-01','YYYY-MM-DD'),2);

INSERT INTO Campaigns VALUES (3,'Fitness Campaign',6000,TO_DATE('2026-07-01','YYYY-MM-DD'),TO_DATE('2026-08-01','YYYY-MM-DD'),3);

INSERT INTO Campaigns VALUES (4,'Travel Ads',7500,TO_DATE('2026-08-01','YYYY-MM-DD'),TO_DATE('2026-09-01','YYYY-MM-DD'),1);

INSERT INTO Campaigns VALUES (5,'Programming Bootcamp',9000,TO_DATE('2026-09-01','YYYY-MM-DD'),TO_DATE('2026-10-01','YYYY-MM-DD'),2);

INSERT INTO Campaigns VALUES (6,'Music Promotion',4000,TO_DATE('2026-10-01','YYYY-MM-DD'),TO_DATE('2026-11-01','YYYY-MM-DD'),3);

INSERT INTO Campaigns VALUES (7,'Food Delivery',5500,TO_DATE('2026-11-01','YYYY-MM-DD'),TO_DATE('2026-12-01','YYYY-MM-DD'),1);

INSERT INTO Campaigns VALUES (8,'Business Summit',10000,TO_DATE('2026-12-01','YYYY-MM-DD'),TO_DATE('2027-01-01','YYYY-MM-DD'),2);

INSERT INTO Campaigns VALUES (9,'Photography Event',6500,TO_DATE('2027-01-01','YYYY-MM-DD'),TO_DATE('2027-02-01','YYYY-MM-DD'),3);

INSERT INTO Campaigns VALUES (10,'Test',5000,SYSDATE,SYSDATE,1);



INSERT INTO Ads VALUES (1,'Buy our new laptop now!',1);
INSERT INTO Ads VALUES (2,'Best gaming products!',2);
INSERT INTO Ads VALUES (3,'Join our fitness program now!',3);
INSERT INTO Ads VALUES (4,'Discover amazing travel offers!',4);
INSERT INTO Ads VALUES (5,'Learn programming with experts!',5);
INSERT INTO Ads VALUES (6,'Best music streaming service!',6);
INSERT INTO Ads VALUES (7,'Order food in minutes!',7);
INSERT INTO Ads VALUES (8,'Attend our business summit!',8);
INSERT INTO Ads VALUES (9,'Capture moments professionally!',9);
INSERT INTO Ads VALUES (10,'Online education for everyone!',10);



INSERT INTO Influencers VALUES (1,'John',100000,1);
INSERT INTO Influencers VALUES (2,'Mona',50000,2);
INSERT INTO Influencers VALUES (3,'Khaled',70000,3);
INSERT INTO Influencers VALUES (4,'Nour',90000,4);
INSERT INTO Influencers VALUES (5,'Youssef',120000,5);
INSERT INTO Influencers VALUES (6,'Salma',40000,6);
INSERT INTO Influencers VALUES (7,'Omar',65000,7);
INSERT INTO Influencers VALUES (8,'Laila',80000,8);
INSERT INTO Influencers VALUES (9,'Tarek',55000,9);
INSERT INTO Influencers VALUES (10,'Mariam',95000,10);



INSERT INTO User_Interests VALUES (1,1);
INSERT INTO User_Interests VALUES (1,2);
INSERT INTO User_Interests VALUES (2,3);
INSERT INTO User_Interests VALUES (2,4);
INSERT INTO User_Interests VALUES (2,5);
INSERT INTO User_Interests VALUES (3,6);
INSERT INTO User_Interests VALUES (1,7);
INSERT INTO User_Interests VALUES (2,8);
INSERT INTO User_Interests VALUES (3,9);
INSERT INTO User_Interests VALUES (1,10);


INSERT INTO Ad_Platforms VALUES (1,1);
INSERT INTO Ad_Platforms VALUES (1,2);
INSERT INTO Ad_Platforms VALUES (2,3);
INSERT INTO Ad_Platforms VALUES (3,4);
INSERT INTO Ad_Platforms VALUES (4,5);
INSERT INTO Ad_Platforms VALUES (5,6);
INSERT INTO Ad_Platforms VALUES (6,7);
INSERT INTO Ad_Platforms VALUES (7,8);
INSERT INTO Ad_Platforms VALUES (8,9);
INSERT INTO Ad_Platforms VALUES (9,10);


INSERT INTO Campaign_Influencers VALUES (1,1);
INSERT INTO Campaign_Influencers VALUES (2,2);
INSERT INTO Campaign_Influencers VALUES (3,3);
INSERT INTO Campaign_Influencers VALUES (4,4);
INSERT INTO Campaign_Influencers VALUES (5,5);
INSERT INTO Campaign_Influencers VALUES (6,6);
INSERT INTO Campaign_Influencers VALUES (7,7);
INSERT INTO Campaign_Influencers VALUES (8,8);
INSERT INTO Campaign_Influencers VALUES (9,9);
INSERT INTO Campaign_Influencers VALUES (10,10);


INSERT INTO Interactions VALUES (1,'Like',1,1);
INSERT INTO Interactions VALUES (2,'Comment',2,1);
INSERT INTO Interactions VALUES (3,'Share',3,2);
INSERT INTO Interactions VALUES (4,'Like',1,3);
INSERT INTO Interactions VALUES (5,'Comment',2,4);
INSERT INTO Interactions VALUES (6,'Share',3,5);
INSERT INTO Interactions VALUES (7,'Like',1,6);
INSERT INTO Interactions VALUES (8,'Comment',2,7);
INSERT INTO Interactions VALUES (9,'Share',3,8);
INSERT INTO Interactions VALUES (10,'Like',1,9);

------------------------------view/trigger/Group


-- CREATE VIEW
---------------------------------------------------

CREATE VIEW Campaign_Details AS

SELECT
    c.campaign_id,
    c.title,
    u.name AS user_name,
    c.budget
FROM Campaigns c
JOIN Users u
ON c.user_id = u.user_id;



---------------------------------------------------
-- CREATE TRIGGER
---------------------------------------------------

CREATE OR REPLACE TRIGGER check_budget

BEFORE INSERT ON Campaigns

FOR EACH ROW

BEGIN

    IF :NEW.budget <= 0 THEN

        RAISE_APPLICATION_ERROR(
        -20001,
        'Budget must be greater than zero'
        );

    END IF;

END;
/


-- GROUP FUNCTION

SELECT
COUNT(*) AS total_campaigns,
AVG(budget) AS average_budget,
MAX(budget) AS max_budget
FROM Campaigns;



-- SINGLE ROW FUNCTION

SELECT
UPPER(name),
LENGTH(name)
FROM Users;


-- JOIN QUERY

SELECT u.name, c.title
FROM Users u
JOIN Campaigns c
ON u.user_id = c.user_id;


-- UPDATE QUERY

UPDATE Users
SET name = 'Ali'
WHERE user_id = 1;


-- DELETE QUERY


DELETE FROM Interactions
WHERE interaction_id = 10;

-- ALTER QUERY

ALTER TABLE Users
ADD phone VARCHAR2(20);

-- COMMIT

COMMIT;


select * from ADS ;
SELECT * FROM Campaign_Details;

SELECT COUNT(*) FROM Ads;

SELECT COUNT(*) FROM Platforms;
 
SELECT COUNT(*) FROM Influencers;

SELECT COUNT(*) FROM Interactions;

SELECT COUNT(*) FROM Categories;

SELECT COUNT(*) FROM Interests;

select * from ads ;