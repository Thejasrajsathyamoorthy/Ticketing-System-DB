CREATE TABLE IF NOT EXISTS "loc_int" (
	"loc_id" int GENERATED ALWAYS AS IDENTITY,
	"loc_assigned" TEXT NOT NULL UNIQUE,
	PRIMARY KEY ("loc_id")
);


INSERT INTO "loc_int" ("loc_assigned") 
VALUES 
	('North Bangalore'),
	('South Bangalore'),
	('East Bangalore'),
	('West Bangalore'),
	('Central Bangalore'),
	('Head Office')
ON CONFLICT ("loc_assigned") DO NOTHING;

SELECT * FROM "loc_int" LIMIT 10;

-- DROP TABLE "loc_int"