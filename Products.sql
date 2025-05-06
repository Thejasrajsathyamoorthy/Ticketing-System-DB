CREATE TABLE IF NOT EXISTS "products" (
	"prd_id" int GENERATED ALWAYS AS IDENTITY,
	"prd_brand" varchar(15) NOT NULL,
	"prd_model" varchar(50) NOT NULL,
	"prd_code" varchar(10) NOT NULL UNIQUE,
	"prd_name" varchar(50) NOT NULL,	
	"prd_description" varchar(255) NOT NULL,
	"prd_status_code" int NOT NULL,
	PRIMARY KEY ("prd_id"),
	FOREIGN KEY ("prd_status_code") REFERENCES "status"("status_code")
);

INSERT INTO "products" ("prd_code", "prd_name", "prd_brand", "prd_model", "prd_description", "prd_status_code")
VALUES
	('HP122', 'HP Laptop', 'HP', 'FD1197TU', 'HP 15 AI Laptop, Intel Core Ultra 5 125H, 12 Tops, 16GB DDR5, 512GB SSD', '51'),
	('DELL123', 'DELL Laptop', 'DELL', 'Inspiron 3530', 'Dell Inspiron 3530 Laptop, 13th Generation Intel Core i7-1355U Processor, 16GB, 512GB, 15.6" (39.62cm) FHD 120Hz Display, Backlit KB, Windows 11 + MSO 21, 15 Month McAfee, Silver, Thin & Light-1.62kg', '50'),
	('HP589', 'HP Printer', 'HP', 'HP Smart Tank 589', 'HP Smart Tank 589 All-in-One WiFi Colour Printer – 30 ppm Speed, High Capacity Ink Tank, Wireless, Ideal for Home & Office Printing', '52')
ON CONFLICT ("prd_code") DO NOTHING;


SELECT * FROM "products" --LIMIT 5;

-- DROP TABLE "products"