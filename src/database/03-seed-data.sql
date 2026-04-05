-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Seed Data
-- =============================================================================
-- Inserts 100+ computers with royal-themed names.
-- Processors and GPUs are inserted first as lookup data, then computers,
-- then child records (storage drives and USB ports).
-- =============================================================================

USE CompuPalace;
GO

-- =============================================================================
-- Processors (8 original + 8 modern = 16 total)
-- =============================================================================
INSERT INTO Processors (Name, Brand) VALUES
    (N'Intel Celeron N3050',                         N'Intel'),
    (N'AMD FX 4300',                                 N'AMD'),
    (N'AMD Athlon Quad-Core APU Athlon 5150',        N'AMD'),
    (N'AMD FX 8-Core Black Edition FX-8350',         N'AMD'),
    (N'AMD FX 8-Core Black Edition FX-8370',         N'AMD'),
    (N'Intel Core i7-6700K 4GHz',                    N'Intel'),
    (N'Intel Core i5-6400',                          N'Intel'),
    (N'Intel Core i7 Extreme Edition 3 GHz',         N'Intel'),
    (N'Intel Core i9-13900K',                        N'Intel'),
    (N'AMD Ryzen 9 7950X',                           N'AMD'),
    (N'Intel Core i5-13600K',                        N'Intel'),
    (N'AMD Ryzen 7 7700X',                           N'AMD'),
    (N'Intel Core i3-13100',                         N'Intel'),
    (N'AMD Ryzen 5 7600X',                           N'AMD'),
    (N'Intel Core i9-14900K',                        N'Intel'),
    (N'AMD Ryzen 9 9950X',                           N'AMD');
GO

-- =============================================================================
-- GPUs (7 original + 8 modern = 15 total)
-- =============================================================================
INSERT INTO Gpus (Name, Brand) VALUES
    (N'NVIDIA GeForce GTX 770',         N'NVIDIA'),
    (N'NVIDIA GeForce GTX 960',         N'NVIDIA'),
    (N'AMD Radeon R7 360',              N'AMD'),
    (N'NVIDIA GeForce GTX 1080',        N'NVIDIA'),
    (N'AMD Radeon RX 480',              N'AMD'),
    (N'AMD Radeon R9 380',              N'AMD'),
    (N'AMD FirePro W4100',              N'AMD'),
    (N'NVIDIA GeForce RTX 4090',        N'NVIDIA'),
    (N'NVIDIA GeForce RTX 4070',        N'NVIDIA'),
    (N'AMD Radeon RX 7900 XTX',         N'AMD'),
    (N'NVIDIA GeForce RTX 3060',        N'NVIDIA'),
    (N'AMD Radeon RX 7600',             N'AMD'),
    (N'NVIDIA GeForce RTX 4060 Ti',     N'NVIDIA'),
    (N'AMD Radeon RX 6700 XT',          N'AMD'),
    (N'NVIDIA GeForce RTX 3080',        N'NVIDIA');
GO

-- =============================================================================
-- Computers (100 entries)
-- =============================================================================
-- Processor IDs:
--   1  = Intel Celeron N3050
--   2  = AMD FX 4300
--   3  = AMD Athlon Quad-Core APU Athlon 5150
--   4  = AMD FX 8-Core Black Edition FX-8350
--   5  = AMD FX 8-Core Black Edition FX-8370
--   6  = Intel Core i7-6700K 4GHz
--   7  = Intel Core i5-6400
--   8  = Intel Core i7 Extreme Edition 3 GHz
--   9  = Intel Core i9-13900K
--  10  = AMD Ryzen 9 7950X
--  11  = Intel Core i5-13600K
--  12  = AMD Ryzen 7 7700X
--  13  = Intel Core i3-13100
--  14  = AMD Ryzen 5 7600X
--  15  = Intel Core i9-14900K
--  16  = AMD Ryzen 9 9950X
--
-- GPU IDs:
--   1  = NVIDIA GeForce GTX 770
--   2  = NVIDIA GeForce GTX 960
--   3  = AMD Radeon R7 360
--   4  = NVIDIA GeForce GTX 1080
--   5  = AMD Radeon RX 480
--   6  = AMD Radeon R9 380
--   7  = AMD FirePro W4100
--   8  = NVIDIA GeForce RTX 4090
--   9  = NVIDIA GeForce RTX 4070
--  10  = AMD Radeon RX 7900 XTX
--  11  = NVIDIA GeForce RTX 3060
--  12  = AMD Radeon RX 7600
--  13  = NVIDIA GeForce RTX 4060 Ti
--  14  = AMD Radeon RX 6700 XT
--  15  = NVIDIA GeForce RTX 3080
--
-- Image URL pool (rotating):
--   A = https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop  (desktop setup)
--   B = https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop  (laptop coding)
--   C = https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop  (laptop)
--   D = https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop  (macbook)
--   E = https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop  (gaming pc)
--   F = https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop    (desktop tower)
--   G = https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop  (gaming setup)
--   H = https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop    (imac)
--   I = https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop  (pc interior)
--   J = https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop    (retro tech)
-- =============================================================================

INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId) VALUES
    -- 1
    (N'The Page''s Companion',          8192,    499.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  8.10, N'kg', 500,  1,  1),
    -- 2
    (N'The Squire''s Arsenal',         16384,    649.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 12.00, N'kg', 500,  2,  2),
    -- 3
    (N'The Herald''s Tower',            8192,    549.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop', 16.00, N'lb', 450,  3,  3),
    -- 4
    (N'The Knight''s Fortress',        16384,    899.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop', 13.80, N'lb', 500,  4,  4),
    -- 5
    (N'The Baron''s Citadel',          32768,   1099.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  7.00, N'kg', 1000, 5,  5),
    -- 6
    (N'The Duke''s Sanctum',           32768,   1249.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',    6.00, N'kg', 450,  6,  6),
    -- 7
    (N'The Prince''s Armory',           8192,    749.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop', 15.00, N'lb', 1000, 7,  4),
    -- 8
    (N'The Viscount''s Chamber',       16384,    599.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',    8.00, N'lb', 750,  7,  1),
    -- 9
    (N'The Sovereign''s Throne',        2048,   1499.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  9.00, N'kg', 508,  8,  7),
    -- 10
    (N'The Court Jester''s Box',         512,    349.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   22.00, N'lb', 700,  7,  5),
    -- 11
    (N'The Archduke''s Engine',        65536,   3499.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  9.50, N'kg', 1200, 9,  8),
    -- 12
    (N'The Emperor''s Dominion',      131072,   4999.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 11.00, N'kg', 1200, 16, 8),
    -- 13
    (N'The Regent''s Might',           65536,   2999.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop', 10.20, N'kg', 1000, 15, 15),
    -- 14
    (N'The Paladin''s Core',           32768,   1799.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  8.80, N'kg', 850,  9,  9),
    -- 15
    (N'The Warden''s Watch',           16384,    999.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  7.50, N'kg', 650,  11, 11),
    -- 16
    (N'The Chancellor''s Decree',      32768,   1599.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',    9.00, N'kg', 750,  10, 10),
    -- 17
    (N'The Viceroy''s Command',        16384,   1149.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop',  8.30, N'kg', 700,  12, 13),
    -- 18
    (N'The Marshal''s Banner',          8192,    699.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',   14.00, N'lb', 550,  13, 12),
    -- 19
    (N'The Constable''s Keep',          4096,    449.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop', 11.00, N'lb', 400,  1,  3),
    -- 20
    (N'The Chamberlain''s Vault',      32768,   1399.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',    7.20, N'kg', 800,  14, 14),
    -- 21
    (N'The Steward''s Watch',          16384,    879.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  6.80, N'kg', 600,  11, 9),
    -- 22
    (N'The Banneret''s Standard',       8192,    599.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 13.50, N'lb', 500,  7,  2),
    -- 23
    (N'The Thane''s Bastion',          32768,   1699.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop',  8.50, N'kg', 850,  12, 15),
    -- 24
    (N'The Liegeman''s Post',           4096,    379.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop', 10.00, N'lb', 350,  3,  3),
    -- 25
    (N'The Seneschal''s Hall',         65536,   2499.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  9.80, N'kg', 1000, 15, 8),
    -- 26
    (N'The Castellan''s Tower',        32768,   1349.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',    8.00, N'kg', 750,  10, 9),
    -- 27
    (N'The Warlord''s Siege',          65536,   2799.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop', 12.00, N'kg', 1200, 9,  8),
    -- 28
    (N'The Envoy''s Dispatch',          8192,    529.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',    5.50, N'kg', 450,  13, 12),
    -- 29
    (N'The Tribune''s Oration',        16384,    949.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  7.80, N'kg', 650,  14, 11),
    -- 30
    (N'The Legate''s Decree',           2048,    329.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   18.00, N'lb', 400,  2,  6),
    -- 31
    (N'The Prelate''s Sanctum',        32768,   1899.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  8.20, N'kg', 900,  16, 10),
    -- 32
    (N'The Exarch''s Domain',          65536,   3199.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 10.50, N'kg', 1200, 15, 15),
    -- 33
    (N'The Patriarch''s Legacy',        4096,    419.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop', 12.00, N'lb', 400,  3,  6),
    -- 34
    (N'The Prefect''s Order',           8192,    679.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  6.20, N'kg', 550,  7,  2),
    -- 35
    (N'The Tribune''s Voice',          16384,   1049.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  8.90, N'kg', 700,  11, 13),
    -- 36
    (N'The Praetor''s Judgment',       32768,   1549.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',    9.30, N'kg', 800,  12, 14),
    -- 37
    (N'The Consul''s Authority',       65536,   2699.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop', 11.50, N'kg', 1000, 16, 8),
    -- 38
    (N'The Procurator''s Ledger',       8192,    589.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',   14.50, N'lb', 500,  4,  5),
    -- 39
    (N'The Strategos'' Gambit',        16384,   1199.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  8.60, N'kg', 750,  14, 9),
    -- 40
    (N'The Eparch''s Edict',             512,    299.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   20.00, N'lb', 350,  1,  3),
    -- 41
    (N'The Archon''s Seal',            32768,   1449.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  7.70, N'kg', 800,  10, 10),
    -- 42
    (N'The Tyrant''s Grip',            65536,   3099.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 10.80, N'kg', 1200, 9,  15),
    -- 43
    (N'The Oligarch''s Reserve',        4096,    459.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop', 11.00, N'lb', 400,  2,  6),
    -- 44
    (N'The Satrap''s Province',        16384,    849.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  7.40, N'kg', 600,  6,  4),
    -- 45
    (N'The Vizier''s Counsel',         32768,   1699.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  8.10, N'kg', 850,  12, 15),
    -- 46
    (N'The Sultan''s Pavilion',        65536,   2999.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',   11.20, N'kg', 1000, 15, 8),
    -- 47
    (N'The Caliph''s Fortress',       131072,   4599.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop', 12.50, N'kg', 1200, 16, 8),
    -- 48
    (N'The Emir''s Outpost',            8192,    729.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',   15.50, N'lb', 550,  5,  5),
    -- 49
    (N'The Pasha''s Enclave',          16384,   1099.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  8.30, N'kg', 700,  11, 11),
    -- 50
    (N'The Bey''s Crossing',            2048,    359.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   17.00, N'lb', 380,  1,  6),
    -- 51
    (N'The Shogun''s Stronghold',      65536,   3399.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  9.90, N'kg', 1200, 9,  8),
    -- 52
    (N'The Daimyo''s Keep',            32768,   1849.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop',  8.70, N'kg', 900,  10, 10),
    -- 53
    (N'The Samurai''s Edge',           16384,    999.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop',  7.10, N'kg', 650,  14, 14),
    -- 54
    (N'The Ronin''s Path',              8192,    649.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  5.80, N'kg', 500,  13, 11),
    -- 55
    (N'The Ninja''s Shadow',            4096,    399.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 10.00, N'lb', 380,  3,  3),
    -- 56
    (N'The Warlord''s Dominion',       65536,   2599.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',   10.00, N'kg', 1000, 15, 15),
    -- 57
    (N'The Chieftain''s Hearth',       16384,    879.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop',  8.00, N'kg', 650,  12, 13),
    -- 58
    (N'The Jarl''s Hall',              32768,   1499.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',    9.40, N'kg', 800,  10, 9),
    -- 59
    (N'The Thegn''s Holding',           4096,    429.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop', 12.50, N'lb', 400,  2,  5),
    -- 60
    (N'The Housecarl''s Post',          8192,    549.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   14.00, N'lb', 500,  7,  2),
    -- 61
    (N'The Overlord''s Citadel',      131072,   4799.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop', 13.00, N'kg', 1200, 16, 8),
    -- 62
    (N'The Suzerain''s Court',         65536,   3299.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 11.80, N'kg', 1200, 15, 10),
    -- 63
    (N'The Potentate''s Chamber',      32768,   2199.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop',  9.10, N'kg', 900,  9,  9),
    -- 64
    (N'The Magnate''s Study',          16384,   1249.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  8.40, N'kg', 750,  11, 13),
    -- 65
    (N'The Patrician''s Villa',         8192,    769.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  7.20, N'kg', 600,  6,  4),
    -- 66
    (N'The Centurion''s Camp',          4096,    449.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',   11.50, N'lb', 400,  4,  6),
    -- 67
    (N'The Legionnaire''s March',       8192,    619.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop',  6.50, N'kg', 500,  5,  5),
    -- 68
    (N'The Tribune''s Rostrum',        16384,   1099.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',    9.20, N'kg', 700,  14, 12),
    -- 69
    (N'The Prefect''s Fortress',       32768,   1599.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  8.80, N'kg', 800,  12, 14),
    -- 70
    (N'The Praetor''s Command',        65536,   2899.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   10.40, N'kg', 1000, 16, 15),
    -- 71
    (N'The Dictator''s Seat',          65536,   3599.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop', 12.20, N'kg', 1200, 9,  8),
    -- 72
    (N'The Imperator''s Will',        131072,   4299.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 11.60, N'kg', 1200, 15, 8),
    -- 73
    (N'The Triumvir''s Alliance',       2048,    319.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop', 19.00, N'lb', 380,  2,  3),
    -- 74
    (N'The Aedile''s Square',           4096,    439.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop', 11.00, N'lb', 400,  3,  6),
    -- 75
    (N'The Quaestor''s Treasury',       8192,    689.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  7.00, N'kg', 550,  7,  2),
    -- 76
    (N'The Censor''s Ledger',          16384,    999.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',    8.20, N'kg', 650,  11, 11),
    -- 77
    (N'The Pontifex''s Shrine',        32768,   1749.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop',  9.60, N'kg', 850,  10, 10),
    -- 78
    (N'The Augur''s Vision',           65536,   2799.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',   10.70, N'kg', 1000, 16, 15),
    -- 79
    (N'The Haruspex''s Oracle',          512,    309.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop', 21.00, N'lb', 360,  1,  7),
    -- 80
    (N'The Flamen''s Altar',            4096,    469.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   12.00, N'lb', 420,  2,  6),
    -- 81
    (N'The Vestal''s Hearth',           8192,    599.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  5.90, N'kg', 480,  13, 12),
    -- 82
    (N'The Sibyl''s Prophecy',         16384,    949.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop',  7.60, N'kg', 650,  14, 9),
    -- 83
    (N'The Oracle''s Revelation',      32768,   1799.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop',  8.30, N'kg', 900,  12, 15),
    -- 84
    (N'The Prophet''s Ascent',         65536,   3099.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop', 11.40, N'kg', 1200, 9,  8),
    -- 85
    (N'The Hierophant''s Mystery',      2048,    339.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 18.50, N'lb', 380,  3,  7),
    -- 86
    (N'The Archmage''s Tower',         65536,   3749.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',   10.10, N'kg', 1200, 15, 8),
    -- 87
    (N'The Sorcerer''s Sanctum',       32768,   2049.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop',  8.90, N'kg', 950,  16, 10),
    -- 88
    (N'The Warlock''s Pact',           16384,   1199.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',    7.50, N'kg', 750,  10, 14),
    -- 89
    (N'The Wizard''s Workshop',         8192,    749.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop',  6.40, N'kg', 600,  11, 13),
    -- 90
    (N'The Conjurer''s Circle',          512,    299.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   23.00, N'lb', 350,  1,  7),
    -- 91
    (N'The Enchanter''s Forge',        32768,   1649.99, N'https://images.unsplash.com/photo-1593062096033-9a26b09da705?w=400&h=300&fit=crop',  9.00, N'kg', 850,  12, 9),
    -- 92
    (N'The Necromancer''s Crypt',       4096,    389.99, N'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=400&h=300&fit=crop', 13.00, N'lb', 400,  4,  5),
    -- 93
    (N'The Alchemist''s Lab',           8192,    579.99, N'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=300&fit=crop',  6.10, N'kg', 500,  7,  11),
    -- 94
    (N'The Sage''s Tome',              16384,   1049.99, N'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400&h=300&fit=crop',  8.10, N'kg', 700,  14, 12),
    -- 95
    (N'The Scholar''s Codex',          32768,   1449.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  8.50, N'kg', 800,  10, 15),
    -- 96
    (N'The Archivist''s Repository',   65536,   2499.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',   10.30, N'kg', 1000, 15, 8),
    -- 97
    (N'The Lorekeeper''s Vault',      131072,   4199.99, N'https://images.unsplash.com/photo-1602080858428-57174f9431cf?w=400&h=300&fit=crop', 12.80, N'kg', 1200, 16, 8),
    -- 98
    (N'The Chronicler''s Annals',       4096,    409.99, N'https://images.unsplash.com/photo-1555617981-dac3880eac6e?w=400&h=300&fit=crop',   10.50, N'lb', 400,  3,  6),
    -- 99
    (N'The Scribe''s Scriptorium',      2048,    329.99, N'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400&h=300&fit=crop', 16.00, N'lb', 380,  2,  3),
    -- 100
    (N'The Grand Sovereign''s Apex',  131072,   4999.99, N'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=400&h=300&fit=crop',   13.50, N'kg', 1200, 16, 8);
GO

-- =============================================================================
-- Storage Drives
-- =============================================================================
INSERT INTO StorageDrives (ComputerId, CapacityGB, Type) VALUES
    -- 1. The Page's Companion
    (1,   1024, N'SSD'),
    -- 2. The Squire's Arsenal
    (2,   2048, N'HDD'),
    -- 3. The Herald's Tower
    (3,   3072, N'HDD'),
    -- 4. The Knight's Fortress
    (4,   4096, N'HDD'),
    -- 5. The Baron's Citadel
    (5,    750, N'SSD'),
    -- 6. The Duke's Sanctum
    (6,   2048, N'SSD'),
    -- 7. The Prince's Armory
    (7,   2048, N'HDD'),
    -- 8. The Viscount's Chamber
    (8,    500, N'SSD'),
    -- 9. The Sovereign's Throne
    (9,   2048, N'HDD'),
    -- 10. The Court Jester's Box
    (10,    80, N'SSD'),
    -- 11. The Archduke's Engine: 2 TB SSD + 4 TB HDD
    (11,  2048, N'SSD'),
    (11,  4096, N'HDD'),
    -- 12. The Emperor's Dominion: 4 TB SSD + 8 TB HDD
    (12,  4096, N'SSD'),
    (12,  8192, N'HDD'),
    -- 13. The Regent's Might: 2 TB SSD + 2 TB HDD
    (13,  2048, N'SSD'),
    (13,  2048, N'HDD'),
    -- 14. The Paladin's Core: 1 TB SSD + 2 TB HDD
    (14,  1024, N'SSD'),
    (14,  2048, N'HDD'),
    -- 15. The Warden's Watch: 512 GB SSD
    (15,   512, N'SSD'),
    -- 16. The Chancellor's Decree: 1 TB SSD + 2 TB HDD
    (16,  1024, N'SSD'),
    (16,  2048, N'HDD'),
    -- 17. The Viceroy's Command: 512 GB SSD + 1 TB HDD
    (17,   512, N'SSD'),
    (17,  1024, N'HDD'),
    -- 18. The Marshal's Banner: 256 GB SSD
    (18,   256, N'SSD'),
    -- 19. The Constable's Keep: 500 GB HDD
    (19,   500, N'HDD'),
    -- 20. The Chamberlain's Vault: 2 TB SSD
    (20,  2048, N'SSD'),
    -- 21. The Steward's Watch: 512 GB SSD + 1 TB HDD
    (21,   512, N'SSD'),
    (21,  1024, N'HDD'),
    -- 22. The Banneret's Standard: 256 GB SSD
    (22,   256, N'SSD'),
    -- 23. The Thane's Bastion: 1 TB SSD + 2 TB HDD
    (23,  1024, N'SSD'),
    (23,  2048, N'HDD'),
    -- 24. The Liegeman's Post: 500 GB HDD
    (24,   500, N'HDD'),
    -- 25. The Seneschal's Hall: 2 TB SSD + 4 TB HDD
    (25,  2048, N'SSD'),
    (25,  4096, N'HDD'),
    -- 26. The Castellan's Tower: 1 TB SSD + 1 TB HDD
    (26,  1024, N'SSD'),
    (26,  1024, N'HDD'),
    -- 27. The Warlord's Siege: 4 TB SSD + 4 TB HDD
    (27,  4096, N'SSD'),
    (27,  4096, N'HDD'),
    -- 28. The Envoy's Dispatch: 128 GB SSD
    (28,   128, N'SSD'),
    -- 29. The Tribune's Oration: 512 GB SSD + 1 TB HDD
    (29,   512, N'SSD'),
    (29,  1024, N'HDD'),
    -- 30. The Legate's Decree: 500 GB HDD
    (30,   500, N'HDD'),
    -- 31. The Prelate's Sanctum: 2 TB SSD + 2 TB HDD
    (31,  2048, N'SSD'),
    (31,  2048, N'HDD'),
    -- 32. The Exarch's Domain: 4 TB SSD + 4 TB HDD
    (32,  4096, N'SSD'),
    (32,  4096, N'HDD'),
    -- 33. The Patriarch's Legacy: 500 GB HDD
    (33,   500, N'HDD'),
    -- 34. The Prefect's Order: 256 GB SSD
    (34,   256, N'SSD'),
    -- 35. The Tribune's Voice: 512 GB SSD + 1 TB HDD
    (35,   512, N'SSD'),
    (35,  1024, N'HDD'),
    -- 36. The Praetor's Judgment: 1 TB SSD + 2 TB HDD
    (36,  1024, N'SSD'),
    (36,  2048, N'HDD'),
    -- 37. The Consul's Authority: 2 TB SSD + 4 TB HDD
    (37,  2048, N'SSD'),
    (37,  4096, N'HDD'),
    -- 38. The Procurator's Ledger: 500 GB SSD
    (38,   500, N'SSD'),
    -- 39. The Strategos' Gambit: 1 TB SSD
    (39,  1024, N'SSD'),
    -- 40. The Eparch's Edict: 80 GB SSD
    (40,    80, N'SSD'),
    -- 41. The Archon's Seal: 1 TB SSD + 1 TB HDD
    (41,  1024, N'SSD'),
    (41,  1024, N'HDD'),
    -- 42. The Tyrant's Grip: 2 TB SSD + 4 TB HDD
    (42,  2048, N'SSD'),
    (42,  4096, N'HDD'),
    -- 43. The Oligarch's Reserve: 500 GB HDD
    (43,   500, N'HDD'),
    -- 44. The Satrap's Province: 512 GB SSD
    (44,   512, N'SSD'),
    -- 45. The Vizier's Counsel: 2 TB SSD
    (45,  2048, N'SSD'),
    -- 46. The Sultan's Pavilion: 2 TB SSD + 4 TB HDD
    (46,  2048, N'SSD'),
    (46,  4096, N'HDD'),
    -- 47. The Caliph's Fortress: 4 TB SSD + 8 TB HDD
    (47,  4096, N'SSD'),
    (47,  8192, N'HDD'),
    -- 48. The Emir's Outpost: 500 GB SSD
    (48,   500, N'SSD'),
    -- 49. The Pasha's Enclave: 1 TB SSD
    (49,  1024, N'SSD'),
    -- 50. The Bey's Crossing: 250 GB HDD
    (50,   250, N'HDD'),
    -- 51. The Shogun's Stronghold: 4 TB SSD + 4 TB HDD
    (51,  4096, N'SSD'),
    (51,  4096, N'HDD'),
    -- 52. The Daimyo's Keep: 2 TB SSD + 2 TB HDD
    (52,  2048, N'SSD'),
    (52,  2048, N'HDD'),
    -- 53. The Samurai's Edge: 512 GB SSD + 1 TB HDD
    (53,   512, N'SSD'),
    (53,  1024, N'HDD'),
    -- 54. The Ronin's Path: 256 GB SSD
    (54,   256, N'SSD'),
    -- 55. The Ninja's Shadow: 500 GB HDD
    (55,   500, N'HDD'),
    -- 56. The Warlord's Dominion: 2 TB SSD + 2 TB HDD
    (56,  2048, N'SSD'),
    (56,  2048, N'HDD'),
    -- 57. The Chieftain's Hearth: 1 TB SSD
    (57,  1024, N'SSD'),
    -- 58. The Jarl's Hall: 1 TB SSD + 2 TB HDD
    (58,  1024, N'SSD'),
    (58,  2048, N'HDD'),
    -- 59. The Thegn's Holding: 500 GB HDD
    (59,   500, N'HDD'),
    -- 60. The Housecarl's Post: 256 GB SSD
    (60,   256, N'SSD'),
    -- 61. The Overlord's Citadel: 4 TB SSD + 8 TB HDD
    (61,  4096, N'SSD'),
    (61,  8192, N'HDD'),
    -- 62. The Suzerain's Court: 4 TB SSD + 4 TB HDD
    (62,  4096, N'SSD'),
    (62,  4096, N'HDD'),
    -- 63. The Potentate's Chamber: 2 TB SSD + 2 TB HDD
    (63,  2048, N'SSD'),
    (63,  2048, N'HDD'),
    -- 64. The Magnate's Study: 1 TB SSD + 1 TB HDD
    (64,  1024, N'SSD'),
    (64,  1024, N'HDD'),
    -- 65. The Patrician's Villa: 512 GB SSD
    (65,   512, N'SSD'),
    -- 66. The Centurion's Camp: 500 GB HDD
    (66,   500, N'HDD'),
    -- 67. The Legionnaire's March: 500 GB SSD
    (67,   500, N'SSD'),
    -- 68. The Tribune's Rostrum: 1 TB SSD
    (68,  1024, N'SSD'),
    -- 69. The Prefect's Fortress: 1 TB SSD + 2 TB HDD
    (69,  1024, N'SSD'),
    (69,  2048, N'HDD'),
    -- 70. The Praetor's Command: 2 TB SSD + 4 TB HDD
    (70,  2048, N'SSD'),
    (70,  4096, N'HDD'),
    -- 71. The Dictator's Seat: 4 TB SSD + 4 TB HDD
    (71,  4096, N'SSD'),
    (71,  4096, N'HDD'),
    -- 72. The Imperator's Will: 4 TB SSD + 8 TB HDD
    (72,  4096, N'SSD'),
    (72,  8192, N'HDD'),
    -- 73. The Triumvir's Alliance: 250 GB HDD
    (73,   250, N'HDD'),
    -- 74. The Aedile's Square: 500 GB HDD
    (74,   500, N'HDD'),
    -- 75. The Quaestor's Treasury: 256 GB SSD
    (75,   256, N'SSD'),
    -- 76. The Censor's Ledger: 512 GB SSD
    (76,   512, N'SSD'),
    -- 77. The Pontifex's Shrine: 1 TB SSD + 2 TB HDD
    (77,  1024, N'SSD'),
    (77,  2048, N'HDD'),
    -- 78. The Augur's Vision: 2 TB SSD + 4 TB HDD
    (78,  2048, N'SSD'),
    (78,  4096, N'HDD'),
    -- 79. The Haruspex's Oracle: 80 GB SSD
    (79,    80, N'SSD'),
    -- 80. The Flamen's Altar: 500 GB HDD
    (80,   500, N'HDD'),
    -- 81. The Vestal's Hearth: 256 GB SSD
    (81,   256, N'SSD'),
    -- 82. The Sibyl's Prophecy: 512 GB SSD + 1 TB HDD
    (82,   512, N'SSD'),
    (82,  1024, N'HDD'),
    -- 83. The Oracle's Revelation: 2 TB SSD
    (83,  2048, N'SSD'),
    -- 84. The Prophet's Ascent: 2 TB SSD + 4 TB HDD
    (84,  2048, N'SSD'),
    (84,  4096, N'HDD'),
    -- 85. The Hierophant's Mystery: 250 GB HDD
    (85,   250, N'HDD'),
    -- 86. The Archmage's Tower: 4 TB SSD + 4 TB HDD
    (86,  4096, N'SSD'),
    (86,  4096, N'HDD'),
    -- 87. The Sorcerer's Sanctum: 2 TB SSD + 2 TB HDD
    (87,  2048, N'SSD'),
    (87,  2048, N'HDD'),
    -- 88. The Warlock's Pact: 1 TB SSD + 1 TB HDD
    (88,  1024, N'SSD'),
    (88,  1024, N'HDD'),
    -- 89. The Wizard's Workshop: 512 GB SSD
    (89,   512, N'SSD'),
    -- 90. The Conjurer's Circle: 80 GB SSD
    (90,    80, N'SSD'),
    -- 91. The Enchanter's Forge: 1 TB SSD + 2 TB HDD
    (91,  1024, N'SSD'),
    (91,  2048, N'HDD'),
    -- 92. The Necromancer's Crypt: 500 GB HDD
    (92,   500, N'HDD'),
    -- 93. The Alchemist's Lab: 256 GB SSD
    (93,   256, N'SSD'),
    -- 94. The Sage's Tome: 1 TB SSD
    (94,  1024, N'SSD'),
    -- 95. The Scholar's Codex: 1 TB SSD + 2 TB HDD
    (95,  1024, N'SSD'),
    (95,  2048, N'HDD'),
    -- 96. The Archivist's Repository: 2 TB SSD + 4 TB HDD
    (96,  2048, N'SSD'),
    (96,  4096, N'HDD'),
    -- 97. The Lorekeeper's Vault: 4 TB SSD + 8 TB HDD
    (97,  4096, N'SSD'),
    (97,  8192, N'HDD'),
    -- 98. The Chronicler's Annals: 500 GB HDD
    (98,   500, N'HDD'),
    -- 99. The Scribe's Scriptorium: 250 GB HDD
    (99,   250, N'HDD'),
    -- 100. The Grand Sovereign's Apex: 4 TB SSD + 8 TB HDD
    (100, 4096, N'SSD'),
    (100, 8192, N'HDD');
GO

-- =============================================================================
-- USB Ports
-- =============================================================================
INSERT INTO UsbPorts (ComputerId, Count, UsbType) VALUES
    -- 1. The Page's Companion: 2x USB 3.0 + 4x USB 2.0
    (1,  2, N'USB 3.0'),
    (1,  4, N'USB 2.0'),
    -- 2. The Squire's Arsenal: 3x USB 3.0 + 4x USB 2.0
    (2,  3, N'USB 3.0'),
    (2,  4, N'USB 2.0'),
    -- 3. The Herald's Tower: 4x USB 3.0 + 4x USB 2.0
    (3,  4, N'USB 3.0'),
    (3,  4, N'USB 2.0'),
    -- 4. The Knight's Fortress: 5x USB 2.0 + 4x USB 3.0
    (4,  5, N'USB 2.0'),
    (4,  4, N'USB 3.0'),
    -- 5. The Baron's Citadel: 2x USB 3.0 + 2x USB 2.0 + 1x USB C
    (5,  2, N'USB 3.0'),
    (5,  2, N'USB 2.0'),
    (5,  1, N'USB C'),
    -- 6. The Duke's Sanctum: 2x USB C + 4x USB 3.0
    (6,  2, N'USB C'),
    (6,  4, N'USB 3.0'),
    -- 7. The Prince's Armory: 8x USB 3.0
    (7,  8, N'USB 3.0'),
    -- 8. The Viscount's Chamber: 4x USB 2.0
    (8,  4, N'USB 2.0'),
    -- 9. The Sovereign's Throne: 10x USB 3.0 + 10x USB 2.0 + 10x USB C
    (9,  10, N'USB 3.0'),
    (9,  10, N'USB 2.0'),
    (9,  10, N'USB C'),
    -- 10. The Court Jester's Box: 19x USB 3.0 + 4x USB 2.0
    (10, 19, N'USB 3.0'),
    (10,  4, N'USB 2.0'),
    -- 11. The Archduke's Engine: 4x USB C + 6x USB 3.0
    (11,  4, N'USB C'),
    (11,  6, N'USB 3.0'),
    -- 12. The Emperor's Dominion: 6x USB C + 8x USB 3.0 + 2x USB 2.0
    (12,  6, N'USB C'),
    (12,  8, N'USB 3.0'),
    (12,  2, N'USB 2.0'),
    -- 13. The Regent's Might: 4x USB C + 6x USB 3.0
    (13,  4, N'USB C'),
    (13,  6, N'USB 3.0'),
    -- 14. The Paladin's Core: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (14,  2, N'USB C'),
    (14,  4, N'USB 3.0'),
    (14,  2, N'USB 2.0'),
    -- 15. The Warden's Watch: 2x USB C + 4x USB 3.0
    (15,  2, N'USB C'),
    (15,  4, N'USB 3.0'),
    -- 16. The Chancellor's Decree: 3x USB C + 5x USB 3.0 + 2x USB 2.0
    (16,  3, N'USB C'),
    (16,  5, N'USB 3.0'),
    (16,  2, N'USB 2.0'),
    -- 17. The Viceroy's Command: 2x USB C + 4x USB 3.0
    (17,  2, N'USB C'),
    (17,  4, N'USB 3.0'),
    -- 18. The Marshal's Banner: 2x USB 3.0 + 4x USB 2.0
    (18,  2, N'USB 3.0'),
    (18,  4, N'USB 2.0'),
    -- 19. The Constable's Keep: 4x USB 2.0
    (19,  4, N'USB 2.0'),
    -- 20. The Chamberlain's Vault: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (20,  2, N'USB C'),
    (20,  4, N'USB 3.0'),
    (20,  2, N'USB 2.0'),
    -- 21. The Steward's Watch: 1x USB C + 3x USB 3.0 + 2x USB 2.0
    (21,  1, N'USB C'),
    (21,  3, N'USB 3.0'),
    (21,  2, N'USB 2.0'),
    -- 22. The Banneret's Standard: 2x USB 3.0 + 4x USB 2.0
    (22,  2, N'USB 3.0'),
    (22,  4, N'USB 2.0'),
    -- 23. The Thane's Bastion: 2x USB C + 6x USB 3.0
    (23,  2, N'USB C'),
    (23,  6, N'USB 3.0'),
    -- 24. The Liegeman's Post: 2x USB 2.0 + 2x USB 3.0
    (24,  2, N'USB 2.0'),
    (24,  2, N'USB 3.0'),
    -- 25. The Seneschal's Hall: 4x USB C + 6x USB 3.0 + 2x USB 2.0
    (25,  4, N'USB C'),
    (25,  6, N'USB 3.0'),
    (25,  2, N'USB 2.0'),
    -- 26. The Castellan's Tower: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (26,  2, N'USB C'),
    (26,  4, N'USB 3.0'),
    (26,  2, N'USB 2.0'),
    -- 27. The Warlord's Siege: 6x USB C + 8x USB 3.0
    (27,  6, N'USB C'),
    (27,  8, N'USB 3.0'),
    -- 28. The Envoy's Dispatch: 1x USB C + 2x USB 3.0
    (28,  1, N'USB C'),
    (28,  2, N'USB 3.0'),
    -- 29. The Tribune's Oration: 2x USB C + 4x USB 3.0
    (29,  2, N'USB C'),
    (29,  4, N'USB 3.0'),
    -- 30. The Legate's Decree: 2x USB 2.0 + 2x USB 3.0
    (30,  2, N'USB 2.0'),
    (30,  2, N'USB 3.0'),
    -- 31. The Prelate's Sanctum: 4x USB C + 4x USB 3.0 + 2x USB 2.0
    (31,  4, N'USB C'),
    (31,  4, N'USB 3.0'),
    (31,  2, N'USB 2.0'),
    -- 32. The Exarch's Domain: 4x USB C + 6x USB 3.0 + 2x USB 2.0
    (32,  4, N'USB C'),
    (32,  6, N'USB 3.0'),
    (32,  2, N'USB 2.0'),
    -- 33. The Patriarch's Legacy: 4x USB 2.0 + 2x USB 3.0
    (33,  4, N'USB 2.0'),
    (33,  2, N'USB 3.0'),
    -- 34. The Prefect's Order: 2x USB 3.0 + 2x USB 2.0
    (34,  2, N'USB 3.0'),
    (34,  2, N'USB 2.0'),
    -- 35. The Tribune's Voice: 2x USB C + 4x USB 3.0
    (35,  2, N'USB C'),
    (35,  4, N'USB 3.0'),
    -- 36. The Praetor's Judgment: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (36,  2, N'USB C'),
    (36,  4, N'USB 3.0'),
    (36,  2, N'USB 2.0'),
    -- 37. The Consul's Authority: 4x USB C + 6x USB 3.0
    (37,  4, N'USB C'),
    (37,  6, N'USB 3.0'),
    -- 38. The Procurator's Ledger: 4x USB 3.0 + 4x USB 2.0
    (38,  4, N'USB 3.0'),
    (38,  4, N'USB 2.0'),
    -- 39. The Strategos' Gambit: 2x USB C + 4x USB 3.0
    (39,  2, N'USB C'),
    (39,  4, N'USB 3.0'),
    -- 40. The Eparch's Edict: 4x USB 2.0
    (40,  4, N'USB 2.0'),
    -- 41. The Archon's Seal: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (41,  2, N'USB C'),
    (41,  4, N'USB 3.0'),
    (41,  2, N'USB 2.0'),
    -- 42. The Tyrant's Grip: 6x USB C + 6x USB 3.0
    (42,  6, N'USB C'),
    (42,  6, N'USB 3.0'),
    -- 43. The Oligarch's Reserve: 4x USB 2.0 + 2x USB 3.0
    (43,  4, N'USB 2.0'),
    (43,  2, N'USB 3.0'),
    -- 44. The Satrap's Province: 2x USB C + 4x USB 3.0
    (44,  2, N'USB C'),
    (44,  4, N'USB 3.0'),
    -- 45. The Vizier's Counsel: 4x USB C + 4x USB 3.0
    (45,  4, N'USB C'),
    (45,  4, N'USB 3.0'),
    -- 46. The Sultan's Pavilion: 4x USB C + 6x USB 3.0 + 2x USB 2.0
    (46,  4, N'USB C'),
    (46,  6, N'USB 3.0'),
    (46,  2, N'USB 2.0'),
    -- 47. The Caliph's Fortress: 6x USB C + 8x USB 3.0 + 2x USB 2.0
    (47,  6, N'USB C'),
    (47,  8, N'USB 3.0'),
    (47,  2, N'USB 2.0'),
    -- 48. The Emir's Outpost: 2x USB C + 4x USB 3.0
    (48,  2, N'USB C'),
    (48,  4, N'USB 3.0'),
    -- 49. The Pasha's Enclave: 2x USB C + 4x USB 3.0
    (49,  2, N'USB C'),
    (49,  4, N'USB 3.0'),
    -- 50. The Bey's Crossing: 2x USB 2.0 + 2x USB 3.0
    (50,  2, N'USB 2.0'),
    (50,  2, N'USB 3.0'),
    -- 51. The Shogun's Stronghold: 6x USB C + 8x USB 3.0
    (51,  6, N'USB C'),
    (51,  8, N'USB 3.0'),
    -- 52. The Daimyo's Keep: 4x USB C + 4x USB 3.0 + 2x USB 2.0
    (52,  4, N'USB C'),
    (52,  4, N'USB 3.0'),
    (52,  2, N'USB 2.0'),
    -- 53. The Samurai's Edge: 2x USB C + 4x USB 3.0
    (53,  2, N'USB C'),
    (53,  4, N'USB 3.0'),
    -- 54. The Ronin's Path: 2x USB 3.0 + 2x USB 2.0
    (54,  2, N'USB 3.0'),
    (54,  2, N'USB 2.0'),
    -- 55. The Ninja's Shadow: 4x USB 2.0
    (55,  4, N'USB 2.0'),
    -- 56. The Warlord's Dominion: 4x USB C + 6x USB 3.0
    (56,  4, N'USB C'),
    (56,  6, N'USB 3.0'),
    -- 57. The Chieftain's Hearth: 2x USB C + 4x USB 3.0
    (57,  2, N'USB C'),
    (57,  4, N'USB 3.0'),
    -- 58. The Jarl's Hall: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (58,  2, N'USB C'),
    (58,  4, N'USB 3.0'),
    (58,  2, N'USB 2.0'),
    -- 59. The Thegn's Holding: 2x USB 2.0 + 2x USB 3.0
    (59,  2, N'USB 2.0'),
    (59,  2, N'USB 3.0'),
    -- 60. The Housecarl's Post: 2x USB 3.0 + 4x USB 2.0
    (60,  2, N'USB 3.0'),
    (60,  4, N'USB 2.0'),
    -- 61. The Overlord's Citadel: 6x USB C + 8x USB 3.0 + 4x USB 2.0
    (61,  6, N'USB C'),
    (61,  8, N'USB 3.0'),
    (61,  4, N'USB 2.0'),
    -- 62. The Suzerain's Court: 6x USB C + 6x USB 3.0 + 2x USB 2.0
    (62,  6, N'USB C'),
    (62,  6, N'USB 3.0'),
    (62,  2, N'USB 2.0'),
    -- 63. The Potentate's Chamber: 4x USB C + 6x USB 3.0
    (63,  4, N'USB C'),
    (63,  6, N'USB 3.0'),
    -- 64. The Magnate's Study: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (64,  2, N'USB C'),
    (64,  4, N'USB 3.0'),
    (64,  2, N'USB 2.0'),
    -- 65. The Patrician's Villa: 2x USB C + 4x USB 3.0
    (65,  2, N'USB C'),
    (65,  4, N'USB 3.0'),
    -- 66. The Centurion's Camp: 4x USB 2.0 + 2x USB 3.0
    (66,  4, N'USB 2.0'),
    (66,  2, N'USB 3.0'),
    -- 67. The Legionnaire's March: 2x USB C + 4x USB 3.0
    (67,  2, N'USB C'),
    (67,  4, N'USB 3.0'),
    -- 68. The Tribune's Rostrum: 2x USB C + 4x USB 3.0
    (68,  2, N'USB C'),
    (68,  4, N'USB 3.0'),
    -- 69. The Prefect's Fortress: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (69,  2, N'USB C'),
    (69,  4, N'USB 3.0'),
    (69,  2, N'USB 2.0'),
    -- 70. The Praetor's Command: 4x USB C + 6x USB 3.0
    (70,  4, N'USB C'),
    (70,  6, N'USB 3.0'),
    -- 71. The Dictator's Seat: 6x USB C + 8x USB 3.0
    (71,  6, N'USB C'),
    (71,  8, N'USB 3.0'),
    -- 72. The Imperator's Will: 6x USB C + 8x USB 3.0 + 2x USB 2.0
    (72,  6, N'USB C'),
    (72,  8, N'USB 3.0'),
    (72,  2, N'USB 2.0'),
    -- 73. The Triumvir's Alliance: 4x USB 2.0 + 2x USB 3.0
    (73,  4, N'USB 2.0'),
    (73,  2, N'USB 3.0'),
    -- 74. The Aedile's Square: 4x USB 2.0 + 2x USB 3.0
    (74,  4, N'USB 2.0'),
    (74,  2, N'USB 3.0'),
    -- 75. The Quaestor's Treasury: 2x USB 3.0 + 4x USB 2.0
    (75,  2, N'USB 3.0'),
    (75,  4, N'USB 2.0'),
    -- 76. The Censor's Ledger: 2x USB C + 4x USB 3.0
    (76,  2, N'USB C'),
    (76,  4, N'USB 3.0'),
    -- 77. The Pontifex's Shrine: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (77,  2, N'USB C'),
    (77,  4, N'USB 3.0'),
    (77,  2, N'USB 2.0'),
    -- 78. The Augur's Vision: 4x USB C + 6x USB 3.0
    (78,  4, N'USB C'),
    (78,  6, N'USB 3.0'),
    -- 79. The Haruspex's Oracle: 4x USB 2.0
    (79,  4, N'USB 2.0'),
    -- 80. The Flamen's Altar: 4x USB 2.0 + 2x USB 3.0
    (80,  4, N'USB 2.0'),
    (80,  2, N'USB 3.0'),
    -- 81. The Vestal's Hearth: 1x USB C + 2x USB 3.0
    (81,  1, N'USB C'),
    (81,  2, N'USB 3.0'),
    -- 82. The Sibyl's Prophecy: 2x USB C + 4x USB 3.0
    (82,  2, N'USB C'),
    (82,  4, N'USB 3.0'),
    -- 83. The Oracle's Revelation: 4x USB C + 4x USB 3.0
    (83,  4, N'USB C'),
    (83,  4, N'USB 3.0'),
    -- 84. The Prophet's Ascent: 4x USB C + 6x USB 3.0 + 2x USB 2.0
    (84,  4, N'USB C'),
    (84,  6, N'USB 3.0'),
    (84,  2, N'USB 2.0'),
    -- 85. The Hierophant's Mystery: 4x USB 2.0 + 2x USB 3.0
    (85,  4, N'USB 2.0'),
    (85,  2, N'USB 3.0'),
    -- 86. The Archmage's Tower: 6x USB C + 8x USB 3.0
    (86,  6, N'USB C'),
    (86,  8, N'USB 3.0'),
    -- 87. The Sorcerer's Sanctum: 4x USB C + 6x USB 3.0 + 2x USB 2.0
    (87,  4, N'USB C'),
    (87,  6, N'USB 3.0'),
    (87,  2, N'USB 2.0'),
    -- 88. The Warlock's Pact: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (88,  2, N'USB C'),
    (88,  4, N'USB 3.0'),
    (88,  2, N'USB 2.0'),
    -- 89. The Wizard's Workshop: 2x USB C + 4x USB 3.0
    (89,  2, N'USB C'),
    (89,  4, N'USB 3.0'),
    -- 90. The Conjurer's Circle: 4x USB 2.0
    (90,  4, N'USB 2.0'),
    -- 91. The Enchanter's Forge: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (91,  2, N'USB C'),
    (91,  4, N'USB 3.0'),
    (91,  2, N'USB 2.0'),
    -- 92. The Necromancer's Crypt: 4x USB 2.0 + 2x USB 3.0
    (92,  4, N'USB 2.0'),
    (92,  2, N'USB 3.0'),
    -- 93. The Alchemist's Lab: 1x USB C + 2x USB 3.0 + 2x USB 2.0
    (93,  1, N'USB C'),
    (93,  2, N'USB 3.0'),
    (93,  2, N'USB 2.0'),
    -- 94. The Sage's Tome: 2x USB C + 4x USB 3.0
    (94,  2, N'USB C'),
    (94,  4, N'USB 3.0'),
    -- 95. The Scholar's Codex: 2x USB C + 4x USB 3.0 + 2x USB 2.0
    (95,  2, N'USB C'),
    (95,  4, N'USB 3.0'),
    (95,  2, N'USB 2.0'),
    -- 96. The Archivist's Repository: 4x USB C + 6x USB 3.0
    (96,  4, N'USB C'),
    (96,  6, N'USB 3.0'),
    -- 97. The Lorekeeper's Vault: 6x USB C + 8x USB 3.0 + 2x USB 2.0
    (97,  6, N'USB C'),
    (97,  8, N'USB 3.0'),
    (97,  2, N'USB 2.0'),
    -- 98. The Chronicler's Annals: 4x USB 2.0 + 2x USB 3.0
    (98,  4, N'USB 2.0'),
    (98,  2, N'USB 3.0'),
    -- 99. The Scribe's Scriptorium: 2x USB 2.0 + 2x USB 3.0
    (99,  2, N'USB 2.0'),
    (99,  2, N'USB 3.0'),
    -- 100. The Grand Sovereign's Apex: 8x USB C + 10x USB 3.0 + 4x USB 2.0
    (100, 8, N'USB C'),
    (100, 10, N'USB 3.0'),
    (100,  4, N'USB 2.0');
GO

PRINT 'Seed data inserted successfully.';
GO
