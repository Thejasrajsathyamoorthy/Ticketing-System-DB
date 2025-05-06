CREATE TABLE IF NOT EXISTS "customers" (
	"cust_id" int GENERATED ALWAYS AS IDENTITY,
	/*
	"cust_code" varchar(16) GENERATED ALWAYS AS (
    upper(
        rpad(substr(regexp_replace("cus_name", '\s+', '', 'g'), 1, 3), 3, 'x')
    ) || '_' ||
    CASE 
        WHEN length("cus_id"::text) = 1 THEN lpad("cus_id"::text, 3, '0')
        WHEN length("cus_id"::text) = 2 THEN lpad("cus_id"::text, 3, '0')
        ELSE "cus_id"::text
    END
	) STORED UNIQUE,
	*/
	"cust_name" varchar(100) NOT NULL,
	"ctc_pers_name" varchar(25) NOT NULL,
	"ctc_ph" varchar(11) NOT NULL UNIQUE,
	"email" varchar(50) NOT NULL UNIQUE,
	"gst_no" varchar(16) NOT NULL UNIQUE,
	"add_1" varchar(100) NOT NULL,
	"add_2" varchar(100) NOT NULL,
	"pincode" varchar(6) NOT NULL,
	"state" varchar(25) NOT NULL,
	"city" varchar(25) NOT NULL,
	"cust_status_code" int NOT NULL,
	PRIMARY KEY ("cust_id"),
	FOREIGN KEY ("cust_status_code") REFERENCES "status"("status_code")
);

INSERT INTO "customers" ("cust_name", "ctc_pers_name", "ctc_ph", "email", "gst_no", "add_1", "add_2", "pincode", "state", "city", "cust_status_code") 
VALUES
	('Vertex Techno Solutions', 'Rahul V', '91234561001', 'customer1001@example.com', '29ABCDE1234F1Z5', '123', 'MG Road', '560001', 'Karnataka', 'Bangalore', '20'),
	('SHI | Locuz', 'Ari Praksh', '91234561002', 'customer1002@example.com', '29ABCDE1235F1Z5', '56', 'Residency Road', '560025', 'Karnataka', 'Bangalore', '20'),
	('CROMAC', 'Sneha Singh', '91234561003', 'customer1003@example.com', '29ABCDE1236F1Z5', '789', 'Koramangala', '560034', 'Karnataka', 'Bangalore', '20'),
	('SIPLINK Communications', 'Vikas Sharma', '91234561004', 'customer1004@example.com', '29ABCDE1237F1Z5', '98', 'Indiranagar', '560038', 'Karnataka', 'Bangalore', '20'),
	('Best Technological Solutions', 'Nisha Verma', '91234561005', 'customer1005@example.com', '29ABCDE1238F1Z5', '11', 'Whitefield', '560066', 'Karnataka', 'Bangalore', '21'),
	('ITC Infotech', 'Aditya Joshi', '91234561006', 'customer1006@example.com', '29ABCDE1239F1Z5', '234', 'Jayanagar', '560041', 'Karnataka', 'Bangalore', '20'),
	('ACL Digital', 'Pooja Yadav', '91234561007', 'customer1007@example.com', '29ABCDE1240F1Z5', '76', 'Malleshwaram', '560003', 'Karnataka', 'Bangalore', '20'),
	('Databytes Consulting', 'Karan Mishra', '91234561008', 'customer1008@example.com', '29ABCDE1241F1Z5', '44', 'Rajajinagar', '560010', 'Karnataka', 'Bangalore', '20'),
	('Impelsys', 'Meera Kapoor', '91234561009', 'customer1009@example.com', '29ABCDE1242F1Z5', '12', 'BTM Layout', '560076', 'Karnataka', 'Bangalore', '21'),
	('Technix Technology', 'Sahil Bajaj', '91234561010', 'customer1010@example.com', '29ABCDE1243F1Z5', '9', 'HSR Layout', '560102', 'Karnataka', 'Bangalore', '20')
ON CONFLICT ("email") DO NOTHING;

SELECT * FROM "customers" 
	LIMIT 5;

-- DROP TABLE "customers"