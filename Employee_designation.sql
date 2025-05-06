CREATE TABLE IF NOT EXISTS "emp_designation"(
	"emp_desg_id" int GENERATED ALWAYS AS IDENTITY,
	"designation" varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY ("emp_desg_id")
);

INSERT INTO "emp_designation" ("designation")
VALUES
	('Regional Manager'),
	('Branch Manager'),
	('Admin'),
	('SE_P'),
	('SE_H'),
	('SE_N')
ON CONFLICT ("designation") DO NOTHING;


SELECT * FROM "emp_designation";

-- DROP TABLE "emp_designation"