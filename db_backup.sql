-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               PostgreSQL 10.19 on x86_64-pc-linux-musl, compiled by gcc (Alpine 10.3.1_git20211027) 10.3.1 20211027, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table public.categories
CREATE TABLE IF NOT EXISTS "categories" (
	"category_id" VARCHAR(50) NOT NULL,
	"category_name" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("category_id")
);

-- Dumping data for table public.categories: 0 rows
DELETE FROM "categories";
/*!40000 ALTER TABLE "categories" DISABLE KEYS */;
INSERT INTO "categories" ("category_id", "category_name") VALUES
	('1', 'การแพทย์'),
	('2', 'การศึกษา'),
	('3', 'เด็กและสตรี'),
	('4', 'บรรเทาสาธารณะภัย'),
	('5', 'ผู้พิการ'),
	('6', 'ผู้สูงอายุ'),
	('7', 'พัฒนาชุมชน'),
	('8', 'ศิลปะและวัฒนธรรม'),
	('9', 'สัตว์'),
	('10', 'สิ่งแวดล้อม'),
	('11', 'สิทธิมนุษยชน');
/*!40000 ALTER TABLE "categories" ENABLE KEYS */;

-- Dumping structure for table public.fdns_resources_documents
CREATE TABLE IF NOT EXISTS "fdns_resources_documents" (
	"fdn_resources_doc_uuid" VARCHAR(50) NOT NULL,
	"file_name" VARCHAR(50) NOT NULL,
	"file_path" VARCHAR(255) NOT NULL,
	"file_type" VARCHAR(50) NOT NULL,
	"fdn_uuid" VARCHAR(50) NULL DEFAULT NULL,
	"create_date" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("fdn_resources_doc_uuid")
);

-- Dumping data for table public.fdns_resources_documents: 0 rows
DELETE FROM "fdns_resources_documents";
/*!40000 ALTER TABLE "fdns_resources_documents" DISABLE KEYS */;
INSERT INTO "fdns_resources_documents" ("fdn_resources_doc_uuid", "file_name", "file_path", "file_type", "fdn_uuid", "create_date") VALUES
	('21ae0ccf-bccc-44e7-9c20-350b11743bee', 'IBM_Plex_Sans_Thai,Montserrat.zip', 'D:\me\int371\namjai-be\fdn_documents\', 'zip', '2b6aeebc-a38b-49fc-aaaa-d1f3e8016782', NULL),
	('0d057c93-39c9-4690-81d9-ce0d0aff7c1b', 'FOb4myuacAooNVZ.zip', './fdn_documents/', 'zip', '33344511113333', '2022-09-06 22:51:28.507'),
	('7f562223-8b23-4366-a02e-8b37603ce4f0', 'FOb4myuacAooNVZ.zip', './fdn_documents/', 'zip', '5', '2022-09-11 19:55:50.014'),
	('13e09eb7-101f-44e8-b797-43a7ba287805', 'FOb4myuacAooNVZ.zip', './fdn_documents/', 'zip', '2', '2022-09-11 19:56:46.771'),
	('932eea02-65b7-47d3-b766-8eeb2944367f', 'FOb4myuacAooNVZ.zip', './fdn_documents/', 'zip', '2', '2022-09-12 01:35:43.785');
/*!40000 ALTER TABLE "fdns_resources_documents" ENABLE KEYS */;

-- Dumping structure for table public.fdn_categories
CREATE TABLE IF NOT EXISTS "fdn_categories" (
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"category_id" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("fdn_uuid", "category_id"),
	CONSTRAINT "fdn_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."categories" ("category_id") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "fdn_categories_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_categories: 0 rows
DELETE FROM "fdn_categories";
/*!40000 ALTER TABLE "fdn_categories" DISABLE KEYS */;
INSERT INTO "fdn_categories" ("fdn_uuid", "category_id") VALUES
	('949526a8-893e-41af-a222-abd7dbfb5fac', '1'),
	('29536bf0-6fab-4257-be44-463b46a1388e', '11'),
	('cd4ea7b8-b5e8-418e-abbf-4b735a58c374', '8');
/*!40000 ALTER TABLE "fdn_categories" ENABLE KEYS */;

-- Dumping structure for table public.fdn_posts
CREATE TABLE IF NOT EXISTS "fdn_posts" (
	"fdn_post_uuid" VARCHAR(50) NOT NULL,
	"post_title" VARCHAR(255) NOT NULL,
	"post_detail" VARCHAR(255) NOT NULL,
	"create_date" TIMESTAMP NOT NULL,
	"fdn_uuid" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("fdn_post_uuid"),
	CONSTRAINT "fdn_posts_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_posts: 0 rows
DELETE FROM "fdn_posts";
/*!40000 ALTER TABLE "fdn_posts" DISABLE KEYS */;
INSERT INTO "fdn_posts" ("fdn_post_uuid", "post_title", "post_detail", "create_date", "fdn_uuid") VALUES
	('c2bbd3ec-8bcc-415c-b9c8-494b3703645c', 'สภากาชาดไทยจับมือองค์กรชั้นนำร่วมพาประเทศไทยเข้าสู่นวัตกรรมส่งเสริมความยั่งยืนวงการแพทย์', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบฉากที่เด็กทารกเสียชีวิตเพราะรถชนแล้วหลุดออกมาจากรถออกมากระแทก', '2022-09-04 18:43:11.328771', '949526a8-893e-41af-a222-abd7dbfb5fac'),
	('798d8c2d-d50a-4ef8-95cb-bee978ac4127', 'ไรเฟิลแฟกซ์คาแรคเตอร์ม้านั่ง กระดี๊กระด๊าแป๋ว นาฏยศาลาแตงโมเคส แฟรีตรวจสอบซาดิ', 'แมมโบ้จุ๊ย แฮนด์ซาฟารีแฟกซ์รุสโซ แดนเซอร์บร็อกโคลีป๊อก เซลส์แมนไพลินแบล็ค มหาอุปราชาเจ๊ ช็อต เอฟเฟ็กต์ หลินจือ ไพลินออสซี่แจ๊กพ็อต คูลเลอร์', '2022-09-04 18:43:11.368007', '29536bf0-6fab-4257-be44-463b46a1388e'),
	('35181b43-5be0-4bf6-b205-fe193ce4523b', 'ซากุระหลวงปู่ ราเมน แชเชือน วโรกาสอันตรกิริยารูบิก', 'แคร็กเกอร์ ไฮไลท์วาทกรรม ลีกโชห่วย แคนยอนมิลค์เอเซียเมี่ยงคำตังค์ โบว์คอนเซ็ปต์ หลวงปู่ไมค์โพสต์กิฟท์แรงผลัก แกรนด์แฟนตาซีอัลตรา พูลอิมพีเรียลแหววแม็กกาซีนมาร์ก คอนโดโก๊ะนิวแอคทีฟก๋ากั่น', '2022-09-04 18:43:11.399181', 'cd4ea7b8-b5e8-418e-abbf-4b735a58c374');
/*!40000 ALTER TABLE "fdn_posts" ENABLE KEYS */;

-- Dumping structure for table public.fdn_projects
CREATE TABLE IF NOT EXISTS "fdn_projects" (
	"fdn_project_uuid" VARCHAR(50) NOT NULL,
	"fp_name" VARCHAR(255) NOT NULL,
	"goal" INTEGER NOT NULL,
	"create_date" TIMESTAMP NOT NULL,
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"picture_path" TEXT NULL DEFAULT NULL,
	"fp_detail" TEXT NULL DEFAULT NULL,
	"fp_detail_place" TEXT NULL DEFAULT NULL,
	"responsible_person" VARCHAR(255) NULL DEFAULT NULL,
	"status" VARCHAR(50) NULL DEFAULT 'OPEN',
	"start_date" DATE NULL DEFAULT 'now()',
	"end_date" DATE NULL DEFAULT 'now()',
	PRIMARY KEY ("fdn_project_uuid"),
	CONSTRAINT "fdn_projects_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_projects: 4 rows
DELETE FROM "fdn_projects";
/*!40000 ALTER TABLE "fdn_projects" DISABLE KEYS */;
INSERT INTO "fdn_projects" ("fdn_project_uuid", "fp_name", "goal", "create_date", "fdn_uuid", "picture_path", "fp_detail", "fp_detail_place", "responsible_person", "status", "start_date", "end_date") VALUES
	('62f9fb70-8ab0-4ae6-a1af-f55d76a88bad', 'จิตพิสัยเพียว มวลชนคัตเอาต์เนิร์สเซอรี่', 20000, '2022-09-04 18:39:56.544443', 'cd4ea7b8-b5e8-418e-abbf-4b735a58c374', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'John Smith', 'OPEN', '2022-09-16', '2022-09-16'),
	('5d459431-c872-4089-8334-41ed786bae35', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-11 23:58:40.734', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', 'NOT_SHOWING', '2022-09-16', '2022-09-16'),
	('cef1b5a2-fc05-4405-8c1e-95ee06ea97ec', 'นู้ดหมั่นโถว เพนตากอนเมคอัพเลสเบี้ยน', 30000, '2022-09-04 18:39:56.52428', '29536bf0-6fab-4257-be44-463b46a1388e', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'John Smith', 'OPEN', '2022-09-16', '2022-09-16'),
	('43a047f7-55c2-49cc-9aa2-19527da04727', 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย', 15000, '2022-09-04 18:39:56.513722', '949526a8-893e-41af-a222-abd7dbfb5fac', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'John Smith', 'OPEN', '2022-09-16', '2022-09-16'),
	('5d459431-c872-4089-8334-41ed786bae37', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-17 02:06:08.205', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', 'OPEN', '2022-09-24', '2022-10-08'),
	('5d459431-c872-4089-8334-41ed786bae38', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-17 02:06:13.128', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', 'OPEN', '2022-09-24', '2022-10-08'),
	('5d459431-c872-4089-8334-41ed786bae39', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-17 02:06:16.902', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', 'OPEN', '2022-09-24', '2022-10-08'),
	('5d459431-c872-4089-8334-41ed786bae36', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-17 02:06:00.46', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', 'OPEN', '2022-09-24', '2022-10-08'),
	('5d459431-c872-4089-8334-41ed786bae40', 'ซื้อไก่ต้มน้ำปลาให้น้อง ๆ', 50000, '2022-09-17 02:07:03.571', '25', NULL, 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถ้ารถหยุดกระทันหันเพราะอุบัติเหตุหรืออะไรก็ตาม สมมุติเด็กหนักซักห้าหกกิโล เมื่อรถหยุดทันที สมมุติแล้นมาด้วยความเร็วซักหกสิบกิโลต่อ ชม เด็กก็จะยังเคลื่อนที่ไปข้างหน้าด้วยความเร็วนั้น ลองนึกภาพดัมเบลเหล็กห้ากิโลที่พุ่งไปด้วยความเร็วหกสิบกิโลเมตรต่อชั่วโมง ', 'จากการ์ตูน ตำรวจสาวป้อมยามตอนสิบ ฉากที่เด็กทารกเสียชีวิต เพราะรถชน แล้วหลุดออกมาจากรถ ออกมากระแทกพื้นถนน จนร่างกายผิดรูปเสียชีวิตคาที่
อันนี้ตามข้อเท็จจริงเลยครับ คือไม่ว่าพ่อแม่จะอุ้มลูกดูยังไงก็ตาม แต่ถารถหยดกระทนหนเพราะอบตเหตหรออะไรกตาม สมมตเดกหนกซกหาหกกโล เมอรถหยดทนท สมมตแลนมาดวยความเรวซกหกสบกโลตอ ชม เดกกจะยงเคลอนทไปขางหนาดวยความเรวนน ลองนกภาพดมเบลเหลกหากโลทพงไปดวยความเรวหกสบกโลเมตรตอชวโมง ', 'John Smith', NULL, '2022-09-24', '2022-10-08');
/*!40000 ALTER TABLE "fdn_projects" ENABLE KEYS */;

-- Dumping structure for table public.fdn_project_target_categories
CREATE TABLE IF NOT EXISTS "fdn_project_target_categories" (
	"fdn_project_uuid" VARCHAR(50) NOT NULL,
	"target_category_id" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("fdn_project_uuid", "target_category_id"),
	CONSTRAINT "fdn_project_target_categories_fdn_project_uuid_fkey" FOREIGN KEY ("fdn_project_uuid") REFERENCES "public"."fdn_projects" ("fdn_project_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "fdn_project_target_categories_target_category_id_fkey" FOREIGN KEY ("target_category_id") REFERENCES "public"."target_categories" ("target_category_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_project_target_categories: 0 rows
DELETE FROM "fdn_project_target_categories";
/*!40000 ALTER TABLE "fdn_project_target_categories" DISABLE KEYS */;
INSERT INTO "fdn_project_target_categories" ("fdn_project_uuid", "target_category_id") VALUES
	('43a047f7-55c2-49cc-9aa2-19527da04727', '1'),
	('43a047f7-55c2-49cc-9aa2-19527da04727', '4'),
	('cef1b5a2-fc05-4405-8c1e-95ee06ea97ec', '4'),
	('cef1b5a2-fc05-4405-8c1e-95ee06ea97ec', '7'),
	('62f9fb70-8ab0-4ae6-a1af-f55d76a88bad', '7'),
	('5d459431-c872-4089-8334-41ed786bae35', '3'),
	('5d459431-c872-4089-8334-41ed786bae35', '2'),
	('5d459431-c872-4089-8334-41ed786bae36', '3'),
	('5d459431-c872-4089-8334-41ed786bae36', '2'),
	('5d459431-c872-4089-8334-41ed786bae37', '3'),
	('5d459431-c872-4089-8334-41ed786bae37', '2'),
	('5d459431-c872-4089-8334-41ed786bae38', '2'),
	('5d459431-c872-4089-8334-41ed786bae38', '3'),
	('5d459431-c872-4089-8334-41ed786bae39', '2'),
	('5d459431-c872-4089-8334-41ed786bae39', '3'),
	('5d459431-c872-4089-8334-41ed786bae40', '3'),
	('5d459431-c872-4089-8334-41ed786bae40', '2');
/*!40000 ALTER TABLE "fdn_project_target_categories" ENABLE KEYS */;

-- Dumping structure for table public.fdn_rejected
CREATE TABLE IF NOT EXISTS "fdn_rejected" (
	"fdn_rejected_uuid" VARCHAR(50) NOT NULL,
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"detail" TEXT NOT NULL,
	"create_date" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("fdn_rejected_uuid"),
	CONSTRAINT "fdn_rejected_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_rejected: 0 rows
DELETE FROM "fdn_rejected";
/*!40000 ALTER TABLE "fdn_rejected" DISABLE KEYS */;
/*!40000 ALTER TABLE "fdn_rejected" ENABLE KEYS */;

-- Dumping structure for table public.fdn_staff
CREATE TABLE IF NOT EXISTS "fdn_staff" (
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"user_uuid" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("user_uuid", "fdn_uuid"),
	CONSTRAINT "fdn_staff_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "fdn_staff_user_uuid_fkey" FOREIGN KEY ("user_uuid") REFERENCES "public"."users" ("user_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.fdn_staff: 0 rows
DELETE FROM "fdn_staff";
/*!40000 ALTER TABLE "fdn_staff" DISABLE KEYS */;
/*!40000 ALTER TABLE "fdn_staff" ENABLE KEYS */;

-- Dumping structure for table public.foundations
CREATE TABLE IF NOT EXISTS "foundations" (
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"sub_district" VARCHAR(255) NOT NULL,
	"district" VARCHAR(255) NOT NULL,
	"province" VARCHAR(255) NOT NULL,
	"postalcode" VARCHAR(50) NOT NULL,
	"founder_name" VARCHAR(255) NOT NULL,
	"fdn_detail" TEXT NOT NULL,
	"fdn_size" VARCHAR(255) NOT NULL,
	"establish_date" VARCHAR(50) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"contact_num" VARCHAR(20) NOT NULL,
	"status" VARCHAR(50) NOT NULL,
	"address_detail" TEXT NULL DEFAULT NULL,
	"approval" VARCHAR(255) NULL DEFAULT 'NULL::character varying',
	"create_date" DATE NULL DEFAULT 'now()',
	"qrcode_path" TEXT NULL DEFAULT NULL,
	"profile_path" TEXT NULL DEFAULT NULL,
	"name_en" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("fdn_uuid"),
	UNIQUE INDEX "foundations_name_key" ("name"),
	UNIQUE INDEX "foundations_email_key" ("email")
);

-- Dumping data for table public.foundations: 4 rows
DELETE FROM "foundations";
/*!40000 ALTER TABLE "foundations" DISABLE KEYS */;
INSERT INTO "foundations" ("fdn_uuid", "name", "sub_district", "district", "province", "postalcode", "founder_name", "fdn_detail", "fdn_size", "establish_date", "email", "contact_num", "status", "address_detail", "approval", "create_date", "qrcode_path", "profile_path", "name_en") VALUES
	('cd4ea7b8-b5e8-418e-abbf-4b735a58c374', 'มูลนิธิสัตว์โลกน่ารัก', 'ตลาดบางบาง', 'หลักหน่วย', 'กรุงเทพมหานคร', '22202', 'นายประเสิรฐ จัง', 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์ เซอร์ไพรส์ดัมพ์ คำตอบพาสเจอร์ไรส์ เซ็นทรัลน็อกจูนฮิปโปเทเลกราฟ พาสปอร์ตโค้กยิวฟีดฮัม เกย์ไฟต์ปิยมิตรมาร์กแจ็กเก็ต ลาเต้ แคมเปญ คาเฟ่คอร์ปแยมโรลเบนโตะบ๊อกซ์ แมนชั่นปักขคณนาวานิลา คาแร็คเตอร์แฟล็ต ปูอัด', 'ใหญ่', '2499', 'dee@gmail.com', '0812345678', 'REJECTED', '24/56 Bang Na-Trat Rd, Tambon Bang Sao Thong, Amphoe Bang Sao Thong, Chang Wat Samut Prakan 10540', NULL, '2022-09-07', NULL, NULL, NULL),
	('33344511113333', 'testfdnName25111133333', 'testSubDistrict', 'testDistrict', 'testProvince', 'testPostalCode', 'testFounderName', 'testFdnDetail', 'testFdnSize', '2022-09-06', 'khonjai.3994@gmail.com', 'testContactNumber', 'VERIFIED', 'TestAddress', NULL, '2022-09-07', NULL, NULL, NULL),
	('29536bf0-6fab-4257-be44-463b46a1388e', 'มูลนิธิเพื่อเด็กและสตรี', 'เอบีซี', 'ฟฟหกดเาสว', 'กรุงเทพมหานคร', '00000', 'นายอนงค์ คนดี', 'สจ๊วตตาปรือ มายาคติจูนฟลุทถ่ายทำสะบึมส์ อยุติธรรมเห่ยสามช่าไฮแจ็ค เนิร์สเซอรี่ผลักดันเพทนาการโปรเจกเตอร์สกาย ทัวร์กีวี จีดีพีแมมโบ้เซอร์วิสวาทกรรมฮัม อุตสาหการซังเตออโต้รีโมท แซว ซื่อบื้อ มยุราภิรมย์ซูเปอร์แชมพู เฮียวันเวย์ฮากกา วาไรตี้ซื่อบื้อโปรดิวเซอร์ซันตาคลอสฮิปฮอป พุดดิ้งแรงผลักโอเพ่นไฮไลต์ ลิสต์ สมาพันธ์ แอนด์ป๋าคอนแทคชะโนดกู๋', 'เล็ก', '2544', 'foundation@gmail.com', '0800000000', 'VERIFIED', 'เลขที่ 000 ซอยกจค 99  ถนน abc', 'qwanjai_admin', '2022-09-07', NULL, NULL, NULL),
	('2', 'testfdnName2', 'testSubDistrict', 'testDistrict', 'testProvince', 'testPostalCode', 'testFounderName', 'testFdnDetail', 'testFdnSize', 'testEstablishDate', 'khonjai.backup@gmail.com', 'testContactNumber', 'VERIFIED', 'TestAddress', NULL, NULL, NULL, NULL, NULL),
	('3', 'testfdnName3', 'testSubDistrict', 'testDistrict', 'testProvince', 'testPostalCode', 'testFounderName', 'testFdnDetail', 'testFdnSize', 'testEstablishDate', 'backuporeilly@gmail.com', 'testContactNumber', 'VERIFIED', 'TestAddress', NULL, NULL, NULL, NULL, NULL),
	('949526a8-893e-41af-a222-abd7dbfb5fac', 'มูลนิธิกระจกเงา', 'ตลาดบางเขน', 'หลักสี่', 'กรุงเทพมหานคร', '10210', 'นายสมบัติ บุญงามอนงค์', 'มูลนิธิกระจกเงา คือ องค์กรพัฒนาเอกชนที่ทำงานเกี่ยวกับการพัฒนาสังคม หลายด้าน ได้แก่ งานด้านสิทธิมนุษยชน งานด้านสื่อและเทคโนโลยีสารสนเทศ งานพัฒนาอาสาสมัครและการแบ่งปันทรัพยากร เพื่อเพิ่มศักยภาพใน การเรียนรู้และการใช้ชีวิต โดยมีพื้นที่ปฏิบัติงานทั้งบนสังคมออนไลน์ (internet) สังคมเมืองและสังคมชนบท โดยทำหน้าที่เป็นกระจกเงา ที่สะท้อนเรื่องราว ความเป็นจริงของสังคมและให้ความช่วยเหลือผู้ที่ได้รับผล กระทบจาก การเปลี่ยนแปลงของสังคม ด้วยวิธีคิด คือ การสร้างคนและสร้างนวัตกรรม สร้างความมเปลี่ยนแปลงแก่สังคม', 'ใหญ่', '2534', 'khonjai.3994@gmail.com44444', '061-9091840', 'VERIFIED', 'เลขที่ 191 ซอยวิภาวดี 62 (แยก 4-7) ถนนวิภาวดีรังสิต', 'qwanjai_admin', '2022-09-07', NULL, NULL, NULL),
	('25', 'มูลนิธิไก่ต้มน้ำปลา', 'testSubDistrict', 'testDistrict', 'testProvince', 'testPostalCode', 'testFounderName', 'testFdnDetail', 'testFdnSize', 'testEstablishDate', 'fdnkaitomnampla@gmail.com', 'testContactNumber', 'VERIFIED', 'TestAddress', NULL, NULL, './foundation/มูลนิธิไก่ต้มน้ำปลา/angry_shibe.jpg', './foundation/kaitomnampla/angry_shibe.jpg', 'kaitomnampla');
/*!40000 ALTER TABLE "foundations" ENABLE KEYS */;

-- Dumping structure for table public.report_issue
CREATE TABLE IF NOT EXISTS "report_issue" (
	"issue_uuid" VARCHAR(50) NOT NULL,
	"issue_type" VARCHAR(255) NOT NULL,
	"detail" TEXT NOT NULL,
	"reporter" VARCHAR(255) NULL DEFAULT NULL,
	"issue_status" VARCHAR(150) NULL DEFAULT NULL,
	PRIMARY KEY ("issue_uuid")
);

-- Dumping data for table public.report_issue: 0 rows
DELETE FROM "report_issue";
/*!40000 ALTER TABLE "report_issue" DISABLE KEYS */;
INSERT INTO "report_issue" ("issue_uuid", "issue_type", "detail", "reporter", "issue_status") VALUES
	('83f4ee8a-82f1-432c-949d-b2b5725577bd', 'WEB_PROBLEM', 'Web seems not having much feature', 'qwanjai', 'UNSOLVED'),
	('e0624ea6-8498-487b-8a4b-a87ee7ee2d7c', 'FDN_PROBLEM', 'Foundation seems not having much project', 'qwanjai', 'UNSOLVED');
/*!40000 ALTER TABLE "report_issue" ENABLE KEYS */;

-- Dumping structure for table public.roles
CREATE TABLE IF NOT EXISTS "roles" (
	"role_id" VARCHAR(50) NOT NULL,
	"role_name" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("role_id")
);

-- Dumping data for table public.roles: 0 rows
DELETE FROM "roles";
/*!40000 ALTER TABLE "roles" DISABLE KEYS */;
INSERT INTO "roles" ("role_id", "role_name") VALUES
	('1', 'ROLE_ADMIN'),
	('2', 'ROLE_USER'),
	('3', 'ROLE_FDN'),
	('4', 'ROLE_FDN_STAFF');
/*!40000 ALTER TABLE "roles" ENABLE KEYS */;

-- Dumping structure for table public.target_categories
CREATE TABLE IF NOT EXISTS "target_categories" (
	"target_category_id" VARCHAR(50) NOT NULL,
	"target_category_name" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("target_category_id")
);

-- Dumping data for table public.target_categories: 0 rows
DELETE FROM "target_categories";
/*!40000 ALTER TABLE "target_categories" DISABLE KEYS */;
INSERT INTO "target_categories" ("target_category_id", "target_category_name") VALUES
	('1', 'การแพทย์'),
	('2', 'การศึกษา'),
	('3', 'เด็กและสตรี'),
	('4', 'บรรเทาสาธารณะภัย'),
	('5', 'ผู้พิการ'),
	('6', 'ผู้สูงอายุ'),
	('7', 'พัฒนาชุมชน'),
	('8', 'ศิลปะและวัฒนธรรม'),
	('9', 'สัตว์'),
	('10', 'สิ่งแวดล้อม'),
	('11', 'สิทธิมนุษยชน');
/*!40000 ALTER TABLE "target_categories" ENABLE KEYS */;

-- Dumping structure for table public.users
CREATE TABLE IF NOT EXISTS "users" (
	"user_uuid" VARCHAR(50) NOT NULL,
	"email" VARCHAR(255) NOT NULL,
	"fname" VARCHAR(255) NOT NULL,
	"lname" VARCHAR(255) NOT NULL,
	"username" VARCHAR(255) NOT NULL,
	"password" VARCHAR(255) NOT NULL,
	"role_id" VARCHAR(50) NOT NULL,
	"status" VARCHAR(100) NOT NULL,
	"create_date" DATE NULL DEFAULT 'now()',
	"phone_number" VARCHAR(10) NULL DEFAULT '0900000000',
	PRIMARY KEY ("user_uuid"),
	UNIQUE INDEX "users_email_key" ("email"),
	CONSTRAINT "users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("role_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.users: 6 rows
DELETE FROM "users";
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" ("user_uuid", "email", "fname", "lname", "username", "password", "role_id", "status", "create_date", "phone_number") VALUES
	('e10e697d-377b-42ab-9148-e552b0bf1b8a', 'qwanjai_admin@gmail.com', 'qwanjai_admin', 'dee', 'qwanjai_admin', '$2a$10$6.Qzjb2znkuVELiSPMOsW.W4Qn3ldJNrcvyyFIccZ0hGuncn3MNqa', '1', 'ACTIVE', '2022-09-07', '0900000000'),
	('b1428f68-f3f7-4a96-ae6a-436a3d235e79', 'khonjai.3994@gmail.com3333', 'Foundation', 'testfdnName2', 'testfdnName2', '$2a$10$pPYCWv7udKsXXrytEJpd6epnh1gZMS1ZS33MZd1deke74qRvKAk0C', '3', 'DISABLE', '2022-09-07', '0900000000'),
	('c793dbb5-e957-472c-baf6-8607ec2b6acc', 'khonjai.3994@gmail.com', 'Foundation', 'testfdnName25111133333', 'testfdnName25111133333', '$2a$10$w5yBF4tE95/mJIOH4FHbVuJVNVnTfPmLp8OBoCI8GwNLUdiA8BuoO', '3', 'ACTIVE', '2022-09-07', '0900000000'),
	('47a67449-b99a-4076-9bc4-5f0d6152170f', 'khonjai.backup@gmail.com', 'Foundation', 'testfdnName2', 'testfdnName2', '$2a$10$aOSwc2d0g7fHScI/u1wupOm70KsaegMnKluDAGFrOQN3gMV90FMiS', '3', 'ACTIVE', '2022-09-09', '0900000000'),
	('85727469-10f3-4c11-8999-0822a8f70549', 'backuporeilly@gmail.com', 'Foundation', 'testfdnName3', 'testfdnName3', '$2a$10$/hpNhuTRmE6S9dbchkDiF.2Hf6Bi6LTq3DsRvIYBrv95EoaEBOGim', '3', 'ACTIVE', '2022-09-09', '0900000000'),
	('c0ebfcbf-3d29-4e43-a72f-0ac0148dc161', 'fdnkaitomnampla@gmail.com', 'Foundation', 'มูลนิธิไก่ต้มน้ำปลา', 'มูลนิธิไก่ต้มน้ำปลา', '$2a$10$cwkDar7hjdB9tdlZq7lp0eKnbQwgw6kXyvfL.NpTUAqAAiPq6IwT.', '3', 'ACTIVE', '2022-09-11', '0900000000'),
	('9b18cdcc-589d-4683-9337-919636b126ba', 'qwanjai@kaitomnampla.com', 'qwanjagfgfgfi3', 'deefgffg', 'qwanjai_usernormal', '$2a$10$drTucLH3FJDCyc9KAEhwougTYr5e3GmiqRLaggwyV1TnDkdw0HrSS', '2', 'ACTIVE', '2022-10-17', NULL),
	('a87adb77-5740-4887-94d8-c86f7a22c304', 'qwanjai@lng320.com', 'qwanjagfgfgfi22', 'deefgffg', 'qwanjai_usernormal2', '$2a$10$3B37yPm4n9nKoDsCNyXeiei1nyIpqcnmWQQvmTG4Uu2pMvSh2cyBu', '2', 'ACTIVE', '2022-10-19', NULL);
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

-- Dumping structure for table public.user_posts
CREATE TABLE IF NOT EXISTS "user_posts" (
	"user_post_uuid" VARCHAR(50) NOT NULL,
	"post_title" VARCHAR(255) NOT NULL,
	"post_detail" TEXT NOT NULL,
	"create_date" TIMESTAMP NOT NULL,
	"user_uuid" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("user_post_uuid"),
	CONSTRAINT "user_posts_user_uuid_fkey" FOREIGN KEY ("user_uuid") REFERENCES "public"."users" ("user_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.user_posts: 0 rows
DELETE FROM "user_posts";
/*!40000 ALTER TABLE "user_posts" DISABLE KEYS */;
/*!40000 ALTER TABLE "user_posts" ENABLE KEYS */;

-- Dumping structure for table public.volunteers_projects
CREATE TABLE IF NOT EXISTS "volunteers_projects" (
	"volunteer_projects_uuid" VARCHAR(50) NOT NULL,
	"vp_name" VARCHAR(255) NOT NULL,
	"people_needed" INTEGER NOT NULL,
	"description" TEXT NOT NULL,
	"activity_type" VARCHAR(255) NULL DEFAULT NULL,
	"create_date" TIMESTAMP NOT NULL,
	"fdn_uuid" VARCHAR(50) NOT NULL,
	"location_detail" TEXT NULL DEFAULT NULL,
	"location_district" VARCHAR(100) NULL DEFAULT NULL,
	"location_subdistrict" VARCHAR(100) NULL DEFAULT NULL,
	"location_province" VARCHAR(100) NULL DEFAULT NULL,
	"location_postalcose" VARCHAR(100) NULL DEFAULT NULL,
	"picture_path" VARCHAR(255) NULL DEFAULT NULL,
	"people_registered" INTEGER NULL DEFAULT NULL,
	"start_date" DATE NULL DEFAULT NULL,
	"end_date" DATE NULL DEFAULT NULL,
	"activity_start_date" DATE NULL DEFAULT NULL,
	"activity_end_date" DATE NULL DEFAULT NULL,
	"user_uuid" VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY ("volunteer_projects_uuid"),
	CONSTRAINT "volunteers_projects_fdn_uuid_fkey" FOREIGN KEY ("fdn_uuid") REFERENCES "public"."foundations" ("fdn_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "volunteers_projects_user_uuid_fkey" FOREIGN KEY ("user_uuid") REFERENCES "public"."users" ("user_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.volunteers_projects: 0 rows
DELETE FROM "volunteers_projects";
/*!40000 ALTER TABLE "volunteers_projects" DISABLE KEYS */;
INSERT INTO "volunteers_projects" ("volunteer_projects_uuid", "vp_name", "people_needed", "description", "activity_type", "create_date", "fdn_uuid", "location_detail", "location_district", "location_subdistrict", "location_province", "location_postalcose", "picture_path", "people_registered", "start_date", "end_date", "activity_start_date", "activity_end_date", "user_uuid") VALUES
	('3', 'สจ๊วตตาปรือ4', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 09:52:34.04', '3', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL),
	('4', 'สจ๊วตตาปรือ5', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 11:03:11.954', '25', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL),
	('5', 'สจ๊วตตาปรือ5', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 11:04:39.198', '25', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL),
	('6', 'สจ๊วตตาปรือ6', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 11:11:21.335', '25', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL),
	('7', 'สจ๊วตตาปรือ7', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 11:14:48.211', '25', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL),
	('8', 'สจ๊วตตาปรือ8', 12, 'โบรกเกอร์เซ็นเตอร์ไฟลท์โชห่วย วิลเลจอยุติธรรมแฟลช อุปการคุณ สันทนาการหลินจือโชห่วย ทัวร์นาเมนท์ฮ่องเต้หลวงตาแหววพงษ์', 'Online', '2022-10-19 11:23:59.839', '25', 'cosmo home', 'บางมด', 'ทุ่งครุ', 'กรุงเทพ', '10140', NULL, 0, '2022-09-04', '2022-09-04', '2022-09-04', '2022-09-04', NULL);
/*!40000 ALTER TABLE "volunteers_projects" ENABLE KEYS */;

-- Dumping structure for table public.volunteers_projects_duties
CREATE TABLE IF NOT EXISTS "volunteers_projects_duties" (
	"volunteer_projects_uuid" VARCHAR(50) NOT NULL,
	"duty_detail" TEXT NOT NULL,
	PRIMARY KEY ("volunteer_projects_uuid", "duty_detail"),
	CONSTRAINT "volunteers_projects_duties_volunteer_projects_uuid_fkey" FOREIGN KEY ("volunteer_projects_uuid") REFERENCES "public"."volunteers_projects" ("volunteer_projects_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.volunteers_projects_duties: 0 rows
DELETE FROM "volunteers_projects_duties";
/*!40000 ALTER TABLE "volunteers_projects_duties" DISABLE KEYS */;
INSERT INTO "volunteers_projects_duties" ("volunteer_projects_uuid", "duty_detail") VALUES
	('3', 'Able to do homework'),
	('3', 'Able to do laundury'),
	('8', 'Able to do homework'),
	('8', 'Able to do dishes');
/*!40000 ALTER TABLE "volunteers_projects_duties" ENABLE KEYS */;

-- Dumping structure for table public.volunteers_projects_qualifies
CREATE TABLE IF NOT EXISTS "volunteers_projects_qualifies" (
	"volunteer_projects_uuid" VARCHAR(50) NOT NULL,
	"qualifies_detail" TEXT NOT NULL,
	PRIMARY KEY ("volunteer_projects_uuid", "qualifies_detail"),
	CONSTRAINT "volunteers_projects_qulifies_volunteer_projects_uuid_fkey" FOREIGN KEY ("volunteer_projects_uuid") REFERENCES "public"."volunteers_projects" ("volunteer_projects_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.volunteers_projects_qualifies: 0 rows
DELETE FROM "volunteers_projects_qualifies";
/*!40000 ALTER TABLE "volunteers_projects_qualifies" DISABLE KEYS */;
INSERT INTO "volunteers_projects_qualifies" ("volunteer_projects_uuid", "qualifies_detail") VALUES
	('3', 'Age above 18'),
	('3', 'Accept  all genders'),
	('4', 'Age above 18'),
	('5', 'Age above 20'),
	('6', 'Age above 20'),
	('7', 'Age above 18'),
	('7', 'Age above 20'),
	('8', 'Age above 18'),
	('8', 'Age above 20');
/*!40000 ALTER TABLE "volunteers_projects_qualifies" ENABLE KEYS */;

-- Dumping structure for table public.volunteer_enrolled
CREATE TABLE IF NOT EXISTS "volunteer_enrolled" (
	"volunteer_enrolled_uuid" VARCHAR(50) NOT NULL,
	"volunteer_projects_uuid" VARCHAR(50) NOT NULL,
	"is_member" BOOLEAN NULL DEFAULT NULL,
	"user_uuid" VARCHAR(50) NULL DEFAULT NULL,
	"fname" VARCHAR(150) NULL DEFAULT NULL,
	"lname" VARCHAR(150) NULL DEFAULT NULL,
	"contact_number" VARCHAR(150) NULL DEFAULT NULL,
	"email" VARCHAR(150) NULL DEFAULT NULL,
	PRIMARY KEY ("volunteer_enrolled_uuid"),
	CONSTRAINT "volunteer_enrolled_user_uuid_fkey" FOREIGN KEY ("user_uuid") REFERENCES "public"."users" ("user_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "volunteer_enrolled_volunteer_projects_uuid_fkey" FOREIGN KEY ("volunteer_projects_uuid") REFERENCES "public"."volunteers_projects" ("volunteer_projects_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.volunteer_enrolled: 0 rows
DELETE FROM "volunteer_enrolled";
/*!40000 ALTER TABLE "volunteer_enrolled" DISABLE KEYS */;
INSERT INTO "volunteer_enrolled" ("volunteer_enrolled_uuid", "volunteer_projects_uuid", "is_member", "user_uuid", "fname", "lname", "contact_number", "email") VALUES
	('fe1766c3-f144-4e8b-b495-9db86f6a14f1', '8', 'false', NULL, 'Max2', 'Black2', '08999999992', 'max@black.com2'),
	('3ffa94cc-9cde-4584-b216-a191f97ad36d', '8', 'true', 'a87adb77-5740-4887-94d8-c86f7a22c304', 'qwanjagfgfgfi22', 'deefgffg', NULL, 'qwanjai@lng320.com');
/*!40000 ALTER TABLE "volunteer_enrolled" ENABLE KEYS */;

-- Dumping structure for table public.volunteer_project_target_categories
CREATE TABLE IF NOT EXISTS "volunteer_project_target_categories" (
	"volunteer_projects_uuid" VARCHAR(50) NOT NULL,
	"target_category_id" VARCHAR(50) NOT NULL,
	PRIMARY KEY ("volunteer_projects_uuid", "target_category_id"),
	CONSTRAINT "volunteer_project_target_categorie_volunteer_projects_uuid_fkey" FOREIGN KEY ("volunteer_projects_uuid") REFERENCES "public"."volunteers_projects" ("volunteer_projects_uuid") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "volunteer_project_target_categories_target_category_id_fkey" FOREIGN KEY ("target_category_id") REFERENCES "public"."target_categories" ("target_category_id") ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Dumping data for table public.volunteer_project_target_categories: 0 rows
DELETE FROM "volunteer_project_target_categories";
/*!40000 ALTER TABLE "volunteer_project_target_categories" DISABLE KEYS */;
INSERT INTO "volunteer_project_target_categories" ("volunteer_projects_uuid", "target_category_id") VALUES
	('3', '2'),
	('3', '3'),
	('4', '2'),
	('4', '3'),
	('5', '3'),
	('5', '2'),
	('6', '3'),
	('6', '2'),
	('7', '2'),
	('7', '3'),
	('8', '2'),
	('8', '3');
/*!40000 ALTER TABLE "volunteer_project_target_categories" ENABLE KEYS */;

-- Dumping structure for table public.web_resources
CREATE TABLE IF NOT EXISTS "web_resources" (
	"resource_uuid" VARCHAR(50) NULL DEFAULT NULL,
	"file_name" VARCHAR(255) NULL DEFAULT NULL,
	"create_date" TIMESTAMP NULL DEFAULT 'now()'
);

-- Dumping data for table public.web_resources: 0 rows
DELETE FROM "web_resources";
/*!40000 ALTER TABLE "web_resources" DISABLE KEYS */;
INSERT INTO "web_resources" ("resource_uuid", "file_name", "create_date") VALUES
	('5a8e7eef-ea98-4995-8324-ce4476683a6e', 'angry_shibe.jpg', '2022-09-20 17:23:46.223');
/*!40000 ALTER TABLE "web_resources" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
