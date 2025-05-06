CREATE TABLE IF NOT EXISTS "tickets_details" (
	"tkt_id" int GENERATED ALWAYS AS IDENTITY,
	"tkt_code" varchar(16) GENERATED ALWAYS AS (
    'TKT' ||
    CASE 
        WHEN length("tkt_id"::text) = 1 THEN lpad("tkt_id"::text, 3, '0')
        WHEN length("tkt_id"::text) = 2 THEN lpad("tkt_id"::text, 3, '0')
        ELSE "tkt_id"::text
    END
) STORED UNIQUE,
	"cust_id_fk" int NOT NULL ,
	"mcn_id_fk" int NOT NULL UNIQUE,
	"prblm_desc" varchar(100) NOT NULL,
	"emp_asn_fk" int,
	"created_on" TIMESTAMP NOT NULL,
	"closed_on" TIMESTAMP,	
	"tkt_status_code" INTEGER NOT NULL,
	"remarks" varchar(255),
	PRIMARY KEY ("tkt_id"),
	FOREIGN KEY ("emp_asn_fk") REFERENCES "employee_details"("emp_id"),
	FOREIGN KEY ("cust_id_fk") REFERENCES "customers"("cust_id"),
	FOREIGN KEY ("tkt_status_code") REFERENCES "status"("status_code")
);


INSERT INTO "tickets_details" ("cust_id_fk", "mcn_id_fk", "prblm_desc", "emp_asn_fk", "created_on", "closed_on", "tkt_status_code", "remarks") 
VALUES 
	(1, 1, 'Booting issue', 1, '2025-02-06 10:05:20', '2025-02-09 17:35:20', 102, 'In progress'),
	(2, 2, 'Sound issue', 2, '2025-01-21 10:05:20', '2025-01-24 17:35:20', 102, 'In progress'),
	(3, 3, 'Monitor not on', 1, '2025-03-15 10:05:20', '2025-03-24 17:35:20', 100, 'Resolved'),
	(4, 4, 'Booting issue', 4, '2025-02-02 10:05:20', '2025-02-06 17:35:20', 102, 'In progress'),
	(5, 5, 'Sound issue', 6, '2025-02-13 10:05:20', '2025-02-16 17:35:20', 100, 'Resolved'),
	(6, 6, 'Printer issue', 7, '2025-03-03 10:05:20', '2025-03-04 17:35:20', 100, 'Resolved'),
	(7, 7, 'Sound issue', 9, '2025-02-22 10:05:20', '2025-03-02 17:35:20', 102, 'In progress'),
	(8, 8, 'Monitor not on', 10, '2025-03-25 10:05:20', '2025-03-26 17:35:20', 100, 'Resolved'),
	(9, 9, 'Slow performance', 4, '2025-01-06 10:05:20', '2025-01-09 17:35:20', 102, 'In progress'),
	(10, 10, 'Booting issue', 2, '2025-03-10 10:05:20', '2025-03-14 17:35:20', 102, 'In progress'),
	(8, 11, 'Printer issue', 10, '2025-02-15 10:05:20', '2025-02-16 17:35:20', 102, 'In progress'),
	(9, 12, 'Monitor not on', 5, '2025-01-02 10:05:20', '2025-01-11 17:35:20', 102, 'In progress'),
	(5, 13, 'Beeping', 7, '2025-03-14 10:05:20', '2025-03-16 17:35:20', 102, 'In progress'),
	(7, 14, 'Monitor not on', 1, '2025-03-01 10:05:20', '2025-03-05 17:35:20', 102, 'In progress'),
	(4, 15, 'Sound issue', 2, '2025-02-18 10:05:20', '2025-02-20 17:35:20', 102, 'In progress'),
	(8, 16, 'Beeping', 6, '2025-03-20 10:05:20', '2025-03-29 17:35:20', 102, 'In progress'),
	(5, 17, 'Beeping', 8, '2025-03-30 10:05:20', '2025-04-05 17:35:20', 102, 'In progress'),
	(2, 18, 'Printer issue', 9, '2025-01-28 10:05:20', '2025-02-02 17:35:20', 102, 'In progress'),
	(1, 19, 'Beeping', 10, '2025-01-29 10:05:20', '2025-01-30 17:35:20', 100, 'Resolved')
ON CONFLICT ("mcn_id_fk") DO NOTHING;

SELECT * FROM "tickets_details"
	LIMIT 5;

-- DROP TABLE "tickets_details"