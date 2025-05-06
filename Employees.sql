CREATE TABLE IF NOT EXISTS "employee_details" (
	"emp_id" int GENERATED ALWAYS AS IDENTITY,
	"emp_code" varchar(16) GENERATED ALWAYS AS (
        upper(
            lpad(substr(regexp_replace(emp_name, '\s+', '', 'g'), 1, 3), 3, 'x')
        ) ||
		CASE 
        WHEN length("emp_id"::text) = 1 THEN lpad("emp_id"::text, 3, '0')
        WHEN length("emp_id"::text) = 2 THEN lpad("emp_id"::text, 3, '0')
        ELSE "emp_id"::text
    END
    ) STORED UNIQUE,
	"emp_name" varchar(100) NOT NULL,
	"emp_desg_id_fk" int NOT NULL,
	"emp_ph_no" varchar(10) NOT NULL UNIQUE,
	"add_1" varchar(100) NOT NULL,
	"add_2" varchar(100) NOT NULL,
	"pincode" varchar(6) NOT NULL,
	"state" varchar(50) NOT NULL,
	"city" varchar(50) NOT NULL,
	"loc_asn_fk" int NOT NULL,
	"emp_status_code" int NOT NULL,
	PRIMARY KEY ("emp_id"),
	FOREIGN KEY ("emp_desg_id_fk") REFERENCES "emp_designation"("emp_desg_id"),
	FOREIGN KEY ("emp_status_code") REFERENCES "status"("status_code"),
	FOREIGN KEY ("loc_asn_fk") REFERENCES "loc_int"("loc_id")
);

INSERT INTO "employee_details" ("emp_name", "emp_desg_id_fk", "emp_ph_no", "add_1", "add_2", "pincode", "state", "city", "loc_asn_fk", "emp_status_code")
VALUES
	('Prem Kumar', 3, '8123456781', 'House No 8, HSR Layout', 'Near Community Hall', '560001', 'Karnataka', 'Bangalore', 6, '20'),
	('Suresh Sharma', 2, '8123456782', 'Block A, RT Nagar', 'Opposite IT Park', '560025', 'Karnataka', 'Bangalore', 2, '20'),
	('Ravi Verma', 3, '8123456783', 'Plot 23, Whitefield', 'Opposite IT Park', '560034', 'Karnataka', 'Bangalore', 6, '20'),
	('Amit Joshi', 4, '8123456784', 'House No 8, HSR Layout', 'Opp. Government Office', '560001', 'Karnataka', 'Bangalore', 1, '21'),
	('Kunal Mishra', 3, '8123456785', 'House No 8, HSR Layout', 'Behind Police Station', '560025', 'Karnataka', 'Bangalore', 6, '20'),
	('Deepak Kapoor', 2, '8123456786', 'House No 8, HSR Layout', 'Behind Central Mall', '560038', 'Karnataka', 'Bangalore', 4, '20'),
	('Anil Patel', 2, '8123456787', 'No.12, MG Road', 'Opp. Government Office', '560001', 'Karnataka', 'Bangalore', 5, '20'),
	('Vikas Agarwal', 4, '8123456788', '14/2, Rajajinagar', 'Opp. Government Office', '560025', 'Karnataka', 'Bangalore', 2, '20'),
	('Ramesh Reddy', 2, '8123456789', 'Flat 3B, Jayanagar', 'Behind Police Station', '560038', 'Karnataka', 'Bangalore', 3, '20'),
	('Sanjay Gupta', 4, '8123456790', 'No.12, MG Road', 'Opposite IT Park', '560001', 'Karnataka', 'Bangalore', 2, '20'),
	('Manoj Yadav', 2, '8123456791', '14/2, Rajajinagar', 'Landmark: Near Metro', '560025', 'Karnataka', 'Bangalore', 1, '20'),
	('Arun Chopra', 3, '8123456792', '45/A, 4th Cross, Indiranagar', 'Behind Police Station', '560038', 'Karnataka', 'Bangalore', 6, '20'),
	('Naresh Rana', 5, '8123456793', 'Flat 3B, Jayanagar', 'Close to Temple', '560034', 'Karnataka', 'Bangalore', 2, '20'),
	('Rajesh Bhatia', 6, '8123456794', '101, Brigade Gateway', 'Near Lakeview Apartments', '560025', 'Karnataka', 'Bangalore', 3, '20'),
	('Vinod Goyal', 5, '8123456795', '45/A, 4th Cross, Indiranagar', 'Close to Temple', '560001', 'Karnataka', 'Bangalore', 4, '20'),
	('Dinesh Thakur', 1, '8123456796', 'House No 8, HSR Layout', 'Near Community Hall', '560038', 'Karnataka', 'Bangalore', 6, '20'),
	('Mahesh Malik', 4, '8123456797', '1st Main, BTM 2nd Stage', 'Close to Temple', '560038', 'Karnataka', 'Bangalore', 2, '20'),
	('Pankaj Jain', 5, '8123456798', '101, Brigade Gateway', 'Near Community Hall', '560025', 'Karnataka', 'Bangalore', 3, '20'),
	('Suraj Naveen', 6, '8123456799', 'Flat 3B, Jayanagar', 'Behind Police Station', '560001', 'Karnataka', 'Bangalore', 4, '20'),
	('Satish Alok', 5, '8123456800', 'House No 8, HSR Layout', 'Near Community Hall', '560034', 'Karnataka', 'Bangalore', 1, '20'),
	('Yogesh Pandey', 4, '8123456801', 'Plot 23, Whitefield', 'Behind Police Station', '560025', 'Karnataka', 'Bangalore', 3, '20'),
	('Lokesh Chaudhary', 5, '8123456802', 'Flat 3B, Jayanagar', 'Behind Central Mall', '560001', 'Karnataka', 'Bangalore', 3, '20'),
	('Harish Roy', 4, '8123456803', 'Block A, RT Nagar', 'Close to Bus Depot', '560034', 'Karnataka', 'Bangalore', 1, '21'),
	('Gaurav Seth', 6, '8123456804', 'No.12, MG Road', 'Near Lakeview Apartments', '560041', 'Karnataka', 'Bangalore', 4, '20'),
	('Sunil Bose', 6, '8123456805', 'Flat 3B, Jayanagar', 'Near Community Hall', '560001', 'Karnataka', 'Bangalore', 4, '21'),
	('Ashok Mehta', 4, '8123456806', '1st Main, BTM 2nd Stage', 'Opp. Government Office', '560034', 'Karnataka', 'Bangalore', 5, '20'),
	('Tushar Desai', 5, '8123456807', 'Plot 23, Whitefield', 'Landmark: Near Metro', '560001', 'Karnataka', 'Bangalore', 4, '20'),
	('Ajay Banerjee', 6, '8123456808', '101, Brigade Gateway', 'Next to School', '560041', 'Karnataka', 'Bangalore', 1, '20'),
	('Pradeep Malik', 6, '8123456809', '101, Brigade Gateway', 'Near Community Hall', '560034', 'Karnataka', 'Bangalore', 5, '21'),
	('Sunil Thakur', 4, '8123456810', 'House No 8, HSR Layout', 'Landmark: Near Metro', '560025', 'Karnataka', 'Bangalore', 5, '20'),
	('Kunal Patel', 2, '8123456811', '101, Brigade Gateway', 'Close to Temple', '560001', 'Karnataka', 'Bangalore', 5, '20')
ON CONFLICT ("emp_ph_no") DO NOTHING;


SELECT * FROM "employee_details" -- WHERE "designation_id_fk" IN (1,2) 
	LIMIT 10;

-- DROP TABLE "employee_details"