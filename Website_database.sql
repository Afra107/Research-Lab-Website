CREATE DATABASE website_db;
USE website_db;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    Email VARCHAR(100),
    UserType VARCHAR(50)
);
CREATE TABLE LabHead (
    LabHeadID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Dept VARCHAR(50),
    LabName VARCHAR(100),
    LabDescription TEXT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Researcher (
    ResearcherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Dept VARCHAR(50),
    ResearcherType VARCHAR(50),
    Email VARCHAR(100),
    Experience VARCHAR(1000),
    UserID INT,
    LabHeadID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (LabHeadID) REFERENCES LabHead(LabHeadID)
);

CREATE TABLE Student(
stu_name char(50),
stu_id int,
researchers_id int ,
suser_id int,
FOREIGN KEY (researchers_id) REFERENCES Researcher(ResearcherID),
FOREIGN KEY (suser_id) REFERENCES User(UserID)
);
CREATE TABLE Publication (
    PublicationID INT PRIMARY KEY,
    Author VARCHAR(200),
    PaperName VARCHAR(200),
    Journal VARCHAR(200),
    Link VARCHAR(200)
);
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    Title VARCHAR(200),
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    ResearcherID INT,
    FOREIGN KEY (ResearcherID) REFERENCES Researcher(ResearcherID)
);
CREATE TABLE Researcher_Publication (
    ResearcherID INT,
    PublicationID INT,
    FOREIGN KEY (ResearcherID) REFERENCES Researcher(ResearcherID),
    FOREIGN KEY (PublicationID) REFERENCES Publication(PublicationID),
    PRIMARY KEY (ResearcherID, PublicationID)
);

	-- Insert data into User table with Password as null, Email as null, and UserType as 'Student'
INSERT INTO User (UserID, Username, Password, Email, UserType)
VALUES 
(1, 'dr. Shah Khalid', NULL, 'shah.khalid@seecs.edu.pk', 'Lab Head'),
(2, 'Hafiz Haseeb Ahmad Butt', NULL, NULL, 'Student'),
       (3, 'Sana Ullah', NULL, NULL, 'Student'),
       (4, 'Waleed Ahmed Shahid', NULL, NULL, 'Student'),
       (5, 'Rashid Iqbal', NULL, NULL, 'Student'),
       (6, 'Ihsan Ullah', NULL, NULL, 'Student'),
       (7, 'Mian Umer Bacha', NULL, NULL, 'Student - UG - Batch 2011-15, GAC.'),
       (8, 'Ijaz Ul Haq', NULL, NULL, 'Student'),
       (9, 'Misha Karim', NULL, NULL, 'Student'),
       (10, 'Sheher Bano', NULL, NULL, 'Student'),
       (11, 'Samir Khan', NULL, NULL, 'Student'),
       (12, 'Ali Khan', NULL, NULL, 'Student'),
       (13, 'Mobina Abdul Rauf', NULL, NULL, 'Student'),
       (14, 'Maryam Azam', NULL, NULL, 'Student'),
       (15, 'Syeda Hania', NULL, NULL, 'Student'),
	(16, 'Aftab Alam', NULL, NULL, 'Researcher'),
(17, 'Irfan Ullah', NULL, NULL, 'Researcher'),
(18, 'Shah Khusro', NULL, NULL, 'Researcher');



INSERT INTO LabHead (LabHeadID, Name, Email, Dept, LabName, LabDescription, UserID)
VALUES (1, 'Dr. Shah Khalid', 'shah.khalid@seecs.edu.pk', 'Head', 'Information Retrieval and Intelligent Systems Lab', 'A multidisciplinary research group performing basic and applied research in computer vision, data science, and related areas of AI & machine learning', 1);

INSERT INTO LabHead (LabHeadID, Name, Email, Dept, LabName, LabDescription, UserID)
VALUES (2, 'Aftab Alam', NULL, 'Head Collaborator', 'Information Retrieval and Intelligent Systems Lab', 'A multidisciplinary research group performing basic and applied research in computer vision, data science, and related areas of AI & machine learning', 16),
(3, 'Irfan Ullah', NULL, 'Head Collaborator', 'Information Retrieval and Intelligent Systems Lab', 'A multidisciplinary research group performing basic and applied research in computer vision, data science, and related areas of AI & machine learning', 17),
(4, 'Shah Khusro', NULL, 'Head Collaborator', 'Information Retrieval and Intelligent Systems Lab', 'A multidisciplinary research group performing basic and applied research in computer vision, data science, and related areas of AI & machine learning', 18);


INSERT INTO Researcher (ResearcherID, Name, Dept, ResearcherType, Email, Experience, UserID, LabHeadID)
VALUES (1, 'Dr. Shah Khalid', 'SEECS', 'Lab Head', 'shah.khalid@seecs.edu.pk',
        'Assistant Professor, School of Electrical Engineering and Computer Science (NUST-SEECS),
         Lecturer, School of Electrical Engineering and Computer Science (NUST-SEECS),
         Lecturer, Government AKL Postgraduate College, Matta Swat KP PK,
         MIS Programmer FDMA, FATA Secretariat, Peshawar Pakistan, PK,
         Lecturer(TA) University of Peshawar, PK,
         Lecturer Government AKL Postgraduate College, Matta Swat KP, PK', 1, 1),
         (2, 'Aftab Alam', 'Lab Head Collaborators Department', 'Collaborator', NULL, 
    'Ph.D., a Postdoctoral Researcher at the Kyung Hee University (KHU, Global Campus), South Korea. I am currently involved with Prof. Young-Koo Lee, researching an intelligent video analytics cloud platform utilizing state-of-the-art techniques and distributed computing technologies. I received my Ph.D. from the Department of Computer Engineering, KHU, under Professor Young-Koo Lee\'s supervision in the domain of video big data analytics at the Data & Knowledge Engineering Laboratory, KHU. I have received an MS degree in Computer Science from the University of Peshawar (UOP), Pakistan.', 16, 2),
    
(3, 'Dr. Irfan Ullah', 'Lab Head Collaborators Department', 'Collaborator', NULL, 
    'an Assistant Professor and Head of the Department of Computer Science, Shaheed Benazir Bhutto University, Sheringal, Pakistan. He has received PhD and MS degrees in Computer Science specializing in the area of Web Engineering from the Department of Computer Science, University of Peshawar, Pakistan. He has received BS degree in Computer Science from the Department of Computer Science, University of Malakand, Pakistan with a Gold Medal.', 17, 3),

(4, 'Dr. Shah Khusro', 'Lab Head Collaborators Department', 'Collaborator', NULL, 
    'nPh.D , Vienna University of Technology, Austria in Information & Web Semantics\nFaculty member at the Department of Computer Science, University of Peshawar since May 1998. Currently working as Full Professor since October 2015 and Chairman of the department since October 2016.\nCourses Taught at BS, MS and PhD Levels', 18, 4);


INSERT INTO Publication (PublicationID, Author, PaperName, Journal, Link)
VALUES  (1,
        ' Khalid, S., Wu, S., Alam, A., & Ullah, I. (2021)',
        'Real-time feedback query expansion technique for supporting scholarly search using citation network analysis',
        'Journal of Information Science, SCI Index',
        'https://doi.org/10.1177/0165551519863346'),
		(2,
        'Khalid S, Wu S, Wahid A, Alam A, Ullah I',
        'An effective scholarly search by combining inverted indices and structured search with citation networks analysis',
        'IEEE Access',
        ''),
        (3,
        ' S. Khalid, S. Khusro, I. Ullah, and G. Dawson-Amoah',
        'On The Current State of Scholarly Retrieval Systems',
        'Engineering Technology and Applied Science Research, ESCI',
        'http://orcid.org/0000-0002-7734-7243'),
		(4,
        ' Khalid, S., Khusro, S., & Ullah, I. (2018)',
        'Crawling Ajax-based Web Applications: Evolution and State-of-the-art',
        'Malaysian Journal of Computer science- SCI index',
        'http://mjs.um.edu.my/index.php/MJCS/article/view/10558'),
		(5,
        ' S. Khalid and S. Wu',
        'Supporting Scholarly Search by Query Expansion and Citation Analysis',
        'Engineering Technology and Applied Science Research',
        'https://doi.org/10.48084/etasr.3655'),
		(6,
        ' Adamu Garba, Shah Khalid, Irfan Ullah, Shah Khusro, Diyawu Mumin ',
        'Embedding Based Learning for Collection Selection in Federated Search',
        'Data Technologies and Applications, SCI Index',
        'https://doi.org/10.1108/DTA-01-2019-0005'),
		(7,
        ' Shah Khusro, Aftab Alam, Shah Khalid',
        'Social Question and Answer Sites: The Story So Far',
        'Program electronic library and information systems, SCI indexed',
        'https://www.researchgate.net/publication/316786510'),
		(8,
        ' Khalid, S., Wu, S. and Zhang, F. (2021)',
        'Multi-objective approach for determining the usefulness of papers in Academic search',
        'Data Technologies and Applications, SCI Index',
        'https://doi.org/10.1108/DTA-05-2020-0104'),
		(9,
        'J. Khan, N. Ahmad, S. Khalid, F. Ali and Y. Lee',
        'Sentiment and Context-Aware Hybrid DNN with Attention for Text Sentiment Classification',
        'IEEE Access',
        'doi: 10.1109/ACCESS.2023.3259107'),
        (10,
        ' Garba, Adamu, Shah Khalid, and Irfan Ullah',
        'Understanding the impact of query expansion on federated search',
        'Multimedia Tools and Applications',
        ''),
        (11,
        ' Garba, Adamu, Shengli Wu, and Shah Khalid',
        'Federated search techniques: an overview of the trends and state of the art',
        'Knowledge and Information Systems',
        ''),
        (12,
        'Sheher Bano, Shah Khalid, Nasser Mansoor Tairan, Habib Shah, Hasan Ali Khattak',
        'Summarization of Scholarly Articles Using BERT and BiGRU: Deep Learning-Based Extractive Approach',
        'Journal of King Saud University-Computer and Information Sciences',
        '');  

-- Insert data into Student table with researchers_id as 1, suser_id as 1
INSERT INTO Student (stu_name, stu_id, researchers_id, suser_id)
VALUES ('Hafiz Haseeb Ahmad Butt', 1, 1, 1),
       ('Sana Ullah', 2, 1, 2),
       ('Waleed Ahmed Shahid', 3, 1, 3),
       ('Rashid Iqbal', 4, 1, 4),
       ('Ihsan Ullah', 5, 1, 5),
       ('Mian Umer Bacha', 6, 1, 6),
       ('Ijaz Ul Haq', 7, 1, 7),
       ('Misha Karim', 8, 1, 8),
       ('Sheher Bano', 9, 1, 9),
       ('Samir Khan', 10, 1, 10),
       ('Ali Khan', 11, 1, 11),
       ('Mobina Abdul Rauf', 12, 1, 12),
       ('Maryam Azam', 13, 1, 13),
       ('Syeda Hania', 14, 1, 14);

-- Insert data into Project table
INSERT INTO Project (ProjectID, Title, Description, StartDate, EndDate, ResearcherID)
VALUES 
    (1, 'Improving Scholarly Article by Different Measures', 
     'In this project, we propose and develop different methods for supporting scholarly search systems including multi-objective approach and evaluation metrics for it.',
     '2016-01-01', '2021-01-01', 1),
    
    (2, 'Video Big Data Analytics in the Cloud (siat.kr)', 
     'In this project, a scalable and flexible reference architecture called SIAT on top of general-purpose big data technologies (HDFS, Spark, HBase, & Kafka) for intelligent video big data analytics in the cloud is proposed. High-level abstractions are provided to allow the researcher to develop & deploy video analytics algorithms & services in the cloud under the as-a-service paradigm.',
     '2019-01-01', '2021-01-01', 1),

    (3, 'Crawling Ajax-based web applications', 
     'The traditional crawler is unable to crawl ajax-based web application due to its dynamic nature. Under this project, I was supposed to study the amalgamation of involved technologies and the way they work.',
     '2012-01-01', '2015-01-01', 1),

    (4, 'User Ranking in Online SQA Platforms', 
     'A novel social Question & Answer (SQA) platform that confluences different social network features, SQA, and the dynamic points-based user reputation model. We investigated and developed an innovative, dynamic points-based user reputation model that takes user rating and social network analysis as input.',
     '2010-01-01', '2014-01-01', 1),

    (5, 'MIS for IDPs Registration', 
     'In this project, we developed MIS system for registering and facilitating IDPs of all agencies during the military operation in FATA. The software was also configured and modified to facilitate DPs during Shelters Assessment and Distribution.',
     '2010-01-01', '2011-01-01', 1),

    (6, 'HUASP MIS', 
     'Housing Uniform Assistance Subsidy Project (HUASP), was developed to register and facilitate the DPs. The software was specifically designed and configured to compensate DPs for their damaged houses during the military operation in FATA, Pakistan.',
     '2011-01-01', '2012-01-01', 1),

    (7, 'Disaster Frequency by Type & Location', 
     'We developed a software to map disaster in FATA sector by type and location in order to address the vulnerabilities accordingly.',
     '2012-01-01', '2013-01-01', 1);
     
     -- Insert into Researcher_Publication table
INSERT INTO Researcher_Publication (ResearcherID, PublicationID)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12);


ALTER TABLE student
ADD status VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;
update student 
set status = "Graduated"
where stu_id = 1 or stu_id = 2 or stu_id = 3 or stu_id = 8 or stu_id = 9 or stu_id = 10;


CREATE OR REPLACE VIEW publicationv AS
SELECT PublicationID, PaperName AS "Publication title", Link
FROM Publication;

select * from Publicationv;

CREATE OR REPLACE VIEW projectv AS
SELECT ProjectID, Title, StartDate
FROM project;

SELECT * FROM projectv;


CREATE OR REPLACE VIEW publicationv AS
SELECT PublicationID, PaperName AS "Publication title"
FROM Publication;


CREATE OR REPLACE VIEW publicationlink AS
SELECT Link
FROM Publication;

select * from publicationlink;

create or replace view stuv as
select s.stu_id, s.stu_name, r.Name
from student s
inner join researcher r
on s.researchers_id = r.ResearcherID;

select * from stuv;


create or replace view alumni as
select s.stu_id, s.stu_name, r.Name
from student s
inner join researcher r
on s.researchers_id = r.ResearcherID
where s.status = "Graduated";

select * from alumni;