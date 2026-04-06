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
-- Image URL pool (gaming PCs by tier):
--   Budget1 = https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop  (simple PC)
--   Budget2 = https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop  (basic setup)
--   Budget3 = https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop  (clean desktop)
--   Mid1    = https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop  (gaming setup)
--   Mid2    = https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop  (RGB PC)
--   Mid3    = https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop  (gaming rig)
--   High1   = https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop  (RGB battlestation)
--   High2   = https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop  (premium setup)
--   Flag1   = https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop     (ultimate setup)
--   Flag2   = https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop     (premium gaming)
-- =============================================================================

INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId, Status) VALUES
    -- 1
    (N'The Archduke''s Engine',        65536,   3499.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop',  9.50, N'kg', 1200, 9,  8,  N'Active'),
    -- 2
    (N'The Emperor''s Dominion',      131072,   4999.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop', 11.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 3
    (N'The Regent''s Might',           65536,   2999.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop', 10.20, N'kg', 1000, 15, 15, N'Active'),
    -- 4
    (N'The Paladin''s Core',           32768,   1799.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  8.80, N'kg', 850,  9,  9,  N'Active'),
    -- 5
    (N'The Warden''s Watch',           16384,    999.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  7.50, N'kg', 650,  11, 11, N'Active'),
    -- 6
    (N'The Chancellor''s Decree',      32768,   1599.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',    9.00, N'kg', 750,  10, 10, N'Active'),
    -- 7
    (N'The Viceroy''s Command',        16384,   1149.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  8.30, N'kg', 700,  12, 13, N'Active'),
    -- 8
    (N'The Marshal''s Banner',          8192,    699.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',   14.00, N'lb', 550,  13, 12, N'Active'),
    -- 9
    (N'The Constable''s Keep',          4096,    449.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 11.00, N'lb', 400,  1,  3,  N'Active'),
    -- 10
    (N'The Chamberlain''s Vault',      32768,   1399.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',    7.20, N'kg', 800,  14, 14, N'Active'),
    -- 11
    (N'The Steward''s Watch',          16384,    879.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  6.80, N'kg', 600,  11, 9,  N'Active'),
    -- 12
    (N'The Banneret''s Standard',       8192,    599.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop', 13.50, N'lb', 500,  7,  2,  N'Active'),
    -- 13
    (N'The Thane''s Bastion',          32768,   1699.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.50, N'kg', 850,  12, 15, N'Active'),
    -- 14
    (N'The Liegeman''s Post',           4096,    379.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 10.00, N'lb', 350,  3,  3,  N'Active'),
    -- 15
    (N'The Seneschal''s Hall',         65536,   2499.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  9.80, N'kg', 1000, 15, 8,  N'Active'),
    -- 16
    (N'The Castellan''s Tower',        32768,   1349.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',    8.00, N'kg', 750,  10, 9,  N'Active'),
    -- 17
    (N'The Warlord''s Siege',          65536,   2799.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop', 12.00, N'kg', 1200, 9,  8,  N'Active'),
    -- 18
    (N'The Envoy''s Dispatch',          8192,    529.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',    5.50, N'kg', 450,  13, 12, N'Active'),
    -- 19
    (N'The Tribune''s Oration',        16384,    949.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  7.80, N'kg', 650,  14, 11, N'Active'),
    -- 20
    (N'The Legate''s Decree',           2048,    329.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   18.00, N'lb', 400,  2,  6,  N'Active'),
    -- 21
    (N'The Prelate''s Sanctum',        32768,   1899.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.20, N'kg', 900,  16, 10, N'Active'),
    -- 22
    (N'The Exarch''s Domain',          65536,   3199.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 10.50, N'kg', 1200, 15, 15, N'Active'),
    -- 23
    (N'The Patriarch''s Legacy',        4096,    419.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 12.00, N'lb', 400,  3,  6,  N'Active'),
    -- 24
    (N'The Prefect''s Order',           8192,    679.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',  6.20, N'kg', 550,  7,  2,  N'Active'),
    -- 25
    (N'The Tribune''s Voice',          16384,   1049.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  8.90, N'kg', 700,  11, 13, N'Active'),
    -- 26
    (N'The Praetor''s Judgment',       32768,   1549.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',    9.30, N'kg', 800,  12, 14, N'Active'),
    -- 27
    (N'The Consul''s Authority',       65536,   2699.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop', 11.50, N'kg', 1000, 16, 8,  N'Active'),
    -- 28
    (N'The Procurator''s Ledger',       8192,    589.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',   14.50, N'lb', 500,  4,  5,  N'Active'),
    -- 29
    (N'The Strategos'' Gambit',        16384,   1199.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  8.60, N'kg', 750,  14, 9,  N'Active'),
    -- 30
    (N'The Eparch''s Edict',             512,    299.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   20.00, N'lb', 350,  1,  3,  N'Active'),
    -- 31
    (N'The Archon''s Seal',            32768,   1449.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  7.70, N'kg', 800,  10, 10, N'Active'),
    -- 32
    (N'The Tyrant''s Grip',            65536,   3099.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop', 10.80, N'kg', 1200, 9,  15, N'Active'),
    -- 33
    (N'The Oligarch''s Reserve',        4096,    459.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 11.00, N'lb', 400,  2,  6,  N'Active'),
    -- 34
    (N'The Satrap''s Province',        16384,    849.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',  7.40, N'kg', 600,  6,  4,  N'Active'),
    -- 35
    (N'The Vizier''s Counsel',         32768,   1699.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.10, N'kg', 850,  12, 15, N'Active'),
    -- 36
    (N'The Sultan''s Pavilion',        65536,   2999.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',   11.20, N'kg', 1000, 15, 8,  N'Active'),
    -- 37
    (N'The Caliph''s Fortress',       131072,   4599.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 12.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 38
    (N'The Emir''s Outpost',            8192,    729.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',   15.50, N'lb', 550,  5,  5,  N'Active'),
    -- 39
    (N'The Pasha''s Enclave',          16384,   1099.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  8.30, N'kg', 700,  11, 11, N'Active'),
    -- 40
    (N'The Bey''s Crossing',            2048,    359.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',   17.00, N'lb', 380,  1,  6,  N'Active'),
    -- 41
    (N'The Shogun''s Stronghold',      65536,   3399.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop',  9.90, N'kg', 1200, 9,  8,  N'Active'),
    -- 42
    (N'The Daimyo''s Keep',            32768,   1849.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.70, N'kg', 900,  10, 10, N'Active'),
    -- 43
    (N'The Samurai''s Edge',           16384,    999.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',  7.10, N'kg', 650,  14, 14, N'Active'),
    -- 44
    (N'The Ronin''s Path',              8192,    649.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',  5.80, N'kg', 500,  13, 11, N'Active'),
    -- 45
    (N'The Ninja''s Shadow',            4096,    399.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 10.00, N'lb', 380,  3,  3,  N'Active'),
    -- 46
    (N'The Warlord''s Dominion',       65536,   2599.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',   10.00, N'kg', 1000, 15, 15, N'Active'),
    -- 47
    (N'The Chieftain''s Hearth',       16384,    879.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  8.00, N'kg', 650,  12, 13, N'Active'),
    -- 48
    (N'The Jarl''s Hall',              32768,   1499.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',    9.40, N'kg', 800,  10, 9,  N'Active'),
    -- 49
    (N'The Thegn''s Holding',           4096,    429.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 12.50, N'lb', 400,  2,  5,  N'Active'),
    -- 50
    (N'The Housecarl''s Post',          8192,    549.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   14.00, N'lb', 500,  7,  2,  N'Active'),
    -- 51
    (N'The Overlord''s Citadel',      131072,   4799.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 13.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 52
    (N'The Suzerain''s Court',         65536,   3299.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop', 11.80, N'kg', 1200, 15, 10, N'Active'),
    -- 53
    (N'The Potentate''s Chamber',      32768,   2199.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  9.10, N'kg', 900,  9,  9,  N'Active'),
    -- 54
    (N'The Magnate''s Study',          16384,   1249.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  8.40, N'kg', 750,  11, 13, N'Active'),
    -- 55
    (N'The Patrician''s Villa',         8192,    769.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',  7.20, N'kg', 600,  6,  4,  N'Active'),
    -- 56
    (N'The Centurion''s Camp',          4096,    449.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop',   11.50, N'lb', 400,  4,  6,  N'Active'),
    -- 57
    (N'The Legionnaire''s March',       8192,    619.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  6.50, N'kg', 500,  5,  5,  N'Active'),
    -- 58
    (N'The Tribune''s Rostrum',        16384,   1099.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',    9.20, N'kg', 700,  14, 12, N'Active'),
    -- 59
    (N'The Prefect''s Fortress',       32768,   1599.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.80, N'kg', 800,  12, 14, N'Active'),
    -- 60
    (N'The Praetor''s Command',        65536,   2899.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',   10.40, N'kg', 1000, 16, 15, N'Active'),
    -- 61
    (N'The Dictator''s Seat',          65536,   3599.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 12.20, N'kg', 1200, 9,  8,  N'Active'),
    -- 62
    (N'The Imperator''s Will',        131072,   4299.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop', 11.60, N'kg', 1200, 15, 8,  N'Active'),
    -- 63
    (N'The Triumvir''s Alliance',       2048,    319.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop', 19.00, N'lb', 380,  2,  3,  N'Active'),
    -- 64
    (N'The Aedile''s Square',           4096,    439.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 11.00, N'lb', 400,  3,  6,  N'Active'),
    -- 65
    (N'The Quaestor''s Treasury',       8192,    689.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',  7.00, N'kg', 550,  7,  2,  N'Active'),
    -- 66
    (N'The Censor''s Ledger',          16384,    999.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',    8.20, N'kg', 650,  11, 11, N'Active'),
    -- 67
    (N'The Pontifex''s Shrine',        32768,   1749.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  9.60, N'kg', 850,  10, 10, N'Active'),
    -- 68
    (N'The Augur''s Vision',           65536,   2799.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',   10.70, N'kg', 1000, 16, 15, N'Active'),
    -- 69
    (N'The Haruspex''s Oracle',          512,    309.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 21.00, N'lb', 360,  1,  7,  N'Active'),
    -- 70
    (N'The Flamen''s Altar',            4096,    469.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   12.00, N'lb', 420,  2,  6,  N'Active'),
    -- 71
    (N'The Vestal''s Hearth',           8192,    599.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop',  5.90, N'kg', 480,  13, 12, N'Active'),
    -- 72
    (N'The Sibyl''s Prophecy',         16384,    949.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  7.60, N'kg', 650,  14, 9,  N'Active'),
    -- 73
    (N'The Oracle''s Revelation',      32768,   1799.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  8.30, N'kg', 900,  12, 15, N'Active'),
    -- 74
    (N'The Prophet''s Ascent',         65536,   3099.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 11.40, N'kg', 1200, 9,  8,  N'Active'),
    -- 75
    (N'The Hierophant''s Mystery',      2048,    339.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop', 18.50, N'lb', 380,  3,  7,  N'Active'),
    -- 76
    (N'The Archmage''s Tower',         65536,   3749.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop',   10.10, N'kg', 1200, 15, 8,  N'Active'),
    -- 77
    (N'The Sorcerer''s Sanctum',       32768,   2049.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  8.90, N'kg', 950,  16, 10, N'Active'),
    -- 78
    (N'The Warlock''s Pact',           16384,   1199.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop',    7.50, N'kg', 750,  10, 14, N'Active'),
    -- 79
    (N'The Wizard''s Workshop',         8192,    749.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',  6.40, N'kg', 600,  11, 13, N'Active'),
    -- 80
    (N'The Conjurer''s Circle',          512,    299.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   23.00, N'lb', 350,  1,  7,  N'Active'),
    -- 81
    (N'The Enchanter''s Forge',        32768,   1649.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',  9.00, N'kg', 850,  12, 9,  N'Active'),
    -- 82
    (N'The Necromancer''s Crypt',       4096,    389.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 13.00, N'lb', 400,  4,  5,  N'Active'),
    -- 83
    (N'The Alchemist''s Lab',           8192,    579.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  6.10, N'kg', 500,  7,  11, N'Active'),
    -- 84
    (N'The Sage''s Tome',              16384,   1049.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  8.10, N'kg', 700,  14, 12, N'Active'),
    -- 85
    (N'The Scholar''s Codex',          32768,   1449.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',  8.50, N'kg', 800,  10, 15, N'Active'),
    -- 86
    (N'The Archivist''s Repository',   65536,   2499.99, N'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400&h=300&fit=crop',   10.30, N'kg', 1000, 15, 8,  N'Active'),
    -- 87
    (N'The Lorekeeper''s Vault',      131072,   4199.99, N'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=400&h=300&fit=crop', 12.80, N'kg', 1200, 16, 8,  N'Active'),
    -- 88
    (N'The Chronicler''s Annals',       4096,    409.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop',   10.50, N'lb', 400,  3,  6,  N'Active'),
    -- 89
    (N'The Scribe''s Scriptorium',      2048,    329.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop', 16.00, N'lb', 380,  2,  3,  N'Active'),
    -- 90
    (N'The Grand Sovereign''s Apex',  131072,   4999.99, N'https://images.unsplash.com/photo-1558618666-fcd25c85f82e?w=400&h=300&fit=crop',   13.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 91
    (N'The Page''s Companion',          8192,    499.99, N'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=400&h=300&fit=crop',  8.10, N'kg', 500,  1,  1,  N'New'),
    -- 92
    (N'The Squire''s Arsenal',         16384,    649.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop', 12.00, N'kg', 500,  2,  2,  N'New'),
    -- 93
    (N'The Herald''s Tower',            8192,    549.99, N'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=400&h=300&fit=crop', 16.00, N'lb', 450,  3,  3,  N'New'),
    -- 94
    (N'The Knight''s Fortress',        16384,    899.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop', 13.80, N'lb', 500,  4,  4,  N'New'),
    -- 95
    (N'The Baron''s Citadel',          32768,   1099.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  7.00, N'kg', 1000, 5,  5,  N'New'),
    -- 96
    (N'The Duke''s Sanctum',           32768,   1249.99, N'https://images.unsplash.com/photo-1593152167544-085d3b9c4938?w=400&h=300&fit=crop',    6.00, N'kg', 450,  6,  6,  N'New'),
    -- 97
    (N'The Prince''s Armory',           8192,    749.99, N'https://images.unsplash.com/photo-1625842268584-8f3296236761?w=400&h=300&fit=crop', 15.00, N'lb', 1000, 7,  4,  N'New'),
    -- 98
    (N'The Viscount''s Chamber',       16384,    599.99, N'https://images.unsplash.com/photo-1600861194942-f883de0dfe97?w=400&h=300&fit=crop',    8.00, N'lb', 750,  7,  1,  N'New'),
    -- 99
    (N'The Sovereign''s Throne',        2048,   1499.99, N'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400&h=300&fit=crop',  9.00, N'kg', 508,  8,  7,  N'New'),
    -- 100
    (N'The Court Jester''s Box',         512,    349.99, N'https://images.unsplash.com/photo-1624705002806-5d72df19c3ad?w=400&h=300&fit=crop',   22.00, N'lb', 700,  7,  5,  N'New');
GO

-- =============================================================================
-- Storage Drives
-- =============================================================================
INSERT INTO StorageDrives (ComputerId, CapacityGB, Type) VALUES
    -- 1. The Archduke's Engine: 2 TB SSD + 4 TB HDD
    (1,  2048, N'SSD'),
    (1,  4096, N'HDD'),
    -- 2. The Emperor's Dominion: 4 TB SSD + 8 TB HDD
    (2,  4096, N'SSD'),
    (2,  8192, N'HDD'),
    -- 3. The Regent's Might: 2 TB SSD + 2 TB HDD
    (3,  2048, N'SSD'),
    (3,  2048, N'HDD'),
    -- 4. The Paladin's Core: 1 TB SSD + 2 TB HDD
    (4,  1024, N'SSD'),
    (4,  2048, N'HDD'),
    -- 5. The Warden's Watch: 512 GB SSD
    (5,   512, N'SSD'),
    -- 6. The Chancellor's Decree: 1 TB SSD + 2 TB HDD
    (6,  1024, N'SSD'),
    (6,  2048, N'HDD'),
    -- 7. The Viceroy's Command: 512 GB SSD + 1 TB HDD
    (7,   512, N'SSD'),
    (7,  1024, N'HDD'),
    -- 8. The Marshal's Banner: 256 GB SSD
    (8,   256, N'SSD'),
    -- 9. The Constable's Keep: 500 GB HDD
    (9,   500, N'HDD'),
    -- 10. The Chamberlain's Vault: 2 TB SSD
    (10,  2048, N'SSD'),
    -- 11. The Steward's Watch: 512 GB SSD + 1 TB HDD
    (11,   512, N'SSD'),
    (11,  1024, N'HDD'),
    -- 12. The Banneret's Standard: 256 GB SSD
    (12,   256, N'SSD'),
    -- 13. The Thane's Bastion: 1 TB SSD + 2 TB HDD
    (13,  1024, N'SSD'),
    (13,  2048, N'HDD'),
    -- 14. The Liegeman's Post: 500 GB HDD
    (14,   500, N'HDD'),
    -- 15. The Seneschal's Hall: 2 TB SSD + 4 TB HDD
    (15,  2048, N'SSD'),
    (15,  4096, N'HDD'),
    -- 16. The Castellan's Tower: 1 TB SSD + 1 TB HDD
    (16,  1024, N'SSD'),
    (16,  1024, N'HDD'),
    -- 17. The Warlord's Siege: 4 TB SSD + 4 TB HDD
    (17,  4096, N'SSD'),
    (17,  4096, N'HDD'),
    -- 18. The Envoy's Dispatch: 128 GB SSD
    (18,   128, N'SSD'),
    -- 19. The Tribune's Oration: 512 GB SSD + 1 TB HDD
    (19,   512, N'SSD'),
    (19,  1024, N'HDD'),
    -- 20. The Legate's Decree: 500 GB HDD
    (20,   500, N'HDD'),
    -- 21. The Prelate's Sanctum: 2 TB SSD + 2 TB HDD
    (21,  2048, N'SSD'),
    (21,  2048, N'HDD'),
    -- 22. The Exarch's Domain: 4 TB SSD + 4 TB HDD
    (22,  4096, N'SSD'),
    (22,  4096, N'HDD'),
    -- 23. The Patriarch's Legacy: 500 GB HDD
    (23,   500, N'HDD'),
    -- 24. The Prefect's Order: 256 GB SSD
    (24,   256, N'SSD'),
    -- 25. The Tribune's Voice: 512 GB SSD + 1 TB HDD
    (25,   512, N'SSD'),
    (25,  1024, N'HDD'),
    -- 26. The Praetor's Judgment: 1 TB SSD + 2 TB HDD
    (26,  1024, N'SSD'),
    (26,  2048, N'HDD'),
    -- 27. The Consul's Authority: 2 TB SSD + 4 TB HDD
    (27,  2048, N'SSD'),
    (27,  4096, N'HDD'),
    -- 28. The Procurator's Ledger: 500 GB SSD
    (28,   500, N'SSD'),
    -- 29. The Strategos' Gambit: 1 TB SSD
    (29,  1024, N'SSD'),
    -- 30. The Eparch's Edict: 80 GB SSD
    (30,    80, N'SSD'),
    -- 31. The Archon's Seal: 1 TB SSD + 1 TB HDD
    (31,  1024, N'SSD'),
    (31,  1024, N'HDD'),
    -- 32. The Tyrant's Grip: 2 TB SSD + 4 TB HDD
    (32,  2048, N'SSD'),
    (32,  4096, N'HDD'),
    -- 33. The Oligarch's Reserve: 500 GB HDD
    (33,   500, N'HDD'),
    -- 34. The Satrap's Province: 512 GB SSD
    (34,   512, N'SSD'),
    -- 35. The Vizier's Counsel: 2 TB SSD
    (35,  2048, N'SSD'),
    -- 36. The Sultan's Pavilion: 2 TB SSD + 4 TB HDD
    (36,  2048, N'SSD'),
    (36,  4096, N'HDD'),
    -- 37. The Caliph's Fortress: 4 TB SSD + 8 TB HDD
    (37,  4096, N'SSD'),
    (37,  8192, N'HDD'),
    -- 38. The Emir's Outpost: 500 GB SSD
    (38,   500, N'SSD'),
    -- 39. The Pasha's Enclave: 1 TB SSD
    (39,  1024, N'SSD'),
    -- 40. The Bey's Crossing: 250 GB HDD
    (40,   250, N'HDD'),
    -- 41. The Shogun's Stronghold: 4 TB SSD + 4 TB HDD
    (41,  4096, N'SSD'),
    (41,  4096, N'HDD'),
    -- 42. The Daimyo's Keep: 2 TB SSD + 2 TB HDD
    (42,  2048, N'SSD'),
    (42,  2048, N'HDD'),
    -- 43. The Samurai's Edge: 512 GB SSD + 1 TB HDD
    (43,   512, N'SSD'),
    (43,  1024, N'HDD'),
    -- 44. The Ronin's Path: 256 GB SSD
    (44,   256, N'SSD'),
    -- 45. The Ninja's Shadow: 500 GB HDD
    (45,   500, N'HDD'),
    -- 46. The Warlord's Dominion: 2 TB SSD + 2 TB HDD
    (46,  2048, N'SSD'),
    (46,  2048, N'HDD'),
    -- 47. The Chieftain's Hearth: 1 TB SSD
    (47,  1024, N'SSD'),
    -- 48. The Jarl's Hall: 1 TB SSD + 2 TB HDD
    (48,  1024, N'SSD'),
    (48,  2048, N'HDD'),
    -- 49. The Thegn's Holding: 500 GB HDD
    (49,   500, N'HDD'),
    -- 50. The Housecarl's Post: 256 GB SSD
    (50,   256, N'SSD'),
    -- 51. The Overlord's Citadel: 4 TB SSD + 8 TB HDD
    (51,  4096, N'SSD'),
    (51,  8192, N'HDD'),
    -- 52. The Suzerain's Court: 4 TB SSD + 4 TB HDD
    (52,  4096, N'SSD'),
    (52,  4096, N'HDD'),
    -- 53. The Potentate's Chamber: 2 TB SSD + 2 TB HDD
    (53,  2048, N'SSD'),
    (53,  2048, N'HDD'),
    -- 54. The Magnate's Study: 1 TB SSD + 1 TB HDD
    (54,  1024, N'SSD'),
    (54,  1024, N'HDD'),
    -- 55. The Patrician's Villa: 512 GB SSD
    (55,   512, N'SSD'),
    -- 56. The Centurion's Camp: 500 GB HDD
    (56,   500, N'HDD'),
    -- 57. The Legionnaire's March: 500 GB SSD
    (57,   500, N'SSD'),
    -- 58. The Tribune's Rostrum: 1 TB SSD
    (58,  1024, N'SSD'),
    -- 59. The Prefect's Fortress: 1 TB SSD + 2 TB HDD
    (59,  1024, N'SSD'),
    (59,  2048, N'HDD'),
    -- 60. The Praetor's Command: 2 TB SSD + 4 TB HDD
    (60,  2048, N'SSD'),
    (60,  4096, N'HDD'),
    -- 61. The Dictator's Seat: 4 TB SSD + 4 TB HDD
    (61,  4096, N'SSD'),
    (61,  4096, N'HDD'),
    -- 62. The Imperator's Will: 4 TB SSD + 8 TB HDD
    (62,  4096, N'SSD'),
    (62,  8192, N'HDD'),
    -- 63. The Triumvir's Alliance: 250 GB HDD
    (63,   250, N'HDD'),
    -- 64. The Aedile's Square: 500 GB HDD
    (64,   500, N'HDD'),
    -- 65. The Quaestor's Treasury: 256 GB SSD
    (65,   256, N'SSD'),
    -- 66. The Censor's Ledger: 512 GB SSD
    (66,   512, N'SSD'),
    -- 67. The Pontifex's Shrine: 1 TB SSD + 2 TB HDD
    (67,  1024, N'SSD'),
    (67,  2048, N'HDD'),
    -- 68. The Augur's Vision: 2 TB SSD + 4 TB HDD
    (68,  2048, N'SSD'),
    (68,  4096, N'HDD'),
    -- 69. The Haruspex's Oracle: 80 GB SSD
    (69,    80, N'SSD'),
    -- 70. The Flamen's Altar: 500 GB HDD
    (70,   500, N'HDD'),
    -- 71. The Vestal's Hearth: 256 GB SSD
    (71,   256, N'SSD'),
    -- 72. The Sibyl's Prophecy: 512 GB SSD + 1 TB HDD
    (72,   512, N'SSD'),
    (72,  1024, N'HDD'),
    -- 73. The Oracle's Revelation: 2 TB SSD
    (73,  2048, N'SSD'),
    -- 74. The Prophet's Ascent: 2 TB SSD + 4 TB HDD
    (74,  2048, N'SSD'),
    (74,  4096, N'HDD'),
    -- 75. The Hierophant's Mystery: 250 GB HDD
    (75,   250, N'HDD'),
    -- 76. The Archmage's Tower: 4 TB SSD + 4 TB HDD
    (76,  4096, N'SSD'),
    (76,  4096, N'HDD'),
    -- 77. The Sorcerer's Sanctum: 2 TB SSD + 2 TB HDD
    (77,  2048, N'SSD'),
    (77,  2048, N'HDD'),
    -- 78. The Warlock's Pact: 1 TB SSD + 1 TB HDD
    (78,  1024, N'SSD'),
    (78,  1024, N'HDD'),
    -- 79. The Wizard's Workshop: 512 GB SSD
    (79,   512, N'SSD'),
    -- 80. The Conjurer's Circle: 80 GB SSD
    (80,    80, N'SSD'),
    -- 81. The Enchanter's Forge: 1 TB SSD + 2 TB HDD
    (81,  1024, N'SSD'),
    (81,  2048, N'HDD'),
    -- 82. The Necromancer's Crypt: 500 GB HDD
    (82,   500, N'HDD'),
    -- 83. The Alchemist's Lab: 256 GB SSD
    (83,   256, N'SSD'),
    -- 84. The Sage's Tome: 1 TB SSD
    (84,  1024, N'SSD'),
    -- 85. The Scholar's Codex: 1 TB SSD + 2 TB HDD
    (85,  1024, N'SSD'),
    (85,  2048, N'HDD'),
    -- 86. The Archivist's Repository: 2 TB SSD + 4 TB HDD
    (86,  2048, N'SSD'),
    (86,  4096, N'HDD'),
    -- 87. The Lorekeeper's Vault: 4 TB SSD + 8 TB HDD
    (87,  4096, N'SSD'),
    (87,  8192, N'HDD'),
    -- 88. The Chronicler's Annals: 500 GB HDD
    (88,   500, N'HDD'),
    -- 89. The Scribe's Scriptorium: 250 GB HDD
    (89,   250, N'HDD'),
    -- 90. The Grand Sovereign's Apex: 4 TB SSD + 8 TB HDD
    (90, 4096, N'SSD'),
    (90, 8192, N'HDD'),
    -- 91. The Page's Companion
    (91,   1024, N'SSD'),
    -- 92. The Squire's Arsenal
    (92,   2048, N'HDD'),
    -- 93. The Herald's Tower
    (93,   3072, N'HDD'),
    -- 94. The Knight's Fortress
    (94,   4096, N'HDD'),
    -- 95. The Baron's Citadel
    (95,    750, N'SSD'),
    -- 96. The Duke's Sanctum
    (96,   2048, N'SSD'),
    -- 97. The Prince's Armory
    (97,   2048, N'HDD'),
    -- 98. The Viscount's Chamber
    (98,    500, N'SSD'),
    -- 99. The Sovereign's Throne
    (99,   2048, N'HDD'),
    -- 100. The Court Jester's Box
    (100,    80, N'SSD');
GO

-- =============================================================================
-- USB Ports
-- =============================================================================
INSERT INTO UsbPorts (ComputerId, Count, UsbType) VALUES
    -- 1. The Archduke's Engine: 4x USB-C + 6x USB 3.0
    (1,  4, N'USB-C'),
    (1,  6, N'USB 3.0'),
    -- 2. The Emperor's Dominion: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (2,  6, N'USB-C'),
    (2,  8, N'USB 3.0'),
    (2,  2, N'USB 2.0'),
    -- 3. The Regent's Might: 4x USB-C + 6x USB 3.0
    (3,  4, N'USB-C'),
    (3,  6, N'USB 3.0'),
    -- 4. The Paladin's Core: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (4,  2, N'USB-C'),
    (4,  4, N'USB 3.0'),
    (4,  2, N'USB 2.0'),
    -- 5. The Warden's Watch: 2x USB-C + 4x USB 3.0
    (5,  2, N'USB-C'),
    (5,  4, N'USB 3.0'),
    -- 6. The Chancellor's Decree: 3x USB-C + 5x USB 3.0 + 2x USB 2.0
    (6,  3, N'USB-C'),
    (6,  5, N'USB 3.0'),
    (6,  2, N'USB 2.0'),
    -- 7. The Viceroy's Command: 2x USB-C + 4x USB 3.0
    (7,  2, N'USB-C'),
    (7,  4, N'USB 3.0'),
    -- 8. The Marshal's Banner: 2x USB 3.0 + 4x USB 2.0
    (8,  2, N'USB 3.0'),
    (8,  4, N'USB 2.0'),
    -- 9. The Constable's Keep: 4x USB 2.0
    (9,  4, N'USB 2.0'),
    -- 10. The Chamberlain's Vault: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (10,  2, N'USB-C'),
    (10,  4, N'USB 3.0'),
    (10,  2, N'USB 2.0'),
    -- 11. The Steward's Watch: 1x USB-C + 3x USB 3.0 + 2x USB 2.0
    (11,  1, N'USB-C'),
    (11,  3, N'USB 3.0'),
    (11,  2, N'USB 2.0'),
    -- 12. The Banneret's Standard: 2x USB 3.0 + 4x USB 2.0
    (12,  2, N'USB 3.0'),
    (12,  4, N'USB 2.0'),
    -- 13. The Thane's Bastion: 2x USB-C + 6x USB 3.0
    (13,  2, N'USB-C'),
    (13,  6, N'USB 3.0'),
    -- 14. The Liegeman's Post: 2x USB 2.0 + 2x USB 3.0
    (14,  2, N'USB 2.0'),
    (14,  2, N'USB 3.0'),
    -- 15. The Seneschal's Hall: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (15,  4, N'USB-C'),
    (15,  6, N'USB 3.0'),
    (15,  2, N'USB 2.0'),
    -- 16. The Castellan's Tower: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (16,  2, N'USB-C'),
    (16,  4, N'USB 3.0'),
    (16,  2, N'USB 2.0'),
    -- 17. The Warlord's Siege: 6x USB-C + 8x USB 3.0
    (17,  6, N'USB-C'),
    (17,  8, N'USB 3.0'),
    -- 18. The Envoy's Dispatch: 1x USB-C + 2x USB 3.0
    (18,  1, N'USB-C'),
    (18,  2, N'USB 3.0'),
    -- 19. The Tribune's Oration: 2x USB-C + 4x USB 3.0
    (19,  2, N'USB-C'),
    (19,  4, N'USB 3.0'),
    -- 20. The Legate's Decree: 2x USB 2.0 + 2x USB 3.0
    (20,  2, N'USB 2.0'),
    (20,  2, N'USB 3.0'),
    -- 21. The Prelate's Sanctum: 4x USB-C + 4x USB 3.0 + 2x USB 2.0
    (21,  4, N'USB-C'),
    (21,  4, N'USB 3.0'),
    (21,  2, N'USB 2.0'),
    -- 22. The Exarch's Domain: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (22,  4, N'USB-C'),
    (22,  6, N'USB 3.0'),
    (22,  2, N'USB 2.0'),
    -- 23. The Patriarch's Legacy: 4x USB 2.0 + 2x USB 3.0
    (23,  4, N'USB 2.0'),
    (23,  2, N'USB 3.0'),
    -- 24. The Prefect's Order: 2x USB 3.0 + 2x USB 2.0
    (24,  2, N'USB 3.0'),
    (24,  2, N'USB 2.0'),
    -- 25. The Tribune's Voice: 2x USB-C + 4x USB 3.0
    (25,  2, N'USB-C'),
    (25,  4, N'USB 3.0'),
    -- 26. The Praetor's Judgment: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (26,  2, N'USB-C'),
    (26,  4, N'USB 3.0'),
    (26,  2, N'USB 2.0'),
    -- 27. The Consul's Authority: 4x USB-C + 6x USB 3.0
    (27,  4, N'USB-C'),
    (27,  6, N'USB 3.0'),
    -- 28. The Procurator's Ledger: 4x USB 3.0 + 4x USB 2.0
    (28,  4, N'USB 3.0'),
    (28,  4, N'USB 2.0'),
    -- 29. The Strategos' Gambit: 2x USB-C + 4x USB 3.0
    (29,  2, N'USB-C'),
    (29,  4, N'USB 3.0'),
    -- 30. The Eparch's Edict: 4x USB 2.0
    (30,  4, N'USB 2.0'),
    -- 31. The Archon's Seal: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (31,  2, N'USB-C'),
    (31,  4, N'USB 3.0'),
    (31,  2, N'USB 2.0'),
    -- 32. The Tyrant's Grip: 6x USB-C + 6x USB 3.0
    (32,  6, N'USB-C'),
    (32,  6, N'USB 3.0'),
    -- 33. The Oligarch's Reserve: 4x USB 2.0 + 2x USB 3.0
    (33,  4, N'USB 2.0'),
    (33,  2, N'USB 3.0'),
    -- 34. The Satrap's Province: 2x USB-C + 4x USB 3.0
    (34,  2, N'USB-C'),
    (34,  4, N'USB 3.0'),
    -- 35. The Vizier's Counsel: 4x USB-C + 4x USB 3.0
    (35,  4, N'USB-C'),
    (35,  4, N'USB 3.0'),
    -- 36. The Sultan's Pavilion: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (36,  4, N'USB-C'),
    (36,  6, N'USB 3.0'),
    (36,  2, N'USB 2.0'),
    -- 37. The Caliph's Fortress: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (37,  6, N'USB-C'),
    (37,  8, N'USB 3.0'),
    (37,  2, N'USB 2.0'),
    -- 38. The Emir's Outpost: 2x USB-C + 4x USB 3.0
    (38,  2, N'USB-C'),
    (38,  4, N'USB 3.0'),
    -- 39. The Pasha's Enclave: 2x USB-C + 4x USB 3.0
    (39,  2, N'USB-C'),
    (39,  4, N'USB 3.0'),
    -- 40. The Bey's Crossing: 2x USB 2.0 + 2x USB 3.0
    (40,  2, N'USB 2.0'),
    (40,  2, N'USB 3.0'),
    -- 41. The Shogun's Stronghold: 6x USB-C + 8x USB 3.0
    (41,  6, N'USB-C'),
    (41,  8, N'USB 3.0'),
    -- 42. The Daimyo's Keep: 4x USB-C + 4x USB 3.0 + 2x USB 2.0
    (42,  4, N'USB-C'),
    (42,  4, N'USB 3.0'),
    (42,  2, N'USB 2.0'),
    -- 43. The Samurai's Edge: 2x USB-C + 4x USB 3.0
    (43,  2, N'USB-C'),
    (43,  4, N'USB 3.0'),
    -- 44. The Ronin's Path: 2x USB 3.0 + 2x USB 2.0
    (44,  2, N'USB 3.0'),
    (44,  2, N'USB 2.0'),
    -- 45. The Ninja's Shadow: 4x USB 2.0
    (45,  4, N'USB 2.0'),
    -- 46. The Warlord's Dominion: 4x USB-C + 6x USB 3.0
    (46,  4, N'USB-C'),
    (46,  6, N'USB 3.0'),
    -- 47. The Chieftain's Hearth: 2x USB-C + 4x USB 3.0
    (47,  2, N'USB-C'),
    (47,  4, N'USB 3.0'),
    -- 48. The Jarl's Hall: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (48,  2, N'USB-C'),
    (48,  4, N'USB 3.0'),
    (48,  2, N'USB 2.0'),
    -- 49. The Thegn's Holding: 2x USB 2.0 + 2x USB 3.0
    (49,  2, N'USB 2.0'),
    (49,  2, N'USB 3.0'),
    -- 50. The Housecarl's Post: 2x USB 3.0 + 4x USB 2.0
    (50,  2, N'USB 3.0'),
    (50,  4, N'USB 2.0'),
    -- 51. The Overlord's Citadel: 6x USB-C + 8x USB 3.0 + 4x USB 2.0
    (51,  6, N'USB-C'),
    (51,  8, N'USB 3.0'),
    (51,  4, N'USB 2.0'),
    -- 52. The Suzerain's Court: 6x USB-C + 6x USB 3.0 + 2x USB 2.0
    (52,  6, N'USB-C'),
    (52,  6, N'USB 3.0'),
    (52,  2, N'USB 2.0'),
    -- 53. The Potentate's Chamber: 4x USB-C + 6x USB 3.0
    (53,  4, N'USB-C'),
    (53,  6, N'USB 3.0'),
    -- 54. The Magnate's Study: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (54,  2, N'USB-C'),
    (54,  4, N'USB 3.0'),
    (54,  2, N'USB 2.0'),
    -- 55. The Patrician's Villa: 2x USB-C + 4x USB 3.0
    (55,  2, N'USB-C'),
    (55,  4, N'USB 3.0'),
    -- 56. The Centurion's Camp: 4x USB 2.0 + 2x USB 3.0
    (56,  4, N'USB 2.0'),
    (56,  2, N'USB 3.0'),
    -- 57. The Legionnaire's March: 2x USB-C + 4x USB 3.0
    (57,  2, N'USB-C'),
    (57,  4, N'USB 3.0'),
    -- 58. The Tribune's Rostrum: 2x USB-C + 4x USB 3.0
    (58,  2, N'USB-C'),
    (58,  4, N'USB 3.0'),
    -- 59. The Prefect's Fortress: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (59,  2, N'USB-C'),
    (59,  4, N'USB 3.0'),
    (59,  2, N'USB 2.0'),
    -- 60. The Praetor's Command: 4x USB-C + 6x USB 3.0
    (60,  4, N'USB-C'),
    (60,  6, N'USB 3.0'),
    -- 61. The Dictator's Seat: 6x USB-C + 8x USB 3.0
    (61,  6, N'USB-C'),
    (61,  8, N'USB 3.0'),
    -- 62. The Imperator's Will: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (62,  6, N'USB-C'),
    (62,  8, N'USB 3.0'),
    (62,  2, N'USB 2.0'),
    -- 63. The Triumvir's Alliance: 4x USB 2.0 + 2x USB 3.0
    (63,  4, N'USB 2.0'),
    (63,  2, N'USB 3.0'),
    -- 64. The Aedile's Square: 4x USB 2.0 + 2x USB 3.0
    (64,  4, N'USB 2.0'),
    (64,  2, N'USB 3.0'),
    -- 65. The Quaestor's Treasury: 2x USB 3.0 + 4x USB 2.0
    (65,  2, N'USB 3.0'),
    (65,  4, N'USB 2.0'),
    -- 66. The Censor's Ledger: 2x USB-C + 4x USB 3.0
    (66,  2, N'USB-C'),
    (66,  4, N'USB 3.0'),
    -- 67. The Pontifex's Shrine: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (67,  2, N'USB-C'),
    (67,  4, N'USB 3.0'),
    (67,  2, N'USB 2.0'),
    -- 68. The Augur's Vision: 4x USB-C + 6x USB 3.0
    (68,  4, N'USB-C'),
    (68,  6, N'USB 3.0'),
    -- 69. The Haruspex's Oracle: 4x USB 2.0
    (69,  4, N'USB 2.0'),
    -- 70. The Flamen's Altar: 4x USB 2.0 + 2x USB 3.0
    (70,  4, N'USB 2.0'),
    (70,  2, N'USB 3.0'),
    -- 71. The Vestal's Hearth: 1x USB-C + 2x USB 3.0
    (71,  1, N'USB-C'),
    (71,  2, N'USB 3.0'),
    -- 72. The Sibyl's Prophecy: 2x USB-C + 4x USB 3.0
    (72,  2, N'USB-C'),
    (72,  4, N'USB 3.0'),
    -- 73. The Oracle's Revelation: 4x USB-C + 4x USB 3.0
    (73,  4, N'USB-C'),
    (73,  4, N'USB 3.0'),
    -- 74. The Prophet's Ascent: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (74,  4, N'USB-C'),
    (74,  6, N'USB 3.0'),
    (74,  2, N'USB 2.0'),
    -- 75. The Hierophant's Mystery: 4x USB 2.0 + 2x USB 3.0
    (75,  4, N'USB 2.0'),
    (75,  2, N'USB 3.0'),
    -- 76. The Archmage's Tower: 6x USB-C + 8x USB 3.0
    (76,  6, N'USB-C'),
    (76,  8, N'USB 3.0'),
    -- 77. The Sorcerer's Sanctum: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (77,  4, N'USB-C'),
    (77,  6, N'USB 3.0'),
    (77,  2, N'USB 2.0'),
    -- 78. The Warlock's Pact: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (78,  2, N'USB-C'),
    (78,  4, N'USB 3.0'),
    (78,  2, N'USB 2.0'),
    -- 79. The Wizard's Workshop: 2x USB-C + 4x USB 3.0
    (79,  2, N'USB-C'),
    (79,  4, N'USB 3.0'),
    -- 80. The Conjurer's Circle: 4x USB 2.0
    (80,  4, N'USB 2.0'),
    -- 81. The Enchanter's Forge: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (81,  2, N'USB-C'),
    (81,  4, N'USB 3.0'),
    (81,  2, N'USB 2.0'),
    -- 82. The Necromancer's Crypt: 4x USB 2.0 + 2x USB 3.0
    (82,  4, N'USB 2.0'),
    (82,  2, N'USB 3.0'),
    -- 83. The Alchemist's Lab: 1x USB-C + 2x USB 3.0 + 2x USB 2.0
    (83,  1, N'USB-C'),
    (83,  2, N'USB 3.0'),
    (83,  2, N'USB 2.0'),
    -- 84. The Sage's Tome: 2x USB-C + 4x USB 3.0
    (84,  2, N'USB-C'),
    (84,  4, N'USB 3.0'),
    -- 85. The Scholar's Codex: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (85,  2, N'USB-C'),
    (85,  4, N'USB 3.0'),
    (85,  2, N'USB 2.0'),
    -- 86. The Archivist's Repository: 4x USB-C + 6x USB 3.0
    (86,  4, N'USB-C'),
    (86,  6, N'USB 3.0'),
    -- 87. The Lorekeeper's Vault: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (87,  6, N'USB-C'),
    (87,  8, N'USB 3.0'),
    (87,  2, N'USB 2.0'),
    -- 88. The Chronicler's Annals: 4x USB 2.0 + 2x USB 3.0
    (88,  4, N'USB 2.0'),
    (88,  2, N'USB 3.0'),
    -- 89. The Scribe's Scriptorium: 2x USB 2.0 + 2x USB 3.0
    (89,  2, N'USB 2.0'),
    (89,  2, N'USB 3.0'),
    -- 90. The Grand Sovereign's Apex: 8x USB-C + 10x USB 3.0 + 4x USB 2.0
    (90, 8, N'USB-C'),
    (90, 10, N'USB 3.0'),
    (90,  4, N'USB 2.0'),
    -- 91. The Page's Companion: 2x USB 3.0 + 4x USB 2.0
    (91,  2, N'USB 3.0'),
    (91,  4, N'USB 2.0'),
    -- 92. The Squire's Arsenal: 3x USB 3.0 + 4x USB 2.0
    (92,  3, N'USB 3.0'),
    (92,  4, N'USB 2.0'),
    -- 93. The Herald's Tower: 4x USB 3.0 + 4x USB 2.0
    (93,  4, N'USB 3.0'),
    (93,  4, N'USB 2.0'),
    -- 94. The Knight's Fortress: 5x USB 2.0 + 4x USB 3.0
    (94,  5, N'USB 2.0'),
    (94,  4, N'USB 3.0'),
    -- 95. The Baron's Citadel: 2x USB 3.0 + 2x USB 2.0 + 1x USB-C
    (95,  2, N'USB 3.0'),
    (95,  2, N'USB 2.0'),
    (95,  1, N'USB-C'),
    -- 96. The Duke's Sanctum: 2x USB-C + 4x USB 3.0
    (96,  2, N'USB-C'),
    (96,  4, N'USB 3.0'),
    -- 97. The Prince's Armory: 8x USB 3.0
    (97,  8, N'USB 3.0'),
    -- 98. The Viscount's Chamber: 4x USB 2.0
    (98,  4, N'USB 2.0'),
    -- 99. The Sovereign's Throne: 10x USB 3.0 + 10x USB 2.0 + 10x USB-C
    (99,  10, N'USB 3.0'),
    (99,  10, N'USB 2.0'),
    (99,  10, N'USB-C'),
    -- 100. The Court Jester's Box: 19x USB 3.0 + 4x USB 2.0
    (100, 19, N'USB 3.0'),
    (100,  4, N'USB 2.0');
GO

PRINT 'Seed data inserted successfully.';
GO
