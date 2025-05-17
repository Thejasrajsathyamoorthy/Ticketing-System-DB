CREATE TABLE IF NOT EXISTS "cust_ship_details" (
	"cust_ship_id" int GENERATED ALWAYS AS IDENTITY,
	"ship_add_1" varchar(100) NOT NULL,
	"ship_add_2" varchar(100) NOT NULL,
	"ship_pincode" varchar(6) NOT NULL,
	"ship_state" varchar(25) NOT NULL,
	"ship_city" varchar(25) NOT NULL,
	"ship_add_status_code" int NOT NULL,
	"cust_id" int NOT NULL,
	PRIMARY KEY ("cust_ship_id")
);

INSERT INTO "cust_ship_details" ("ship_add_1", "ship_add_2", "ship_pincode", "ship_state", "ship_city", "ship_add_status_code", "cust_id") 
VALUES
	('123', 'MG Road', '560001', 'Karnataka', 'Bangalore', 20, 1),
	('56', 'Residency Road', '560025', 'Karnataka', 'Bangalore', 20, 2),
	('789', 'Koramangala', '560034', 'Karnataka', 'Bangalore', 20, 3),
	('98', 'Indiranagar', '560038', 'Karnataka', 'Bangalore', 20, 4),
	('11', 'Whitefield', '560066', 'Karnataka', 'Bangalore', 21, 5);



SELECT * FROM "cust_ship_details"
		LIMIT 5;

-- DROP TABLE "cust_ship_details"