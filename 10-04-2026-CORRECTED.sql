-- --------------------------------------------------------
-- Host:                         187.127.128.214
-- Server version:               PostgreSQL 15.8 on x86_64-pc-linux-gnu, compiled by gcc (GCC) 13.2.0, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.16.0.7229
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Disable foreign key constraint checks to allow table creation in any order
 SET session_replication_role = replica;

-- Dumping structure for table public._prisma_migrations
CREATE TABLE IF NOT EXISTS "_prisma_migrations" (
	"id" VARCHAR(36) NOT NULL,
	"checksum" VARCHAR(64) NOT NULL,
	"finished_at" TIMESTAMPTZ NULL DEFAULT NULL,
	"migration_name" VARCHAR(255) NOT NULL,
	"logs" TEXT NULL DEFAULT NULL,
	"rolled_back_at" TIMESTAMPTZ NULL DEFAULT NULL,
	"started_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
	"applied_steps_count" INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY ("id")
);

-- Dumping data for table public._prisma_migrations: -1 rows

-- Dumping structure for table public.Address
CREATE TABLE IF NOT EXISTS "Address" (
	"id" TEXT NOT NULL,
	"userId" TEXT NOT NULL,
	"label" TEXT NOT NULL,
	"addressLine" TEXT NOT NULL,
	"houseNo" TEXT NULL DEFAULT NULL,
	"streetArea" TEXT NULL DEFAULT NULL,
	"city" TEXT NULL DEFAULT NULL,
	"pincode" TEXT NOT NULL,
	"isDefault" BOOLEAN NOT NULL DEFAULT false,
	"googleMapUrl" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "Address_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Dumping data for table public.Address: -1 rows
INSERT INTO "Address" ("id", "userId", "label", "addressLine", "houseNo", "streetArea", "city", "pincode", "isDefault", "googleMapUrl", "createdAt", "updatedAt") VALUES
	('02f9b198-04cc-4de5-9354-20a9ac85ee67', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Pista house', '123, Nacharam, Nacharam, Ward 6 Nacharam, Greater Hyderabad Municipal Corporation East Zone, Uppal mandal, Medchal–Malkajgiri, Telangana, 500076, India, Medchal–Malkajgiri', '123', 'Nacharam', 'Medchal–Malkajgiri', '500001', 'false', 'https://www.google.com/maps/place/Pista+House+Uppal/@17.4221396,78.5576541,13z/data=!4m2!3m1!1s0x0:0x71817374e3378f71?utm_campaign=ml-hpri-aht_2025-wv-msc&g_ep=Eg1tbF8yMDI2MDMyNV8wIJvbDyoASAJQAQ%3D%3D', '2026-03-31 02:09:30.757', '2026-03-31 02:09:30.757'),
	('05c40a15-a090-42d1-b548-7d1786ba3d5a', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-02 09:00:48.026', '2026-04-04 12:01:28.89'),
	('097554bc-81a8-42ef-b06f-7728fed26597', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-04 12:34:47.524', '2026-04-04 12:34:47.524'),
	('1633aa51-cacc-4dde-b906-7140294a8202', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '12453', 'Ranga Reddy', 'Ranga Reddy', '500093', 'false', 'https://www.google.com/maps/place//@17.35728,78.3697036,14.1z/data=!4m8!1m2!2m1!1sHotels!3m4!1s0x3bcb97da3c25b7eb:0xba29be05a45d8c9!8m2!3d17.3595779!4d78.387414?entry=ttu&g_ep=EgoyMDI2MDMxNS4wIKXMDSoASAFQAw%3D%3D', '2026-03-18 13:22:04.506', '2026-03-18 13:22:04.506'),
	('181e66b2-e7ff-4632-b94b-f41e2c01e3c8', 'd8b2945b-48a8-4fa3-824f-a3380fb326f7', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-04 09:02:50.179', '2026-04-04 09:02:50.179'),
	('368a5433-e940-4f98-a9ab-0f1d7059e7cb', 'c78b1780-7325-4700-8836-4838a8c35b59', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-03 08:13:01.419', '2026-04-03 08:13:01.419'),
	('4d1e9088-0230-4e16-9964-338ad9689dea', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-04 12:47:07.279', '2026-04-04 12:47:07.279'),
	('5d7bb8f6-e1be-4f4f-8884-c07f21ac4bf6', '8b1390d5-e522-46b4-a075-36956c0095d2', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-03-30 16:53:54.307', '2026-03-30 16:53:54.307'),
	('656a4aad-8c70-4a18-918e-a71d82499d07', '8b1390d5-e522-46b4-a075-36956c0095d2', 'Home', '233421, Nagole, Hyderabad', '233421', 'Nagole', 'Hyderabad', '500001', 'false', 'https://www.google.com/maps/place/Punjagutta,+Hyderabad,+Telangana/@17.426128,78.4410724,15z/data=!3m1!4b1!4m6!3m5!1s0x3bcb90ca21c29fcb:0xa02313f9052ee76f!8m2!3d17.4254486!4d78.450544!16zL20vMGQ4NzB5?entry=ttu&g_ep=EgoyMDI2MDMyNC4wIKXMDSoASAFQAw%3D%3D', '2026-03-30 17:32:19.021', '2026-03-30 17:32:19.021'),
	('6a19379f-0c14-46b9-8067-17a75b24e04d', '8b1390d5-e522-46b4-a075-36956c0095d2', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-02 09:03:59.24', '2026-04-02 09:03:59.24'),
	('6ccbcefa-4e05-4fac-ab63-f1899612b1a0', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-04 12:24:53.091', '2026-04-04 12:24:53.091'),
	('8418081a-6a95-4b65-8690-4db0e6a49232', '033bc790-69f2-49df-8bb6-5cad9faaa911', 'Sri dhatri', '222, Mallapur, Hyd', '222', 'Mallapur', 'Hyd', '500001', 'true', NULL, '2026-04-04 14:07:19.884', '2026-04-04 14:07:19.884'),
	('8c006a98-7e6d-4216-af62-7d73ac361895', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '3-200/10', 'Sandeep guru swamy', 'Sandeep guru swamy', '500001', 'false', 'https://www.google.com/maps', '2026-04-01 10:06:47.578', '2026-04-05 12:21:37.185'),
	('8c787b0e-4c4f-4dd1-a231-7ba25d75757d', '1b035041-1269-4e2f-b5d0-02fde79e95b5', 'Walk-in', 'Surya nagar', NULL, NULL, NULL, '000000', 'false', NULL, '2026-03-18 11:50:51.125', '2026-03-18 11:50:51.125'),
	('9354a307-585b-48b4-b0b4-dc3591732f98', 'd26666cb-f639-4892-98ce-db3c8cb9fab2', 'Sri dhatri', '123, Mallapur, Hyd', '123', 'Mallapur', 'Hyd', '500001', 'true', NULL, '2026-04-04 14:14:50.401', '2026-04-04 14:14:50.401'),
	('9ca7cafb-4bcf-4a47-a7ca-c42b63201885', '131950a3-84c5-4c0a-87bc-ed776885b0fe', 'Home', 'Demo House, Demo Street', NULL, NULL, NULL, '500081', 'true', NULL, '2026-03-18 07:10:21.316', '2026-03-18 07:10:21.316'),
	('9f78c8ec-e7fe-4848-b5a3-7a838c99c0b1', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'offce', '3-133, kukatpally, hyderabad', '3-133', 'kukatpally', 'hyderabad', '500001', 'true', NULL, '2026-04-04 12:13:50.928', '2026-04-04 12:13:50.928'),
	('ba6e18e6-aea1-4565-9a24-e2aaa8e69518', '8b1b013c-b1f6-4313-9a34-8c5108db1bf5', 'Home', 'Tired ho u6, Goo, Tired ho u6, Goo, Miyapur, Miyapur', 'Tired ho u6', 'Goo', 'Miyapur', '500001', 'false', NULL, '2026-04-04 12:17:54.907', '2026-04-04 12:18:16.955'),
	('bccdfe75-94b7-45ae-be4a-487617b7d021', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Home', '3-13, Mahaa nagar, Mahabad', '3-13', 'Mahaa nagar', 'Mahabad', '500002', 'true', NULL, '2026-04-04 12:01:28.895', '2026-04-04 12:01:28.895'),
	('c0442cbc-8ba6-47be-8b5b-485478909e95', '1b035041-1269-4e2f-b5d0-02fde79e95b5', 'Home', 'LAKS, nagole, DASDASF, nagole', 'LAKS', 'nagole', 'nagole', '500001', 'false', 'https://www.google.com/maps/place/Nagole,+Hyderabad,+Telangana+500068,+India/@17.375161,78.570812,13z/data=!4m6!3m5!1s0x3bcb98d23ef5fa3b:0x2fd6d213bdc9aa2!8m2!3d17.3714737!4d78.5695016!16s%2Fm%2F04f3hyz?hl=en-US&entry=ttu&g_ep=EgoyMDI2MDMyNC4wIKXMDSoASAFQAw%3D%3D', '2026-03-31 04:21:15.775', '2026-03-31 04:21:15.775'),
	('c3d0595e-7c7f-4600-ac71-5be5d5cdce16', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Walk-in', 'Miyapur We You, hyderbad', NULL, NULL, NULL, '000000', 'false', NULL, '2026-03-18 12:14:42.67', '2026-03-18 12:14:42.67'),
	('cea30979-b1ae-4843-b138-96871d325036', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', 'Manjeera mall', 'Guru Balaji Apartments, Sivaji Nagar', 'Hyderabad', '500001', 'false', 'https://www.google.com/maps/place/Manjeera+Trinity+Corporate/@17.4893766,78.3226182,12z/data=!4m6!3m5!1s0x3bcb918dab342375:0x180a04af0c47f594!8m2!3d17.4893763!4d78.3926563!16s%2Fg%2F11gbx8t856?entry=ttu&g_ep=EgoyMDI2MDMxNS4wIKXMDSoASAFQAw%3D%3D', '2026-03-18 14:13:45.468', '2026-03-18 14:13:45.468'),
	('d7192f38-d6a1-4a6a-b3ea-e04d88b93541', '956d6ab1-afda-4046-acff-a77004781020', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-02 08:35:29.48', '2026-04-02 08:35:29.48'),
	('d8362d09-7fc4-45c3-bc15-badee36a826a', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-07 11:01:05.656', '2026-04-07 11:01:05.656'),
	('da1bfaac-e88c-4f25-b777-924e090af98e', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-02 08:56:56.085', '2026-04-04 12:01:28.89'),
	('db676fd0-6fb1-41bc-bbd3-bc6a717d8da4', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-02 09:15:10.737', '2026-04-04 12:13:50.925'),
	('e20bc998-e2e6-49f2-a5e2-3636252b399a', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-03-31 03:12:09.484', '2026-04-04 12:01:28.89'),
	('ec0adbab-a324-4cc3-a5e3-01dbd75ff526', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-03-31 03:27:57.802', '2026-04-04 12:01:28.89'),
	('f87335e8-13ce-42ff-b313-e77a5d0e9f42', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Walk-in', 'PHASE 3 , RAMYA GROUND LANE', NULL, NULL, NULL, '500001', 'false', NULL, '2026-04-04 13:36:33.125', '2026-04-04 13:36:33.125'),
	('fed65189-2792-492a-ba5a-d822b4837560', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'Another home', '35355, Nagole, 35355, Nagole, Hyderabad, Hyderabad', '35355', 'Nagole', 'Hyderabad', '500001', 'false', 'https://goo.gl/maps/daWaBr1bSnmbCWfJ9', '2026-04-01 09:48:48.086', '2026-04-01 09:49:02.98');

-- Dumping structure for table public.Branch
CREATE TABLE IF NOT EXISTS "Branch" (
	"id" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"address" TEXT NOT NULL,
	"phone" TEXT NULL DEFAULT NULL,
	"email" TEXT NULL DEFAULT NULL,
	"gstNumber" TEXT NULL DEFAULT NULL,
	"panNumber" TEXT NULL DEFAULT NULL,
	"footerNote" TEXT NULL DEFAULT NULL,
	"logoUrl" TEXT NULL DEFAULT NULL,
	"upiId" TEXT NULL DEFAULT NULL,
	"upiPayeeName" TEXT NULL DEFAULT NULL,
	"upiLink" TEXT NULL DEFAULT NULL,
	"upiQrUrl" TEXT NULL DEFAULT NULL,
	"isDefault" BOOLEAN NOT NULL DEFAULT false,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.Branch: -1 rows
INSERT INTO "Branch" ("id", "name", "address", "phone", "email", "gstNumber", "panNumber", "footerNote", "logoUrl", "upiId", "upiPayeeName", "upiLink", "upiQrUrl", "isDefault", "createdAt", "updatedAt") VALUES
	('ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'MAHAA ENTERPRISES ,KPHB', 'PHASE 3 , RAMYA GROUND LANE', '+91 8121298787', 'weyouthelaundryman@gmail.com', '36BUTPV3296B1Z0', NULL, 'WE YOU customer care number: +91 8121398787', NULL, NULL, NULL, NULL, NULL, 'false', '2026-03-18 11:46:38.385', '2026-04-02 07:28:48.253'),
	('e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'Miyapur', 'Miyapur We You, hyderbad', '07093142725', 'vudevMiytapur2025@gmail.com', 'MIYAPUR00002737', 'M', 'Thank you, Miyapur', NULL, 'MIYA8949494', 'MIYAPURWEYOU', 'MIYAPURI LINK', NULL, 'false', '2026-03-18 11:49:10.874', '2026-03-31 17:33:34.886');

-- Dumping structure for table public.BrandingSettings
CREATE TABLE IF NOT EXISTS "BrandingSettings" (
	"id" TEXT NOT NULL,
	"businessName" TEXT NOT NULL,
	"logoUrl" TEXT NULL DEFAULT NULL,
	"address" TEXT NOT NULL,
	"phone" TEXT NOT NULL,
	"footerNote" TEXT NULL DEFAULT NULL,
	"panNumber" TEXT NULL DEFAULT NULL,
	"gstNumber" TEXT NULL DEFAULT NULL,
	"email" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	"upiId" TEXT NULL DEFAULT NULL,
	"upiPayeeName" TEXT NULL DEFAULT NULL,
	"upiLink" TEXT NULL DEFAULT NULL,
	"upiQrUrl" TEXT NULL DEFAULT NULL,
	"termsAndConditions" TEXT NULL DEFAULT NULL,
	"privacyPolicy" TEXT NULL DEFAULT NULL,
	"welcomeBackgroundUrl" TEXT NULL DEFAULT NULL,
	"appIconUrl" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.BrandingSettings: 1 rows
INSERT INTO "BrandingSettings" ("id", "businessName", "logoUrl", "address", "phone", "footerNote", "panNumber", "gstNumber", "email", "createdAt", "updatedAt", "upiId", "upiPayeeName", "upiLink", "upiQrUrl", "termsAndConditions", "privacyPolicy", "welcomeBackgroundUrl", "appIconUrl") VALUES
	('branding-default', 'WE YOU -The laundry man', '/api/assets/branding/logo.png', 'Demo Address', '+91-9000000000', 'For Any Query Contact WE TOU Customer Care Number +91 8121398787.', NULL, '36BUTPV3296B1Z0', NULL, '2026-03-18 07:10:14.197', '2026-04-10 05:18:47.894', 'merchant@upi', 'Laundry Demo', NULL, NULL, 'Terms and conditions: We collect minimal data, such as your email and usage patterns, to improve your experience. We do not sell your personal information to third parties. We use industry-standard security to protect your data. By using our service, you consent to our data practices. Contact us to request data deletion.', 'Privacy Policy: We collect minimal data, such as your email and usage patterns, to improve your experience. We do not sell your personal information to third parties. We use industry-standard security to protect your data. By using our service, you consent to our data practices. Contact us to request data deletion.', NULL, '/api/assets/branding/app-icon.png');

-- Dumping structure for table public.CarouselImage
CREATE TABLE IF NOT EXISTS "CarouselImage" (
	"id" TEXT NOT NULL,
	"position" INTEGER NOT NULL,
	"imageUrl" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("position")
);

-- Dumping data for table public.CarouselImage: 3 rows
INSERT INTO "CarouselImage" ("id", "position", "imageUrl", "createdAt", "updatedAt") VALUES
	('1bc86306-8412-4a7c-afae-619fe0da5735', 2, '/api/assets/carousel/carousel-2.jpg', '2026-03-24 08:05:11.005', '2026-04-04 11:33:08.814'),
	('7f204a9c-a6ae-4099-9757-7a2331227202', 1, '/api/assets/carousel/carousel-1.jpg', '2026-03-24 08:05:07.145', '2026-04-04 11:33:05.877'),
	('868ee2cd-1bc3-41fd-b995-5070eaf1f194', 3, '/api/assets/carousel/carousel-3.jpg', '2026-03-24 08:05:14.294', '2026-04-04 11:33:11.92');

-- Dumping structure for table public.customer_addresses
CREATE TABLE IF NOT EXISTS "customer_addresses" (
	"id" UUID NOT NULL DEFAULT gen_random_uuid(),
	"user_id" UUID NOT NULL,
	"label" TEXT NOT NULL,
	"address_line" TEXT NOT NULL,
	"pincode" TEXT NOT NULL,
	"google_place_url" TEXT NULL DEFAULT NULL,
	"is_default" BOOLEAN NOT NULL DEFAULT false,
	"created_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
	"updated_at" TIMESTAMPTZ NOT NULL DEFAULT now(),
	PRIMARY KEY ("id"),
	CONSTRAINT "customer_addresses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);
CREATE INDEX "idx_customer_addresses_user_id" ON "customer_addresses" ("user_id");

-- Dumping data for table public.customer_addresses: -1 rows

-- Dumping structure for table public.DryCleanItem
CREATE TABLE IF NOT EXISTS "DryCleanItem" (
	"id" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"unitPrice" INTEGER NOT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.DryCleanItem: -1 rows
INSERT INTO "DryCleanItem" ("id", "name", "unitPrice", "active", "createdAt", "updatedAt") VALUES
	('210de242-ac4c-4de1-8e89-41aae443c723', 'Shirt', 800, 'true', '2026-03-18 07:10:16.001', '2026-03-18 07:10:16.001'),
	('215eb53f-fb93-4217-b4fb-7cc881056a15', 'Dress', 1800, 'true', '2026-03-18 07:10:16.558', '2026-03-18 07:10:16.558'),
	('d4151364-a039-494f-9385-774ec3d46d1e', 'Suit', 2500, 'true', '2026-03-18 07:10:16.281', '2026-03-18 07:10:16.281');

-- Dumping structure for table public.Feedback
CREATE TABLE IF NOT EXISTS "Feedback" (
	"id" TEXT NOT NULL,
	"userId" TEXT NULL DEFAULT NULL,
	"orderId" TEXT NULL DEFAULT NULL,
	"type" TEXT NOT NULL,
	"rating" INTEGER NULL DEFAULT NULL,
	"tags" TEXT NULL DEFAULT NULL,
	"message" TEXT NULL DEFAULT NULL,
	"status" TEXT NOT NULL DEFAULT 'NEW',
	"adminNotes" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("orderId"),
	CONSTRAINT "Feedback_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "Feedback_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE INDEX "Feedback_userId_createdAt_idx" ON "Feedback" ("userId", "createdAt");
CREATE INDEX "Feedback_orderId_idx" ON "Feedback" ("orderId");
CREATE INDEX "Feedback_status_createdAt_idx" ON "Feedback" ("status", "createdAt");
CREATE INDEX "Feedback_rating_idx" ON "Feedback" ("rating");

-- Dumping data for table public.Feedback: -1 rows
INSERT INTO "Feedback" ("id", "userId", "orderId", "type", "rating", "tags", "message", "status", "adminNotes", "createdAt", "updatedAt") VALUES
	('174ac924-22aa-4a43-9558-51c48e010b7b', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'MAH060420260004ON', 'ORDER', 5, '{}', 'Nice 👍🙂', 'NEW', NULL, '2026-04-09 08:21:08.479', '2026-04-09 08:21:08.479'),
	('bf838d07-d548-44e4-bd12-a094f9e44aa0', NULL, NULL, 'GENERAL', NULL, '{area_request}', '{"pincode":"500093","addressLine":"Bandlaguda, Bandlaguda Jagir, Gandipet mandal, Ranga Reddy, Telangana, 500093, India","customerName":"karthik897","customerPhone":"+918971690163","customerEmail":"karthikburra2211@gmail.com"}', 'NEW', NULL, '2026-03-18 13:21:21.031', '2026-03-18 13:21:21.031'),
	('d8238297-d47d-4f5a-9420-bfc694a68745', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'MIY180320260002ON', 'ORDER', 5, '{}', 'good kARTHIK', 'NEW', NULL, '2026-04-01 13:08:26.559', '2026-04-01 13:08:26.559'),
	('e40b47d3-48ac-48b4-9f96-944dc265c151', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'MIY180320260003ON', 'ORDER', 5, '{}', '😃 good service', 'NEW', NULL, '2026-03-24 15:51:27.262', '2026-03-24 15:51:27.262'),
	('e80784fd-de92-41bd-a880-e8379cd416bd', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'KUK180320260002ON', 'ORDER', 4, '{}', 'Good service', 'NEW', NULL, '2026-03-18 19:16:23.211', '2026-03-18 19:16:23.211'),
	('eee82000-6dcd-4ab9-a4fb-fe889b30eb23', '8b1390d5-e522-46b4-a075-36956c0095d2', 'KPH300320260001WI', 'ORDER', 5, '{}', 'very good service', 'NEW', NULL, '2026-03-30 17:27:14.387', '2026-03-30 17:27:14.387'),
	('f40f6952-3b5f-41ad-b353-a2687561ac3b', '131950a3-84c5-4c0a-87bc-ed776885b0fe', '7f841148-de2d-4570-a2cc-e452994301f8', 'ORDER', 5, '{quality,delivery}', 'Great service!', 'REVIEWED', NULL, '2026-03-18 07:10:22.502', '2026-03-18 07:10:22.502'),
	('f63ac413-b311-4dca-a056-557cc60c8fa0', '8b1390d5-e522-46b4-a075-36956c0095d2', 'KPH300320260002ON', 'ORDER', 3, '{}', 'good', 'NEW', NULL, '2026-03-30 18:02:22.944', '2026-03-30 18:02:22.944');

-- Dumping structure for table public.Holiday
CREATE TABLE IF NOT EXISTS "Holiday" (
	"id" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"label" TEXT NULL DEFAULT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("date", "branchId")
);
CREATE INDEX "Holiday_branchId_idx" ON "Holiday" ("branchId");

-- Dumping data for table public.Holiday: -1 rows
INSERT INTO "Holiday" ("id", "date", "label", "branchId", "createdAt", "updatedAt") VALUES
	('164f944a-6461-46f3-a436-fcb0ffcf6869', '2026-03-31', 'RANDOM HOLIDAY', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', '2026-03-30 16:40:10.822', '2026-03-30 16:40:10.822'),
	('720d20d7-5b3b-4ed9-b571-a2b0fc1dc2d0', '2026-03-19', 'Ugadi', NULL, '2026-03-18 14:31:57.667', '2026-03-18 14:31:57.667'),
	('c79ed16c-797e-4b16-abe5-de1bd0bedb25', '2026-03-20', 'just holiday', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', '2026-03-18 14:32:09.04', '2026-03-18 14:32:09.04');

-- Dumping structure for table public.Invoice
CREATE TABLE IF NOT EXISTS "Invoice" (
	"id" TEXT NOT NULL,
	"orderId" TEXT NULL DEFAULT NULL,
	"subscriptionId" TEXT NULL DEFAULT NULL,
	"code" TEXT NULL DEFAULT NULL,
	"subtotal" INTEGER NOT NULL,
	"tax" INTEGER NOT NULL DEFAULT 0,
	"total" INTEGER NOT NULL,
	"pdfUrl" TEXT NULL DEFAULT NULL,
	"brandingSnapshotJson" JSONB NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	"type" UNKNOWN NOT NULL,
	"issuedAt" TIMESTAMP NULL DEFAULT NULL,
	"discountPaise" INTEGER NULL DEFAULT NULL,
	"status" UNKNOWN NOT NULL,
	"orderMode" UNKNOWN NOT NULL DEFAULT 'INDIVIDUAL',
	"subscriptionUtilized" BOOLEAN NOT NULL DEFAULT false,
	"subscriptionUsageKg" NUMERIC(10,2) NULL DEFAULT NULL,
	"subscriptionUsageItems" INTEGER NULL DEFAULT NULL,
	"subscriptionUsagesJson" JSONB NULL DEFAULT NULL,
	"paymentStatus" TEXT NOT NULL DEFAULT 'DUE',
	"paymentOverrideReason" TEXT NULL DEFAULT NULL,
	"comments" TEXT NULL DEFAULT NULL,
	"newSubscriptionSnapshotJson" JSONB NULL DEFAULT NULL,
	"newSubscriptionFulfilledAt" TIMESTAMP NULL DEFAULT NULL,
	"subscriptionPurchaseSnapshotJson" JSONB NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("orderId", "type"),
	CONSTRAINT "Invoice_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "Invoice_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "Invoice_orderId_idx" ON "Invoice" ("orderId");
CREATE INDEX "Invoice_subscriptionId_idx" ON "Invoice" ("subscriptionId");

-- Dumping data for table public.Invoice: 46 rows
INSERT INTO "Invoice" ("id", "orderId", "subscriptionId", "code", "subtotal", "tax", "total", "pdfUrl", "brandingSnapshotJson", "createdAt", "updatedAt", "type", "issuedAt", "discountPaise", "status", "orderMode", "subscriptionUtilized", "subscriptionUsageKg", "subscriptionUsageItems", "subscriptionUsagesJson", "paymentStatus", "paymentOverrideReason", "comments", "newSubscriptionSnapshotJson", "newSubscriptionFulfilledAt", "subscriptionPurchaseSnapshotJson") VALUES
	('02c36375-5077-475a-9df4-9a70d3f7d0a7', 'MAH060420260004ON', NULL, 'INMAH060420260004ON', 53100, 0, 53100, '/api/invoices/02c36375-5077-475a-9df4-9a70d3f7d0a7/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-09 08:20:16.621', '2026-04-09 08:20:39.488', 'FINAL', '2026-04-09 08:20:16.687', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('0b06ed4d-b784-4320-a779-d43e14411623', 'KPH310320260002WI', NULL, 'ACK - KPH310320260002WI', 2500, 0, 2500, '/api/invoices/0b06ed4d-b784-4320-a779-d43e14411623/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-31 03:30:15.809', '2026-03-31 03:30:27.105', 'ACKNOWLEDGEMENT', '2026-03-31 03:30:27.09', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('0cc81d4f-1ec5-4ea1-af8a-5ac9e9db023c', 'KUK180320260002ON', NULL, 'ACK - KUK180320260002ON', 7000, 0, 7000, '/api/invoices/0cc81d4f-1ec5-4ea1-af8a-5ac9e9db023c/pdf', '{"email": "vudevKBHB2025@gmail.com", "phone": "+91-9000000000", "upiId": "KPHB8949494", "address": "Surya nagar", "logoUrl": null, "upiQrUrl": null, "gstNumber": "KPHB20940340934", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, KBHB", "businessName": "Kukatpally", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-18 14:15:17.04', '2026-03-18 14:45:10.499', 'ACKNOWLEDGEMENT', '2026-03-18 14:45:09.761', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('0d52939d-ede0-4cea-a1fb-2189b2090669', 'MAH010420260001ON', NULL, 'INMAH010420260001ON', 12900, 0, 12900, '/api/invoices/0d52939d-ede0-4cea-a1fb-2189b2090669/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 09:53:33.059', '2026-04-01 09:53:34.163', 'FINAL', '2026-04-01 09:53:34.15', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('0e857d51-8545-4fef-8f7d-529a2e4788f6', 'MIY180320260002ON', NULL, 'INMIY180320260002ON', 4400, 0, 4400, '/api/invoices/0e857d51-8545-4fef-8f7d-529a2e4788f6/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:24:09.229', '2026-03-18 13:24:24.106', 'FINAL', '2026-03-18 13:24:12.129', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('1118cfb2-c44c-40dc-932b-e9b01b663116', 'MIY180320260003ON', NULL, 'INMIY180320260003ON', 1600, 80, 1480, '/api/invoices/1118cfb2-c44c-40dc-932b-e9b01b663116/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:32:18.192', '2026-03-18 13:34:08.161', 'FINAL', '2026-03-18 13:32:21.563', 200, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('1585b632-a60e-4a12-b2db-9c37a341699e', 'MIY180320260005ON', NULL, 'INMIY180320260005ON', 4800, 240, 4040, '/api/invoices/1585b632-a60e-4a12-b2db-9c37a341699e/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 14:03:52.033', '2026-03-18 19:14:45.505', 'FINAL', '2026-03-18 14:04:03.956', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('1606f45a-1b3f-4ca4-b93b-b64ea482b88d', 'MAH040420260008WI', NULL, 'ACK - MAH040420260008WI', 6000, 0, 6000, '/api/invoices/1606f45a-1b3f-4ca4-b93b-b64ea482b88d/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 12:47:30.418', '2026-04-04 12:47:31.492', 'ACKNOWLEDGEMENT', '2026-04-04 12:47:31.476', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('17995e11-9c73-4d03-9d3c-fe91f5dd2ee8', 'KPH310320260002WI', NULL, 'INKPH310320260002WI', 3500, 0, 3500, '/api/invoices/17995e11-9c73-4d03-9d3c-fe91f5dd2ee8/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 04:04:00.093', '2026-04-01 04:04:04.266', 'FINAL', '2026-04-01 04:04:03.566', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('1b244da3-a7db-4d4c-8b16-8f5b46cad263', 'MAH020420260003ON', NULL, 'INMAH020420260003ON', 9100, 0, 9100, '/api/invoices/1b244da3-a7db-4d4c-8b16-8f5b46cad263/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 08:54:03.36', '2026-04-02 08:54:30.298', 'FINAL', '2026-04-02 08:54:12.275', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('1eac66ad-c121-48f3-9434-c15c8fdbaa31', 'MAH030420260002ON', NULL, 'INMAH030420260002ON', 8700, 0, 8700, '/api/invoices/1eac66ad-c121-48f3-9434-c15c8fdbaa31/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 14:08:59.414', '2026-04-04 14:08:59.489', 'FINAL', '2026-04-04 14:08:59.48', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('1eeed0e0-e63b-4c4a-b432-94fe373c3aca', 'MAH010420260003ON', NULL, 'INMAH010420260003ON', 1000, 0, 1000, '/api/invoices/1eeed0e0-e63b-4c4a-b432-94fe373c3aca/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 12:32:28.862', '2026-04-01 12:32:32.429', 'FINAL', '2026-04-01 12:32:32.416', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('206b0805-7e8c-42ff-8c9f-de2040d5effc', 'MAH010420260004ON', NULL, 'INMAH010420260004ON', 22900, 0, 22900, '/api/invoices/206b0805-7e8c-42ff-8c9f-de2040d5effc/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 13:14:02.107', '2026-04-01 13:14:45.343', 'FINAL', '2026-04-01 13:14:03.591', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('3aa5ac9e-1acb-4f0f-8ed4-92539dede8f7', '7f841148-de2d-4570-a2cc-e452994301f8', NULL, NULL, 14000, 0, 14000, '/api/invoices/3aa5ac9e-1acb-4f0f-8ed4-92539dede8f7/pdf', '{"phone": "+91-9000000000", "upiId": "merchant@upi", "address": "Demo Address", "businessName": "Laundry Demo", "upiPayeeName": "Laundry Demo"}', '2026-03-18 07:10:21.899', '2026-03-18 07:10:22.215', 'FINAL', '2026-03-18 07:10:21.894', NULL, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, NULL, NULL, NULL, NULL),
	('3af0e0be-5741-47aa-bc22-4554db456335', 'MAH020420260007WI', NULL, 'INMAH020420260007WI', 4000, 0, 3000, '/api/invoices/3af0e0be-5741-47aa-bc22-4554db456335/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:19:35.548', '2026-04-02 09:19:58.137', 'FINAL', '2026-04-02 09:19:38.157', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'ON SAREE OIL MARK HAS DEDUCTED', NULL, NULL, NULL),
	('3d289584-61d1-4127-a32c-7dd916ba0ad4', 'MIY180320260002ON', NULL, 'ACK - MIY180320260002ON', 4400, 0, 4400, '/api/invoices/3d289584-61d1-4127-a32c-7dd916ba0ad4/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:23:28.742', '2026-03-18 13:23:33.685', 'ACKNOWLEDGEMENT', '2026-03-18 13:23:33.109', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('3d99984a-d310-428f-8974-dd1cb11c7952', 'MAH040420260003ON', NULL, 'ACK - MAH040420260003ON', 7900, 0, 7900, NULL, '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 15:05:09.353', '2026-04-04 15:05:09.353', 'ACKNOWLEDGEMENT', NULL, 0, 'DRAFT', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('47dcba7d-e1e0-45a1-a303-d457267f8711', 'KPH310320260001WI', NULL, 'ACK - KPH310320260001WI', 5600, 0, 5320, '/api/invoices/47dcba7d-e1e0-45a1-a303-d457267f8711/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-31 03:14:55.47', '2026-03-31 03:15:14.809', 'ACKNOWLEDGEMENT', '2026-03-31 03:15:14.797', 280, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'thank you
we you  Bill may change at delivery.', NULL, NULL, NULL),
	('4881b202-eb71-4c37-9a9b-7f81a4973547', 'MIY180320260003ON', NULL, 'ACK - MIY180320260003ON', 800, 40, 640, '/api/invoices/4881b202-eb71-4c37-9a9b-7f81a4973547/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:31:21.399', '2026-03-18 13:31:25.579', 'ACKNOWLEDGEMENT', '2026-03-18 13:31:24.442', 200, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('56418034-18d3-4b3e-8637-8015fdb2e48a', 'MAH010420260004ON', NULL, 'ACK - MAH010420260004ON', 22900, 0, 22900, '/api/invoices/56418034-18d3-4b3e-8637-8015fdb2e48a/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 13:12:08.862', '2026-04-01 13:12:19.036', 'ACKNOWLEDGEMENT', '2026-04-01 13:12:19.023', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('57246f61-412d-4866-9d5e-2f497026d9ce', 'MAH020420260005WI', NULL, 'INMAH020420260005WI', 5500, 0, 5500, '/api/invoices/57246f61-412d-4866-9d5e-2f497026d9ce/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:01:57.383', '2026-04-02 09:02:57.194', 'FINAL', '2026-04-02 09:01:58.087', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'DEDUCTED OIL MARK ON SAREE', NULL, NULL, NULL),
	('5a7f3cc9-b439-48b1-b014-b20d786caa0e', 'MAH040420260007WI', NULL, 'ACK - MAH040420260007WI', 3300, 0, 3300, '/api/invoices/5a7f3cc9-b439-48b1-b014-b20d786caa0e/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 14:02:55.078', '2026-04-04 14:03:02.415', 'ACKNOWLEDGEMENT', '2026-04-04 14:03:02.403', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('5f23e8cf-80c5-404e-bbf7-314c3571f4d4', 'MIY180320260004ON', NULL, 'ACK - MIY180320260004ON', 2000, 100, 2100, '/api/invoices/5f23e8cf-80c5-404e-bbf7-314c3571f4d4/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:53:21.76', '2026-03-18 13:53:28.803', 'ACKNOWLEDGEMENT', '2026-03-18 13:53:26.183', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('5ff86d9d-94cc-4f56-b6d3-2506f7e4ea65', 'MAH030420260001WI', NULL, 'INMAH030420260001WI', 12000, 0, 12000, '/api/invoices/5ff86d9d-94cc-4f56-b6d3-2506f7e4ea65/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-03 08:15:27.78', '2026-04-03 08:15:46.777', 'FINAL', '2026-04-03 08:15:29.227', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('606f5f7a-ab2b-4804-bc31-1f2a5c0b50b5', 'MIY180320260004ON', NULL, 'INMIY180320260004ON', 2000, 100, 2100, '/api/invoices/606f5f7a-ab2b-4804-bc31-1f2a5c0b50b5/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 13:54:55.027', '2026-03-18 13:55:40.059', 'FINAL', '2026-03-18 13:55:38.217', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('63892c91-d43e-404f-96fa-ae383cde53ec', 'MAH040420260004ON', NULL, 'ACK - MAH040420260004ON', 1000, 0, 1000, '/api/invoices/63892c91-d43e-404f-96fa-ae383cde53ec/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 16:14:14.312', '2026-04-04 16:14:15.123', 'ACKNOWLEDGEMENT', '2026-04-04 16:14:15.113', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('65091c8a-4829-4e9a-9262-5a0e29332a38', 'KUK220320260001ON', NULL, 'ACK - KUK220320260001ON', 1200, 0, 1200, '/api/invoices/65091c8a-4829-4e9a-9262-5a0e29332a38/pdf', '{"email": "vudevKBHB2025@gmail.com", "phone": "+91-9000000000", "upiId": "KPHB8949494", "address": "Surya nagar", "logoUrl": null, "upiQrUrl": null, "gstNumber": "KPHB20940340934", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, KBHB", "businessName": "Kukatpally", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-22 06:33:42.855', '2026-03-22 06:33:45.298', 'ACKNOWLEDGEMENT', '2026-03-22 06:33:45.282', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('6e2c7f35-dad5-46bd-a531-c2ee3c46720b', 'MAH040420260011WI', NULL, 'ACK - MAH040420260011WI', 7500, 0, 7500, '/api/invoices/6e2c7f35-dad5-46bd-a531-c2ee3c46720b/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-06 10:36:42.447', '2026-04-06 10:36:45.316', 'ACKNOWLEDGEMENT', '2026-04-06 10:36:45.302', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('7e288b42-3699-4082-9566-df4888ea3ec0', 'MAH010420260003ON', NULL, 'ACK - MAH010420260003ON', 1000, 0, 1000, '/api/invoices/7e288b42-3699-4082-9566-df4888ea3ec0/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 12:29:32.51', '2026-04-01 12:29:49.896', 'ACKNOWLEDGEMENT', '2026-04-01 12:29:49.881', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('8125bf47-2066-435f-9247-9ee1bb273c4c', 'KUK180320260003ON', NULL, 'INKUK180320260003ON', 2600, 0, 2600, '/api/invoices/8125bf47-2066-435f-9247-9ee1bb273c4c/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 04:01:57.641', '2026-04-01 04:02:02.3', 'FINAL', '2026-04-01 04:02:01.575', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('8ba4cba8-41d7-4141-81a7-740274d44e31', 'MAH020420260007WI', NULL, 'ACK - MAH020420260007WI', 4000, 0, 3000, '/api/invoices/8ba4cba8-41d7-4141-81a7-740274d44e31/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:18:29.877', '2026-04-02 09:18:40.473', 'ACKNOWLEDGEMENT', '2026-04-02 09:18:40.457', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'ON SAREE OIL MARK HAS DEDUCTED', NULL, NULL, NULL),
	('8d0fd54f-3cef-45b0-b305-7008da63081d', 'KUK180320260002ON', NULL, 'INKUK180320260002ON', 7000, 0, 7000, '/api/invoices/8d0fd54f-3cef-45b0-b305-7008da63081d/pdf', '{"email": "vudevKBHB2025@gmail.com", "phone": "+91-9000000000", "upiId": "KPHB8949494", "address": "Surya nagar", "logoUrl": null, "upiQrUrl": null, "gstNumber": "KPHB20940340934", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, KBHB", "businessName": "Kukatpally", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-18 14:45:27.71', '2026-03-18 14:46:18.761', 'FINAL', '2026-03-18 14:45:30.45', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('8d550c3d-8469-4234-94a9-5f34063eedce', 'MAH040420260001WI', NULL, 'ACK - MAH040420260001WI', 1200, 0, 1100, '/api/invoices/8d550c3d-8469-4234-94a9-5f34063eedce/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 09:04:17.424', '2026-04-04 09:04:21.086', 'ACKNOWLEDGEMENT', '2026-04-04 09:04:21.075', 100, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('8d8fdb5b-3b17-43b6-831a-ca98e480d2a7', 'MAH070420260002ON', NULL, 'ACK - MAH070420260002ON', 20800, 0, 20800, '/api/invoices/8d8fdb5b-3b17-43b6-831a-ca98e480d2a7/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-08 12:19:06.158', '2026-04-08 12:19:13.217', 'ACKNOWLEDGEMENT', '2026-04-08 12:19:13.202', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('929bde53-8acf-43e5-895f-96089a3f7c11', 'MIY220320260001ON', NULL, 'ACK - MIY220320260001ON', 2000, 0, 2000, '/api/invoices/929bde53-8acf-43e5-895f-96089a3f7c11/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-30 17:06:22.769', '2026-03-30 17:06:24.948', 'ACKNOWLEDGEMENT', '2026-03-30 17:06:24.937', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('9559af51-cb9a-465d-9b06-7b51caad98f9', 'MAH040420260007WI', NULL, 'INMAH040420260007WI', 3300, 0, 3300, '/api/invoices/9559af51-cb9a-465d-9b06-7b51caad98f9/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 15:04:37.431', '2026-04-04 15:04:37.49', 'FINAL', '2026-04-04 15:04:37.48', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('97de76fb-14fc-4e63-bbc0-184bab409dfc', 'MAH020420260006WI', NULL, 'INMAH020420260006WI', 1500, 0, 1500, '/api/invoices/97de76fb-14fc-4e63-bbc0-184bab409dfc/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:06:28.412', '2026-04-02 09:07:43.191', 'FINAL', '2026-04-02 09:06:30.495', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'INK MARK ON SHIRT', NULL, NULL, NULL),
	('98c49e1a-b97d-41e0-b381-b7f254eae14c', 'MAH060420260004ON', NULL, 'ACK - MAH060420260004ON', 53100, 0, 53100, '/api/invoices/98c49e1a-b97d-41e0-b381-b7f254eae14c/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-06 10:45:10.267', '2026-04-08 17:55:13.666', 'ACKNOWLEDGEMENT', '2026-04-08 17:55:13.657', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('9ead6ac6-20c1-4412-b3a2-8f92d77f5900', 'MIY180320260001WI', NULL, 'ACK - MIY180320260001WI', 8500, 425, 7925, '/api/invoices/9ead6ac6-20c1-4412-b3a2-8f92d77f5900/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 12:17:32.201', '2026-03-18 12:17:35.838', 'ACKNOWLEDGEMENT', '2026-03-18 12:17:35.221', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('a01d082e-7171-4dc2-afd5-05011a11f916', 'KPH300320260001WI', NULL, 'INKPH300320260001WI', 6000, 0, 5400, '/api/invoices/a01d082e-7171-4dc2-afd5-05011a11f916/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-30 17:03:01.032', '2026-03-30 17:03:21.055', 'FINAL', '2026-03-30 17:03:03.181', 600, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'THANK YOU ,  
WE YOU The laundry man. Bill may change at delivery.', NULL, NULL, NULL),
	('a05018ce-23b4-4c41-b2e2-0e71cb66f4d9', 'MIY180320260005ON', NULL, 'ACK - MIY180320260005ON', 4800, 240, 4040, '/api/invoices/a05018ce-23b4-4c41-b2e2-0e71cb66f4d9/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 14:02:46.347', '2026-03-18 14:03:27.951', 'ACKNOWLEDGEMENT', '2026-03-18 14:03:27.295', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('a3d2d9de-d449-473a-8c8d-cb4c2eafdccf', 'MAH010420260001ON', NULL, 'ACK - MAH010420260001ON', 12900, 0, 12900, '/api/invoices/a3d2d9de-d449-473a-8c8d-cb4c2eafdccf/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "For any Queries contact WE YOU customer care number: +91 8546854625", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-04-01 09:52:24.496', '2026-04-01 09:52:25.628', 'ACKNOWLEDGEMENT', '2026-04-01 09:52:25.618', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('a8d8d19d-c385-480b-9361-7d514ffaf7ba', 'MAH030420260002ON', NULL, 'ACK - MAH030420260002ON', 8700, 0, 8700, '/api/invoices/a8d8d19d-c385-480b-9361-7d514ffaf7ba/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 14:08:15.518', '2026-04-04 14:08:35.385', 'ACKNOWLEDGEMENT', '2026-04-04 14:08:35.371', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('a9f73c57-b880-4853-86be-ba7a29fee348', 'KPH310320260001WI', NULL, 'INKPH310320260001WI', 5600, 0, 5320, '/api/invoices/a9f73c57-b880-4853-86be-ba7a29fee348/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-31 03:19:20.043', '2026-03-31 03:19:50.355', 'FINAL', '2026-03-31 03:19:22.368', 280, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'thank you
we you  Bill may change at delivery.', NULL, NULL, NULL),
	('af8dc317-ae4f-43d2-87af-eb5806c2a7f3', 'MAH090420260003ON', NULL, 'ACK - MAH090420260003ON', 7500, 0, 7500, '/api/invoices/af8dc317-ae4f-43d2-87af-eb5806c2a7f3/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-09 11:31:59.485', '2026-04-09 11:32:00.375', 'ACKNOWLEDGEMENT', '2026-04-09 11:32:00.363', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('b6583719-fa50-497a-aeb8-fb6bb2b904d9', 'MAH070420260002ON', NULL, 'INMAH070420260002ON', 20800, 0, 20800, '/api/invoices/b6583719-fa50-497a-aeb8-fb6bb2b904d9/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-08 12:20:20.85', '2026-04-08 12:20:48.751', 'FINAL', '2026-04-08 12:20:20.912', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('bd05682c-ea8c-4e78-b58f-fe9fcc1a2f11', 'MAH020420260003ON', NULL, 'ACK - MAH020420260003ON', 9100, 0, 9100, '/api/invoices/bd05682c-ea8c-4e78-b58f-fe9fcc1a2f11/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 08:50:02.275', '2026-04-02 08:50:12.26', 'ACKNOWLEDGEMENT', '2026-04-02 08:50:12.249', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('beeba6b2-f507-4b30-a86f-2fdae9cc8da7', 'MAH020420260004WI', NULL, 'INMAH020420260004WI', 4500, 0, 4500, '/api/invoices/beeba6b2-f507-4b30-a86f-2fdae9cc8da7/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 08:59:06.543', '2026-04-02 09:00:35.95', 'FINAL', '2026-04-02 08:59:14.664', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'OIL MARK HAD DEDUCTED ON SAREE', NULL, NULL, NULL),
	('c2119d3a-a3ea-4b61-a517-b49b9554a569', 'MAH040420260006WI', NULL, 'ACK - MAH040420260006WI', 2500, 0, 2500, '/api/invoices/c2119d3a-a3ea-4b61-a517-b49b9554a569/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 12:25:53.205', '2026-04-04 12:26:00.698', 'ACKNOWLEDGEMENT', '2026-04-04 12:26:00.684', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('c88939c8-0b73-415f-8edd-8d74388f0033', 'KPH300320260002ON', NULL, 'ACK - KPH300320260002ON', 4000, 0, 4000, '/api/invoices/c88939c8-0b73-415f-8edd-8d74388f0033/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-30 17:58:54.723', '2026-03-30 17:58:57.898', 'ACKNOWLEDGEMENT', '2026-03-30 17:58:57.882', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('c9d37f8a-72ce-4e7c-b620-414b96ae02e6', 'MAH020420260004WI', NULL, 'ACK - MAH020420260004WI', 4500, 0, 4500, '/api/invoices/c9d37f8a-72ce-4e7c-b620-414b96ae02e6/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 08:58:05.984', '2026-04-02 08:58:13.646', 'ACKNOWLEDGEMENT', '2026-04-02 08:58:13.622', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'OIL MARK HAD DEDUCTED ON SAREE', NULL, NULL, NULL),
	('cf2db01a-0acb-41b1-957b-732192c0e329', 'KUK180320260003ON', NULL, 'ACK - KUK180320260003ON', 2600, 0, 2600, '/api/invoices/cf2db01a-0acb-41b1-957b-732192c0e329/pdf', '{"email": "vudevKBHB2025@gmail.com", "phone": "+91-9000000000", "upiId": "KPHB8949494", "address": "Surya nagar", "logoUrl": null, "upiQrUrl": null, "gstNumber": "KPHB20940340934", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, KBHB", "businessName": "Kukatpally", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-20 09:01:42.169', '2026-03-20 09:01:46.834', 'ACKNOWLEDGEMENT', '2026-03-20 09:01:46.821', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('d158e4e5-8277-404c-83c8-69bc921d9af2', 'KPH300320260002ON', NULL, 'INKPH300320260002ON', 4000, 0, 4000, '/api/invoices/d158e4e5-8277-404c-83c8-69bc921d9af2/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-30 18:00:36.66', '2026-03-30 18:01:57.291', 'FINAL', '2026-03-30 18:00:39.024', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('d21f0ae0-7543-4dfe-8ee2-30613c3fc5b4', 'KPH300320260001WI', NULL, 'ACK - KPH300320260001WI', 6000, 0, 5400, '/api/invoices/d21f0ae0-7543-4dfe-8ee2-30613c3fc5b4/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "91 8121298787", "upiId": "KPHB8949494", "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": "KPHB94940094AD", "footerNote": "Thank you, WE YOU", "businessName": "KPHB", "upiPayeeName": "KPHB WEYOU", "termsAndConditions": null}', '2026-03-30 16:58:48.5', '2026-03-30 17:00:00.365', 'ACKNOWLEDGEMENT', '2026-03-30 17:00:00.353', 600, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'THANK YOU ,  
WE YOU The laundry man. Bill may change at delivery.', NULL, NULL, NULL),
	('db8da5a0-0c84-4ef6-bf8f-0913acd1ba2d', 'MAH020420260006WI', NULL, 'ACK - MAH020420260006WI', 1500, 0, 1500, '/api/invoices/db8da5a0-0c84-4ef6-bf8f-0913acd1ba2d/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:04:20.718', '2026-04-02 09:04:29.825', 'ACKNOWLEDGEMENT', '2026-04-02 09:04:29.812', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'INK MARK ON SHIRT', NULL, NULL, NULL),
	('dc344ed4-37d8-4094-aa2a-b92b8125e0ca', 'MAH020420260005WI', NULL, 'ACK - MAH020420260005WI', 5500, 0, 5500, '/api/invoices/dc344ed4-37d8-4094-aa2a-b92b8125e0ca/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-02 09:01:29.703', '2026-04-02 09:01:35.701', 'ACKNOWLEDGEMENT', '2026-04-02 09:01:35.689', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'DEDUCTED OIL MARK ON SAREE', NULL, NULL, NULL),
	('dded04f9-1410-412a-9eda-5b09b6ed90fc', 'MIY180320260001WI', NULL, 'INMIY180320260001WI', 8500, 425, 7925, '/api/invoices/dded04f9-1410-412a-9eda-5b09b6ed90fc/pdf', '{"email": "vudevMiytapur2025@gmail.com", "phone": "07093142725", "upiId": "MIYA8949494", "address": "Miyapur We You, hyderbad", "logoUrl": null, "upiQrUrl": null, "gstNumber": "MIYAPUR00002737", "panNumber": "MIYA9484839", "footerNote": "Thank you, Miyapur", "businessName": "Miyapur", "upiPayeeName": "MIYAPURWEYOU", "termsAndConditions": null}', '2026-03-18 12:18:14.879', '2026-03-18 12:18:23.369', 'FINAL', '2026-03-18 12:18:16.103', 1000, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you, we will deliver within 3 days. Bill may change at delivery.', NULL, NULL, NULL),
	('e49a7966-adb7-41d3-aad3-d9b4c1b348f3', 'MAH040420260006WI', NULL, 'INMAH040420260006WI', 2500, 0, 2500, '/api/invoices/e49a7966-adb7-41d3-aad3-d9b4c1b348f3/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 12:26:36.81', '2026-04-04 12:26:55.252', 'FINAL', '2026-04-04 12:26:36.988', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('e6e8ae9e-a8e4-46eb-937f-1b227103a45b', 'MAH040420260010ON', NULL, 'INMAH040420260010ON', 1200, 0, 1200, '/api/invoices/e6e8ae9e-a8e4-46eb-937f-1b227103a45b/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 15:05:58.074', '2026-04-04 15:06:12.568', 'FINAL', '2026-04-04 15:05:58.132', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('e8928ed0-7a70-454b-92a2-3469af47db51', 'MAH040420260010ON', NULL, 'ACK - MAH040420260010ON', 1200, 0, 1200, '/api/invoices/e8928ed0-7a70-454b-92a2-3469af47db51/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-04 15:05:42.945', '2026-04-04 15:05:44.01', 'ACKNOWLEDGEMENT', '2026-04-04 15:05:44.001', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL),
	('f8190de6-8eae-4666-af41-1d29519731a6', 'MAH040420260011WI', NULL, 'INMAH040420260011WI', 7500, 0, 7500, '/api/invoices/f8190de6-8eae-4666-af41-1d29519731a6/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-06 10:38:39.567', '2026-04-06 10:39:25.484', 'FINAL', '2026-04-06 10:38:39.686', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'PAID', NULL, 'Thank you', NULL, NULL, NULL),
	('f92a5df3-3505-48ee-8054-36151cfa1579', 'MAH030420260001WI', NULL, 'ACK - MAH030420260001WI', 12000, 0, 12000, '/api/invoices/f92a5df3-3505-48ee-8054-36151cfa1579/pdf', '{"email": "weyouthelaundryman@gmail.com", "phone": "+91 8121298787", "upiId": null, "address": "PHASE 3 , RAMYA GROUND LANE", "logoUrl": null, "upiQrUrl": null, "gstNumber": "36BUTPV3296B1Z0", "panNumber": null, "footerNote": "WE YOU customer care number: +91 8121398787", "businessName": "MAHAA ENTERPRISES ,KPHB", "upiPayeeName": null, "termsAndConditions": null}', '2026-04-03 08:13:47.242', '2026-04-03 08:13:53.142', 'ACKNOWLEDGEMENT', '2026-04-03 08:13:53.131', 0, 'ISSUED', 'INDIVIDUAL', 'false', NULL, NULL, NULL, 'DUE', NULL, 'Thank you', NULL, NULL, NULL);

-- Dumping structure for table public.InvoiceItem
CREATE TABLE IF NOT EXISTS "InvoiceItem" (
	"id" TEXT NOT NULL,
	"invoiceId" TEXT NOT NULL,
	"type" UNKNOWN NOT NULL,
	"name" TEXT NOT NULL,
	"quantity" NUMERIC(10,2) NOT NULL DEFAULT 1,
	"unitPrice" INTEGER NOT NULL,
	"amount" INTEGER NOT NULL,
	"catalogItemId" TEXT NULL DEFAULT NULL,
	"segmentCategoryId" TEXT NULL DEFAULT NULL,
	"serviceCategoryId" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	CONSTRAINT "InvoiceItem_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "InvoiceItem_invoiceId_idx" ON "InvoiceItem" ("invoiceId");

-- Dumping data for table public.InvoiceItem: 75 rows
INSERT INTO "InvoiceItem" ("id", "invoiceId", "type", "name", "quantity", "unitPrice", "amount", "catalogItemId", "segmentCategoryId", "serviceCategoryId", "createdAt") VALUES
	('0382a35e-cf3d-465c-a3e0-51c0dbe7a591', 'a05018ce-23b4-4c41-b2e2-0e71cb66f4d9', 'DRYCLEAN_ITEM', 'Shirt', 2.00, 800, 1600, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:22.906'),
	('0b1035b8-3b3b-49b6-9e6c-08c57fa6e7a2', '97de76fb-14fc-4e63-bbc0-184bab409dfc', 'DRYCLEAN_ITEM', 'Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 09:06:28.412'),
	('0d8b0d31-6c8c-45eb-8f0a-4d9c9405c0f1', '8125bf47-2066-435f-9247-9ee1bb273c4c', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 600, 600, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 04:01:57.641'),
	('0d9b3d73-2298-446c-a824-908e5276dc7d', '206b0805-7e8c-42ff-8c9f-de2040d5effc', 'DRYCLEAN_ITEM', 'PREMIUM PACKAGES', 1.00, 9900, 9900, '2e448803-a16b-4074-b831-5f2bcd8a237f', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-01 13:14:02.107'),
	('15debad6-54c6-4a4f-bb93-8ed686de6c57', '56418034-18d3-4b3e-8637-8015fdb2e48a', 'DRYCLEAN_ITEM', 'PREMIUM PACKAGES', 1.00, 9900, 9900, '2e448803-a16b-4074-b831-5f2bcd8a237f', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-01 13:12:08.862'),
	('1cbe3509-08c8-47a7-9196-eed80fdc8669', 'd158e4e5-8277-404c-83c8-69bc921d9af2', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 2000, 2000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-03-30 18:00:36.66'),
	('1d53c039-4f30-4d93-a627-c86861f7b295', '56418034-18d3-4b3e-8637-8015fdb2e48a', 'DRYCLEAN_ITEM', 'Jeans', 13.00, 1000, 13000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 13:12:08.862'),
	('21ee75f8-118d-4fd1-8d12-59a1ba5613c6', '02c36375-5077-475a-9df4-9a70d3f7d0a7', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 4.00, 12900, 51600, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-09 08:20:16.621'),
	('24609a89-7113-492f-b84b-166c89329dd3', '3d289584-61d1-4127-a32c-7dd916ba0ad4', 'DRYCLEAN_ITEM', 'Jeans', 3.00, 800, 2400, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 13:23:28.742'),
	('250540ee-1b6d-4983-89db-a872d5535573', '5ff86d9d-94cc-4f56-b6d3-2506f7e4ea65', 'DRYCLEAN_ITEM', 'Jeans', 10.00, 1200, 12000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-03 08:15:27.78'),
	('2569228f-c2fe-4e02-8759-c4f167f60e09', 'beeba6b2-f507-4b30-a86f-2fdae9cc8da7', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:00:35.95'),
	('290d6df1-261f-47a8-814d-87bb04787396', 'bd05682c-ea8c-4e78-b58f-fe9fcc1a2f11', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-02 08:50:02.275'),
	('2fc09382-1b2e-4630-ba14-31b497e91201', 'f8190de6-8eae-4666-af41-1d29519731a6', 'DRYCLEAN_ITEM', 'Linen Shirt', 5.00, 1500, 7500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-06 10:38:39.567'),
	('308163ec-d5c8-4733-852b-743f75fbb802', '1eac66ad-c121-48f3-9434-c15c8fdbaa31', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 800, 800, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 14:08:59.414'),
	('309d52b6-7cee-4842-afd7-da31e123c819', '1eac66ad-c121-48f3-9434-c15c8fdbaa31', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-04 14:08:59.414'),
	('314db290-0575-4c18-8595-b8bd4b7ddb51', '3aa5ac9e-1acb-4f0f-8ed4-92539dede8f7', 'SERVICE', 'Wash & Fold', 5.00, 1000, 5000, NULL, NULL, NULL, '2026-03-18 07:10:21.899'),
	('344e3e85-5b02-4d22-b592-61208e55bb55', '5a7f3cc9-b439-48b1-b014-b20d786caa0e', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 800, 800, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 14:02:55.078'),
	('380a40d8-9b98-4531-851b-2326e6cec5ee', '0cc81d4f-1ec5-4ea1-af8a-5ac9e9db023c', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 14:15:17.04'),
	('38246508-607f-4962-a0fd-e41871c95aac', '63892c91-d43e-404f-96fa-ae383cde53ec', 'DRYCLEAN_ITEM', 'Linen Shirt', 1.00, 1000, 1000, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-04-04 16:14:14.312'),
	('39276082-915a-4911-a7f9-b54086d42d33', 'beeba6b2-f507-4b30-a86f-2fdae9cc8da7', 'DRYCLEAN_ITEM', 'BED SHEET', 1.00, 2500, 2500, '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-04-02 09:00:35.95'),
	('39a5a616-15b8-4c17-a3be-d59218482ba7', '206b0805-7e8c-42ff-8c9f-de2040d5effc', 'DRYCLEAN_ITEM', 'Jeans', 13.00, 1000, 13000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 13:14:02.107'),
	('3af06e10-182f-4de4-b5fb-7e0a4480ff60', '8d8fdb5b-3b17-43b6-831a-ca98e480d2a7', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-08 12:19:06.158'),
	('3daa4c1a-c64a-4fef-9306-89e0ed493754', '1585b632-a60e-4a12-b2db-9c37a341699e', 'DRYCLEAN_ITEM', 'Jeans', 2.00, 600, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:52.033'),
	('41326a91-1e0b-428f-9740-04b31eb489b6', '0e857d51-8545-4fef-8f7d-529a2e4788f6', 'DRYCLEAN_ITEM', 'Jeans', 3.00, 800, 2400, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 13:24:09.229'),
	('47507d28-ae5f-43da-81f5-474e34e0f722', 'f92a5df3-3505-48ee-8054-36151cfa1579', 'DRYCLEAN_ITEM', 'Jeans', 10.00, 1200, 12000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-03 08:13:47.242'),
	('48e40c40-aea3-400a-90ed-d98631603c8b', 'd21f0ae0-7543-4dfe-8ee2-30613c3fc5b4', 'DRYCLEAN_ITEM', 'BED SHEET', 1.00, 3500, 3500, '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-30 16:59:52.356'),
	('4ea1f5c7-eed1-46b7-96c3-764eb82e36e9', '9ead6ac6-20c1-4412-b3a2-8f92d77f5900', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 12:17:32.201'),
	('4f49bb92-663a-4df4-8046-64b697712be2', '0e857d51-8545-4fef-8f7d-529a2e4788f6', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 13:24:09.229'),
	('54096423-87e8-495e-84e4-d6b59d8ce2df', 'a05018ce-23b4-4c41-b2e2-0e71cb66f4d9', 'DRYCLEAN_ITEM', 'Jeans', 2.00, 600, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:22.906'),
	('57077326-9bac-43c8-aad0-a7dc9801cc35', 'e8928ed0-7a70-454b-92a2-3469af47db51', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-04 15:05:42.945'),
	('583bc2ed-7de3-41d0-9f92-e1050d923c96', '65091c8a-4829-4e9a-9262-5a0e29332a38', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-03-22 06:33:42.855'),
	('5a2fdf34-2851-4e2b-9ea7-8c3ee12edfe1', 'bd05682c-ea8c-4e78-b58f-fe9fcc1a2f11', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 08:50:02.275'),
	('5a9e389e-8ad1-42c3-88c1-ba72094646b5', '1b244da3-a7db-4d4c-8b16-8f5b46cad263', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 08:54:03.36'),
	('5b460b95-ebcf-4700-8d55-ebb6e85b6721', 'dc344ed4-37d8-4094-aa2a-b92b8125e0ca', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 3500, 3500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 09:01:29.703'),
	('6262d960-a328-40f0-82ee-989bbec3d578', '6e2c7f35-dad5-46bd-a531-c2ee3c46720b', 'DRYCLEAN_ITEM', 'Linen Shirt', 5.00, 1500, 7500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-06 10:36:42.447'),
	('626df6ff-cbef-4e8c-8985-dc8b10c16d79', '5f23e8cf-80c5-404e-bbf7-314c3571f4d4', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', '2026-03-18 13:53:21.76'),
	('6ad46228-4290-479c-a489-f439ea322966', 'c9d37f8a-72ce-4e7c-b620-414b96ae02e6', 'DRYCLEAN_ITEM', 'BED SHEET', 1.00, 2500, 2500, '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-04-02 08:58:05.984'),
	('6b6fcb20-67d8-49bc-bcb5-efced2c3926f', 'af8dc317-ae4f-43d2-87af-eb5806c2a7f3', 'DRYCLEAN_ITEM', 'DHOTI / LINGI (COTTON )', 1.00, 3000, 3000, '60209ff0-a069-4ca7-855a-beaa92570b03', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-04-09 11:31:59.485'),
	('6e3c63cd-4e1b-493b-8411-c8e885b75f24', '4881b202-eb71-4c37-9a9b-7f81a4973547', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 800, 800, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 13:31:21.399'),
	('6f9309d5-81f1-44b9-acc0-49fc2adcdb18', 'a8d8d19d-c385-480b-9361-7d514ffaf7ba', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 800, 800, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 14:08:15.518'),
	('73ba9e88-4687-4b0d-83d5-4eb51730321e', 'dc344ed4-37d8-4094-aa2a-b92b8125e0ca', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:01:29.703'),
	('787f9a63-3325-476f-8fba-164ee56516b4', '7e288b42-3699-4082-9566-df4888ea3ec0', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1000, 1000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 12:29:32.51'),
	('79b9ed7b-cc36-4b28-8cf8-9ea42dc6929f', '3af0e0be-5741-47aa-bc22-4554db456335', 'DRYCLEAN_ITEM', 'Jeans', 2.00, 1000, 2000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:19:35.548'),
	('7da772f1-1488-4acf-bcaa-30ffb65bc7e0', '5a7f3cc9-b439-48b1-b014-b20d786caa0e', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 14:02:55.078'),
	('7e3ba9f1-071f-4382-9185-58c364edd939', 'c88939c8-0b73-415f-8edd-8d74388f0033', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 2000, 2000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-03-30 17:58:54.723'),
	('80512791-a4b6-4598-8b1f-062343989686', '1606f45a-1b3f-4ca4-b93b-b64ea482b88d', 'DRYCLEAN_ITEM', 'Jeans', 5.00, 1200, 6000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-04 12:47:30.418'),
	('810333d8-ed62-427d-9576-172446f95914', '8d0fd54f-3cef-45b0-b305-7008da63081d', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 14:45:29.038'),
	('86064f4c-4368-49c4-ae1d-0c003ca03f6b', 'dded04f9-1410-412a-9eda-5b09b6ed90fc', 'DRYCLEAN_ITEM', 'Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-03-18 12:18:14.879'),
	('866c8b2d-4926-4585-b62b-d43262b81c2c', 'a3d2d9de-d449-473a-8c8d-cb4c2eafdccf', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 12900, 12900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '3186e444-4129-4882-bc51-82645c0cab9e', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-01 09:52:24.496'),
	('8758eb7b-23ca-48bf-b926-816436972afd', 'c2119d3a-a3ea-4b61-a517-b49b9554a569', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 12:25:53.205'),
	('8800cf46-6353-48a3-952a-7a34e193f8aa', '17995e11-9c73-4d03-9d3c-fe91f5dd2ee8', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1000, 1000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 04:04:00.093'),
	('8c6c286d-3926-4775-ab8b-e6faecceee8a', 'dded04f9-1410-412a-9eda-5b09b6ed90fc', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', '2026-03-18 12:18:14.879'),
	('8c8d219b-ffc7-4cfc-bf77-efcfecf32700', 'a8d8d19d-c385-480b-9361-7d514ffaf7ba', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-04 14:08:15.518'),
	('8de5d5f2-c8af-4786-872a-c05fdd405d94', 'a01d082e-7171-4dc2-afd5-05011a11f916', 'DRYCLEAN_ITEM', 'BED SHEET', 1.00, 3500, 3500, '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-30 17:03:01.032'),
	('9195e579-8bc2-43a6-af83-79be1ff54ffc', 'a9f73c57-b880-4853-86be-ba7a29fee348', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-31 03:19:20.043'),
	('9bfbbf39-5aca-481f-afc2-e3fffd891e5c', '02c36375-5077-475a-9df4-9a70d3f7d0a7', 'DRYCLEAN_ITEM', 'Linen Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-09 08:20:16.621'),
	('9c7a35b1-4d28-4b2c-99d9-ea0cffe10276', 'a01d082e-7171-4dc2-afd5-05011a11f916', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 2500, 2500, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-30 17:03:01.032'),
	('a51b2af6-2248-4c7d-92f9-179aa0e7da43', '1585b632-a60e-4a12-b2db-9c37a341699e', 'DRYCLEAN_ITEM', 'Shirt', 2.00, 800, 1600, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:52.033'),
	('aa8f1824-4b63-4214-9eb9-94b8c7525374', '8d0fd54f-3cef-45b0-b305-7008da63081d', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 14:45:29.038'),
	('ac483365-9f2a-48aa-91e6-5de548626d34', '929bde53-8acf-43e5-895f-96089a3f7c11', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', '2026-03-30 17:06:22.769'),
	('ad6860cf-e7d4-4a5d-b5b0-adf9b99bf314', 'dded04f9-1410-412a-9eda-5b09b6ed90fc', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 12:18:14.879'),
	('aea0eaef-52c6-44f5-918f-9b136fc21e12', 'a9f73c57-b880-4853-86be-ba7a29fee348', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 600, 600, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-31 03:19:20.043'),
	('b3667304-10ef-4874-a44b-258cb885bf39', 'e49a7966-adb7-41d3-aad3-d9b4c1b348f3', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 12:26:36.81'),
	('b49f9623-56fd-4c89-8ce9-71dba788b2be', '1118cfb2-c44c-40dc-932b-e9b01b663116', 'DRYCLEAN_ITEM', 'Jeans', 2.00, 800, 1600, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 13:32:18.192'),
	('b53ae868-aea0-4a24-a3e4-0417e1e79e51', 'af8dc317-ae4f-43d2-87af-eb5806c2a7f3', 'DRYCLEAN_ITEM', 'BLAZER -1 PIECE', 1.00, 4500, 4500, '65cea1c5-d5d4-4b98-8af0-974963247e09', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', '2026-04-09 11:31:59.485'),
	('b5ce04f0-1be8-4765-8f7a-87e37cfc8660', 'e6e8ae9e-a8e4-46eb-937f-1b227103a45b', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-04 15:05:58.074'),
	('b6f11eec-37c3-4937-8a9e-3e0244a69475', '9559af51-cb9a-465d-9b06-7b51caad98f9', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 15:04:37.431'),
	('bb994a7e-0a5d-42b4-b8f8-19fa1871d061', 'db8da5a0-0c84-4ef6-bf8f-0913acd1ba2d', 'DRYCLEAN_ITEM', 'Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 09:04:20.718'),
	('bde4db79-3224-4aa9-b0df-6c3aff8b3a76', '9ead6ac6-20c1-4412-b3a2-8f92d77f5900', 'DRYCLEAN_ITEM', 'Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-03-18 12:17:32.201'),
	('c11dc8db-e890-46e3-b57a-c0bf3505c115', '17995e11-9c73-4d03-9d3c-fe91f5dd2ee8', 'DRYCLEAN_ITEM', 'curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-01 04:04:00.093'),
	('c6175f02-75e8-4224-b4c3-c7ae164b448c', '1585b632-a60e-4a12-b2db-9c37a341699e', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:52.033'),
	('c7e6e634-fa6a-4f19-86b3-646625db9ad1', '8d550c3d-8469-4234-94a9-5f34063eedce', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1200, 1200, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-04 09:04:17.424'),
	('c8c5983d-29e0-4b40-8324-1bfcc73143b9', '1eeed0e0-e63b-4c4a-b432-94fe373c3aca', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 1000, 1000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-01 12:32:28.862'),
	('c9470569-bd2b-49b2-bf8e-c25ed190d568', '3aa5ac9e-1acb-4f0f-8ed4-92539dede8f7', 'SERVICE', 'Wash & Fold', 9.00, 1000, 9000, NULL, NULL, NULL, '2026-03-18 07:10:21.899'),
	('ca9689c5-dd85-474e-87fd-ac837a3e646d', 'b6583719-fa50-497a-aeb8-fb6bb2b904d9', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-08 12:20:20.85'),
	('cabfa936-d4d3-4091-bfc5-5af8b765b586', '9ead6ac6-20c1-4412-b3a2-8f92d77f5900', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', '2026-03-18 12:17:32.201'),
	('cad719f5-929f-45ea-9f42-3c0bd421051f', 'cf2db01a-0acb-41b1-957b-732192c0e329', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 600, 600, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-20 09:01:42.169'),
	('d0c78826-fde6-41c9-b95d-8fcc4ab83ef0', '8ba4cba8-41d7-4141-81a7-740274d44e31', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:18:29.877'),
	('d34a834a-4c2a-4ea7-837a-25c4d5eafda1', 'd158e4e5-8277-404c-83c8-69bc921d9af2', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-30 18:00:36.66'),
	('d801fa11-5be1-4c39-820e-2031f4c4e172', '3af0e0be-5741-47aa-bc22-4554db456335', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:19:35.548'),
	('daebb0e7-5818-447c-ba03-b82dca49bbd0', '0cc81d4f-1ec5-4ea1-af8a-5ac9e9db023c', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-18 14:15:17.04'),
	('dc20305a-90e8-45f1-a049-667d8a8c1678', '3d289584-61d1-4127-a32c-7dd916ba0ad4', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 13:23:28.742'),
	('dc296e13-160f-4bda-a3ab-a507635886fb', '57246f61-412d-4866-9d5e-2f497026d9ce', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:02:57.194'),
	('dca88f15-56d3-483f-be42-c890dc5d09c6', '606f5f7a-ab2b-4804-bc31-1f2a5c0b50b5', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', '2026-03-18 13:54:55.027'),
	('dcb39569-35ee-410f-b36e-3eb387661424', '9559af51-cb9a-465d-9b06-7b51caad98f9', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 800, 800, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-04 15:04:37.431'),
	('de3e1a73-e0bc-45b8-93dc-ad091e6dca50', 'a05018ce-23b4-4c41-b2e2-0e71cb66f4d9', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-18 14:03:22.906'),
	('df36f5b9-0669-46fd-b51b-18da7514e493', '47dcba7d-e1e0-45a1-a303-d457267f8711', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 600, 600, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-03-31 03:14:55.47'),
	('e39bd53b-21ae-4e59-aac2-24da57611e1e', '0b06ed4d-b784-4320-a779-d43e14411623', 'DRYCLEAN_ITEM', 'curtains', 1.00, 2500, 2500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-31 03:30:15.809'),
	('e43406e5-71ac-47a8-9537-67c110143da0', '8ba4cba8-41d7-4141-81a7-740274d44e31', 'DRYCLEAN_ITEM', 'Jeans', 2.00, 1000, 2000, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 09:18:29.877'),
	('e4b10149-dd1a-499a-bb3a-55df024630df', 'd21f0ae0-7543-4dfe-8ee2-30613c3fc5b4', 'DRYCLEAN_ITEM', 'Jeans', 1.00, 2500, 2500, '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-30 16:59:52.356'),
	('e5f3b162-969c-4d47-acd9-6670fb9f8eeb', '98c49e1a-b97d-41e0-b381-b7f254eae14c', 'DRYCLEAN_ITEM', 'Linen Shirt', 1.00, 1500, 1500, '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-08 17:55:10.936'),
	('eddb23ab-5d9b-4072-86a0-a3c57e9abdd1', 'c9d37f8a-72ce-4e7c-b620-414b96ae02e6', 'DRYCLEAN_ITEM', 'Saree', 1.00, 2000, 2000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', '2026-04-02 08:58:05.984'),
	('eea2fcc2-b6c4-4028-94f4-09325644cfaf', 'b6583719-fa50-497a-aeb8-fb6bb2b904d9', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 12900, 12900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-08 12:20:20.85'),
	('eee1137d-aa21-4e7b-b169-c469cc57484d', 'cf2db01a-0acb-41b1-957b-732192c0e329', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-20 09:01:42.169'),
	('f00898ec-8e7b-409a-8756-a57a5f8d6ade', '1b244da3-a7db-4d4c-8b16-8f5b46cad263', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-02 08:54:03.36'),
	('f69dddf4-92ee-4231-875d-0e47ccdfd893', 'c88939c8-0b73-415f-8edd-8d74388f0033', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-30 17:58:54.723'),
	('f881671c-427a-40b1-a39d-74885226f095', '0d52939d-ede0-4cea-a1fb-2189b2090669', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 12900, 12900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '3186e444-4129-4882-bc51-82645c0cab9e', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-01 09:53:33.059'),
	('fbac326b-c74e-4174-92a1-069cb70bbf32', '47dcba7d-e1e0-45a1-a303-d457267f8711', 'DRYCLEAN_ITEM', 'Saree', 1.00, 5000, 5000, '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-03-31 03:14:55.47'),
	('fc26efac-e051-41cc-9023-e44543df0908', '3d99984a-d310-428f-8974-dd1cb11c7952', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 7900, 7900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', '6fa34ba2-76f4-41ae-952d-045f4abbff6a', '62ca2b5d-7994-4f92-a164-0fbdf78de49f', '2026-04-04 15:05:09.353'),
	('ff47b443-dd86-42b0-9538-5c0078c81c47', '57246f61-412d-4866-9d5e-2f497026d9ce', 'DRYCLEAN_ITEM', 'Curtains', 1.00, 3500, 3500, 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-02 09:02:57.194'),
	('ffc27c76-693a-4837-a167-87eb506b08fb', '8d8fdb5b-3b17-43b6-831a-ca98e480d2a7', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 1.00, 12900, 12900, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-08 12:19:06.158'),
	('ffc90ec2-3157-48b5-9fb8-9d49de47f685', '98c49e1a-b97d-41e0-b381-b7f254eae14c', 'DRYCLEAN_ITEM', 'BASIC PACKAGE', 4.00, 12900, 51600, '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', '2026-04-08 17:55:10.936'),
	('ffe182e7-5b2e-4b9f-9722-d38a3857c267', '8125bf47-2066-435f-9247-9ee1bb273c4c', 'DRYCLEAN_ITEM', 'Add Ons', 1.00, 2000, 2000, '54e2c639-436e-4dec-b63c-056832b0bed4', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', '2026-04-01 04:01:57.641');

-- Dumping structure for table public.ItemSegmentServicePrice
CREATE TABLE IF NOT EXISTS "ItemSegmentServicePrice" (
	"id" TEXT NOT NULL,
	"itemId" TEXT NOT NULL,
	"segmentCategoryId" TEXT NOT NULL,
	"serviceCategoryId" TEXT NOT NULL,
	"priceRupees" INTEGER NOT NULL,
	"isActive" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("itemId", "segmentCategoryId", "serviceCategoryId"),
	CONSTRAINT "ItemSegmentServicePrice_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "LaundryItem" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "ItemSegmentServicePrice_segmentCategoryId_fkey" FOREIGN KEY ("segmentCategoryId") REFERENCES "SegmentCategory" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "ItemSegmentServicePrice_serviceCategoryId_fkey" FOREIGN KEY ("serviceCategoryId") REFERENCES "ServiceCategory" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "ItemSegmentServicePrice_itemId_idx" ON "ItemSegmentServicePrice" ("itemId");
CREATE INDEX "ItemSegmentServicePrice_serviceCategoryId_idx" ON "ItemSegmentServicePrice" ("serviceCategoryId");
CREATE INDEX "ItemSegmentServicePrice_segmentCategoryId_idx" ON "ItemSegmentServicePrice" ("segmentCategoryId");

-- Dumping data for table public.ItemSegmentServicePrice: 105 rows
INSERT INTO "ItemSegmentServicePrice" ("id", "itemId", "segmentCategoryId", "serviceCategoryId", "priceRupees", "isActive", "createdAt", "updatedAt") VALUES
	('020bfefd-8d4c-45f5-abb6-69f4295096c3', '6b124486-4f2c-49ba-9bda-e3156dccf33a', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 25, 'true', '2026-04-09 07:43:06.421', '2026-04-09 07:43:06.421'),
	('04ea0d2f-cfa0-482d-9a97-19e61e4d088f', '2e448803-a16b-4074-b831-5f2bcd8a237f', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', 179, 'true', '2026-04-08 12:07:45.467', '2026-04-08 12:07:45.467'),
	('05a70979-d2d4-441a-bef8-e331b262c228', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 15, 'true', '2026-04-09 07:31:27.981', '2026-04-09 07:31:27.981'),
	('06ac03a5-3825-4e3d-8996-786c4981d784', 'a825f10a-34a0-47b3-a789-695f28c07439', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 05:56:03.743', '2026-04-09 05:56:03.743'),
	('0799a5e4-84ef-4224-a7a2-47ff5d569a10', '54e2c639-436e-4dec-b63c-056832b0bed4', '9787fd18-9c79-443f-9d03-2124706791ce', '66b207f7-d5d7-4523-b1ec-166f5cb341c4', 0, 'true', '2026-04-09 05:51:56.403', '2026-04-09 05:51:56.403'),
	('0c5ce35a-ea3a-4ec5-ae3c-88234ed783be', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:27:05.117', '2026-04-09 07:27:05.117'),
	('0db14580-f900-41b5-b18e-5ff9f5fe4338', 'bac24a94-28bd-47e7-915a-6177e08ccff1', '9787fd18-9c79-443f-9d03-2124706791ce', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 79, 'true', '2026-04-09 06:46:20.256', '2026-04-09 06:46:20.256'),
	('105f76ab-3fbd-485a-bb70-cd14db84b875', 'dc54978a-4122-48aa-b1a0-842191299d25', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 50, 'true', '2026-04-09 07:00:47.301', '2026-04-09 07:00:47.301'),
	('11126669-e10f-465f-a44d-ea0649faab24', '7daf382e-c96d-40d7-931b-642cd1707b3a', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 200, 'true', '2026-04-09 07:17:52.594', '2026-04-09 07:17:52.594'),
	('118d7466-449f-440d-b6f8-4b106c6e1b6a', '5cbc5130-790a-46db-a691-d8c4257622c3', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 160, 'true', '2026-04-09 07:33:22.628', '2026-04-09 07:33:22.628'),
	('126d7c3a-3088-45da-a495-07e4140baa49', '469f83c9-fae3-4821-9887-da37456b23d7', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 60, 'true', '2026-04-09 07:45:16.71', '2026-04-09 07:45:16.71'),
	('1396fddf-6be6-43d2-800d-21f649e2e653', '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 250, 'true', '2026-04-09 06:17:47.539', '2026-04-09 06:17:47.539'),
	('14092db7-b06e-4fe9-8527-58546afe2cdc', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:24:30.46', '2026-04-09 07:24:30.46'),
	('162890d5-e795-44a7-a930-2d6183d6e4f5', 'ee7d2be1-565d-487d-a643-44b604a0447c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 150, 'true', '2026-04-09 05:59:09.499', '2026-04-09 05:59:09.499'),
	('191b374f-d2c8-472c-b4c7-569cc80f4035', '7f1fc6a5-a754-46b8-be43-0eba29ebcba2', '638a56bd-4a42-4503-a454-71b5db3da0e8', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', 199, 'true', '2026-04-09 07:38:12.491', '2026-04-09 07:38:12.491'),
	('195ec610-7dd6-4cd0-9d9a-e12c87976d28', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:24:30.463', '2026-04-09 07:24:30.463'),
	('1a446674-f50b-48e1-ab60-f1d5af6750ae', 'bac24a94-28bd-47e7-915a-6177e08ccff1', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 06:46:20.254', '2026-04-09 06:46:20.254'),
	('1c078205-a2ae-470c-b5fa-0f1b253cdd9a', 'eb8e49c9-0dcf-4909-bfbe-0dd5b27376a6', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 50, 'true', '2026-04-09 06:42:39.922', '2026-04-09 06:42:39.922'),
	('1c3933c8-c9f1-4ec7-8eb2-5e8de83cc1d9', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:24:30.468', '2026-04-09 07:24:30.468'),
	('22857768-4a52-4b61-aa62-aace15918f4e', '574a9574-d3bb-4200-8131-9e2555b1f054', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 200, 'true', '2026-04-09 06:16:52.584', '2026-04-09 06:16:52.584'),
	('23e720de-396f-4ee7-8c76-e9c315281523', 'b307bf51-8459-4d34-8c0f-12768ed53914', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 79, 'true', '2026-04-09 06:27:33.92', '2026-04-09 06:27:33.92'),
	('247af2e7-8032-4b41-b9e1-aba7d12dacb7', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 40, 'true', '2026-04-09 07:31:14.376', '2026-04-09 07:31:14.376'),
	('264f6ebb-28ef-4f95-92f1-6f1657e27cb7', '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', 79, 'true', '2026-04-08 12:06:05.411', '2026-04-08 12:06:05.411'),
	('288e923d-f1b4-4e43-990d-41a6e74aad8b', '65cea1c5-d5d4-4b98-8af0-974963247e09', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 45, 'true', '2026-04-09 07:46:49.504', '2026-04-09 07:46:49.504'),
	('28cb3459-9d83-4fd8-acba-c8aa79a20e42', '2a558e3e-f558-4eb5-add5-27c357ed4a88', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 35, 'true', '2026-04-09 06:17:47.538', '2026-04-09 06:17:47.538'),
	('2bd654c0-940e-4836-8446-30d080138832', '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 25, 'true', '2026-04-04 12:23:48.458', '2026-04-04 12:23:48.458'),
	('2cfd738e-ade6-468d-b923-2d6714ef69d7', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 40, 'true', '2026-04-09 07:31:14.38', '2026-04-09 07:31:14.38'),
	('2f21660b-8e32-4f4d-9800-bfa2cbc49c3f', 'd5c4d968-3148-4819-abd5-c02a41f55ce7', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:20:39.152', '2026-04-09 07:20:39.152'),
	('32a7d37c-6fde-4707-8e63-f758c2958b3c', 'e646c084-7b26-4ab4-9d12-9abf57ff8595', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 800, 'true', '2026-04-09 06:13:05.712', '2026-04-09 06:13:05.712'),
	('3a9aa3ad-5d9e-4bf8-b2c5-63e7873656ab', 'd41f7417-ca22-45e0-a0d5-bed974cfe8a9', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:10:35.497', '2026-04-09 07:10:35.497'),
	('3aaec4f9-9bfe-45bc-aab3-817c5dd77841', 'cd7c533d-0998-4048-a585-b5196d639ba7', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 79, 'true', '2026-04-09 07:09:46.218', '2026-04-09 07:09:46.218'),
	('4112951b-f347-4276-96a9-eba7a564e3bd', '60209ff0-a069-4ca7-855a-beaa92570b03', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 250, 'true', '2026-04-09 06:50:20.872', '2026-04-09 06:50:20.872'),
	('422800a3-ead8-4951-b0e0-50de47c2bc21', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:27:05.11', '2026-04-09 07:27:05.11'),
	('449f1a1d-db20-420f-bd49-33444aea66df', 'e646c084-7b26-4ab4-9d12-9abf57ff8595', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 120, 'true', '2026-04-09 06:13:05.71', '2026-04-09 06:13:05.71'),
	('48727280-1d80-4c16-b521-a29043ebaadd', 'b99eaddf-65d8-4c9a-9a56-48b4cccee185', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:06:09.113', '2026-04-09 07:06:09.113'),
	('4cb4b417-c8fa-4792-83e2-87c6fa817ed5', '0375e4df-fe3d-46c1-8099-dda085982901', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 06:48:53.204', '2026-04-09 06:48:53.204'),
	('4d2c7791-3d2f-49e3-96a7-e1167cfb4239', 'cd7c533d-0998-4048-a585-b5196d639ba7', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:09:46.226', '2026-04-09 07:09:46.226'),
	('4f6bb858-3874-4f3f-8dfa-3023074dd1d1', 'aba54729-d477-4c96-996b-358dc760fc92', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'de05b014-87c6-4e7d-ab71-5c8dc4d62eb9', 15, 'true', '2026-04-09 07:41:55.619', '2026-04-09 07:41:55.619'),
	('5067df84-2b88-42f7-901f-cc90d0c1ebec', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:27:05.114', '2026-04-09 07:27:05.114'),
	('50ee01c7-1d42-428a-aa89-86f285c1d32b', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:24:30.466', '2026-04-09 07:24:30.466'),
	('5193fc07-dcc9-4114-9069-9104ebc60bf5', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:27:05.113', '2026-04-09 07:27:05.113'),
	('5339345a-0685-46a4-b79a-e86802a37810', '469f83c9-fae3-4821-9887-da37456b23d7', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 350, 'true', '2026-04-09 07:45:16.712', '2026-04-09 07:45:16.712'),
	('5403caeb-4358-44b1-a0b6-17757875fdd1', '8bc04e8b-0e80-45a6-9b68-9869b907d6cf', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 80, 'true', '2026-04-09 06:10:50.171', '2026-04-09 06:10:50.171'),
	('54cfe1bc-9268-46f8-8165-59588dcbb0c9', '7daf382e-c96d-40d7-931b-642cd1707b3a', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 750, 'true', '2026-04-09 07:17:52.591', '2026-04-09 07:17:52.591'),
	('5630f013-b9f5-40ab-87f3-fef8517defa1', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 80, 'true', '2026-04-09 07:31:27.983', '2026-04-09 07:31:27.983'),
	('57516268-6cc2-4093-92bd-0eab398aa363', 'dba154a3-bc5f-4e55-acf9-6940a346672b', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 170, 'true', '2026-04-09 07:35:42.552', '2026-04-09 07:35:42.552'),
	('57f69721-4599-4f99-8b5a-a463a270ffed', '9018b132-0163-48fd-91c6-603932e41d01', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 65, 'true', '2026-04-09 07:47:55.05', '2026-04-09 07:47:55.05'),
	('5a19ba96-91f7-4099-acfd-e0783a0de457', 'bac24a94-28bd-47e7-915a-6177e08ccff1', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 15, 'true', '2026-04-09 06:46:20.251', '2026-04-09 06:46:20.251'),
	('5a57e6ea-b379-425e-a373-c0a2887c1fec', 'ee7d2be1-565d-487d-a643-44b604a0447c', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 05:59:09.498', '2026-04-09 05:59:09.498'),
	('5cc0422f-b169-45ee-9dbd-e93525020948', '957a84e6-32c7-4a63-8056-3e8aedecbac2', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 05:57:07.748', '2026-04-09 05:57:07.748'),
	('5db4534d-939b-4016-8e8b-ebc9d6b0b32d', 'd41f7417-ca22-45e0-a0d5-bed974cfe8a9', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 350, 'true', '2026-04-09 07:10:35.496', '2026-04-09 07:10:35.496'),
	('5e3f3910-f37b-4e71-86b6-772203812d47', '7f1fc6a5-a754-46b8-be43-0eba29ebcba2', '1c60493a-da3e-482a-9825-fcf19a956c6a', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', 199, 'true', '2026-04-09 07:38:12.493', '2026-04-09 07:38:12.493'),
	('62b2258f-77db-46e5-93bc-f59f9108e516', '1141dd41-24f6-4c6c-9b8e-2f27ddef7d4c', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 200, 'true', '2026-04-09 06:30:16.187', '2026-04-09 06:30:16.187'),
	('64646cb5-6b63-479a-b1a4-631189b5699a', '684ee0e2-b2bd-46b6-8940-39a95b95728c', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 60, 'true', '2026-04-09 07:44:33.487', '2026-04-09 07:44:33.487'),
	('64904fd8-6b21-474a-983e-cfc01cd48572', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 40, 'true', '2026-04-09 07:31:14.384', '2026-04-09 07:31:14.384'),
	('6541c699-fcc5-4515-a790-b232c2ad537b', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:24:30.462', '2026-04-09 07:24:30.462'),
	('66782910-7407-4e5c-a006-5f426e22d43a', '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', 35, 'true', '2026-04-04 12:23:48.46', '2026-04-04 12:23:48.46'),
	('695a3aac-ddaa-43c1-b01a-234ffcbb799f', '9f4c069f-292d-4b23-895b-c0468e3bc9e4', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 06:15:08.855', '2026-04-09 06:15:08.855'),
	('6af47887-1de1-45f2-8195-4af17e317515', 'dba154a3-bc5f-4e55-acf9-6940a346672b', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 07:35:42.547', '2026-04-09 07:35:42.547'),
	('6bbbfd62-8e65-48cb-967c-090c63e5f86c', 'cd7c533d-0998-4048-a585-b5196d639ba7', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 79, 'true', '2026-04-09 07:09:46.222', '2026-04-09 07:09:46.222'),
	('73113658-52a4-4be8-9386-365f23002650', '574a9574-d3bb-4200-8131-9e2555b1f054', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 10, 'true', '2026-04-09 06:16:52.577', '2026-04-09 06:16:52.577'),
	('782b51fc-6186-40b4-80d5-ab9cf0c4b847', 'd41f7417-ca22-45e0-a0d5-bed974cfe8a9', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 180, 'true', '2026-04-09 07:10:35.499', '2026-04-09 07:10:35.499'),
	('78b6b8e1-61c7-4475-abac-089b205e0581', '7e60d1d4-fbc9-4e9f-b13b-6abe0f5c8f2f', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 350, 'true', '2026-04-09 06:22:32.971', '2026-04-09 06:22:32.971'),
	('7afbc853-97c9-4a04-9c41-594205ce72f3', '2e448803-a16b-4074-b831-5f2bcd8a237f', 'adc7be55-788a-4843-a763-9f443b099d55', 'e3c4292d-b0fc-44d2-84c8-76e80114f5cd', 99, 'true', '2026-04-08 12:07:45.464', '2026-04-08 12:07:45.464'),
	('7b7c11d7-76ca-4f6e-9570-6a29855f94a9', '7f1fc6a5-a754-46b8-be43-0eba29ebcba2', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '31c46e53-2011-4c7f-8d3e-c5345bba3dcc', 199, 'true', '2026-04-09 07:38:12.495', '2026-04-09 07:38:12.495'),
	('7e9f043e-63bb-4f10-83c2-13ce179f02b7', '54e2c639-436e-4dec-b63c-056832b0bed4', 'e9f69332-0217-48da-aa08-2c5e11301df2', '705631e6-3f65-4576-9244-e2377cf0aef2', 40, 'true', '2026-04-09 05:51:56.404', '2026-04-09 05:51:56.404'),
	('837330b6-de2c-4656-9e3b-60562273a789', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 25, 'true', '2026-04-09 07:31:27.978', '2026-04-09 07:31:27.978'),
	('8cb48e5b-ae42-4655-9ebc-2caaadc80254', '1141dd41-24f6-4c6c-9b8e-2f27ddef7d4c', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 06:30:16.184', '2026-04-09 06:30:16.184'),
	('8dd656ab-80bb-4e0f-ae0e-59f77e273beb', '60209ff0-a069-4ca7-855a-beaa92570b03', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 06:50:20.87', '2026-04-09 06:50:20.87'),
	('8eb55180-2df2-4757-9015-6c1d8320fc3c', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 100, 'true', '2026-04-09 07:31:27.979', '2026-04-09 07:31:27.979'),
	('8f3f0691-a702-4bb4-b169-e36a049c50c8', '7daf382e-c96d-40d7-931b-642cd1707b3a', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 90, 'true', '2026-04-09 07:17:52.589', '2026-04-09 07:17:52.589'),
	('9239f95b-1c4b-458c-8844-3d5b463a8aaa', 'cec7abfa-5943-4ea1-8ee5-d80da6c9aa14', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 350, 'true', '2026-04-09 06:22:17.53', '2026-04-09 06:22:17.53'),
	('94a1ecfc-ba51-4d9c-9863-649882c57f2c', 'cd7c533d-0998-4048-a585-b5196d639ba7', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:09:46.22', '2026-04-09 07:09:46.22'),
	('96eb7ebc-8c53-4737-b5e7-c7d4f61b47fa', '65cea1c5-d5d4-4b98-8af0-974963247e09', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 45, 'true', '2026-04-09 07:46:49.506', '2026-04-09 07:46:49.506'),
	('9708cf9a-2630-401f-b885-7568ee33089c', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 25, 'true', '2026-04-09 07:31:27.973', '2026-04-09 07:31:27.973'),
	('970ba8b8-8d42-4215-85b1-f2ff2b47a596', '44868091-4673-4053-b149-0937d5a04279', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 300, 'true', '2026-04-09 06:43:49.988', '2026-04-09 06:43:49.988'),
	('9850521d-98d4-4411-a64f-02c7fccf0cbd', 'dba154a3-bc5f-4e55-acf9-6940a346672b', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 07:35:42.55', '2026-04-09 07:35:42.55'),
	('9a6a8106-b91c-45a4-871c-01e27c38a8a9', '7e60d1d4-fbc9-4e9f-b13b-6abe0f5c8f2f', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 45, 'true', '2026-04-09 06:22:32.969', '2026-04-09 06:22:32.969'),
	('9b55aa81-1f19-4ca5-a832-72959515a54f', '8bc04e8b-0e80-45a6-9b68-9869b907d6cf', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 600, 'true', '2026-04-09 06:10:50.173', '2026-04-09 06:10:50.173'),
	('a0d80c68-6805-4a01-9b64-07b60782e394', 'b99eaddf-65d8-4c9a-9a56-48b4cccee185', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:06:09.116', '2026-04-09 07:06:09.116'),
	('a6dc0cad-5151-4661-b0e8-d89f05975f58', '54e2c639-436e-4dec-b63c-056832b0bed4', '0def0e23-b76e-4d6f-afde-26c56211f1eb', '705631e6-3f65-4576-9244-e2377cf0aef2', 30, 'true', '2026-04-09 05:51:56.406', '2026-04-09 05:51:56.406'),
	('aa80e96d-7500-4d94-b746-b795b144850d', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 100, 'true', '2026-04-09 07:31:27.976', '2026-04-09 07:31:27.976'),
	('b092770b-c031-43bc-9470-cb2cf02674a0', 'cd7c533d-0998-4048-a585-b5196d639ba7', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:09:46.215', '2026-04-09 07:09:46.215'),
	('b2701bc9-7bc1-4f86-b6ad-fb807782f009', 'cd7c533d-0998-4048-a585-b5196d639ba7', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:09:46.224', '2026-04-09 07:09:46.224'),
	('b4100ed0-f59f-495e-8e9e-4ee226cdabc8', 'a1a87c50-d0b6-4aee-b028-63b9ef459552', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 360, 'true', '2026-04-09 06:58:28.896', '2026-04-09 06:58:28.896'),
	('ba662130-8185-4f2d-a769-324ca010c3de', 'eb8e49c9-0dcf-4909-bfbe-0dd5b27376a6', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 300, 'true', '2026-04-09 06:42:39.924', '2026-04-09 06:42:39.924'),
	('ba805f26-7211-4ef8-8f43-0c3fd0d6ebe0', 'bac24a94-28bd-47e7-915a-6177e08ccff1', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 06:46:20.253', '2026-04-09 06:46:20.253'),
	('bb51dc26-36cf-4c31-b249-5d3c60748923', 'dc54978a-4122-48aa-b1a0-842191299d25', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 70, 'true', '2026-04-09 07:00:47.303', '2026-04-09 07:00:47.303'),
	('bc487370-265f-49d6-a80e-61be457b741e', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 180, 'true', '2026-04-09 07:31:14.382', '2026-04-09 07:31:14.382'),
	('c163419c-73f9-4e6c-82f3-a30c9f6f7210', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:24:30.465', '2026-04-09 07:24:30.465'),
	('c445a150-fb57-4a6b-90a6-432b3c9949a0', 'b307bf51-8459-4d34-8c0f-12768ed53914', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 15, 'true', '2026-04-09 06:27:33.918', '2026-04-09 06:27:33.918'),
	('c4813844-bb4f-4b54-8dfc-e4fe3a41d54b', 'a1a87c50-d0b6-4aee-b028-63b9ef459552', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 06:58:28.894', '2026-04-09 06:58:28.894'),
	('c5bca2d3-2879-444d-a78d-588c4456e6c9', '7daf382e-c96d-40d7-931b-642cd1707b3a', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:17:52.593', '2026-04-09 07:17:52.593'),
	('c8ba398d-3c80-46ba-a46f-48a6d9a38cba', '6b124486-4f2c-49ba-9bda-e3156dccf33a', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 110, 'true', '2026-04-09 07:43:06.423', '2026-04-09 07:43:06.423'),
	('cbf6a8f6-fe26-4fa4-b95b-2174a351c45c', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 180, 'true', '2026-04-09 07:31:14.386', '2026-04-09 07:31:14.386'),
	('ccbc7a2e-d917-4273-9713-1201ec1881c3', 'd41f7417-ca22-45e0-a0d5-bed974cfe8a9', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 45, 'true', '2026-04-09 07:10:35.494', '2026-04-09 07:10:35.494'),
	('d728ffca-fe3f-47ad-80a6-84d69d3a5c2d', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 30, 'true', '2026-04-09 06:07:45.797', '2026-04-09 06:07:45.797'),
	('d8858f61-e4b0-4e5a-859c-cc628b8e231e', '0375e4df-fe3d-46c1-8099-dda085982901', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 150, 'true', '2026-04-09 06:48:53.206', '2026-04-09 06:48:53.206'),
	('dc1f9de6-daf2-42a8-acb8-8408bad29c0a', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:27:05.116', '2026-04-09 07:27:05.116'),
	('dca86a95-7370-4c37-9865-f4e3579aa383', '957a84e6-32c7-4a63-8056-3e8aedecbac2', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 05:57:07.746', '2026-04-09 05:57:07.746'),
	('e5544f7b-d2e2-4e6e-bb2c-112de6c1b8df', 'd47af90f-d9f7-4b5f-8d72-2eafbed05aca', '638a56bd-4a42-4503-a454-71b5db3da0e8', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 200, 'true', '2026-04-09 07:32:39.864', '2026-04-09 07:32:39.864'),
	('e77f08fd-42d1-4cc7-a2ce-4158d246f165', '9f4c069f-292d-4b23-895b-c0468e3bc9e4', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 10, 'true', '2026-04-09 06:15:08.854', '2026-04-09 06:15:08.854'),
	('e9d265cf-dcdc-4f25-9d61-29f0974a8a26', 'b99eaddf-65d8-4c9a-9a56-48b4cccee185', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 07:06:09.118', '2026-04-09 07:06:09.118'),
	('ea058c9c-7783-47a0-9dac-431955a38405', '0f976ea2-561b-4240-afcb-030c6bffb374', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 79, 'true', '2026-04-09 06:04:06.658', '2026-04-09 06:04:06.658'),
	('ea20faba-c9ab-4446-9dd3-2c9af6154c50', '849d0cb2-6fff-4eb5-9a07-4435488e98a4', '1c60493a-da3e-482a-9825-fcf19a956c6a', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 95, 'true', '2026-04-09 07:48:30.841', '2026-04-09 07:48:30.841'),
	('eafffe9e-5ac6-4535-8463-6cc787890cf1', 'd5c4d968-3148-4819-abd5-c02a41f55ce7', '638a56bd-4a42-4503-a454-71b5db3da0e8', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 15, 'true', '2026-04-09 07:20:39.15', '2026-04-09 07:20:39.15'),
	('ebd58b99-d728-4ef8-bc89-db1fb54a47b8', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 150, 'true', '2026-04-09 06:07:45.8', '2026-04-09 06:07:45.8'),
	('ebf2a3c7-765f-405b-89bb-3db601872ac5', 'dba154a3-bc5f-4e55-acf9-6940a346672b', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 180, 'true', '2026-04-09 07:35:42.549', '2026-04-09 07:35:42.549'),
	('ec0dd414-8150-4f19-b03a-7fccf0b4913d', '684ee0e2-b2bd-46b6-8940-39a95b95728c', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 300, 'true', '2026-04-09 07:44:33.491', '2026-04-09 07:44:33.491'),
	('ee9f4757-dcea-4067-9c46-46ac5846a953', '5384a69c-bf35-4302-8dcf-f7c661d5e906', 'adc7be55-788a-4843-a763-9f443b099d55', 'a5a920cc-06f9-42db-baa2-b79c5624a921', 129, 'true', '2026-04-08 12:06:05.412', '2026-04-08 12:06:05.412'),
	('f01879ca-cd5e-43f1-81cb-6a48b012e443', '44868091-4673-4053-b149-0937d5a04279', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 80, 'true', '2026-04-09 06:43:49.986', '2026-04-09 06:43:49.986'),
	('f13a7db9-36bf-4b6c-b0d5-9eeb1b82f208', 'a825f10a-34a0-47b3-a789-695f28c07439', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 05:56:03.741', '2026-04-09 05:56:03.741'),
	('f457e6a0-00e7-40c1-b15b-f722db5ca8dc', 'd3a2834f-7518-4eb8-a616-f116169330cf', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 50, 'true', '2026-04-09 07:01:41.512', '2026-04-09 07:01:41.512'),
	('f67094f2-e329-4c91-87d7-64f7651cfc75', '0f976ea2-561b-4240-afcb-030c6bffb374', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 20, 'true', '2026-04-09 06:04:06.656', '2026-04-09 06:04:06.656'),
	('f82630b6-20d4-413b-b9db-76d8ffe0b0d1', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 180, 'true', '2026-04-09 07:31:14.379', '2026-04-09 07:31:14.379'),
	('f97a1b1d-7e24-4250-a4f6-7e8b7db84531', '71640e6e-a8ec-48a7-a1b3-908053f44c35', '1c60493a-da3e-482a-9825-fcf19a956c6a', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 90, 'true', '2026-04-09 07:27:05.111', '2026-04-09 07:27:05.111'),
	('fbbc6682-a431-418d-a6de-91bba9eca561', 'd3a2834f-7518-4eb8-a616-f116169330cf', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 130, 'true', '2026-04-09 07:01:41.514', '2026-04-09 07:01:41.514'),
	('fe624242-8bec-464c-9db2-ff4fe7a2646c', 'cec7abfa-5943-4ea1-8ee5-d80da6c9aa14', '6e9dee74-21f3-4c97-bdfd-b3052323ed50', '9e1ee360-277f-4474-a0ec-29cd6943aefb', 45, 'true', '2026-04-09 06:22:17.519', '2026-04-09 06:22:17.519'),
	('fe69abf6-877b-48a2-88f4-2d3cf3a2eca1', '31929250-bc39-4c67-b0fa-e0ade43b33d3', '425dbde3-47e9-4802-89d3-92c4232bcd2b', 'c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 35, 'true', '2026-04-04 12:23:48.456', '2026-04-04 12:23:48.456');

-- Dumping structure for table public.LaundryItem
CREATE TABLE IF NOT EXISTS "LaundryItem" (
	"id" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"icon" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("name")
);

-- Dumping data for table public.LaundryItem: 31 rows
INSERT INTO "LaundryItem" ("id", "name", "active", "icon", "createdAt", "updatedAt") VALUES
	('0375e4df-fe3d-46c1-8099-dda085982901', 'DHOTI/LUNGI (SILK)', 'true', '/api/assets/catalog-icons/icon-0375e4df-fe3d-46c1-8099-dda085982901.png', '2026-04-09 06:47:25.377', '2026-04-09 06:48:53.2'),
	('0f976ea2-561b-4240-afcb-030c6bffb374', 'NORMAL TOP', 'true', '/api/assets/catalog-icons/icon-0f976ea2-561b-4240-afcb-030c6bffb374.png', '2026-04-04 12:31:38.59', '2026-04-09 06:04:06.652'),
	('1141dd41-24f6-4c6c-9b8e-2f27ddef7d4c', 'BLOUSE ( DESIGNER)', 'true', '/api/assets/catalog-icons/icon-1141dd41-24f6-4c6c-9b8e-2f27ddef7d4c.png', '2026-04-09 06:27:55.836', '2026-04-09 06:30:16.18'),
	('2a558e3e-f558-4eb5-add5-27c357ed4a88', 'SAREE (SILK)', 'true', '/api/assets/catalog-icons/icon-2a558e3e-f558-4eb5-add5-27c357ed4a88.png', '2026-03-18 12:15:59.956', '2026-04-09 06:17:47.535'),
	('2e448803-a16b-4074-b831-5f2bcd8a237f', 'PREMIUM PACKAGES', 'true', '/api/assets/catalog-icons/icon-2e448803-a16b-4074-b831-5f2bcd8a237f.png', '2026-03-31 17:14:46.33', '2026-04-08 12:07:45.457'),
	('31929250-bc39-4c67-b0fa-e0ade43b33d3', 'BED SHEET', 'true', '/api/assets/catalog-icons/icon-31929250-bc39-4c67-b0fa-e0ade43b33d3.png', '2026-03-30 16:47:23.472', '2026-04-04 12:23:48.452'),
	('44868091-4673-4053-b149-0937d5a04279', 'LONG DRESS (LAYERED)', 'true', '/api/assets/catalog-icons/icon-44868091-4673-4053-b149-0937d5a04279.png', '2026-04-09 06:43:03.012', '2026-04-09 06:43:49.983'),
	('469f83c9-fae3-4821-9887-da37456b23d7', 'SAFARI SUIT - 3P', 'true', NULL, '2026-04-09 07:44:47.175', '2026-04-09 07:45:16.707'),
	('5384a69c-bf35-4302-8dcf-f7c661d5e906', 'BASIC PACKAGE', 'true', '/api/assets/catalog-icons/icon-5384a69c-bf35-4302-8dcf-f7c661d5e906.png', '2026-03-31 08:45:15.839', '2026-04-08 12:06:05.407'),
	('54e2c639-436e-4dec-b63c-056832b0bed4', 'Add Ons', 'true', '/api/assets/catalog-icons/icon-54e2c639-436e-4dec-b63c-056832b0bed4.png', '2026-03-18 12:15:15.493', '2026-04-09 05:51:56.399'),
	('574a9574-d3bb-4200-8131-9e2555b1f054', 'DUPATTA (HEAVY)', 'true', '/api/assets/catalog-icons/icon-574a9574-d3bb-4200-8131-9e2555b1f054.png', '2026-04-09 06:15:27.802', '2026-04-09 06:16:52.558'),
	('5cbc5130-790a-46db-a691-d8c4257622c3', 'KIDS SLEEPMATRESS', 'true', NULL, '2026-04-09 07:32:58.652', '2026-04-09 07:33:22.625'),
	('60209ff0-a069-4ca7-855a-beaa92570b03', 'DHOTI / LINGI (COTTON )', 'true', '/api/assets/catalog-icons/icon-60209ff0-a069-4ca7-855a-beaa92570b03.png', '2026-04-09 06:48:32.205', '2026-04-09 06:50:20.867'),
	('64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', 'KURTI (HEAVY)', 'true', '/api/assets/catalog-icons/icon-64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c.png', '2026-03-18 07:10:16.699', '2026-04-09 06:07:45.793'),
	('64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', 'PANT', 'true', NULL, '2026-04-09 07:22:46.298', '2026-04-09 07:24:30.456'),
	('65cea1c5-d5d4-4b98-8af0-974963247e09', 'BLAZER -1 PIECE', 'true', NULL, '2026-04-09 07:45:55.272', '2026-04-09 07:46:49.501'),
	('684ee0e2-b2bd-46b6-8940-39a95b95728c', 'SAFARI SUIT -2P', 'true', NULL, '2026-04-09 07:43:48.072', '2026-04-09 07:44:33.479'),
	('6b124486-4f2c-49ba-9bda-e3156dccf33a', 'PANCHA', 'true', NULL, '2026-04-09 07:42:27.497', '2026-04-09 07:43:06.418'),
	('71640e6e-a8ec-48a7-a1b3-908053f44c35', 'TROUSER', 'true', NULL, '2026-04-09 07:25:19.882', '2026-04-09 07:27:05.107'),
	('7daf382e-c96d-40d7-931b-642cd1707b3a', 'LEHANGA (DESIGNER)', 'true', NULL, '2026-04-09 06:38:04.231', '2026-04-09 07:17:52.586'),
	('7e60d1d4-fbc9-4e9f-b13b-6abe0f5c8f2f', 'SAREE ( HEAVY)', 'true', '/api/assets/catalog-icons/icon-7e60d1d4-fbc9-4e9f-b13b-6abe0f5c8f2f.png', '2026-04-09 06:19:21.393', '2026-04-09 06:22:32.965'),
	('7f1fc6a5-a754-46b8-be43-0eba29ebcba2', 'SHOES', 'true', NULL, '2026-04-09 07:36:24', '2026-04-09 07:38:12.487'),
	('7f63d2f9-dca0-4b8b-bdc4-220982b123f0', 'JEANS', 'true', '/api/assets/catalog-icons/icon-7f63d2f9-dca0-4b8b-bdc4-220982b123f0.png', '2026-03-18 07:10:16.852', '2026-04-09 07:31:27.968'),
	('849d0cb2-6fff-4eb5-9a07-4435488e98a4', 'BLAZER - 3 PIECE', 'true', NULL, '2026-04-09 07:48:13.783', '2026-04-09 07:48:30.837'),
	('8bc04e8b-0e80-45a6-9b68-9869b907d6cf', 'SHERWANI(NORMAL)', 'true', '/api/assets/catalog-icons/icon-8bc04e8b-0e80-45a6-9b68-9869b907d6cf.png', '2026-04-09 06:08:28.252', '2026-04-09 06:10:50.168'),
	('9018b132-0163-48fd-91c6-603932e41d01', 'BLAZER - 2 PIECE', 'true', NULL, '2026-04-09 07:47:07.268', '2026-04-09 07:47:55.045'),
	('957a84e6-32c7-4a63-8056-3e8aedecbac2', 'KURTA (NORMAL)', 'true', '/api/assets/catalog-icons/icon-957a84e6-32c7-4a63-8056-3e8aedecbac2.png', '2026-04-09 05:48:17.784', '2026-04-09 05:57:07.743'),
	('9f4c069f-292d-4b23-895b-c0468e3bc9e4', 'DUPATTA (NORMAL)', 'true', '/api/assets/catalog-icons/icon-9f4c069f-292d-4b23-895b-c0468e3bc9e4.png', '2026-04-09 06:13:43.249', '2026-04-09 06:15:08.851'),
	('a1a87c50-d0b6-4aee-b028-63b9ef459552', 'FROCK', 'true', '/api/assets/catalog-icons/icon-a1a87c50-d0b6-4aee-b028-63b9ef459552.png', '2026-04-09 06:56:04.785', '2026-04-09 06:58:28.891'),
	('a825f10a-34a0-47b3-a789-695f28c07439', 'KURTI (NORMAL)', 'true', '/api/assets/catalog-icons/icon-a825f10a-34a0-47b3-a789-695f28c07439.png', '2026-04-09 05:41:34.662', '2026-04-09 05:56:03.736'),
	('aba54729-d477-4c96-996b-358dc760fc92', 'Curtains', 'true', '/api/assets/catalog-icons/icon-aba54729-d477-4c96-996b-358dc760fc92.png', '2026-03-31 03:09:43.202', '2026-04-09 07:41:55.615'),
	('b307bf51-8459-4d34-8c0f-12768ed53914', 'BLOUSE (NORMAL)', 'true', '/api/assets/catalog-icons/icon-b307bf51-8459-4d34-8c0f-12768ed53914.png', '2026-04-09 06:25:25.058', '2026-04-09 06:27:33.914'),
	('b99eaddf-65d8-4c9a-9a56-48b4cccee185', 'T- SHIRT', 'true', '/api/assets/catalog-icons/icon-b99eaddf-65d8-4c9a-9a56-48b4cccee185.png', '2026-04-09 07:03:42.38', '2026-04-09 07:06:09.108'),
	('bac24a94-28bd-47e7-915a-6177e08ccff1', 'PYJAMA', 'true', '/api/assets/catalog-icons/icon-new-item-1775716454797-h7618p.png', '2026-04-09 06:45:10.873', '2026-04-09 06:46:20.249'),
	('cd7c533d-0998-4048-a585-b5196d639ba7', 'SHIRT', 'true', '/api/assets/catalog-icons/icon-cd7c533d-0998-4048-a585-b5196d639ba7.png', '2026-04-09 07:06:34.946', '2026-04-09 07:09:46.211'),
	('cec7abfa-5943-4ea1-8ee5-d80da6c9aa14', 'SAREE ( DESIGNER)', 'true', '/api/assets/catalog-icons/icon-cec7abfa-5943-4ea1-8ee5-d80da6c9aa14.png', '2026-04-09 06:20:14.995', '2026-04-09 06:22:17.516'),
	('d3a2834f-7518-4eb8-a616-f116169330cf', 'SKRIT LONG', 'true', '/api/assets/catalog-icons/icon-d3a2834f-7518-4eb8-a616-f116169330cf.png', '2026-04-09 07:01:04.179', '2026-04-09 07:01:41.509'),
	('d41f7417-ca22-45e0-a0d5-bed974cfe8a9', 'LEHANGA (NORMAL)', 'true', NULL, '2026-04-09 06:30:56.118', '2026-04-09 07:10:35.491'),
	('d47af90f-d9f7-4b5f-8d72-2eafbed05aca', 'BABY BLANKET', 'true', NULL, '2026-04-09 07:32:20.084', '2026-04-09 07:32:39.86'),
	('d5c4d968-3148-4819-abd5-c02a41f55ce7', 'DUNGAREE', 'true', NULL, '2026-04-09 07:19:33.719', '2026-04-09 07:20:39.147'),
	('dba154a3-bc5f-4e55-acf9-6940a346672b', 'GHAGRA', 'true', NULL, '2026-04-09 07:33:40.124', '2026-04-09 07:35:42.544'),
	('dc54978a-4122-48aa-b1a0-842191299d25', 'SKIRT MEDIUM', 'true', '/api/assets/catalog-icons/icon-dc54978a-4122-48aa-b1a0-842191299d25.png', '2026-04-09 06:58:51.925', '2026-04-09 07:00:47.298'),
	('e646c084-7b26-4ab4-9d12-9abf57ff8595', 'SHERWANI (HEAVY)', 'true', '/api/assets/catalog-icons/icon-e646c084-7b26-4ab4-9d12-9abf57ff8595.png', '2026-04-09 06:11:18.989', '2026-04-09 06:13:05.705'),
	('eb8e49c9-0dcf-4909-bfbe-0dd5b27376a6', 'LONG DRESS', 'true', '/api/assets/catalog-icons/icon-eb8e49c9-0dcf-4909-bfbe-0dd5b27376a6.png', '2026-04-09 06:39:53.93', '2026-04-09 06:42:39.919'),
	('ee7d2be1-565d-487d-a643-44b604a0447c', 'KURTA (DESIGNER)', 'true', '/api/assets/catalog-icons/icon-ee7d2be1-565d-487d-a643-44b604a0447c.png', '2026-04-09 05:52:49.66', '2026-04-09 05:59:09.494'),
	('f3ce86f0-2300-4d2e-aba2-6385930b8859', 'SPORTS JACKET', 'true', NULL, '2026-04-09 07:29:29.304', '2026-04-09 07:31:14.372');

-- Dumping structure for table public.LaundryItemBranch
CREATE TABLE IF NOT EXISTS "LaundryItemBranch" (
	"id" TEXT NOT NULL,
	"itemId" TEXT NOT NULL,
	"branchId" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE ("itemId", "branchId"),
	CONSTRAINT "LaundryItemBranch_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "LaundryItemBranch_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "LaundryItem" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "LaundryItemBranch_branchId_idx" ON "LaundryItemBranch" ("branchId");
CREATE INDEX "LaundryItemBranch_itemId_idx" ON "LaundryItemBranch" ("itemId");

-- Dumping data for table public.LaundryItemBranch: -1 rows

-- Dumping structure for table public.LaundryItemPrice
CREATE TABLE IF NOT EXISTS "LaundryItemPrice" (
	"id" TEXT NOT NULL,
	"itemId" TEXT NOT NULL,
	"serviceType" UNKNOWN NOT NULL,
	"unitPricePaise" INTEGER NOT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("itemId", "serviceType"),
	CONSTRAINT "LaundryItemPrice_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "LaundryItem" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "LaundryItemPrice_itemId_idx" ON "LaundryItemPrice" ("itemId");

-- Dumping data for table public.LaundryItemPrice: 15 rows
INSERT INTO "LaundryItemPrice" ("id", "itemId", "serviceType", "unitPricePaise", "active", "createdAt", "updatedAt") VALUES
	('044b9838-76db-4801-9709-247513c11461', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', 'DRY_CLEAN', 9000, 'true', '2026-04-09 07:24:30.475', '2026-04-09 07:24:30.475'),
	('0cb7ed08-4df4-4b34-8493-adf598b9a27c', '469f83c9-fae3-4821-9887-da37456b23d7', 'DRY_CLEAN', 35000, 'true', '2026-04-09 07:45:16.718', '2026-04-09 07:45:16.718'),
	('166a6034-b73f-476d-938a-70a35d8839e4', 'cd7c533d-0998-4048-a585-b5196d639ba7', 'STEAM_IRON', 2000, 'true', '2026-04-09 07:09:46.231', '2026-04-09 07:09:46.231'),
	('1a89078c-712d-4235-9150-20578a721b67', '8bc04e8b-0e80-45a6-9b68-9869b907d6cf', 'DRY_CLEAN', 60000, 'true', '2026-04-09 06:08:59.572', '2026-04-09 06:10:50.181'),
	('1b5f61bf-8bae-45a4-b381-f818eaed2413', '684ee0e2-b2bd-46b6-8940-39a95b95728c', 'STEAM_IRON', 6000, 'true', '2026-04-09 07:44:33.502', '2026-04-09 07:44:33.502'),
	('20294eef-bb45-47d7-a260-1506cfae66c5', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', 'STEAM_IRON', 4000, 'true', '2026-04-09 07:31:14.391', '2026-04-09 07:31:14.391'),
	('20df9aa9-3acf-404a-b3f4-a6225eb1b3d5', '71640e6e-a8ec-48a7-a1b3-908053f44c35', 'STEAM_IRON', 2000, 'true', '2026-04-09 07:27:05.12', '2026-04-09 07:27:05.12'),
	('26574bc8-4de7-41c6-9480-fd6275127320', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', 'DRY_CLEAN', 10000, 'true', '2026-03-18 07:10:17.728', '2026-04-09 07:31:27.994'),
	('2c000988-3e41-40e4-bca7-c00b8a6440de', '684ee0e2-b2bd-46b6-8940-39a95b95728c', 'DRY_CLEAN', 30000, 'true', '2026-04-09 07:44:33.507', '2026-04-09 07:44:33.507'),
	('35cdd52e-8f48-4ec7-ade2-23e236787218', '849d0cb2-6fff-4eb5-9a07-4435488e98a4', 'STEAM_IRON', 9500, 'true', '2026-04-09 07:48:30.846', '2026-04-09 07:48:30.846'),
	('3a189aca-df0c-404f-955b-511853311d12', '6b124486-4f2c-49ba-9bda-e3156dccf33a', 'STEAM_IRON', 2500, 'true', '2026-04-09 07:43:06.426', '2026-04-09 07:43:06.426'),
	('3f246cad-dea6-4e83-b947-7e6c32288a0d', '71640e6e-a8ec-48a7-a1b3-908053f44c35', 'DRY_CLEAN', 9000, 'true', '2026-04-09 07:27:05.125', '2026-04-09 07:27:05.125'),
	('461da922-6cac-4a5e-831f-8ace76a0b9d5', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', 'WASH_IRON', 1200, 'true', '2026-03-18 07:10:17.443', '2026-04-04 12:21:09.557'),
	('56fe10b8-8386-4588-b0b5-6b87f1bc8fa4', '469f83c9-fae3-4821-9887-da37456b23d7', 'STEAM_IRON', 6000, 'true', '2026-04-09 07:45:16.715', '2026-04-09 07:45:16.715'),
	('596be7b9-8d9e-404e-9f15-350a012bd518', 'cd7c533d-0998-4048-a585-b5196d639ba7', 'DRY_CLEAN', 7900, 'true', '2026-04-09 07:09:46.234', '2026-04-09 07:09:46.234'),
	('5e638619-9977-4ab7-b026-2e414ce54363', 'ee7d2be1-565d-487d-a643-44b604a0447c', 'STEAM_IRON', 3000, 'true', '2026-04-09 05:53:36.437', '2026-04-09 05:59:09.503'),
	('66748416-456e-4a07-ba1a-fdb4d4c39eaa', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', 'WASH_FOLD', 800, 'true', '2026-03-18 07:10:17.147', '2026-04-04 12:21:09.555'),
	('745615fa-2184-4dec-b4ca-f7c43c8566d8', '0375e4df-fe3d-46c1-8099-dda085982901', 'STEAM_IRON', 3000, 'true', '2026-04-09 06:48:07.538', '2026-04-09 06:48:53.212'),
	('77f8d7c3-c10f-4666-87a2-b1ebbdd11c47', '957a84e6-32c7-4a63-8056-3e8aedecbac2', 'STEAM_IRON', 2000, 'true', '2026-04-09 05:49:13.234', '2026-04-09 05:57:07.751'),
	('78aac623-4978-4c4c-88d7-9e29360a0c3a', 'f3ce86f0-2300-4d2e-aba2-6385930b8859', 'DRY_CLEAN', 18000, 'true', '2026-04-09 07:31:14.395', '2026-04-09 07:31:14.395'),
	('80d52596-6522-45a8-be22-6201d0cf300a', '9018b132-0163-48fd-91c6-603932e41d01', 'STEAM_IRON', 6500, 'true', '2026-04-09 07:47:55.054', '2026-04-09 07:47:55.054'),
	('97722b2b-7024-4f62-8021-e7a73cf6d1d6', '957a84e6-32c7-4a63-8056-3e8aedecbac2', 'DRY_CLEAN', 9000, 'true', '2026-04-09 05:49:13.239', '2026-04-09 05:57:07.754'),
	('995e2e4b-ecb3-48c5-8807-12c83b94382e', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', 'DRY_CLEAN', 5000, 'true', '2026-03-18 07:10:17.588', '2026-04-04 12:21:21.038'),
	('a05cd373-14c8-4e7c-a557-8a10bbfe21bd', 'e646c084-7b26-4ab4-9d12-9abf57ff8595', 'DRY_CLEAN', 80000, 'true', '2026-04-09 06:12:01.528', '2026-04-09 06:13:05.722'),
	('a3eaa770-c992-49aa-9ecd-0dbf05c015f3', '8bc04e8b-0e80-45a6-9b68-9869b907d6cf', 'STEAM_IRON', 8000, 'true', '2026-04-09 06:08:59.569', '2026-04-09 06:10:50.176'),
	('a4117e62-c06f-42ee-b020-3782a57d00c9', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', 'STEAM_IRON', 1000, 'true', '2026-04-01 13:09:49.594', '2026-04-04 12:21:21.034'),
	('b3d19504-814c-41a7-9f8c-499a400aec44', '65cea1c5-d5d4-4b98-8af0-974963247e09', 'STEAM_IRON', 4500, 'true', '2026-04-09 07:46:49.51', '2026-04-09 07:46:49.51'),
	('b6518260-33ee-474e-bcbe-9ead7efbdf13', 'e646c084-7b26-4ab4-9d12-9abf57ff8595', 'STEAM_IRON', 12000, 'true', '2026-04-09 06:12:01.526', '2026-04-09 06:13:05.718'),
	('baa8229c-defb-43a9-8209-eb7121eed521', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', 'WASH_IRON', 1500, 'true', '2026-03-18 07:10:17.299', '2026-04-04 12:21:21.032'),
	('beb5ccbf-1f8e-4245-a2e2-4a3cada65822', '64512a5e-6ea1-41c0-93aa-fdc9ed5a5b9c', 'WASH_FOLD', 1000, 'true', '2026-03-18 07:10:17', '2026-04-04 12:21:21.029'),
	('c56093a2-99c4-477f-842d-139ac40dac5f', 'bac24a94-28bd-47e7-915a-6177e08ccff1', 'STEAM_IRON', 2000, 'true', '2026-04-09 06:46:20.259', '2026-04-09 06:46:20.259'),
	('c601261d-2c4c-4e77-b3a1-df9f60470d0c', '6b124486-4f2c-49ba-9bda-e3156dccf33a', 'DRY_CLEAN', 11000, 'true', '2026-04-09 07:43:06.429', '2026-04-09 07:43:06.429'),
	('c76d9fe9-e832-4fd6-a07f-f9aba1e03a95', '7f63d2f9-dca0-4b8b-bdc4-220982b123f0', 'STEAM_IRON', 2500, 'true', '2026-04-09 07:28:48.51', '2026-04-09 07:31:27.989'),
	('c8ceb910-1e62-4f96-a810-183b4be7e6a9', 'ee7d2be1-565d-487d-a643-44b604a0447c', 'DRY_CLEAN', 15000, 'true', '2026-04-09 05:53:36.44', '2026-04-09 05:59:09.505'),
	('d42c0600-ed77-46bd-b495-f6a566fce078', 'b99eaddf-65d8-4c9a-9a56-48b4cccee185', 'STEAM_IRON', 2000, 'true', '2026-04-09 07:04:48.333', '2026-04-09 07:06:09.123'),
	('d43c6457-aed4-4df1-a0ec-82b5af806156', '60209ff0-a069-4ca7-855a-beaa92570b03', 'STEAM_IRON', 3000, 'true', '2026-04-09 06:49:35.385', '2026-04-09 06:50:20.875'),
	('e2992b6b-89aa-4b2d-8663-50164868dcd7', '7f1fc6a5-a754-46b8-be43-0eba29ebcba2', 'SHOES', 19900, 'true', '2026-04-09 07:38:12.5', '2026-04-09 07:38:12.5'),
	('e44ae828-747c-46b8-b8e6-89a7c3fab954', '64db57d6-1c4a-4e9a-96eb-5c71bc32eeb0', 'STEAM_IRON', 2000, 'true', '2026-04-09 07:24:30.472', '2026-04-09 07:24:30.472'),
	('f1239bc7-dea2-4e6d-8c99-165db121fdab', '0375e4df-fe3d-46c1-8099-dda085982901', 'DRY_CLEAN', 15000, 'true', '2026-04-09 06:48:07.543', '2026-04-09 06:48:53.215'),
	('f7749b4c-ccaa-49cd-bea5-cbddd97969bf', '60209ff0-a069-4ca7-855a-beaa92570b03', 'DRY_CLEAN', 25000, 'true', '2026-04-09 06:49:35.387', '2026-04-09 06:50:20.878');

-- Dumping structure for table public.OperatingHours
CREATE TABLE IF NOT EXISTS "OperatingHours" (
	"id" TEXT NOT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"startTime" TEXT NOT NULL,
	"endTime" TEXT NOT NULL,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("branchId")
);

-- Dumping data for table public.OperatingHours: -1 rows
INSERT INTO "OperatingHours" ("id", "branchId", "startTime", "endTime", "updatedAt") VALUES
	('30191c3b-adad-4cae-a996-8cd75cfb5e46', 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', '09:00', '18:00', '2026-03-18 13:22:39.05'),
	('446ee16e-0eda-4ce2-9444-f7c2d18c702c', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', '9:00', '22:00', '2026-03-30 16:41:07.326');

-- Dumping structure for table public.Order
CREATE TABLE IF NOT EXISTS "Order" (
	"id" TEXT NOT NULL,
	"userId" TEXT NOT NULL,
	"orderType" TEXT NOT NULL DEFAULT 'INDIVIDUAL',
	"orderSource" TEXT NULL DEFAULT NULL,
	"serviceType" TEXT NOT NULL,
	"serviceTypes" TEXT NULL DEFAULT ARRAY[]::"ServiceType"[],
	"addressId" TEXT NOT NULL,
	"addressLabel" TEXT NULL DEFAULT NULL,
	"addressLine" TEXT NULL DEFAULT NULL,
	"pincode" TEXT NOT NULL,
	"pickupDate" TIMESTAMP NOT NULL,
	"timeWindow" TEXT NOT NULL,
	"estimatedWeightKg" NUMERIC(10,2) NULL DEFAULT NULL,
	"actualWeightKg" NUMERIC(10,2) NULL DEFAULT NULL,
	"status" TEXT NOT NULL,
	"cancellationReason" TEXT NULL DEFAULT NULL,
	"cancelledAt" TIMESTAMP NULL DEFAULT NULL,
	"subscriptionId" TEXT NULL DEFAULT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"paymentStatus" TEXT NOT NULL DEFAULT 'PENDING',
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	"confirmedAt" TIMESTAMP NULL DEFAULT NULL,
	"pickedUpAt" TIMESTAMP NULL DEFAULT NULL,
	"inProgressAt" TIMESTAMP NULL DEFAULT NULL,
	"readyAt" TIMESTAMP NULL DEFAULT NULL,
	"outForDeliveryAt" TIMESTAMP NULL DEFAULT NULL,
	"deliveredAt" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "Order_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address" ("id") ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT "Order_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "Order_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE INDEX "Order_userId_createdAt_idx" ON "Order" ("userId", "createdAt");
CREATE INDEX "Order_status_pickupDate_idx" ON "Order" ("status", "pickupDate");
CREATE INDEX "Order_pincode_pickupDate_idx" ON "Order" ("pincode", "pickupDate");
CREATE INDEX "Order_branchId_idx" ON "Order" ("branchId");
CREATE INDEX "Order_orderSource_idx" ON "Order" ("orderSource");

-- Dumping data for table public.Order: 45 rows
INSERT INTO "Order" ("id", "userId", "orderType", "orderSource", "serviceType", "serviceTypes", "addressId", "addressLabel", "addressLine", "pincode", "pickupDate", "timeWindow", "estimatedWeightKg", "actualWeightKg", "status", "cancellationReason", "cancelledAt", "subscriptionId", "branchId", "paymentStatus", "createdAt", "updatedAt", "confirmedAt", "pickedUpAt", "inProgressAt", "readyAt", "outForDeliveryAt", "deliveredAt") VALUES
	('7f841148-de2d-4570-a2cc-e452994301f8', '131950a3-84c5-4c0a-87bc-ed776885b0fe', 'INDIVIDUAL', NULL, 'WASH_FOLD', '{}', '9ca7cafb-4bcf-4a47-a7ca-c42b63201885', NULL, NULL, '500081', '2026-03-16 00:00:00', '10:00-12:00', 5.00, 5.00, 'DELIVERED', NULL, NULL, NULL, NULL, 'CAPTURED', '2026-03-18 07:10:21.616', '2026-03-18 07:10:21.616', NULL, NULL, NULL, NULL, NULL, NULL),
	('KPH300320260001WI', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '5d7bb8f6-e1be-4f4f-8884-c07f21ac4bf6', NULL, NULL, '500001', '2026-03-30 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-03-30 16:53:54.315', '2026-03-30 17:03:21.049', NULL, '2026-03-30 17:00:00.455', '2026-03-30 17:01:46.338', '2026-03-30 17:01:54.535', '2026-03-30 17:01:56.582', '2026-03-30 17:02:25.703'),
	('KPH300320260002ON', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,WASH_IRON}', '656a4aad-8c70-4a18-918e-a71d82499d07', 'Home', '233421, Nagole, Hyderabad', '500001', '2026-04-01 00:00:00', '15:00-17:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-03-30 17:55:54.082', '2026-03-30 18:01:57.282', NULL, '2026-03-30 17:58:57.951', '2026-03-30 18:00:00.294', '2026-03-30 18:00:14.974', '2026-03-30 18:00:30.067', '2026-03-30 18:01:47.169'),
	('KPH310320260001WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'e20bc998-e2e6-49f2-a5e2-3636252b399a', NULL, NULL, '500001', '2026-03-31 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-03-31 03:12:09.49', '2026-03-31 03:19:50.35', NULL, '2026-03-31 03:15:14.881', '2026-03-31 03:19:11.878', '2026-03-31 03:19:14.715', '2026-03-31 03:19:16.523', '2026-03-31 03:19:42.085'),
	('KPH310320260002WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'ec0adbab-a324-4cc3-a5e3-01dbd75ff526', NULL, NULL, '500001', '2026-03-31 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-31 03:27:57.806', '2026-04-01 04:04:31.815', NULL, '2026-03-31 03:30:27.248', NULL, NULL, '2026-04-01 04:03:51.958', '2026-04-01 04:04:31.814'),
	('KPH310320260003ON', '1b035041-1269-4e2f-b5d0-02fde79e95b5', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,WASH_IRON}', 'c0442cbc-8ba6-47be-8b5b-485478909e95', 'Home', 'LAKS, nagole, DASDASF, nagole', '500001', '2026-04-01 00:00:00', '11:00-13:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-31 04:54:01.159', '2026-03-31 04:54:01.159', NULL, NULL, NULL, NULL, NULL, NULL),
	('KUK180320260001WI', '1b035041-1269-4e2f-b5d0-02fde79e95b5', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '8c787b0e-4c4f-4dd1-a231-7ba25d75757d', NULL, NULL, '000000', '2026-03-17 18:30:00', 'Walk-in', NULL, NULL, 'CANCELLED', 'Service Not Required', '2026-03-18 11:51:43.343', NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-18 11:50:51.616', '2026-03-18 11:51:43.344', NULL, NULL, NULL, NULL, NULL, NULL),
	('KUK180320260002ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-03-19 00:00:00', '13:00-15:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-03-18 14:13:57.125', '2026-03-18 14:46:18.446', NULL, '2026-03-18 14:45:10.858', '2026-03-18 14:45:21.4', '2026-03-18 14:45:22.955', '2026-03-18 14:45:24.259', '2026-03-18 14:46:06.54'),
	('KUK180320260003ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-03-21 00:00:00', '12:00-14:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-18 14:37:40.928', '2026-04-01 04:02:20.483', NULL, '2026-03-20 09:01:46.95', NULL, NULL, '2026-04-01 04:01:51.524', '2026-04-01 04:02:20.482'),
	('KUK220320260001ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-03-25 00:00:00', '14:00-16:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-22 06:33:17.564', '2026-03-22 06:33:45.645', NULL, '2026-03-22 06:33:45.644', NULL, NULL, NULL, NULL),
	('KUK240320260001ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,DRY_CLEAN}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-03-25 00:00:00', '14:00-16:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-03-24 15:23:41.81', '2026-03-24 15:23:41.81', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH010420260001ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES}', '02f9b198-04cc-4de5-9354-20a9ac85ee67', 'Pista house', '123, Nacharam, Nacharam, Ward 6 Nacharam, Greater Hyderabad Municipal Corporation East Zone, Uppal mandal, Medchal–Malkajgiri, Telangana, 500076, India, Medchal–Malkajgiri', '500001', '2026-04-02 00:00:00', '13:00-15:00', NULL, NULL, 'OUT_FOR_DELIVERY', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-01 04:49:27.099', '2026-04-01 09:52:42.359', NULL, '2026-04-01 09:52:25.685', NULL, NULL, '2026-04-01 09:52:42.358', NULL),
	('MAH010420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-02 00:00:00', '15:00-17:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-01 10:09:25.947', '2026-04-01 10:09:25.947', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH010420260003ON', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD}', '656a4aad-8c70-4a18-918e-a71d82499d07', 'Home', '233421, Nagole, Hyderabad', '500001', '2026-04-02 00:00:00', '09:00-11:00', NULL, NULL, 'OUT_FOR_DELIVERY', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-01 12:26:50.605', '2026-04-01 12:32:19.514', NULL, '2026-04-01 12:29:49.973', NULL, NULL, '2026-04-01 12:32:19.513', NULL),
	('MAH010420260004ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,SHOES,STEAM_IRON}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-02 00:00:00', '19:00-21:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-01 12:36:21.989', '2026-04-01 13:14:45.334', NULL, '2026-04-01 13:12:19.094', NULL, NULL, '2026-04-01 13:13:34.367', '2026-04-01 13:14:35.733'),
	('MAH010420260005ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'WASH_IRON', '{WASH_IRON,DRY_CLEAN}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-04-03 00:00:00', '17:00-19:00', NULL, NULL, 'CANCELLED', 'Sample order', '2026-04-04 13:38:53.675', NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-01 13:15:38.777', '2026-04-04 13:38:53.675', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH020420260001ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'DRY_CLEAN', '{DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-01 18:31:04.676', '2026-04-01 18:31:04.676', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH020420260002WI', '956d6ab1-afda-4046-acff-a77004781020', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'd7192f38-d6a1-4a6a-b3ea-e04d88b93541', NULL, NULL, '500001', '2026-04-02 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-02 08:35:29.484', '2026-04-02 08:41:05.515', NULL, '2026-04-02 08:39:18.623', NULL, NULL, '2026-04-02 08:39:34.749', '2026-04-02 08:41:05.514'),
	('MAH020420260003ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,SHOES,STEAM_IRON}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-02 00:00:00', '15:00-17:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-02 08:43:13.874', '2026-04-02 08:54:30.291', NULL, '2026-04-02 08:50:12.323', NULL, NULL, '2026-04-02 08:53:41.008', '2026-04-02 08:53:56.21'),
	('MAH020420260004WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'da1bfaac-e88c-4f25-b777-924e090af98e', NULL, NULL, '500001', '2026-04-02 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-02 08:56:56.089', '2026-04-02 08:59:48.353', NULL, '2026-04-02 08:58:13.707', NULL, NULL, '2026-04-02 08:59:03.931', '2026-04-02 08:59:48.352'),
	('MAH020420260005WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '05c40a15-a090-42d1-b548-7d1786ba3d5a', NULL, NULL, '500001', '2026-04-02 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-02 09:00:48.03', '2026-04-04 12:24:02.455', NULL, '2026-04-02 09:01:35.764', NULL, NULL, '2026-04-02 09:01:47.126', '2026-04-04 12:24:02.455'),
	('MAH020420260006WI', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '6a19379f-0c14-46b9-8067-17a75b24e04d', NULL, NULL, '500001', '2026-04-02 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-02 09:03:59.245', '2026-04-02 09:07:43.183', NULL, '2026-04-02 09:04:29.892', NULL, NULL, '2026-04-02 09:06:22.899', '2026-04-02 09:06:43.213'),
	('MAH020420260007WI', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'db676fd0-6fb1-41bc-bbd3-bc6a717d8da4', NULL, NULL, '500001', '2026-04-02 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-02 09:15:10.741', '2026-04-02 09:19:58.131', NULL, '2026-04-02 09:18:40.553', NULL, NULL, '2026-04-02 09:19:21.498', '2026-04-02 09:19:40.708'),
	('MAH030420260001WI', 'c78b1780-7325-4700-8836-4838a8c35b59', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '368a5433-e940-4f98-a9ab-0f1d7059e7cb', NULL, NULL, '500001', '2026-04-03 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-03 08:13:01.423', '2026-04-03 08:15:46.77', NULL, '2026-04-03 08:13:53.213', NULL, NULL, '2026-04-03 08:14:15.399', '2026-04-03 08:15:32.336'),
	('MAH030420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,DRY_CLEAN,SHOES,WASH_IRON,STEAM_IRON}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-04 00:00:00', '17:00-19:00', NULL, NULL, 'OUT_FOR_DELIVERY', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-03 16:21:01.973', '2026-04-04 14:08:54.823', NULL, '2026-04-04 14:08:35.458', NULL, NULL, '2026-04-04 14:08:54.823', NULL),
	('MAH040420260001WI', 'd8b2945b-48a8-4fa3-824f-a3380fb326f7', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '181e66b2-e7ff-4632-b94b-f41e2c01e3c8', NULL, NULL, '500001', '2026-04-04 00:00:00', 'Walk-in', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 09:02:50.185', '2026-04-04 09:04:21.144', NULL, '2026-04-04 09:04:21.143', NULL, NULL, NULL, NULL),
	('MAH040420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,HOME_LINEN}', 'bccdfe75-94b7-45ae-be4a-487617b7d021', 'Home', '3-13, Mahaa nagar, Mahabad', '500002', '2026-04-09 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:01:47.861', '2026-04-04 12:01:47.861', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH040420260003ON', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'ONLINE', 'WASH_IRON', '{WASH_IRON}', '9f78c8ec-e7fe-4848-b5a3-7a838c99c0b1', 'offce', '3-133, kukatpally, hyderabad', '500001', '2026-04-04 00:00:00', '19:00-21:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:15:04.939', '2026-04-06 12:02:25.97', NULL, '2026-04-06 12:02:25.969', NULL, NULL, NULL, NULL),
	('MAH040420260004ON', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,STEAM_IRON}', '9f78c8ec-e7fe-4848-b5a3-7a838c99c0b1', 'offce', '3-133, kukatpally, hyderabad', '500001', '2026-04-05 00:00:00', '11:00-13:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:16:58.816', '2026-04-04 16:14:15.176', NULL, '2026-04-04 16:14:15.175', NULL, NULL, NULL, NULL),
	('MAH040420260005ON', '8b1b013c-b1f6-4313-9a34-8c5108db1bf5', 'INDIVIDUAL', 'ONLINE', 'HOME_LINEN', '{HOME_LINEN,STEAM_IRON}', 'ba6e18e6-aea1-4565-9a24-e2aaa8e69518', 'Home', 'Tired ho u6, Goo, Tired ho u6, Goo, Miyapur, Miyapur', '500001', '2026-04-10 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:18:24.125', '2026-04-04 12:18:24.125', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH040420260006WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '6ccbcefa-4e05-4fac-ab63-f1899612b1a0', NULL, NULL, '500001', '2026-04-04 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-04 12:24:53.096', '2026-04-04 12:26:55.243', NULL, '2026-04-04 12:26:00.843', NULL, NULL, '2026-04-04 12:26:26.651', '2026-04-04 12:26:42.775'),
	('MAH040420260007WI', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '097554bc-81a8-42ef-b06f-7728fed26597', NULL, NULL, '500001', '2026-04-04 00:00:00', 'Walk-in', NULL, NULL, 'OUT_FOR_DELIVERY', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:34:47.529', '2026-04-04 15:04:34.268', NULL, '2026-04-04 14:03:02.48', NULL, NULL, '2026-04-04 15:04:34.267', NULL),
	('MAH040420260008WI', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', '4d1e9088-0230-4e16-9964-338ad9689dea', NULL, NULL, '500001', '2026-04-04 00:00:00', 'Walk-in', NULL, NULL, 'OUT_FOR_DELIVERY', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 12:47:07.286', '2026-04-04 12:48:55.924', NULL, '2026-04-04 12:47:31.572', NULL, NULL, '2026-04-04 12:48:55.923', NULL),
	('MAH040420260009ON', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD}', '656a4aad-8c70-4a18-918e-a71d82499d07', 'Home', '233421, Nagole, Hyderabad', '500001', '2026-04-09 00:00:00', '11:00-13:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 13:07:15.03', '2026-04-07 08:57:31.308', NULL, '2026-04-07 08:57:31.307', NULL, NULL, NULL, NULL),
	('MAH040420260010ON', '8b1390d5-e522-46b4-a075-36956c0095d2', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES}', '656a4aad-8c70-4a18-918e-a71d82499d07', 'Home', '233421, Nagole, Hyderabad', '500001', '2026-04-05 00:00:00', '11:00-13:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-04 13:09:57.465', '2026-04-04 15:06:12.559', NULL, '2026-04-04 15:05:44.063', NULL, NULL, '2026-04-04 15:05:56.29', '2026-04-04 15:06:12.559'),
	('MAH040420260011WI', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'f87335e8-13ce-42ff-b313-e77a5d0e9f42', NULL, NULL, '500001', '2026-04-04 00:00:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-04 13:36:33.132', '2026-04-06 10:39:25.477', NULL, '2026-04-06 10:36:45.4', NULL, NULL, '2026-04-06 10:38:30.222', '2026-04-06 10:39:07.417'),
	('MAH040420260012ON', '033bc790-69f2-49df-8bb6-5cad9faaa911', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN,SHOES,HOME_LINEN}', '8418081a-6a95-4b65-8690-4db0e6a49232', 'Sri dhatri', '222, Mallapur, Hyd', '500001', '2026-04-10 00:00:00', '09:00-11:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 14:07:38.458', '2026-04-04 14:07:38.458', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH040420260013ON', 'd26666cb-f639-4892-98ce-db3c8cb9fab2', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN}', '9354a307-585b-48b4-b0b4-dc3591732f98', 'Sri dhatri', '123, Mallapur, Hyd', '500001', '2026-04-15 00:00:00', '09:00-11:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 14:14:58.631', '2026-04-04 14:14:58.631', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH040420260014ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'DRY_CLEAN', '{DRY_CLEAN,SHOES}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-10 00:00:00', '15:00-17:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 17:37:10.735', '2026-04-04 17:37:10.735', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH040420260015ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '15:00-17:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-04 17:52:53.327', '2026-04-04 17:52:53.327', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH050420260001ON', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,SHOES,HOME_LINEN}', '9f78c8ec-e7fe-4848-b5a3-7a838c99c0b1', 'offce', '3-133, kukatpally, hyderabad', '500001', '2026-04-23 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-05 11:10:35.536', '2026-04-05 11:10:35.536', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH050420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-05 00:00:00', '17:00-19:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-05 11:15:00.032', '2026-04-05 11:15:00.032', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH050420260003ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'HOME_LINEN', '{HOME_LINEN,SHOES,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-17 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-05 12:21:43.33', '2026-04-05 12:21:43.33', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH060420260001ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,HOME_LINEN,SHOES}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-22 00:00:00', '17:00-19:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-06 04:12:06.122', '2026-04-06 04:12:06.122', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH060420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,DRY_CLEAN,SHOES}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-15 00:00:00', '17:00-19:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-06 05:54:09.402', '2026-04-06 05:54:09.402', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH060420260003ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_IRON', '{WASH_IRON,WASH_FOLD,SHOES}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-06 00:00:00', '21:00-22:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-06 10:30:48.15', '2026-04-06 10:30:48.15', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH060420260004ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'HOME_LINEN', '{HOME_LINEN,SHOES}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-04-06 00:00:00', '19:00-21:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-06 10:32:26.306', '2026-04-09 08:20:39.481', NULL, '2026-04-08 17:55:13.716', NULL, NULL, '2026-04-08 18:02:58.551', '2026-04-09 08:20:39.48'),
	('MAH060420260005ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-07 00:00:00', '13:00-15:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-06 11:29:56.374', '2026-04-06 11:29:56.374', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH070420260001WI', 'cfb1e44b-f40b-4138-9db6-572b85c1859c', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'd8362d09-7fc4-45c3-bc15-badee36a826a', NULL, NULL, '500001', '2026-04-07 00:00:00', 'Walk-in', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-07 11:01:05.662', '2026-04-07 11:01:05.662', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH070420260002ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-08 00:00:00', '11:00-13:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'CAPTURED', '2026-04-07 12:01:59.954', '2026-04-08 12:20:48.744', NULL, '2026-04-08 12:19:13.283', NULL, NULL, '2026-04-08 12:20:03.696', '2026-04-08 12:20:31.705'),
	('MAH070420260003ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN,SHOES,STEAM_IRON,HOME_LINEN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-08 00:00:00', '11:00-13:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-07 15:11:16.09', '2026-04-07 15:11:16.09', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH080420260001ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '19:00-21:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-08 10:55:50.409', '2026-04-08 10:55:50.409', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH090420260001ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '21:00-22:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-09 08:43:41.542', '2026-04-09 08:43:41.542', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH090420260002ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'HOME_LINEN', '{HOME_LINEN,SHOES}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-04-09 00:00:00', '21:00-22:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-09 11:29:45.829', '2026-04-09 11:29:45.829', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH090420260003ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,WASH_IRON}', 'cea30979-b1ae-4843-b138-96871d325036', 'Karthik Kukatpally', 'Manjeera mall, Guru Balaji Apartments, Sivaji Nagar, Guru Balaji Apartments, Sivaji Nagar, Ward 110 Chandanagar, Hyderabad, Serilingampalle mandal, Ranga Reddy, Telangana, 500050, India, Hyderabad', '500001', '2026-04-13 00:00:00', '13:00-15:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-09 11:30:22.068', '2026-04-09 11:32:00.453', NULL, '2026-04-09 11:32:00.452', NULL, NULL, NULL, NULL),
	('MAH090420260004ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'WASH_FOLD', '{WASH_FOLD,WASH_IRON,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '19:00-21:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-09 11:51:58.371', '2026-04-09 11:51:58.371', NULL, NULL, NULL, NULL, NULL, NULL),
	('MAH090420260005ON', '6cea0358-7d60-47f0-b9c3-a56aae29baf6', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,HOME_LINEN,SHOES,DRY_CLEAN}', '8c006a98-7e6d-4216-af62-7d73ac361895', 'Home', '3-200/10, Sandeep guru swamy, 3-200/10, Sandeep guru swamy, Sandeep guru swamy, Sandeep guru swamy', '500001', '2026-04-09 00:00:00', '21:00-22:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'PENDING', '2026-04-09 13:28:35.519', '2026-04-09 13:28:35.519', NULL, NULL, NULL, NULL, NULL, NULL),
	('MIY180320260001WI', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'WALK_IN', 'WASH_IRON', '{WASH_IRON}', 'c3d0595e-7c7f-4600-ac71-5be5d5cdce16', NULL, NULL, '000000', '2026-03-17 18:30:00', 'Walk-in', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'CAPTURED', '2026-03-18 12:14:42.886', '2026-03-18 12:18:23.015', NULL, '2026-03-18 12:17:36.15', '2026-03-18 12:18:08.943', '2026-03-18 12:18:10.282', '2026-03-18 12:18:11.607', '2026-03-18 12:18:19.38'),
	('MIY180320260002ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'SHOES', '{SHOES,WASH_IRON}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-19 00:00:00', '11:00-13:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'CAPTURED', '2026-03-18 13:22:50.547', '2026-03-18 13:24:23.495', NULL, '2026-03-18 13:23:34.41', '2026-03-18 13:23:56.883', '2026-03-18 13:23:58.726', '2026-03-18 13:24:04.145', '2026-03-18 13:24:19.775'),
	('MIY180320260003ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-19 00:00:00', '15:00-17:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'CAPTURED', '2026-03-18 13:30:46.057', '2026-03-18 13:34:07.375', NULL, '2026-03-18 13:31:26.135', '2026-03-18 13:32:06.282', '2026-03-18 13:32:09.263', '2026-03-18 13:32:12.652', '2026-03-18 13:32:49.784'),
	('MIY180320260004ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-19 00:00:00', '09:00-11:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'PENDING', '2026-03-18 13:52:51.891', '2026-03-18 14:41:40.163', NULL, '2026-03-18 13:53:30.054', '2026-03-18 13:53:42.736', '2026-03-18 13:53:46.923', '2026-03-18 13:54:45.325', '2026-03-18 14:41:40.162'),
	('MIY180320260005ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,DRY_CLEAN}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-19 00:00:00', '15:00-17:00', NULL, NULL, 'DELIVERED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'CAPTURED', '2026-03-18 14:02:05.828', '2026-03-18 19:14:44.927', NULL, '2026-03-18 14:03:28.277', '2026-03-18 14:03:36.909', '2026-03-18 14:03:41.647', '2026-03-18 14:03:44.224', '2026-03-18 19:14:37.74'),
	('MIY180320260006ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'WASH_IRON', '{WASH_IRON}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-21 00:00:00', '17:00-18:00', NULL, NULL, 'BOOKING_CONFIRMED', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'PENDING', '2026-03-18 14:36:32.458', '2026-03-18 14:36:32.458', NULL, NULL, NULL, NULL, NULL, NULL),
	('MIY220320260001ON', '766d4a54-385c-4860-a772-2bf135ffe6b0', 'INDIVIDUAL', 'ONLINE', 'STEAM_IRON', '{STEAM_IRON,SHOES}', '1633aa51-cacc-4dde-b906-7140294a8202', 'Karthik home', '12453, Ranga Reddy, Gandipet mandal, Ranga Reddy, Telangana, 500086, India, Ranga Reddy', '500093', '2026-03-23 00:00:00', '11:00-13:00', NULL, NULL, 'PICKED_UP', NULL, NULL, NULL, 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'PENDING', '2026-03-22 09:11:44.84', '2026-03-30 17:06:25.04', NULL, '2026-03-30 17:06:25.039', NULL, NULL, NULL, NULL);

-- Dumping structure for table public.OrderItem
CREATE TABLE IF NOT EXISTS "OrderItem" (
	"id" TEXT NOT NULL,
	"orderId" TEXT NOT NULL,
	"laundryItemId" TEXT NULL DEFAULT NULL,
	"serviceType" UNKNOWN NOT NULL,
	"quantity" NUMERIC(10,2) NOT NULL,
	"estimatedWeightKg" NUMERIC(10,2) NULL DEFAULT NULL,
	"actualWeightKg" NUMERIC(10,2) NULL DEFAULT NULL,
	"unitPricePaise" INTEGER NULL DEFAULT NULL,
	"amountPaise" INTEGER NULL DEFAULT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "OrderItem_laundryItemId_fkey" FOREIGN KEY ("laundryItemId") REFERENCES "LaundryItem" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "OrderItem_orderId_idx" ON "OrderItem" ("orderId");

-- Dumping data for table public.OrderItem: -1 rows

-- Dumping structure for table public.Payment
CREATE TABLE IF NOT EXISTS "Payment" (
	"id" TEXT NOT NULL,
	"orderId" TEXT NULL DEFAULT NULL,
	"subscriptionId" TEXT NULL DEFAULT NULL,
	"provider" UNKNOWN NOT NULL,
	"status" UNKNOWN NOT NULL,
	"amount" INTEGER NOT NULL,
	"providerPaymentId" TEXT NULL DEFAULT NULL,
	"providerOrderId" TEXT NULL DEFAULT NULL,
	"failureReason" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("orderId"),
	UNIQUE ("subscriptionId"),
	CONSTRAINT "Payment_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "Payment_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Dumping data for table public.Payment: -1 rows
INSERT INTO "Payment" ("id", "orderId", "subscriptionId", "provider", "status", "amount", "providerPaymentId", "providerOrderId", "failureReason", "createdAt", "updatedAt") VALUES
	('08a12d18-bfe2-49d3-b5ac-f9e5bf2c6004', 'MAH040420260006WI', NULL, 'UPI', 'CAPTURED', 2500, NULL, NULL, NULL, '2026-04-04 12:26:55.242', '2026-04-04 12:26:55.242'),
	('09ebf7b0-738c-4be0-8089-455a8a535586', 'MAH070420260002ON', NULL, 'CASH', 'CAPTURED', 20800, NULL, NULL, '208', '2026-04-08 12:20:48.742', '2026-04-08 12:20:48.742'),
	('0c57cb21-6a67-4815-84fc-483db5441a6f', 'MAH030420260001WI', NULL, 'UPI', 'CAPTURED', 12000, NULL, NULL, NULL, '2026-04-03 08:15:46.769', '2026-04-03 08:15:46.769'),
	('18835133-d376-47a2-9a3e-47299ab96318', 'MAH020420260006WI', NULL, 'CASH', 'CAPTURED', 1500, NULL, NULL, NULL, '2026-04-02 09:07:43.181', '2026-04-02 09:07:43.181'),
	('195467b0-6ae9-4081-820e-8610ff2d9e4f', 'KPH310320260001WI', NULL, 'UPI', 'CAPTURED', 5320, NULL, NULL, NULL, '2026-03-31 03:19:50.348', '2026-03-31 03:19:50.348'),
	('2f5532ba-9835-48a1-ab58-6206be1e32ab', 'MAH010420260004ON', NULL, 'UPI', 'CAPTURED', 22900, NULL, NULL, '1246585', '2026-04-01 13:14:45.332', '2026-04-01 13:14:45.332'),
	('5fc3faf0-b8ac-46eb-bfc4-e9daedb2c4bd', 'MAH040420260011WI', NULL, 'CASH', 'CAPTURED', 7500, NULL, NULL, NULL, '2026-04-06 10:39:25.476', '2026-04-06 10:39:25.476'),
	('69e5d773-b899-4afe-983b-4d0c04cbb2a0', 'MIY180320260003ON', NULL, 'CASH', 'CAPTURED', 1000, NULL, NULL, NULL, '2026-03-18 13:34:07.267', '2026-03-18 13:34:07.267'),
	('71cbed56-4358-4ee0-9f79-ac6b403d1fe6', 'MIY180320260002ON', NULL, 'UPI', 'CAPTURED', 4400, NULL, NULL, NULL, '2026-03-18 13:24:23.424', '2026-03-18 13:24:23.424'),
	('9207c366-43b9-4534-b30b-b1a47f2d678b', '7f841148-de2d-4570-a2cc-e452994301f8', NULL, 'CASH', 'CAPTURED', 14000, NULL, NULL, NULL, '2026-03-18 07:10:21.753', '2026-03-18 07:10:21.753'),
	('9e83c70e-1106-431d-8ae5-d11185542a37', 'MAH060420260004ON', NULL, 'CASH', 'CAPTURED', 53100, NULL, NULL, NULL, '2026-04-09 08:20:39.475', '2026-04-09 08:20:39.475'),
	('b4217a44-5c6c-412f-898c-1b24a85d2cf1', 'MIY180320260001WI', NULL, 'UPI', 'CAPTURED', 7925, NULL, NULL, NULL, '2026-03-18 12:18:22.975', '2026-03-18 12:18:22.975'),
	('b4e9c2cc-f0f3-4c56-8a01-270e19749699', 'MAH020420260003ON', NULL, 'CASH', 'CAPTURED', 9100, NULL, NULL, NULL, '2026-04-02 08:54:30.29', '2026-04-02 08:54:30.29'),
	('b72b0039-159e-489f-ae1c-2f048a016c79', 'KPH300320260001WI', NULL, 'CASH', 'CAPTURED', 5400, NULL, NULL, NULL, '2026-03-30 17:03:21.047', '2026-03-30 17:03:21.047'),
	('d59f503c-5696-4f1d-a7a8-daf3f043e8d6', 'MAH040420260010ON', NULL, 'CASH', 'CAPTURED', 1200, NULL, NULL, NULL, '2026-04-04 15:06:12.551', '2026-04-04 15:06:12.551'),
	('d82ddcf8-4186-474c-b953-abde369252de', 'MAH020420260007WI', NULL, 'CARD', 'CAPTURED', 3000, NULL, NULL, '1234', '2026-04-02 09:19:58.129', '2026-04-02 09:19:58.129'),
	('e03698bd-6207-4a49-958e-1e3e2e5c9299', 'MIY180320260005ON', NULL, 'UPI', 'CAPTURED', 4040, NULL, NULL, '854', '2026-03-18 19:14:44.86', '2026-03-18 19:14:44.86'),
	('fcd799fb-e93d-4f30-9163-de14c302fa6f', 'KPH300320260002ON', NULL, 'UPI', 'CAPTURED', 4000, NULL, NULL, '7548961562', '2026-03-30 18:01:57.28', '2026-03-30 18:01:57.28'),
	('fe2f56ab-4666-4b18-8d25-56b81ad13f86', 'KUK180320260002ON', NULL, 'UPI', 'CAPTURED', 7000, NULL, NULL, '9405969', '2026-03-18 14:46:18.401', '2026-03-18 14:46:18.401');

-- Dumping structure for table public.SegmentCategory
CREATE TABLE IF NOT EXISTS "SegmentCategory" (
	"id" TEXT NOT NULL,
	"code" TEXT NOT NULL,
	"label" TEXT NOT NULL,
	"isActive" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE ("code")
);

-- Dumping data for table public.SegmentCategory: -1 rows
INSERT INTO "SegmentCategory" ("id", "code", "label", "isActive", "createdAt") VALUES
	('0def0e23-b76e-4d6f-afde-26c56211f1eb', 'STAIN_REMOVAL', 'STAIN REMOVAL', 'true', '2026-04-09 05:50:39.678'),
	('1c60493a-da3e-482a-9825-fcf19a956c6a', 'MEN', 'MEN', 'true', '2026-03-18 07:10:17.875'),
	('3186e444-4129-4882-bc51-82645c0cab9e', 'WASH_AND_IRON', 'WASH AND IRON', 'true', '2026-03-31 17:13:25.296'),
	('425dbde3-47e9-4802-89d3-92c4232bcd2b', 'HOME_LINEN', 'HOME LINEN', 'true', '2026-03-18 07:10:18.3'),
	('638a56bd-4a42-4503-a454-71b5db3da0e8', 'KIDS', 'KIDS', 'true', '2026-03-18 07:10:18.16'),
	('6e9dee74-21f3-4c97-bdfd-b3052323ed50', 'WOMEN', 'WOMEN', 'true', '2026-03-18 07:10:18.016'),
	('6fa34ba2-76f4-41ae-952d-045f4abbff6a', 'WASH_AND_FOLD', 'WASH AND FOLD', 'true', '2026-03-31 17:07:32.636'),
	('9787fd18-9c79-443f-9d03-2124706791ce', 'CONDITIONER', 'CONDITIONER', 'true', '2026-04-09 05:50:10.377'),
	('9bd2306c-3afd-450e-a43f-38d53098d9fe', 'PER_PIECE', 'PER PIECE', 'true', '2026-04-09 07:41:32.539'),
	('adc7be55-788a-4843-a763-9f443b099d55', 'PER_KG', 'PER KG', 'true', '2026-04-08 12:05:43.246'),
	('e9f69332-0217-48da-aa08-2c5e11301df2', 'STARCH', 'STARCH', 'true', '2026-04-09 05:50:24.432');

-- Dumping structure for table public.ServiceArea
CREATE TABLE IF NOT EXISTS "ServiceArea" (
	"id" TEXT NOT NULL,
	"pincode" TEXT NOT NULL,
	"branchId" TEXT NOT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("pincode"),
	CONSTRAINT "ServiceArea_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "ServiceArea_branchId_idx" ON "ServiceArea" ("branchId");

-- Dumping data for table public.ServiceArea: -1 rows
INSERT INTO "ServiceArea" ("id", "pincode", "branchId", "active", "createdAt", "updatedAt") VALUES
	('845311dc-82f7-416f-8670-0430c71f9366', '500002', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'true', '2026-04-01 01:20:25.11', '2026-04-01 01:20:25.11'),
	('af74ef01-bb3d-4ee7-a2e8-8e92a073a9b1', '500030', 'e5dd3263-8b3f-47fe-8dfb-3d2091e685ec', 'true', '2026-04-01 01:19:19.631', '2026-04-01 01:19:19.631'),
	('c18688e3-3c07-4e57-ae4e-a3ceefcf4841', '500001', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', 'true', '2026-03-18 13:20:54.525', '2026-04-01 01:20:24.794');

-- Dumping structure for table public.ServiceCategory
CREATE TABLE IF NOT EXISTS "ServiceCategory" (
	"id" TEXT NOT NULL,
	"code" TEXT NOT NULL,
	"label" TEXT NOT NULL,
	"isActive" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE ("code")
);

-- Dumping data for table public.ServiceCategory: -1 rows
INSERT INTO "ServiceCategory" ("id", "code", "label", "isActive", "createdAt") VALUES
	('31c46e53-2011-4c7f-8d3e-c5345bba3dcc', 'SHOES', 'SHOES CLEANING', 'true', '2026-03-18 07:10:19.152'),
	('66b207f7-d5d7-4523-b1ec-166f5cb341c4', 'FREE', 'FREE', 'true', '2026-04-09 05:50:12.181'),
	('705631e6-3f65-4576-9244-e2377cf0aef2', 'ADD_ONS', 'Add ons', 'true', '2026-03-18 07:10:19.295'),
	('9e1ee360-277f-4474-a0ec-29cd6943aefb', 'STEAM_IRON', 'STEAM IRON', 'true', '2026-03-18 07:10:18.732'),
	('a5a920cc-06f9-42db-baa2-b79c5624a921', 'WASH_IRON', 'WASH & IRON', 'true', '2026-03-18 07:10:18.588'),
	('c1bfb44b-2eb1-462a-9f7c-00c46708cd27', 'DRY_CLEAN', 'DRY CLEAN', 'true', '2026-03-18 07:10:18.871'),
	('de05b014-87c6-4e7d-ab71-5c8dc4d62eb9', 'WASH', 'WASH', 'true', '2026-04-09 07:40:12.799'),
	('e3c4292d-b0fc-44d2-84c8-76e80114f5cd', 'WASH_FOLD', 'WASH & FOLD', 'true', '2026-03-18 07:10:18.445');

-- Dumping structure for table public.ServicePriceConfig
CREATE TABLE IF NOT EXISTS "ServicePriceConfig" (
	"id" TEXT NOT NULL,
	"serviceType" TEXT NOT NULL,
	"pricingMode" TEXT NOT NULL,
	"pricePerKg" INTEGER NOT NULL,
	"minimumKg" NUMERIC(10,2) NOT NULL DEFAULT 3,
	"pickupFee" INTEGER NULL DEFAULT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE ("serviceType")
);

-- Dumping data for table public.ServicePriceConfig: -1 rows
INSERT INTO "ServicePriceConfig" ("id", "serviceType", "pricingMode", "pricePerKg", "minimumKg", "pickupFee", "active", "createdAt", "updatedAt") VALUES
	('7d3e2bc9-21fa-4c85-8554-cbc0b679858a', 'WASH_FOLD', 'PER_KG', 1000, 3.00, 0, 'true', '2026-03-18 07:10:15.55', '2026-03-18 07:10:15.55'),
	('e6ee8e05-2668-470c-b48c-1237799152a6', 'WASH_IRON', 'PER_KG', 1500, 3.00, 0, 'true', '2026-03-18 07:10:15.696', '2026-03-18 07:10:15.696');

-- Dumping structure for table public.SlotConfig
CREATE TABLE IF NOT EXISTS "SlotConfig" (
	"id" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"timeWindow" TEXT NOT NULL,
	"pincode" TEXT NULL DEFAULT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"capacity" INTEGER NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	PRIMARY KEY ("id")
);
CREATE INDEX "SlotConfig_date_timeWindow_pincode_idx" ON "SlotConfig" ("date", "timeWindow", "pincode");
CREATE INDEX "SlotConfig_branchId_idx" ON "SlotConfig" ("branchId");

-- Dumping data for table public.SlotConfig: -1 rows
INSERT INTO "SlotConfig" ("id", "date", "timeWindow", "pincode", "branchId", "capacity", "createdAt", "updatedAt") VALUES
	('052d67b2-84bc-4999-9ab6-d53e05090350', '2026-04-04', '17:00-19:00', '500001', NULL, 100, '2026-04-03 16:21:01.966', '2026-04-03 16:21:01.966'),
	('0a0531ad-63e5-4e1e-8422-2c1885e42c5e', '2026-04-01', '15:00-17:00', '500001', NULL, 100, '2026-03-30 17:55:53.727', '2026-03-30 17:55:53.727'),
	('0e791cd4-e28f-4e8e-90e6-3b9afd05a732', '2026-04-17', '13:00-15:00', '500001', NULL, 100, '2026-04-05 12:21:43.324', '2026-04-05 12:21:43.324'),
	('108774df-56ad-4dbd-8842-79cdc898649e', '2026-04-23', '13:00-15:00', '500001', NULL, 100, '2026-04-05 11:10:35.528', '2026-04-05 11:10:35.528'),
	('14920132-f0a0-4720-9af4-982ab45ab819', '2026-03-19', '13:00-15:00', '500001', NULL, 100, '2026-03-18 14:13:56.797', '2026-03-18 14:13:56.797'),
	('17a3f6e3-a01a-451e-8802-6ef77090f9a3', '2026-04-07', '13:00-15:00', '500001', NULL, 100, '2026-04-06 11:29:56.367', '2026-04-06 11:29:56.367'),
	('201f9034-a4d9-465d-a3f9-4e45f2a7c068', '2026-03-19', '15:00-17:00', '500093', NULL, 100, '2026-03-18 13:30:45.3', '2026-03-18 13:30:45.3'),
	('28140a37-fd83-4ca5-a754-c432be80b3d2', '2026-04-04', '19:00-21:00', '500001', NULL, 100, '2026-04-04 12:15:04.93', '2026-04-04 12:15:04.93'),
	('3d6d1e92-f701-435c-a23e-aa24a9a3dd20', '2026-04-15', '09:00-11:00', '500001', NULL, 100, '2026-04-04 14:14:58.624', '2026-04-04 14:14:58.624'),
	('3e157e4d-7b93-46e1-9248-5ff94550bfdd', '2026-04-02', '19:00-21:00', '500001', NULL, 100, '2026-04-01 12:36:21.982', '2026-04-01 12:36:21.982'),
	('4d3ff889-4f53-42a5-9eea-55c2d1aeac66', '2026-04-06', '21:00-22:00', '500001', NULL, 100, '2026-04-06 10:30:48.138', '2026-04-06 10:30:48.138'),
	('5668944c-e126-4e1f-b4f0-4843904d0f9b', '2026-03-18', '14:00-16:00', '500081', NULL, 10, '2026-03-18 07:10:15.101', '2026-03-18 07:10:15.101'),
	('58f66991-506e-421a-a883-7625e363737d', '2026-04-09', '19:00-21:00', '500001', NULL, 100, '2026-04-08 10:55:50.403', '2026-04-08 10:55:50.403'),
	('5ac12d17-ddcc-4101-8e62-f5baaa97e9c4', '2026-03-21', '17:00-18:00', '500093', NULL, 100, '2026-03-18 14:36:32.127', '2026-03-18 14:36:32.127'),
	('5d42bf88-3ec0-4524-a9df-709a3e65ff9e', '2026-04-02', '13:00-15:00', '500001', NULL, 100, '2026-04-01 04:49:26.689', '2026-04-01 04:49:26.689'),
	('6366e23b-9daa-49f1-ab71-afa2f672d2e6', '2026-03-23', '11:00-13:00', '500093', NULL, 100, '2026-03-22 09:11:44.834', '2026-03-22 09:11:44.834'),
	('66c2fe46-6da3-4b19-a9ad-7fd35b345ab4', '2026-04-15', '17:00-19:00', '500001', NULL, 100, '2026-04-06 05:54:09.395', '2026-04-06 05:54:09.395'),
	('7ba7f04b-9aca-4efa-b00a-9b3939e75dfa', '2026-04-10', '15:00-17:00', '500001', NULL, 100, '2026-04-04 17:37:10.727', '2026-04-04 17:37:10.727'),
	('7d02524a-e01c-4e3d-be77-7ff98a59696f', '2026-04-09', '11:00-13:00', '500001', NULL, 100, '2026-04-04 13:07:15.014', '2026-04-04 13:07:15.014'),
	('8afcec78-11e6-49b1-9ec6-1bb8fe64aa00', '2026-04-06', '19:00-21:00', '500001', NULL, 100, '2026-04-06 10:32:26.282', '2026-04-06 10:32:26.282'),
	('8f1e184d-56dc-4da9-b226-23fbf301c4c0', '2026-04-09', '13:00-15:00', '500001', NULL, 100, '2026-04-01 18:31:04.671', '2026-04-01 18:31:04.671'),
	('8f97f21d-42c9-445c-a85c-32f4395a65b4', '2026-03-19', '11:00-13:00', '500093', NULL, 100, '2026-03-18 13:22:50.255', '2026-03-18 13:22:50.255'),
	('9225c566-e9db-4030-b4d9-cd6aa290e1e8', '2026-04-09', '15:00-17:00', '500001', NULL, 100, '2026-04-04 17:52:53.32', '2026-04-04 17:52:53.32'),
	('97929ef1-8f5d-47d4-b1c5-1f1b2b0b26c0', '2026-04-05', '17:00-19:00', '500001', NULL, 100, '2026-04-05 11:15:00.026', '2026-04-05 11:15:00.026'),
	('980834f2-3359-43e5-98e6-231ad97dbdf4', '2026-03-19', '09:00-11:00', '500093', NULL, 100, '2026-03-18 13:52:51.151', '2026-03-18 13:52:51.151'),
	('a4ca76b0-d64a-4e41-8429-70e04d50f5b0', '2026-04-10', '09:00-11:00', '500001', NULL, 100, '2026-04-04 14:07:38.45', '2026-04-04 14:07:38.45'),
	('a5aa7898-5174-4717-a588-9f6a8dd4634f', '2026-03-25', '14:00-16:00', '500001', NULL, 100, '2026-03-22 06:33:17.556', '2026-03-22 06:33:17.556'),
	('ac93e392-7f14-444c-a447-5c72511bc073', '2026-04-05', '11:00-13:00', '500001', NULL, 100, '2026-04-04 12:16:58.807', '2026-04-04 12:16:58.807'),
	('b1f5aaff-886d-4e93-8a22-212118869bea', '2026-04-02', '09:00-11:00', '500001', NULL, 100, '2026-04-01 12:26:50.597', '2026-04-01 12:26:50.597'),
	('b8ad2146-b2c1-4a89-88c2-df2ff4047a65', '2026-03-18', '10:00-12:00', '500081', NULL, 10, '2026-03-18 07:10:14.796', '2026-03-18 07:10:14.796'),
	('c19bab1f-8e3c-4a1d-8102-15bed6e52a95', '2026-03-21', '12:00-14:00', '500001', NULL, 100, '2026-03-18 14:37:40.592', '2026-03-18 14:37:40.592'),
	('c30d3a4b-4876-4d35-a1dd-72fc00e424c5', '2026-03-19', '10:00-12:00', '500081', NULL, 10, '2026-03-18 07:10:15.407', '2026-03-18 07:10:15.407'),
	('c7e2d394-e5f0-44bc-ac1e-fec55d9ecd88', '2026-04-09', '21:00-22:00', '500001', NULL, 100, '2026-04-09 08:43:41.535', '2026-04-09 08:43:41.535'),
	('cb2e7241-5081-401a-89a3-96f433907180', '2026-04-02', '15:00-17:00', '500001', NULL, 100, '2026-04-01 10:09:25.94', '2026-04-01 10:09:25.94'),
	('d14a4d5f-82fa-4016-a5d6-9a6d254e18a7', '2026-04-08', '11:00-13:00', '500001', NULL, 100, '2026-04-07 12:01:59.943', '2026-04-07 12:01:59.943'),
	('d422dfc4-2e7a-4fd4-a18e-1d041d9a80ed', '2026-04-03', '17:00-19:00', '500001', NULL, 100, '2026-04-01 13:15:38.769', '2026-04-01 13:15:38.769'),
	('da380678-f391-41fe-87f7-c33c8cd9a770', '2026-04-10', '13:00-15:00', '500001', NULL, 100, '2026-04-04 12:18:24.117', '2026-04-04 12:18:24.117'),
	('df4ed8b0-d53f-4351-a609-68343c4f4daf', '2026-04-22', '17:00-19:00', '500001', NULL, 100, '2026-04-06 04:12:06.116', '2026-04-06 04:12:06.116'),
	('eed88f30-d00c-4bd1-9e9c-1228cde07154', '2026-04-01', '11:00-13:00', '500001', NULL, 100, '2026-03-31 04:54:01.154', '2026-03-31 04:54:01.154'),
	('fa135e2d-befc-4615-9f61-06a220d35af0', '2026-04-09', '13:00-15:00', '500002', NULL, 100, '2026-04-04 12:01:47.854', '2026-04-04 12:01:47.854'),
	('fdf80960-8e5b-4e4b-8f79-bad44d4917c7', '2026-04-13', '13:00-15:00', '500001', NULL, 100, '2026-04-09 11:30:22.062', '2026-04-09 11:30:22.062');

-- Dumping structure for table public.Subscription
CREATE TABLE IF NOT EXISTS "Subscription" (
	"id" TEXT NOT NULL,
	"userId" TEXT NOT NULL,
	"planId" TEXT NOT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"addressId" TEXT NULL DEFAULT NULL,
	"addressLabel" TEXT NULL DEFAULT NULL,
	"addressLine" TEXT NULL DEFAULT NULL,
	"validityStartDate" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"remainingPickups" INTEGER NOT NULL,
	"expiryDate" TIMESTAMP NOT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	"usedKg" NUMERIC(10,2) NOT NULL DEFAULT 0,
	"usedItemsCount" INTEGER NOT NULL DEFAULT 0,
	"totalMaxPickups" INTEGER NULL DEFAULT NULL,
	"totalKgLimit" NUMERIC(10,2) NULL DEFAULT NULL,
	"totalItemsLimit" INTEGER NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "Subscription_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "Subscription_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "Subscription_planId_fkey" FOREIGN KEY ("planId") REFERENCES "SubscriptionPlan" ("id") ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT "Subscription_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "Subscription_addressId_idx" ON "Subscription" ("addressId");

-- Dumping data for table public.Subscription: -1 rows
INSERT INTO "Subscription" ("id", "userId", "planId", "branchId", "addressId", "addressLabel", "addressLine", "validityStartDate", "remainingPickups", "expiryDate", "active", "createdAt", "updatedAt", "usedKg", "usedItemsCount", "totalMaxPickups", "totalKgLimit", "totalItemsLimit") VALUES
	('d857e420-eb77-41d8-80f7-af8561aeaa0b', '131950a3-84c5-4c0a-87bc-ed776885b0fe', 'plan-single-12kg-monthly', NULL, NULL, NULL, NULL, '2026-03-18 07:10:21.028', 2, '2026-04-17 12:40:20.882', 'true', '2026-03-18 07:10:21.028', '2026-03-18 07:10:21.028', 0.00, 0, NULL, NULL, NULL);

-- Dumping structure for table public.SubscriptionPlan
CREATE TABLE IF NOT EXISTS "SubscriptionPlan" (
	"id" TEXT NOT NULL,
	"name" TEXT NOT NULL,
	"description" TEXT NULL DEFAULT NULL,
	"redemptionMode" TEXT NOT NULL DEFAULT 'MULTI_USE',
	"validityDays" INTEGER NOT NULL,
	"kgLimit" NUMERIC(10,2) NULL DEFAULT NULL,
	"minKgPerPickup" NUMERIC(10,2) NULL DEFAULT NULL,
	"applicableServiceTypes" TEXT[] NULL DEFAULT NULL,
	"active" BOOLEAN NOT NULL DEFAULT true,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"variant" TEXT NOT NULL,
	"maxPickups" INTEGER NOT NULL,
	"itemsLimit" INTEGER NULL DEFAULT NULL,
	"pricePaise" INTEGER NOT NULL,
	PRIMARY KEY ("id")
);

-- Dumping data for table public.SubscriptionPlan: -1 rows
INSERT INTO "SubscriptionPlan" ("id", "name", "description", "redemptionMode", "validityDays", "kgLimit", "minKgPerPickup", "applicableServiceTypes", "active", "createdAt", "updatedAt", "variant", "maxPickups", "itemsLimit", "pricePaise") VALUES
	('plan-single-12kg-monthly', 'WASH& FOLD', NULL, 'MULTI_USE', 30, 12.00, 3.00, '{WASH_FOLD}', 'false', '2026-03-18 07:10:20.739', '2026-04-01 01:52:22.136', 'SINGLE', 2, NULL, 49900);

-- Dumping structure for table public.SubscriptionPlanBranch
CREATE TABLE IF NOT EXISTS "SubscriptionPlanBranch" (
	"id" TEXT NOT NULL,
	"planId" TEXT NOT NULL,
	"branchId" TEXT NOT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE ("planId", "branchId"),
	CONSTRAINT "SubscriptionPlanBranch_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "SubscriptionPlanBranch_planId_fkey" FOREIGN KEY ("planId") REFERENCES "SubscriptionPlan" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "SubscriptionPlanBranch_planId_idx" ON "SubscriptionPlanBranch" ("planId");
CREATE INDEX "SubscriptionPlanBranch_branchId_idx" ON "SubscriptionPlanBranch" ("branchId");

-- Dumping data for table public.SubscriptionPlanBranch: -1 rows

-- Dumping structure for table public.SubscriptionUsage
CREATE TABLE IF NOT EXISTS "SubscriptionUsage" (
	"id" TEXT NOT NULL,
	"subscriptionId" TEXT NOT NULL,
	"orderId" TEXT NOT NULL,
	"invoiceId" TEXT NULL DEFAULT NULL,
	"deductedPickups" INTEGER NOT NULL DEFAULT 1,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"deductedKg" NUMERIC(10,2) NOT NULL DEFAULT 0,
	"deductedItemsCount" INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY ("id"),
	UNIQUE ("orderId", "subscriptionId"),
	UNIQUE ("invoiceId", "subscriptionId"),
	CONSTRAINT "SubscriptionUsage_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "SubscriptionUsage_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "SubscriptionUsage_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX "SubscriptionUsage_subscriptionId_idx" ON "SubscriptionUsage" ("subscriptionId");
CREATE INDEX "SubscriptionUsage_orderId_idx" ON "SubscriptionUsage" ("orderId");
CREATE INDEX "SubscriptionUsage_invoiceId_idx" ON "SubscriptionUsage" ("invoiceId");

-- Dumping data for table public.SubscriptionUsage: -1 rows

-- Dumping structure for table public.User
CREATE TABLE IF NOT EXISTS "User" (
	"id" TEXT NOT NULL,
	"phone" TEXT NULL DEFAULT NULL,
	"email" TEXT NULL DEFAULT NULL,
	"passwordHash" TEXT NULL DEFAULT NULL,
	"role" TEXT NOT NULL,
	"branchId" TEXT NULL DEFAULT NULL,
	"createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"updatedAt" TIMESTAMP NOT NULL,
	"name" TEXT NULL DEFAULT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"isActive" BOOLEAN NOT NULL DEFAULT true,
	"expoPushToken" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	UNIQUE ("phone"),
	UNIQUE ("email"),
	CONSTRAINT "User_branchId_fkey" FOREIGN KEY ("branchId") REFERENCES "Branch" ("id") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Dumping data for table public.User: 18 rows
INSERT INTO "User" ("id", "phone", "email", "passwordHash", "role", "branchId", "createdAt", "updatedAt", "name", "notes", "isActive", "expoPushToken") VALUES
	('033bc790-69f2-49df-8bb6-5cad9faaa911', '+918309916797', NULL, NULL, 'CUSTOMER', NULL, '2026-04-03 16:15:03.249', '2026-04-04 14:06:51.357', 'Kiran', NULL, 'true', NULL),
	('131950a3-84c5-4c0a-87bc-ed776885b0fe', '+919999999999', NULL, NULL, 'CUSTOMER', NULL, '2026-03-18 07:10:13.587', '2026-04-04 15:43:58.1', 'sample profile', NULL, 'true', NULL),
	('1b035041-1269-4e2f-b5d0-02fde79e95b5', '+918297712133', 'Karthik829@gmail.com', NULL, 'CUSTOMER', NULL, '2026-03-18 11:50:45.697', '2026-03-31 03:02:21.93', 'karthik 829', NULL, 'true', NULL),
	('42b40227-8d8f-4010-b2e8-e6c995229109', '+918374636932', NULL, NULL, 'CUSTOMER', NULL, '2026-04-01 16:49:33.889', '2026-04-01 16:49:33.889', NULL, NULL, 'true', NULL),
	('4653efa7-cc09-4900-b472-d18eb0a92e86', '+918121278787', NULL, NULL, 'CUSTOMER', NULL, '2026-04-02 19:37:57.107', '2026-04-02 19:38:07.221', 'Manish', NULL, 'true', NULL),
	('6cea0358-7d60-47f0-b9c3-a56aae29baf6', '+919666669493', NULL, NULL, 'CUSTOMER', NULL, '2026-03-31 03:12:05.961', '2026-04-09 11:23:34.223', 'sandeep', NULL, 'true', NULL),
	('72660450-ce80-4e1a-829c-e61c4a1a664f', '+919000747704', NULL, NULL, 'CUSTOMER', NULL, '2026-04-04 14:43:04.533', '2026-04-04 14:43:04.533', NULL, NULL, 'true', NULL),
	('766d4a54-385c-4860-a772-2bf135ffe6b0', '+918971690163', 'karthikburra2211@gmail.com', NULL, 'CUSTOMER', NULL, '2026-03-18 12:14:39.722', '2026-04-10 02:08:45.45', 'Karthik burra', NULL, 'true', 'ExponentPushToken[bSnqq2M4fGY4oe4rCvAHBu]'),
	('7d7556e2-49a1-4a1e-8dee-8c5e1d6edfea', NULL, 'Niharika@weyou.com', 'e4bc40679fc383cdd6b9e395ec5043063ba580e351651bca6d2cd5b334374cad', 'ADMIN', NULL, '2026-03-22 05:49:28.739', '2026-03-22 05:56:06.8', 'Niharika', NULL, 'true', NULL),
	('8b1390d5-e522-46b4-a075-36956c0095d2', '+917093142725', NULL, NULL, 'CUSTOMER', NULL, '2026-03-30 16:53:47.829', '2026-04-09 08:57:51.73', 'Chinnu', NULL, 'true', NULL),
	('8b1b013c-b1f6-4313-9a34-8c5108db1bf5', '+918121388787', NULL, NULL, 'CUSTOMER', NULL, '2026-04-04 12:16:59.118', '2026-04-04 12:42:39.547', 'Samhith', NULL, 'true', NULL),
	('8c86b1c2-0c84-4cee-940f-7d1c61f1fe7a', NULL, 'KPHBdriver@weyou.com', '5fba0bc64f8d00af2f4b80dc922ae2d3c7c61fdee08504765ad66e4a81367ee5', 'AGENT', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', '2026-04-09 09:32:12.726', '2026-04-09 09:45:51.729', 'Driver KPHB', NULL, 'true', NULL),
	('956d6ab1-afda-4046-acff-a77004781020', '+918897338949', NULL, NULL, 'CUSTOMER', NULL, '2026-04-02 08:35:21.852', '2026-04-04 12:18:08.176', 'anil kumar', NULL, 'true', NULL),
	('9fa38f08-c01b-4fbe-ae0e-80ae100eb1c3', '+918143232781', NULL, NULL, 'CUSTOMER', NULL, '2026-04-04 12:34:22.453', '2026-04-06 11:39:46.997', 'Manish', NULL, 'true', NULL),
	('c23d483c-8799-4746-87ba-666786920097', NULL, 'weyou@admin.com', 'dev-hash', 'ADMIN', NULL, '2026-03-18 07:10:14.053', '2026-03-18 12:19:52.862', 'Weyou admin', NULL, 'true', NULL),
	('c3c65f86-6762-43b4-ba2d-2514abf8c364', '+917331120205', NULL, NULL, 'CUSTOMER', NULL, '2026-04-09 08:45:12.142', '2026-04-09 08:45:28.028', 'Krackbot studio test', NULL, 'true', NULL),
	('c78b1780-7325-4700-8836-4838a8c35b59', '+917995646711', NULL, NULL, 'CUSTOMER', NULL, '2026-04-03 08:12:56.761', '2026-04-03 08:12:56.761', 'Rathnakar', NULL, 'true', NULL),
	('cfb1e44b-f40b-4138-9db6-572b85c1859c', '+917330712667', NULL, NULL, 'CUSTOMER', NULL, '2026-04-01 17:22:37.993', '2026-04-05 11:10:00.582', 'Kunchala Yenkata Krishna', NULL, 'true', NULL),
	('d26666cb-f639-4892-98ce-db3c8cb9fab2', '+918919435017', NULL, NULL, 'CUSTOMER', NULL, '2026-04-04 14:14:11.127', '2026-04-04 14:14:15.659', 'Varun', NULL, 'true', NULL),
	('d8b2945b-48a8-4fa3-824f-a3380fb326f7', '+918074847338', NULL, NULL, 'CUSTOMER', NULL, '2026-04-04 09:02:45.253', '2026-04-06 11:35:28.405', 'chaitanya', NULL, 'true', NULL),
	('de9cdf1e-30c4-440d-a6bf-14c165d5ab1b', NULL, 'KPHB@WEYOU.COM', '72237f61547d0a8505d3f6807ee48383b39a3577ab68c99932e3dea594b5706c', 'OPS', 'ac1a4eb6-2927-4622-b8ba-f7cc1443bbcf', '2026-03-30 16:26:47.174', '2026-04-02 08:48:05.062', 'KPHB BRANCH HEAD', NULL, 'true', NULL),
	('e8fef64c-5d9e-4f6a-8ab7-bd853479460f', '+916301019935', NULL, NULL, 'CUSTOMER', NULL, '2026-03-19 19:49:51.703', '2026-03-19 19:49:51.703', NULL, NULL, 'true', NULL);

-- Re-enable foreign key constraint checks
SET session_replication_role = DEFAULT;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
