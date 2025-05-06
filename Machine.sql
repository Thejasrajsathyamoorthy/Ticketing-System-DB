CREATE TABLE IF NOT EXISTS "machine_details" (
	"mcn_id" int GENERATED ALWAYS AS IDENTITY,
	"mcn_sno" varchar(16) NOT NULL UNIQUE,
	"prd_id_fk" int NOT NULL,
	"cust_id_fk" int NOT NULL,
	"instl_date" DATE NOT NULL,
	"wrnty_period" int NOT NULL,
	"wrnty_start_date" DATE NOT NULL,
	"wrnty_end_date" DATE GENERATED ALWAYS AS (
		"wrnty_start_date" + make_interval(years => wrnty_period) - INTERVAL '1 day'
		)STORED,
	"mcn_status_code" int NOT NULL,
	"amc_start_date" DATE DEFAULT NULL,
	"amc_end_date" DATE GENERATED ALWAYS AS (
		"amc_start_date" + make_interval(years => 1) - INTERVAL '1 day'
		)STORED,
	"br_mgr_code" varchar(16) NOT NULL,
	"reg_mgr_code" varchar(16) NOT NULL,
	PRIMARY KEY ("mcn_sno"),
	FOREIGN KEY ("prd_id_fk") REFERENCES "products"("prd_id"),
	FOREIGN KEY ("cust_id_fk") REFERENCES "customers"("cust_id"),
	FOREIGN KEY ("mcn_status_code") REFERENCES "status"("status_code")
);

INSERT INTO "machine_details" ("mcn_sno", "prd_id_fk", "cust_id_fk", "instl_date", "wrnty_period", "wrnty_start_date",
									"mcn_status_code", "amc_start_date", "br_mgr_code", "reg_mgr_code")
VALUES
	('SN0001-AX36', 1, 1, '2022-04-18', 3, '2022-04-16', '80', '2025-04-20', 'SUR002', 'DIN016'),
	('SN0002-BY46', 1, 1, '2023-02-20', 3, '2023-02-19', '70', NULL, 'KUN031', 'DIN016'),
	('SN0003-DX45', 2, 2, '2022-05-16', 1, '2022-05-14', '71', NULL, 'SUR002', 'DIN016'),
	('SN0004-DX50', 3, 2, '2022-11-03', 2, '2022-11-02', '80', '2024-11-03', 'SUR002', 'DIN016'),
	('SN0005-EX20', 1, 3, '2021-07-10', 1, '2021-07-09', '71', NULL, 'KUN031', 'DIN016'),
	('SN0006-BY53', 1, 3, '2020-04-03', 3, '2020-04-01', '80',  '2023-05-09', 'DEE006', 'DIN016'),	
	('SN0007-CZ35', 3, 4, '2022-08-18', 3, '2022-08-15', '70', NULL, 'KUN031', 'DIN016'),
	('SN0008-BY37', 3, 4, '2023-09-24', 3, '2023-09-23', '70',  NULL, 'MAN011', 'DIN016'),
	('SN0009-BY72', 2, 4, '2023-09-30', 1, '2023-09-28', '80', '2024-11-22', 'DEE006', 'DIN016'),
	('SN0010-EX91', 2, 4, '2022-07-24', 1, '2022-07-22', '71', NULL, 'ANI007', 'DIN016'),	
	('SN0011-AX25', 2, 5, '2022-01-08', 2, '2022-01-06', '80', '2025-01-13', 'DEE006', 'DIN016'),
	('SN0012-DX73', 1, 5, '2022-09-02', 3, '2022-09-01', '70', NULL, 'MAN011', 'DIN016'),
	('SN0013-AX51', 3, 6, '2021-04-26', 1, '2021-04-26', '80', '2024-06-02', 'ANI007', 'DIN016'),
	('SN0014-AX12', 1, 7, '2021-11-10', 2, '2021-11-08', '80','2024-11-25', 'RAM009', 'DIN016'),
	('SN0015-CZ33', 1, 7, '2021-10-05', 2, '2021-10-01', '71', NULL, 'RAM009', 'DIN016'),
	('SN0016-CZ87', 1, 8, '2021-04-24', 2, '2021-04-22', '80', '2024-06-16', 'ANI007', 'DIN016'),
	('SN0017-BY13', 2, 8, '2023-08-07', 1, '2023-08-06', '80', '2024-09-05', 'RAM009', 'DIN016'),
	('SN0018-BY88', 2, 9, '2022-11-20', 1, '2022-11-18', '71', NULL, 'MAN011', 'DIN016'),
	('SN0019-CZ26', 3, 10, '2021-08-30', 3, '2021-08-29', '80', '2024-10-05', 'RAM009', 'DIN016')
	ON CONFLICT ("mcn_sno") DO NOTHING;
	

SELECT * FROM "machine_details" 
	 LIMIT 5;

-- DROP TABLE "machine_details"