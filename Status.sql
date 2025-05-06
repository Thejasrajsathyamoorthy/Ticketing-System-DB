CREATE TABLE IF NOT EXISTS "status" (	
	"status_code" INTEGER NOT NULL UNIQUE,
	"status" TEXT NOT NULL,
	PRIMARY KEY ("status_code")	
);


INSERT INTO "status" ("status_code", "status") VALUES
	('20', 'Active'),
	('21', 'Inactive'),
	('50', 'Discontinued'),
	('51', 'Available'),
	('52', 'Out of Stock'),
	('70', 'In warranty'),
	('71', 'Out of Warranty'),
	('80', 'In AMC'),
	('100', 'Completed'),
	('102', 'On Progress')
ON CONFLICT ("status_code") DO NOTHING;


SELECT * FROM "status";

-- DROP TABLE "status"