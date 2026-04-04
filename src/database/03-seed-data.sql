-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Seed Data
-- =============================================================================
-- Inserts 10 computers from the Excel dataset with royal-themed names.
-- Processors and GPUs are inserted first as lookup data, then computers,
-- then child records (storage drives and USB ports).
-- =============================================================================

USE CompuPalace;
GO

-- =============================================================================
-- Processors (7 unique CPUs from the dataset)
-- =============================================================================
INSERT INTO Processors (Name, Brand) VALUES
    (N'Intel Celeron N3050',                         N'Intel'),
    (N'AMD FX 4300',                                 N'AMD'),
    (N'AMD Athlon Quad-Core APU Athlon 5150',        N'AMD'),
    (N'AMD FX 8-Core Black Edition FX-8350',         N'AMD'),
    (N'AMD FX 8-Core Black Edition FX-8370',         N'AMD'),
    (N'Intel Core i7-6700K 4GHz',                    N'Intel'),
    (N'Intel Core i5-6400',                          N'Intel'),
    (N'Intel Core i7 Extreme Edition 3 GHz',         N'Intel');
GO

-- =============================================================================
-- GPUs (6 unique GPUs from the dataset)
-- =============================================================================
INSERT INTO Gpus (Name, Brand) VALUES
    (N'NVIDIA GeForce GTX 770',     N'NVIDIA'),
    (N'NVIDIA GeForce GTX 960',     N'NVIDIA'),
    (N'AMD Radeon R7 360',          N'AMD'),
    (N'NVIDIA GeForce GTX 1080',    N'NVIDIA'),
    (N'AMD Radeon RX 480',          N'AMD'),
    (N'AMD Radeon R9 380',          N'AMD'),
    (N'AMD FirePro W4100',          N'AMD');
GO

-- =============================================================================
-- Computers (10 entries)
-- =============================================================================
-- Processor IDs (based on insert order):
--   1 = Intel Celeron N3050
--   2 = AMD FX 4300
--   3 = AMD Athlon Quad-Core APU Athlon 5150
--   4 = AMD FX 8-Core Black Edition FX-8350
--   5 = AMD FX 8-Core Black Edition FX-8370
--   6 = Intel Core i7-6700K 4GHz
--   7 = Intel Core i5-6400
--   8 = Intel Core i7 Extreme Edition 3 GHz
--
-- GPU IDs (based on insert order):
--   1 = NVIDIA GeForce GTX 770
--   2 = NVIDIA GeForce GTX 960
--   3 = AMD Radeon R7 360
--   4 = NVIDIA GeForce GTX 1080
--   5 = AMD Radeon RX 480
--   6 = AMD Radeon R9 380
--   7 = AMD FirePro W4100
-- =============================================================================

INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId) VALUES
    -- 1. The Page's Companion
    (N'The Page''s Companion',      8192,    499.99, NULL,  8.10, N'kg', 500, 1, 1),
    -- 2. The Squire's Arsenal
    (N'The Squire''s Arsenal',      16384,   649.99, NULL, 12.00, N'kg', 500, 2, 2),
    -- 3. The Herald's Tower
    (N'The Herald''s Tower',        8192,    549.99, NULL, 16.00, N'lb', 450, 3, 3),
    -- 4. The Knight's Fortress
    (N'The Knight''s Fortress',     16384,   899.99, NULL, 13.80, N'lb', 500, 4, 4),
    -- 5. The Baron's Citadel
    (N'The Baron''s Citadel',       32768,  1099.99, NULL,  7.00, N'kg', 1000, 5, 5),
    -- 6. The Duke's Sanctum
    (N'The Duke''s Sanctum',        32768,  1249.99, NULL,  6.00, N'kg', 450, 6, 6),
    -- 7. The Prince's Armory
    (N'The Prince''s Armory',       8192,    749.99, NULL, 15.00, N'lb', 1000, 7, 4),
    -- 8. The Viscount's Chamber
    (N'The Viscount''s Chamber',    16384,   599.99, NULL,  8.00, N'lb', 750, 7, 1),
    -- 9. The Sovereign's Throne
    (N'The Sovereign''s Throne',    2048,   1499.99, NULL,  9.00, N'kg', 508, 8, 7),
    -- 10. The Court Jester's Box
    (N'The Court Jester''s Box',    512,     349.99, NULL, 22.00, N'lb', 700, 7, 5);
GO

-- =============================================================================
-- Storage Drives
-- =============================================================================
INSERT INTO StorageDrives (ComputerId, CapacityGB, Type) VALUES
    -- 1. The Page's Companion: 1 TB SSD
    (1,  1024, N'SSD'),
    -- 2. The Squire's Arsenal: 2 TB HDD
    (2,  2048, N'HDD'),
    -- 3. The Herald's Tower: 3 TB HDD
    (3,  3072, N'HDD'),
    -- 4. The Knight's Fortress: 4 TB HDD
    (4,  4096, N'HDD'),
    -- 5. The Baron's Citadel: 750 GB SSD
    (5,   750, N'SSD'),
    -- 6. The Duke's Sanctum: 2 TB SSD
    (6,  2048, N'SSD'),
    -- 7. The Prince's Armory: 2 TB HDD
    (7,  2048, N'HDD'),
    -- 8. The Viscount's Chamber: 500 GB SSD
    (8,   500, N'SSD'),
    -- 9. The Sovereign's Throne: 2 TB HDD
    (9,  2048, N'HDD'),
    -- 10. The Court Jester's Box: 80 GB SSD
    (10,   80, N'SSD');
GO

-- =============================================================================
-- USB Ports
-- =============================================================================
INSERT INTO UsbPorts (ComputerId, Count, UsbType) VALUES
    -- 1. The Page's Companion: 2x USB 3.0 + 4x USB 2.0
    (1, 2, N'USB 3.0'),
    (1, 4, N'USB 2.0'),
    -- 2. The Squire's Arsenal: 3x USB 3.0 + 4x USB 2.0
    (2, 3, N'USB 3.0'),
    (2, 4, N'USB 2.0'),
    -- 3. The Herald's Tower: 4x USB 3.0 + 4x USB 2.0
    (3, 4, N'USB 3.0'),
    (3, 4, N'USB 2.0'),
    -- 4. The Knight's Fortress: 5x USB 2.0 + 4x USB 3.0
    (4, 5, N'USB 2.0'),
    (4, 4, N'USB 3.0'),
    -- 5. The Baron's Citadel: 2x USB 3.0 + 2x USB 2.0 + 1x USB C
    (5, 2, N'USB 3.0'),
    (5, 2, N'USB 2.0'),
    (5, 1, N'USB C'),
    -- 6. The Duke's Sanctum: 2x USB C + 4x USB 3.0
    (6, 2, N'USB C'),
    (6, 4, N'USB 3.0'),
    -- 7. The Prince's Armory: 8x USB 3.0
    (7, 8, N'USB 3.0'),
    -- 8. The Viscount's Chamber: 4x USB 2.0
    (8, 4, N'USB 2.0'),
    -- 9. The Sovereign's Throne: 10x USB 3.0 + 10x USB 2.0 + 10x USB C
    (9, 10, N'USB 3.0'),
    (9, 10, N'USB 2.0'),
    (9, 10, N'USB C'),
    -- 10. The Court Jester's Box: 19x USB 3.0 + 4x USB 2.0
    (10, 19, N'USB 3.0'),
    (10,  4, N'USB 2.0');
GO

PRINT 'Seed data inserted successfully.';
GO
