CREATE TABLE IF NOT EXISTS "cust_bill_details" (
	"cust_bill_id" int GENERATED ALWAYS AS IDENTITY,
	"bill_add_1" varchar(100) NOT NULL,
	"bill_add_2" varchar(100) NOT NULL,
	"bill_pincode" varchar(6) NOT NULL,
	"bill_state" varchar(25) NOT NULL,
	"bill_city" varchar(25) NOT NULL,
	"bill_add_status_code" int NOT NULL,
	"cust_id" int NOT NULL,
	PRIMARY KEY ("cust_bill_id")
);

INSERT INTO "cust_bill_details" ("bill_add_1", "bill_add_2", "bill_pincode", "bill_state", "bill_city", "bill_add_status_code", "cust_id") 
VALUES
	('234', 'Jayanagar', '560041', 'Karnataka', 'Bangalore', 20, 1),
	('76', 'Malleshwaram', '560003', 'Karnataka', 'Bangalore', 20, 2),
	('44', 'Rajajinagar', '560010', 'Karnataka', 'Bangalore', 21, 3),
	('12', 'BTM Layout', '560076', 'Karnataka', 'Bangalore', 20, 3),
	('9', 'HSR Layout', '560102', 'Karnataka', 'Bangalore', 20, 5);

SELECT * FROM "cust_bill_details"
		LIMIT 5;

-- DROP TABLE "cust_bill_details"