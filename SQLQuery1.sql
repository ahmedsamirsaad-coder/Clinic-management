
CREATE TABLE doctor_Tb (
doctor_ID int NOT NULL PRIMARY KEY,
doctor_Name varchar(50) NOT NULL,
doctor_Phone varchar(30) NOT NULL,
doctor_Adress varchar(100) NOT NULL,
doctor_ZIP varchar(10) NOT NULL
);

CREATE TABLE patient_Tb (
patient_ID int NOT NULL PRIMARY KEY,
patient_Name varchar(50) NOT NULL,
patient_gender varchar(30) NOT NULL,
Patient_age varchar(10) NOT NULL,
patient_number  varchar(10) NOT NULL
);

CREATE TABLE medicalExamination_Tb (
medicalExamination_ID int NOT NULL PRIMARY KEY,
Order_Total_Price varchar(20) NOT NULL,
medicalExamination_Date varchar(30) NOT NULL,
doctor_ID int FOREIGN KEY REFERENCES doctor_Tb(doctor_ID),
patient_ID int FOREIGN KEY REFERENCES Patient_Tb (Patient_ID)
);

CREATE TABLE assistant_Tb (
assistant_ID int NOT NULL PRIMARY KEY,
assistant_name varchar(100) NOT NULL,
doctor_ID int FOREIGN KEY REFERENCES doctor_Tb (doctor_ID) 

);



INSERT INTO doctor_Tb 
VALUES ( 1162000,'Ahmed samir' , 01204677453, 'Alexandria_mamoura', '20116');

INSERT INTO doctor_Tb  
VALUES ( 512000 ,'mostafa fawzy' , 01207391160, 'Alexandria_mandara','2015');

INSERT INTO doctor_Tb 
VALUES ( 2332000,'mostafa soliman' , 01208489958, 'Alexandria_asafra', '20233');

INSERT INTO doctor_Tb  
VALUES ( 4516512,'mohamed hassan' , 01273964492, 'Alexandria_saaa', '20116');

INSERT INTO doctor_Tb 
VALUES ( 1234567,'walid mohamed' , 01227053161, 'Alexandria_abosoliman','456654');



INSERT INTO patient_Tb 
 VALUES (123456 , 'ahmed' , 'male', '25' ,01271559985 );

 INSERT INTO patient_Tb
 VALUES (789123 , 'mohamed' ,'male','30',01251586588 );

 INSERT INTO patient_Tb
 VALUES (321654 , 'mostafa' , 'male','32', 01284926555 );

 INSERT INTO patient_Tb 
 VALUES (789456 , 'mai' , 'female','20',01022285942);

 INSERT INTO patient_Tb 
 VALUES (456789 , 'nada' ,'female','19', 01158587412 );

 INSERT INTO medicalExamination_Tb
 VALUES (369258 , '1200$' ,  '2020-14-5' ,1162000,123456);

 INSERT INTO medicalExamination_Tb
 VALUES (258147 , '2000$' ,'2020-15-5',512000,789123 );

 INSERT INTO medicalExamination_Tb 
 VALUES (147369 , '40$' , '2020-16-5',2332000,321654);

 INSERT INTO medicalExamination_Tb
 VALUES (147258, '156$' , '2020-17-5',4516512,789456);

 INSERT INTO medicalExamination_Tb 
 VALUES (963741 , '350$' , '2020-18-5',1234567,456789 );

 
 INSERT INTO assistant_Tb
 VALUES (159236 ,'Awd',1162000);

 INSERT INTO assistant_Tb 
 VALUES (478236 ,'osman',512000);

 INSERT INTO assistant_Tb 
 VALUES (1159478 ,'mona ',2332000);

 INSERT INTO assistant_Tb 
 VALUES (874159 ,'merna', 4516512);

 INSERT INTO assistant_Tb 
 VALUES (236159 ,'farida',1234567 );






SELECT * FROM doctor_Tb;

SELECT * FROM patient_Tb;

SELECT * FROM medicalExamination_Tb;

SELECT * FROM assistant_Tb;



SELECT doctor_Name, doctor_ID FROM doctor_Tb;

SELECT patient_ID, patient_Name FROM patient_Tb;

SELECT patient_ID, medicalExamination_Date FROM medicalExamination_Tb;

SELECT assistant_ID, assistant_name FROM assistant_Tb;

--------------------------------



SELECT * FROM patient_Tb
WHERE patient_Name = 'mohamed';

SELECT * FROM medicalExamination_Tb
WHERE medicalExamination_ID = 258147;

SELECT * FROM assistant_Tb
WHERE assistant_ID = 236159;

--------------------------------


SELECT * FROM doctor_Tb
WHERE doctor_ID=1162000 AND doctor_Name = 'Ahmed samir';

SELECT * FROM patient_Tb
WHERE patient_ID=456789 AND patient_gender = 'Camera';

SELECT * FROM medicalExamination_Tb
WHERE doctor_ID=1162000 AND medicalExamination_Date = '2020-15-5';

SELECT * FROM assistant_Tb
WHERE assistant_ID=258147 AND doctor_ID = 1162000;
---------------------------------------------------------


SELECT * FROM doctor_Tb
WHERE doctor_ID=116200 OR doctor_Name='Ahmed samir';

---------------------------------------------------------
SELECT * FROM doctor_Tb
WHERE doctor_ID=116200 OR doctor_Name='Mostafa fawzy';
SELECT * FROM doctor_Tb
WHERE doctor_ID=116200 OR doctor_Name='mostafa soliman';
---------------------------------------------------------
SELECT * FROM doctor_Tb
ORDER BY doctor_Name ;
----------------------------------

UPDATE doctor_Tb
SET doctor_ZIP = '123456',doctor_Adress = 'Alexandria_haramen'
WHERE doctor_ID = 1162000 ;

UPDATE patient_Tb
SET patient_Name = 'yasser',patient_gender = 'male'
WHERE patient_ID = 456789 ;

UPDATE medicalExamination_Tb
SET medicalExamination_Date = '2020-19-5',Order_Total_Price = '2050$ '
WHERE medicalExamination_ID = 1162000 ;

UPDATE assistant_Tb
SET assistant_name =  'fady'
WHERE doctor_ID = 1162000 ;

UPDATE doctor_Tb
SET doctor_ZIP = '123456',doctor_Adress = 'Alexandria_haramen'
WHERE doctor_ID = 1162000 ;


SELECT *
FROM medicalExamination_Tb
INNER JOIN doctor_Tb ON medicalExamination_Tb.doctor_ID =  doctor_Tb.doctor_ID;


SELECT medicalExamination_ID, doctor_Tb.doctor_ID
FROM doctor_Tb
INNER JOIN medicalExamination_Tb ON medicalExamination_Tb.doctor_ID =  doctor_Tb.doctor_ID;


SELECT doctor_Tb.doctor_Name, medicalExamination_Tb.medicalExamination_Date
FROM medicalExamination_Tb
LEFT JOIN doctor_Tb ON medicalExamination_Tb.doctor_ID = doctor_Tb.doctor_ID;

SELECT assistant_Tb.assistant_name, medicalExamination_Tb.medicalExamination_Date

FROM medicalExamination_Tb
RIGHT JOIN assistant_Tb ON medicalExamination_Tb.patient_ID = assistant_Tb.assistant_ID;



SELECT doctor_Name FROM doctor_Tb WHERE doctor_ID 
IN (
SELECT doctor_ID FROM medicalExamination_Tb WHERE doctor_ID = 789123
);



SELECT medicalExamination_Date FROM medicalExamination_Tb WHERE medicalExamination_ID 
IN(
SELECT medicalExamination_ID FROM assistant_Tb WHERE medicalExamination_ID = 369258
);



SELECT patient_number FROM patient_Tb WHERE patient_ID 
IN (
SELECT patient_ID FROM assistant_Tb WHERE patient_ID = 456789
);



SELECT COUNT(patient_gender)
FROM patient_Tb
GROUP BY patient_ID ;

SELECT COUNT(assistant_ID)
FROM assistant_Tb
GROUP BY assistant_name;

SELECT COUNT(doctor_Phone)
FROM doctor_Tb;

SELECT COUNT(medicalExamination_Date)
FROM medicalExamination_Tb;

SELECT COUNT(doctor_ID)
FROM doctor_Tb;


----------------------------------
delete from doctor_Tb where doctor_Adress   ='Alexandria_mamoura'   ;

delete from assistant_Tb where assistant_name ='osman';

delete from medicalExamination_Tb where medicalExamination_Date ='2020-17-5';

delete from assistant_Tb where assistant_name ='merna';

delete from assistant_Tb where assistant_ID =1162000;


