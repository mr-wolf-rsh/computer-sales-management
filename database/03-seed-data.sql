-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Seed Data
-- =============================================================================
-- Inserts 100 computers with gaming/tech-themed names.
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
-- Image URL pool (gaming PCs by tier, all via picsum.photos):
--   Budget  = https://picsum.photos/seed/budget-{N}/400/300   (price < $500)
--   Mid     = https://picsum.photos/seed/mid-{N}/400/300      (price $500-$1499)
--   High    = https://picsum.photos/seed/high-{N}/400/300     (price $1500-$2999)
--   Flagship= https://picsum.photos/seed/flag-{N}/400/300     (price $3000+)
-- =============================================================================

INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId, Status) VALUES
    -- 1
    (N'The Phoenix''s Blaze',           65536,   3499.99, N'https://picsum.photos/seed/flag-1/400/300',   9.50, N'kg', 1200, 9,  8,  N'Active'),
    -- 2
    (N'The Dragon''s Hoard',           131072,   4999.99, N'https://picsum.photos/seed/flag-2/400/300',  11.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 3
    (N'The Titan''s Resolve',           65536,   2999.99, N'https://picsum.photos/seed/high-1/400/300',  10.20, N'kg', 1000, 15, 15, N'Active'),
    -- 4
    (N'The Griffin''s Talon',           32768,   1799.99, N'https://picsum.photos/seed/high-2/400/300',   8.80, N'kg', 850,  9,  9,  N'Active'),
    -- 5
    (N'The Pulsar''s Drift',            16384,    999.99, N'https://picsum.photos/seed/mid-1/400/300',    7.50, N'kg', 650,  11, 11, N'Active'),
    -- 6
    (N'The Nebula''s Core',             32768,   1599.99, N'https://picsum.photos/seed/high-3/400/300',   9.00, N'kg', 750,  10, 10, N'Active'),
    -- 7
    (N'The Quasar''s Pulse',            16384,   1149.99, N'https://picsum.photos/seed/mid-2/400/300',    8.30, N'kg', 700,  12, 13, N'Active'),
    -- 8
    (N'The Comet''s Trail',              8192,    699.99, N'https://picsum.photos/seed/mid-3/400/300',   14.00, N'lb', 550,  13, 12, N'Active'),
    -- 9
    (N'The Vortex''s Edge',              4096,    449.99, N'https://picsum.photos/seed/budget-1/400/300', 11.00, N'lb', 400,  1,  3,  N'Active'),
    -- 10
    (N'The Hydra''s Strike',            32768,   1399.99, N'https://picsum.photos/seed/mid-4/400/300',    7.20, N'kg', 800,  14, 14, N'Active'),
    -- 11
    (N'The Nova''s Burst',              16384,    879.99, N'https://picsum.photos/seed/mid-5/400/300',    6.80, N'kg', 600,  11, 9,  N'Active'),
    -- 12
    (N'The Turbo''s Rush',               8192,    599.99, N'https://picsum.photos/seed/mid-6/400/300',   13.50, N'lb', 500,  7,  2,  N'Active'),
    -- 13
    (N'The Kraken''s Depth',            32768,   1699.99, N'https://picsum.photos/seed/high-4/400/300',   8.50, N'kg', 850,  12, 15, N'Active'),
    -- 14
    (N'The Pixel''s Dream',              4096,    379.99, N'https://picsum.photos/seed/budget-2/400/300', 10.00, N'lb', 350,  3,  3,  N'Active'),
    -- 15
    (N'The Thunderbolt''s Path',        65536,   2499.99, N'https://picsum.photos/seed/high-5/400/300',   9.80, N'kg', 1000, 15, 8,  N'Active'),
    -- 16
    (N'The Phantom''s Ghost',           32768,   1349.99, N'https://picsum.photos/seed/mid-7/400/300',    8.00, N'kg', 750,  10, 9,  N'Active'),
    -- 17
    (N'The Inferno''s Wrath',           65536,   2799.99, N'https://picsum.photos/seed/high-6/400/300',  12.00, N'kg', 1200, 9,  8,  N'Active'),
    -- 18
    (N'The Nitro''s Ignition',           8192,    529.99, N'https://picsum.photos/seed/mid-8/400/300',    5.50, N'kg', 450,  13, 12, N'Active'),
    -- 19
    (N'The Eclipse''s Shadow',          16384,    949.99, N'https://picsum.photos/seed/mid-9/400/300',    7.80, N'kg', 650,  14, 11, N'Active'),
    -- 20
    (N'The Glacial''s Freeze',           2048,    329.99, N'https://picsum.photos/seed/budget-3/400/300', 18.00, N'lb', 400,  2,  6,  N'Active'),
    -- 21
    (N'The Sentinel''s Vigil',          32768,   1899.99, N'https://picsum.photos/seed/high-7/400/300',   8.20, N'kg', 900,  16, 10, N'Active'),
    -- 22
    (N'The Warlock''s Seal',            65536,   3199.99, N'https://picsum.photos/seed/flag-3/400/300',  10.50, N'kg', 1200, 15, 15, N'Active'),
    -- 23
    (N'The Cipher''s Lock',              4096,    419.99, N'https://picsum.photos/seed/budget-4/400/300', 12.00, N'lb', 400,  3,  6,  N'Active'),
    -- 24
    (N'The Respawn''s Rise',             8192,    679.99, N'https://picsum.photos/seed/mid-10/400/300',   6.20, N'kg', 550,  7,  2,  N'Active'),
    -- 25
    (N'The Storm''s Eye',               16384,   1049.99, N'https://picsum.photos/seed/mid-11/400/300',   8.90, N'kg', 700,  11, 13, N'Active'),
    -- 26
    (N'The Berserker''s Fury',          32768,   1549.99, N'https://picsum.photos/seed/high-8/400/300',   9.30, N'kg', 800,  12, 14, N'Active'),
    -- 27
    (N'The Gladiator''s Arena',         65536,   2699.99, N'https://picsum.photos/seed/high-9/400/300',  11.50, N'kg', 1000, 16, 8,  N'Active'),
    -- 28
    (N'The Overclock''s Peak',           8192,    589.99, N'https://picsum.photos/seed/mid-12/400/300',  14.50, N'lb', 500,  4,  5,  N'Active'),
    -- 29
    (N'The Ranger''s Aim',              16384,   1199.99, N'https://picsum.photos/seed/mid-13/400/300',   8.60, N'kg', 750,  14, 9,  N'Active'),
    -- 30
    (N'The Static''s Spark',             2048,    299.99, N'https://picsum.photos/seed/budget-5/400/300', 20.00, N'lb', 350,  1,  3,  N'Active'),
    -- 31
    (N'The Paladin''s Oath',            32768,   1449.99, N'https://picsum.photos/seed/mid-14/400/300',   7.70, N'kg', 800,  10, 10, N'Active'),
    -- 32
    (N'The Leviathan''s Wake',          65536,   3099.99, N'https://picsum.photos/seed/flag-4/400/300',  10.80, N'kg', 1200, 9,  15, N'Active'),
    -- 33
    (N'The Ember''s Glow',               4096,    459.99, N'https://picsum.photos/seed/budget-6/400/300', 11.00, N'lb', 400,  2,  6,  N'Active'),
    -- 34
    (N'The Cyclone''s Spin',            16384,    849.99, N'https://picsum.photos/seed/mid-15/400/300',   7.40, N'kg', 600,  6,  4,  N'Active'),
    -- 35
    (N'The Wraith''s Haunt',            32768,   1699.99, N'https://picsum.photos/seed/high-10/400/300',  8.10, N'kg', 850,  12, 15, N'Active'),
    -- 36
    (N'The Colossus''s Might',          65536,   2999.99, N'https://picsum.photos/seed/high-11/400/300', 11.20, N'kg', 1000, 15, 8,  N'Active'),
    -- 37
    (N'The Supernova''s Flash',        131072,   4599.99, N'https://picsum.photos/seed/flag-5/400/300',  12.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 38
    (N'The Blizzard''s Chill',           8192,    729.99, N'https://picsum.photos/seed/mid-16/400/300',  15.50, N'lb', 550,  5,  5,  N'Active'),
    -- 39
    (N'The Viper''s Bite',              16384,   1099.99, N'https://picsum.photos/seed/mid-17/400/300',   8.30, N'kg', 700,  11, 11, N'Active'),
    -- 40
    (N'The Pixel''s Flux',               2048,    359.99, N'https://picsum.photos/seed/budget-7/400/300', 17.00, N'lb', 400,  1,  6,  N'Active'),
    -- 41
    (N'The Basilisk''s Gaze',           65536,   3399.99, N'https://picsum.photos/seed/flag-6/400/300',   9.90, N'kg', 1200, 9,  8,  N'Active'),
    -- 42
    (N'The Manticore''s Roar',          32768,   1849.99, N'https://picsum.photos/seed/high-12/400/300',  8.70, N'kg', 900,  10, 10, N'Active'),
    -- 43
    (N'The Specter''s Veil',            16384,    999.99, N'https://picsum.photos/seed/mid-18/400/300',   7.10, N'kg', 650,  14, 14, N'Active'),
    -- 44
    (N'The Rogue''s Gambit',             8192,    649.99, N'https://picsum.photos/seed/mid-19/400/300',   5.80, N'kg', 500,  13, 11, N'Active'),
    -- 45
    (N'The Cipher''s Vault',             4096,    399.99, N'https://picsum.photos/seed/budget-8/400/300', 10.00, N'lb', 400,  3,  3,  N'Active'),
    -- 46
    (N'The Chimera''s Form',            65536,   2599.99, N'https://picsum.photos/seed/high-13/400/300', 10.00, N'kg', 1000, 15, 15, N'Active'),
    -- 47
    (N'The Warden''s Crest',            16384,    879.99, N'https://picsum.photos/seed/mid-20/400/300',   8.00, N'kg', 650,  12, 13, N'Active'),
    -- 48
    (N'The Valkyrie''s Call',           32768,   1499.99, N'https://picsum.photos/seed/mid-21/400/300',   9.40, N'kg', 800,  10, 9,  N'Active'),
    -- 49
    (N'The Vector''s Path',              4096,    429.99, N'https://picsum.photos/seed/budget-9/400/300', 12.50, N'lb', 400,  2,  5,  N'Active'),
    -- 50
    (N'The Drifter''s Mark',             8192,    549.99, N'https://picsum.photos/seed/mid-22/400/300',  14.00, N'lb', 500,  7,  2,  N'Active'),
    -- 51
    (N'The Olympus''s Peak',           131072,   4799.99, N'https://picsum.photos/seed/flag-7/400/300',  13.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 52
    (N'The Rift''s Collapse',           65536,   3299.99, N'https://picsum.photos/seed/flag-8/400/300',  11.80, N'kg', 1200, 15, 10, N'Active'),
    -- 53
    (N'The Behemoth''s Charge',         32768,   2199.99, N'https://picsum.photos/seed/high-14/400/300',  9.10, N'kg', 900,  9,  9,  N'Active'),
    -- 54
    (N'The Stryker''s Mark',            16384,   1249.99, N'https://picsum.photos/seed/mid-23/400/300',   8.40, N'kg', 750,  11, 13, N'Active'),
    -- 55
    (N'The Lynx''s Leap',                8192,    769.99, N'https://picsum.photos/seed/mid-24/400/300',   7.20, N'kg', 600,  6,  4,  N'Active'),
    -- 56
    (N'The Goblin''s Cache',             4096,    449.99, N'https://picsum.photos/seed/budget-10/400/300', 11.50, N'lb', 400,  4,  6,  N'Active'),
    -- 57
    (N'The Frost''s Bite',               8192,    619.99, N'https://picsum.photos/seed/mid-25/400/300',   6.50, N'kg', 500,  5,  5,  N'Active'),
    -- 58
    (N'The Apex''s Throne',             16384,   1099.99, N'https://picsum.photos/seed/mid-26/400/300',   9.20, N'kg', 700,  14, 12, N'Active'),
    -- 59
    (N'The Tempest''s Fury',            32768,   1599.99, N'https://picsum.photos/seed/high-15/400/300',  8.80, N'kg', 800,  12, 14, N'Active'),
    -- 60
    (N'The Abyss''s Call',              65536,   2899.99, N'https://picsum.photos/seed/high-16/400/300', 10.40, N'kg', 1000, 16, 15, N'Active'),
    -- 61
    (N'The Raptor''s Dive',             65536,   3599.99, N'https://picsum.photos/seed/flag-9/400/300',  12.20, N'kg', 1200, 9,  8,  N'Active'),
    -- 62
    (N'The Wyvern''s Wing',            131072,   4299.99, N'https://picsum.photos/seed/flag-10/400/300', 11.60, N'kg', 1200, 15, 8,  N'Active'),
    -- 63
    (N'The Glitch''s Echo',              2048,    319.99, N'https://picsum.photos/seed/budget-11/400/300', 19.00, N'lb', 400,  2,  3,  N'Active'),
    -- 64
    (N'The Rune''s Glyph',               4096,    439.99, N'https://picsum.photos/seed/budget-12/400/300', 11.00, N'lb', 400,  3,  6,  N'Active'),
    -- 65
    (N'The Surge''s Wave',               8192,    689.99, N'https://picsum.photos/seed/mid-27/400/300',   7.00, N'kg', 550,  7,  2,  N'Active'),
    -- 66
    (N'The Mirage''s Veil',             16384,    999.99, N'https://picsum.photos/seed/mid-28/400/300',   8.20, N'kg', 650,  11, 11, N'Active'),
    -- 67
    (N'The Cerberus''s Guard',          32768,   1749.99, N'https://picsum.photos/seed/high-17/400/300',  9.60, N'kg', 850,  10, 10, N'Active'),
    -- 68
    (N'The Pulsar''s Storm',            65536,   2799.99, N'https://picsum.photos/seed/high-18/400/300', 10.70, N'kg', 1000, 16, 15, N'Active'),
    -- 69
    (N'The Byte''s Ghost',               2048,    309.99, N'https://picsum.photos/seed/budget-13/400/300', 21.00, N'lb', 350,  1,  7,  N'Active'),
    -- 70
    (N'The Spark''s Ignite',             4096,    469.99, N'https://picsum.photos/seed/budget-14/400/300', 12.00, N'lb', 400,  2,  6,  N'Active'),
    -- 71
    (N'The Neon''s Grid',                8192,    599.99, N'https://picsum.photos/seed/mid-29/400/300',   5.90, N'kg', 500,  13, 12, N'Active'),
    -- 72
    (N'The Aurora''s Glow',             16384,    949.99, N'https://picsum.photos/seed/mid-30/400/300',   7.60, N'kg', 650,  14, 9,  N'Active'),
    -- 73
    (N'The Titan''s Fist',              32768,   1799.99, N'https://picsum.photos/seed/high-19/400/300',  8.30, N'kg', 900,  12, 15, N'Active'),
    -- 74
    (N'The Andromeda''s Light',         65536,   3099.99, N'https://picsum.photos/seed/flag-11/400/300', 11.40, N'kg', 1200, 9,  8,  N'Active'),
    -- 75
    (N'The Nano''s Drift',               2048,    339.99, N'https://picsum.photos/seed/budget-15/400/300', 18.50, N'lb', 400,  3,  7,  N'Active'),
    -- 76
    (N'The Goliath''s Stride',          65536,   3749.99, N'https://picsum.photos/seed/flag-12/400/300', 10.10, N'kg', 1200, 15, 8,  N'Active'),
    -- 77
    (N'The Photon''s Beam',             32768,   2049.99, N'https://picsum.photos/seed/high-20/400/300',  8.90, N'kg', 950,  16, 10, N'Active'),
    -- 78
    (N'The Specter''s Hunt',            16384,   1199.99, N'https://picsum.photos/seed/mid-31/400/300',   7.50, N'kg', 750,  10, 14, N'Active'),
    -- 79
    (N'The Nexus''s Link',               8192,    749.99, N'https://picsum.photos/seed/mid-32/400/300',   6.40, N'kg', 600,  11, 13, N'Active'),
    -- 80
    (N'The Ion''s Charge',               2048,    299.99, N'https://picsum.photos/seed/budget-16/400/300', 23.00, N'lb', 350,  1,  7,  N'Active'),
    -- 81
    (N'The Cyclops''s Gaze',            32768,   1649.99, N'https://picsum.photos/seed/high-21/400/300',  9.00, N'kg', 850,  12, 9,  N'Active'),
    -- 82
    (N'The Drone''s Flight',             4096,    389.99, N'https://picsum.photos/seed/budget-17/400/300', 13.00, N'lb', 400,  4,  5,  N'Active'),
    -- 83
    (N'The Flux''s Current',             8192,    579.99, N'https://picsum.photos/seed/mid-33/400/300',   6.10, N'kg', 500,  7,  11, N'Active'),
    -- 84
    (N'The Ronin''s Code',              16384,   1049.99, N'https://picsum.photos/seed/mid-34/400/300',   8.10, N'kg', 700,  14, 12, N'Active'),
    -- 85
    (N'The Samurai''s Blade',           32768,   1449.99, N'https://picsum.photos/seed/mid-35/400/300',   8.50, N'kg', 800,  10, 15, N'Active'),
    -- 86
    (N'The Galactic''s Surge',          65536,   2499.99, N'https://picsum.photos/seed/high-22/400/300', 10.30, N'kg', 1000, 15, 8,  N'Active'),
    -- 87
    (N'The Celestial''s Arc',          131072,   4199.99, N'https://picsum.photos/seed/flag-13/400/300', 12.80, N'kg', 1200, 16, 8,  N'Active'),
    -- 88
    (N'The Quark''s Spin',               4096,    409.99, N'https://picsum.photos/seed/budget-18/400/300', 10.50, N'lb', 400,  3,  6,  N'Active'),
    -- 89
    (N'The Nano''s Pulse',               2048,    329.99, N'https://picsum.photos/seed/budget-19/400/300', 16.00, N'lb', 400,  2,  3,  N'Active'),
    -- 90
    (N'The Zenith''s Apex',            131072,   4999.99, N'https://picsum.photos/seed/flag-14/400/300', 13.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 91
    (N'The Page''s Companion',           8192,    499.99, N'https://picsum.photos/seed/budget-20/400/300',  8.10, N'kg', 500,  1,  1,  N'New'),
    -- 92
    (N'The Squire''s Arsenal',          16384,    649.99, N'https://picsum.photos/seed/mid-36/400/300',  12.00, N'kg', 500,  2,  2,  N'New'),
    -- 93
    (N'The Herald''s Tower',             8192,    549.99, N'https://picsum.photos/seed/mid-37/400/300',  16.00, N'lb', 450,  3,  3,  N'New'),
    -- 94
    (N'The Knight''s Fortress',         16384,    899.99, N'https://picsum.photos/seed/mid-38/400/300',  13.80, N'lb', 500,  4,  4,  N'New'),
    -- 95
    (N'The Baron''s Citadel',           32768,   1099.99, N'https://picsum.photos/seed/mid-39/400/300',   7.00, N'kg', 1000, 5,  5,  N'New'),
    -- 96
    (N'The Duke''s Sanctum',            32768,   1249.99, N'https://picsum.photos/seed/mid-40/400/300',   6.00, N'kg', 450,  6,  6,  N'New'),
    -- 97
    (N'The Prince''s Armory',            8192,    749.99, N'https://picsum.photos/seed/mid-41/400/300',  15.00, N'lb', 1000, 7,  4,  N'New'),
    -- 98
    (N'The Viscount''s Chamber',        16384,    599.99, N'https://picsum.photos/seed/mid-42/400/300',   8.00, N'lb', 750,  7,  1,  N'New'),
    -- 99
    (N'The Sovereign''s Throne',         2048,   1499.99, N'https://picsum.photos/seed/mid-43/400/300',   9.00, N'kg', 500,  8,  7,  N'New'),
    -- 100
    (N'The Court Jester''s Box',         2048,    349.99, N'https://picsum.photos/seed/budget-21/400/300', 22.00, N'lb', 700,  7,  5,  N'New');
GO

-- =============================================================================
-- Storage Drives
-- =============================================================================
INSERT INTO StorageDrives (ComputerId, CapacityGB, Type) VALUES
    -- 1. The Phoenix's Blaze: 2 TB SSD + 4 TB HDD
    (1,  2000, N'SSD'),
    (1,  4000, N'HDD'),
    -- 2. The Dragon's Hoard: 4 TB SSD + 8 TB HDD
    (2,  4000, N'SSD'),
    (2,  8000, N'HDD'),
    -- 3. The Titan's Resolve: 2 TB SSD + 2 TB HDD
    (3,  2000, N'SSD'),
    (3,  2000, N'HDD'),
    -- 4. The Griffin's Talon: 1 TB SSD + 2 TB HDD
    (4,  1000, N'SSD'),
    (4,  2000, N'HDD'),
    -- 5. The Pulsar's Drift: 512 GB SSD
    (5,   512, N'SSD'),
    -- 6. The Nebula's Core: 1 TB SSD + 2 TB HDD
    (6,  1000, N'SSD'),
    (6,  2000, N'HDD'),
    -- 7. The Quasar's Pulse: 512 GB SSD + 1 TB HDD
    (7,   512, N'SSD'),
    (7,  1000, N'HDD'),
    -- 8. The Comet's Trail: 256 GB SSD
    (8,   256, N'SSD'),
    -- 9. The Vortex's Edge: 500 GB HDD
    (9,   500, N'HDD'),
    -- 10. The Hydra's Strike: 2 TB SSD
    (10,  2000, N'SSD'),
    -- 11. The Nova's Burst: 512 GB SSD + 1 TB HDD
    (11,   512, N'SSD'),
    (11,  1000, N'HDD'),
    -- 12. The Turbo's Rush: 256 GB SSD
    (12,   256, N'SSD'),
    -- 13. The Kraken's Depth: 1 TB SSD + 2 TB HDD
    (13,  1000, N'SSD'),
    (13,  2000, N'HDD'),
    -- 14. The Pixel's Dream: 500 GB HDD
    (14,   500, N'HDD'),
    -- 15. The Thunderbolt's Path: 2 TB SSD + 4 TB HDD
    (15,  2000, N'SSD'),
    (15,  4000, N'HDD'),
    -- 16. The Phantom's Ghost: 1 TB SSD + 1 TB HDD
    (16,  1000, N'SSD'),
    (16,  1000, N'HDD'),
    -- 17. The Inferno's Wrath: 4 TB SSD + 4 TB HDD
    (17,  4000, N'SSD'),
    (17,  4000, N'HDD'),
    -- 18. The Nitro's Ignition: 128 GB SSD
    (18,   128, N'SSD'),
    -- 19. The Eclipse's Shadow: 512 GB SSD + 1 TB HDD
    (19,   512, N'SSD'),
    (19,  1000, N'HDD'),
    -- 20. The Glacial's Freeze: 500 GB HDD
    (20,   500, N'HDD'),
    -- 21. The Sentinel's Vigil: 2 TB SSD + 2 TB HDD
    (21,  2000, N'SSD'),
    (21,  2000, N'HDD'),
    -- 22. The Warlock's Seal: 4 TB SSD + 4 TB HDD
    (22,  4000, N'SSD'),
    (22,  4000, N'HDD'),
    -- 23. The Cipher's Lock: 500 GB HDD
    (23,   500, N'HDD'),
    -- 24. The Respawn's Rise: 256 GB SSD
    (24,   256, N'SSD'),
    -- 25. The Storm's Eye: 512 GB SSD + 1 TB HDD
    (25,   512, N'SSD'),
    (25,  1000, N'HDD'),
    -- 26. The Berserker's Fury: 1 TB SSD + 2 TB HDD
    (26,  1000, N'SSD'),
    (26,  2000, N'HDD'),
    -- 27. The Gladiator's Arena: 2 TB SSD + 4 TB HDD
    (27,  2000, N'SSD'),
    (27,  4000, N'HDD'),
    -- 28. The Overclock's Peak: 500 GB SSD
    (28,   500, N'SSD'),
    -- 29. The Ranger's Aim: 1 TB SSD
    (29,  1000, N'SSD'),
    -- 30. The Static's Spark: 128 GB SSD
    (30,   128, N'SSD'),
    -- 31. The Paladin's Oath: 1 TB SSD + 1 TB HDD
    (31,  1000, N'SSD'),
    (31,  1000, N'HDD'),
    -- 32. The Leviathan's Wake: 2 TB SSD + 4 TB HDD
    (32,  2000, N'SSD'),
    (32,  4000, N'HDD'),
    -- 33. The Ember's Glow: 500 GB HDD
    (33,   500, N'HDD'),
    -- 34. The Cyclone's Spin: 512 GB SSD
    (34,   512, N'SSD'),
    -- 35. The Wraith's Haunt: 2 TB SSD
    (35,  2000, N'SSD'),
    -- 36. The Colossus's Might: 2 TB SSD + 4 TB HDD
    (36,  2000, N'SSD'),
    (36,  4000, N'HDD'),
    -- 37. The Supernova's Flash: 4 TB SSD + 8 TB HDD
    (37,  4000, N'SSD'),
    (37,  8000, N'HDD'),
    -- 38. The Blizzard's Chill: 500 GB SSD
    (38,   500, N'SSD'),
    -- 39. The Viper's Bite: 1 TB SSD
    (39,  1000, N'SSD'),
    -- 40. The Pixel's Flux: 256 GB HDD
    (40,   256, N'HDD'),
    -- 41. The Basilisk's Gaze: 4 TB SSD + 4 TB HDD
    (41,  4000, N'SSD'),
    (41,  4000, N'HDD'),
    -- 42. The Manticore's Roar: 2 TB SSD + 2 TB HDD
    (42,  2000, N'SSD'),
    (42,  2000, N'HDD'),
    -- 43. The Specter's Veil: 512 GB SSD + 1 TB HDD
    (43,   512, N'SSD'),
    (43,  1000, N'HDD'),
    -- 44. The Rogue's Gambit: 256 GB SSD
    (44,   256, N'SSD'),
    -- 45. The Cipher's Vault: 500 GB HDD
    (45,   500, N'HDD'),
    -- 46. The Chimera's Form: 2 TB SSD + 2 TB HDD
    (46,  2000, N'SSD'),
    (46,  2000, N'HDD'),
    -- 47. The Warden's Crest: 1 TB SSD
    (47,  1000, N'SSD'),
    -- 48. The Valkyrie's Call: 1 TB SSD + 2 TB HDD
    (48,  1000, N'SSD'),
    (48,  2000, N'HDD'),
    -- 49. The Vector's Path: 500 GB HDD
    (49,   500, N'HDD'),
    -- 50. The Drifter's Mark: 256 GB SSD
    (50,   256, N'SSD'),
    -- 51. The Olympus's Peak: 4 TB SSD + 8 TB HDD
    (51,  4000, N'SSD'),
    (51,  8000, N'HDD'),
    -- 52. The Rift's Collapse: 4 TB SSD + 4 TB HDD
    (52,  4000, N'SSD'),
    (52,  4000, N'HDD'),
    -- 53. The Behemoth's Charge: 2 TB SSD + 2 TB HDD
    (53,  2000, N'SSD'),
    (53,  2000, N'HDD'),
    -- 54. The Stryker's Mark: 1 TB SSD + 1 TB HDD
    (54,  1000, N'SSD'),
    (54,  1000, N'HDD'),
    -- 55. The Lynx's Leap: 512 GB SSD
    (55,   512, N'SSD'),
    -- 56. The Goblin's Cache: 500 GB HDD
    (56,   500, N'HDD'),
    -- 57. The Frost's Bite: 500 GB SSD
    (57,   500, N'SSD'),
    -- 58. The Apex's Throne: 1 TB SSD
    (58,  1000, N'SSD'),
    -- 59. The Tempest's Fury: 1 TB SSD + 2 TB HDD
    (59,  1000, N'SSD'),
    (59,  2000, N'HDD'),
    -- 60. The Abyss's Call: 2 TB SSD + 4 TB HDD
    (60,  2000, N'SSD'),
    (60,  4000, N'HDD'),
    -- 61. The Raptor's Dive: 4 TB SSD + 4 TB HDD
    (61,  4000, N'SSD'),
    (61,  4000, N'HDD'),
    -- 62. The Wyvern's Wing: 4 TB SSD + 8 TB HDD
    (62,  4000, N'SSD'),
    (62,  8000, N'HDD'),
    -- 63. The Glitch's Echo: 256 GB HDD
    (63,   256, N'HDD'),
    -- 64. The Rune's Glyph: 500 GB HDD
    (64,   500, N'HDD'),
    -- 65. The Surge's Wave: 256 GB SSD
    (65,   256, N'SSD'),
    -- 66. The Mirage's Veil: 512 GB SSD
    (66,   512, N'SSD'),
    -- 67. The Cerberus's Guard: 1 TB SSD + 2 TB HDD
    (67,  1000, N'SSD'),
    (67,  2000, N'HDD'),
    -- 68. The Pulsar's Storm: 2 TB SSD + 4 TB HDD
    (68,  2000, N'SSD'),
    (68,  4000, N'HDD'),
    -- 69. The Byte's Ghost: 128 GB SSD
    (69,   128, N'SSD'),
    -- 70. The Spark's Ignite: 500 GB HDD
    (70,   500, N'HDD'),
    -- 71. The Neon's Grid: 256 GB SSD
    (71,   256, N'SSD'),
    -- 72. The Aurora's Glow: 512 GB SSD + 1 TB HDD
    (72,   512, N'SSD'),
    (72,  1000, N'HDD'),
    -- 73. The Titan's Fist: 2 TB SSD
    (73,  2000, N'SSD'),
    -- 74. The Andromeda's Light: 2 TB SSD + 4 TB HDD
    (74,  2000, N'SSD'),
    (74,  4000, N'HDD'),
    -- 75. The Nano's Drift: 256 GB HDD
    (75,   256, N'HDD'),
    -- 76. The Goliath's Stride: 4 TB SSD + 4 TB HDD
    (76,  4000, N'SSD'),
    (76,  4000, N'HDD'),
    -- 77. The Photon's Beam: 2 TB SSD + 2 TB HDD
    (77,  2000, N'SSD'),
    (77,  2000, N'HDD'),
    -- 78. The Specter's Hunt: 1 TB SSD + 1 TB HDD
    (78,  1000, N'SSD'),
    (78,  1000, N'HDD'),
    -- 79. The Nexus's Link: 512 GB SSD
    (79,   512, N'SSD'),
    -- 80. The Ion's Charge: 128 GB SSD
    (80,   128, N'SSD'),
    -- 81. The Cyclops's Gaze: 1 TB SSD + 2 TB HDD
    (81,  1000, N'SSD'),
    (81,  2000, N'HDD'),
    -- 82. The Drone's Flight: 500 GB HDD
    (82,   500, N'HDD'),
    -- 83. The Flux's Current: 256 GB SSD
    (83,   256, N'SSD'),
    -- 84. The Ronin's Code: 1 TB SSD
    (84,  1000, N'SSD'),
    -- 85. The Samurai's Blade: 1 TB SSD + 2 TB HDD
    (85,  1000, N'SSD'),
    (85,  2000, N'HDD'),
    -- 86. The Galactic's Surge: 2 TB SSD + 4 TB HDD
    (86,  2000, N'SSD'),
    (86,  4000, N'HDD'),
    -- 87. The Celestial's Arc: 4 TB SSD + 8 TB HDD
    (87,  4000, N'SSD'),
    (87,  8000, N'HDD'),
    -- 88. The Quark's Spin: 500 GB HDD
    (88,   500, N'HDD'),
    -- 89. The Nano's Pulse: 256 GB HDD
    (89,   256, N'HDD'),
    -- 90. The Zenith's Apex: 4 TB SSD + 8 TB HDD
    (90, 4000, N'SSD'),
    (90, 8000, N'HDD'),
    -- 91. The Page's Companion
    (91,  1000, N'SSD'),
    -- 92. The Squire's Arsenal
    (92,  2000, N'HDD'),
    -- 93. The Herald's Tower
    (93,  2000, N'HDD'),
    -- 94. The Knight's Fortress
    (94,  4000, N'HDD'),
    -- 95. The Baron's Citadel
    (95,   512, N'SSD'),
    -- 96. The Duke's Sanctum
    (96,  2000, N'SSD'),
    -- 97. The Prince's Armory
    (97,  2000, N'HDD'),
    -- 98. The Viscount's Chamber
    (98,   500, N'SSD'),
    -- 99. The Sovereign's Throne
    (99,  2000, N'HDD'),
    -- 100. The Court Jester's Box
    (100,  128, N'SSD');
GO

-- =============================================================================
-- USB Ports
-- =============================================================================
INSERT INTO UsbPorts (ComputerId, Count, UsbType) VALUES
    -- 1. The Phoenix's Blaze: 4x USB-C + 6x USB 3.0
    (1,  4, N'USB-C'),
    (1,  6, N'USB 3.0'),
    -- 2. The Dragon's Hoard: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (2,  6, N'USB-C'),
    (2,  8, N'USB 3.0'),
    (2,  2, N'USB 2.0'),
    -- 3. The Titan's Resolve: 4x USB-C + 6x USB 3.0
    (3,  4, N'USB-C'),
    (3,  6, N'USB 3.0'),
    -- 4. The Griffin's Talon: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (4,  2, N'USB-C'),
    (4,  4, N'USB 3.0'),
    (4,  2, N'USB 2.0'),
    -- 5. The Pulsar's Drift: 2x USB-C + 4x USB 3.0
    (5,  2, N'USB-C'),
    (5,  4, N'USB 3.0'),
    -- 6. The Nebula's Core: 3x USB-C + 5x USB 3.0 + 2x USB 2.0
    (6,  3, N'USB-C'),
    (6,  5, N'USB 3.0'),
    (6,  2, N'USB 2.0'),
    -- 7. The Quasar's Pulse: 2x USB-C + 4x USB 3.0
    (7,  2, N'USB-C'),
    (7,  4, N'USB 3.0'),
    -- 8. The Comet's Trail: 2x USB 3.0 + 4x USB 2.0
    (8,  2, N'USB 3.0'),
    (8,  4, N'USB 2.0'),
    -- 9. The Vortex's Edge: 4x USB 2.0
    (9,  4, N'USB 2.0'),
    -- 10. The Hydra's Strike: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (10,  2, N'USB-C'),
    (10,  4, N'USB 3.0'),
    (10,  2, N'USB 2.0'),
    -- 11. The Nova's Burst: 1x USB-C + 3x USB 3.0 + 2x USB 2.0
    (11,  1, N'USB-C'),
    (11,  3, N'USB 3.0'),
    (11,  2, N'USB 2.0'),
    -- 12. The Turbo's Rush: 2x USB 3.0 + 4x USB 2.0
    (12,  2, N'USB 3.0'),
    (12,  4, N'USB 2.0'),
    -- 13. The Kraken's Depth: 2x USB-C + 6x USB 3.0
    (13,  2, N'USB-C'),
    (13,  6, N'USB 3.0'),
    -- 14. The Pixel's Dream: 2x USB 2.0 + 2x USB 3.0
    (14,  2, N'USB 2.0'),
    (14,  2, N'USB 3.0'),
    -- 15. The Thunderbolt's Path: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (15,  4, N'USB-C'),
    (15,  6, N'USB 3.0'),
    (15,  2, N'USB 2.0'),
    -- 16. The Phantom's Ghost: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (16,  2, N'USB-C'),
    (16,  4, N'USB 3.0'),
    (16,  2, N'USB 2.0'),
    -- 17. The Inferno's Wrath: 6x USB-C + 8x USB 3.0
    (17,  6, N'USB-C'),
    (17,  8, N'USB 3.0'),
    -- 18. The Nitro's Ignition: 1x USB-C + 2x USB 3.0
    (18,  1, N'USB-C'),
    (18,  2, N'USB 3.0'),
    -- 19. The Eclipse's Shadow: 2x USB-C + 4x USB 3.0
    (19,  2, N'USB-C'),
    (19,  4, N'USB 3.0'),
    -- 20. The Glacial's Freeze: 2x USB 2.0 + 2x USB 3.0
    (20,  2, N'USB 2.0'),
    (20,  2, N'USB 3.0'),
    -- 21. The Sentinel's Vigil: 4x USB-C + 4x USB 3.0 + 2x USB 2.0
    (21,  4, N'USB-C'),
    (21,  4, N'USB 3.0'),
    (21,  2, N'USB 2.0'),
    -- 22. The Warlock's Seal: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (22,  4, N'USB-C'),
    (22,  6, N'USB 3.0'),
    (22,  2, N'USB 2.0'),
    -- 23. The Cipher's Lock: 4x USB 2.0 + 2x USB 3.0
    (23,  4, N'USB 2.0'),
    (23,  2, N'USB 3.0'),
    -- 24. The Respawn's Rise: 2x USB 3.0 + 2x USB 2.0
    (24,  2, N'USB 3.0'),
    (24,  2, N'USB 2.0'),
    -- 25. The Storm's Eye: 2x USB-C + 4x USB 3.0
    (25,  2, N'USB-C'),
    (25,  4, N'USB 3.0'),
    -- 26. The Berserker's Fury: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (26,  2, N'USB-C'),
    (26,  4, N'USB 3.0'),
    (26,  2, N'USB 2.0'),
    -- 27. The Gladiator's Arena: 4x USB-C + 6x USB 3.0
    (27,  4, N'USB-C'),
    (27,  6, N'USB 3.0'),
    -- 28. The Overclock's Peak: 4x USB 3.0 + 4x USB 2.0
    (28,  4, N'USB 3.0'),
    (28,  4, N'USB 2.0'),
    -- 29. The Ranger's Aim: 2x USB-C + 4x USB 3.0
    (29,  2, N'USB-C'),
    (29,  4, N'USB 3.0'),
    -- 30. The Static's Spark: 4x USB 2.0
    (30,  4, N'USB 2.0'),
    -- 31. The Paladin's Oath: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (31,  2, N'USB-C'),
    (31,  4, N'USB 3.0'),
    (31,  2, N'USB 2.0'),
    -- 32. The Leviathan's Wake: 6x USB-C + 6x USB 3.0
    (32,  6, N'USB-C'),
    (32,  6, N'USB 3.0'),
    -- 33. The Ember's Glow: 4x USB 2.0 + 2x USB 3.0
    (33,  4, N'USB 2.0'),
    (33,  2, N'USB 3.0'),
    -- 34. The Cyclone's Spin: 2x USB-C + 4x USB 3.0
    (34,  2, N'USB-C'),
    (34,  4, N'USB 3.0'),
    -- 35. The Wraith's Haunt: 4x USB-C + 4x USB 3.0
    (35,  4, N'USB-C'),
    (35,  4, N'USB 3.0'),
    -- 36. The Colossus's Might: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (36,  4, N'USB-C'),
    (36,  6, N'USB 3.0'),
    (36,  2, N'USB 2.0'),
    -- 37. The Supernova's Flash: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (37,  6, N'USB-C'),
    (37,  8, N'USB 3.0'),
    (37,  2, N'USB 2.0'),
    -- 38. The Blizzard's Chill: 2x USB-C + 4x USB 3.0
    (38,  2, N'USB-C'),
    (38,  4, N'USB 3.0'),
    -- 39. The Viper's Bite: 2x USB-C + 4x USB 3.0
    (39,  2, N'USB-C'),
    (39,  4, N'USB 3.0'),
    -- 40. The Pixel's Flux: 2x USB 2.0 + 2x USB 3.0
    (40,  2, N'USB 2.0'),
    (40,  2, N'USB 3.0'),
    -- 41. The Basilisk's Gaze: 6x USB-C + 8x USB 3.0
    (41,  6, N'USB-C'),
    (41,  8, N'USB 3.0'),
    -- 42. The Manticore's Roar: 4x USB-C + 4x USB 3.0 + 2x USB 2.0
    (42,  4, N'USB-C'),
    (42,  4, N'USB 3.0'),
    (42,  2, N'USB 2.0'),
    -- 43. The Specter's Veil: 2x USB-C + 4x USB 3.0
    (43,  2, N'USB-C'),
    (43,  4, N'USB 3.0'),
    -- 44. The Rogue's Gambit: 2x USB 3.0 + 2x USB 2.0
    (44,  2, N'USB 3.0'),
    (44,  2, N'USB 2.0'),
    -- 45. The Cipher's Vault: 4x USB 2.0
    (45,  4, N'USB 2.0'),
    -- 46. The Chimera's Form: 4x USB-C + 6x USB 3.0
    (46,  4, N'USB-C'),
    (46,  6, N'USB 3.0'),
    -- 47. The Warden's Crest: 2x USB-C + 4x USB 3.0
    (47,  2, N'USB-C'),
    (47,  4, N'USB 3.0'),
    -- 48. The Valkyrie's Call: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (48,  2, N'USB-C'),
    (48,  4, N'USB 3.0'),
    (48,  2, N'USB 2.0'),
    -- 49. The Vector's Path: 2x USB 2.0 + 2x USB 3.0
    (49,  2, N'USB 2.0'),
    (49,  2, N'USB 3.0'),
    -- 50. The Drifter's Mark: 2x USB 3.0 + 4x USB 2.0
    (50,  2, N'USB 3.0'),
    (50,  4, N'USB 2.0'),
    -- 51. The Olympus's Peak: 6x USB-C + 8x USB 3.0 + 4x USB 2.0
    (51,  6, N'USB-C'),
    (51,  8, N'USB 3.0'),
    (51,  4, N'USB 2.0'),
    -- 52. The Rift's Collapse: 6x USB-C + 6x USB 3.0 + 2x USB 2.0
    (52,  6, N'USB-C'),
    (52,  6, N'USB 3.0'),
    (52,  2, N'USB 2.0'),
    -- 53. The Behemoth's Charge: 4x USB-C + 6x USB 3.0
    (53,  4, N'USB-C'),
    (53,  6, N'USB 3.0'),
    -- 54. The Stryker's Mark: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (54,  2, N'USB-C'),
    (54,  4, N'USB 3.0'),
    (54,  2, N'USB 2.0'),
    -- 55. The Lynx's Leap: 2x USB-C + 4x USB 3.0
    (55,  2, N'USB-C'),
    (55,  4, N'USB 3.0'),
    -- 56. The Goblin's Cache: 4x USB 2.0 + 2x USB 3.0
    (56,  4, N'USB 2.0'),
    (56,  2, N'USB 3.0'),
    -- 57. The Frost's Bite: 2x USB-C + 4x USB 3.0
    (57,  2, N'USB-C'),
    (57,  4, N'USB 3.0'),
    -- 58. The Apex's Throne: 2x USB-C + 4x USB 3.0
    (58,  2, N'USB-C'),
    (58,  4, N'USB 3.0'),
    -- 59. The Tempest's Fury: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (59,  2, N'USB-C'),
    (59,  4, N'USB 3.0'),
    (59,  2, N'USB 2.0'),
    -- 60. The Abyss's Call: 4x USB-C + 6x USB 3.0
    (60,  4, N'USB-C'),
    (60,  6, N'USB 3.0'),
    -- 61. The Raptor's Dive: 6x USB-C + 8x USB 3.0
    (61,  6, N'USB-C'),
    (61,  8, N'USB 3.0'),
    -- 62. The Wyvern's Wing: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (62,  6, N'USB-C'),
    (62,  8, N'USB 3.0'),
    (62,  2, N'USB 2.0'),
    -- 63. The Glitch's Echo: 4x USB 2.0 + 2x USB 3.0
    (63,  4, N'USB 2.0'),
    (63,  2, N'USB 3.0'),
    -- 64. The Rune's Glyph: 4x USB 2.0 + 2x USB 3.0
    (64,  4, N'USB 2.0'),
    (64,  2, N'USB 3.0'),
    -- 65. The Surge's Wave: 2x USB 3.0 + 4x USB 2.0
    (65,  2, N'USB 3.0'),
    (65,  4, N'USB 2.0'),
    -- 66. The Mirage's Veil: 2x USB-C + 4x USB 3.0
    (66,  2, N'USB-C'),
    (66,  4, N'USB 3.0'),
    -- 67. The Cerberus's Guard: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (67,  2, N'USB-C'),
    (67,  4, N'USB 3.0'),
    (67,  2, N'USB 2.0'),
    -- 68. The Pulsar's Storm: 4x USB-C + 6x USB 3.0
    (68,  4, N'USB-C'),
    (68,  6, N'USB 3.0'),
    -- 69. The Byte's Ghost: 4x USB 2.0
    (69,  4, N'USB 2.0'),
    -- 70. The Spark's Ignite: 4x USB 2.0 + 2x USB 3.0
    (70,  4, N'USB 2.0'),
    (70,  2, N'USB 3.0'),
    -- 71. The Neon's Grid: 1x USB-C + 2x USB 3.0
    (71,  1, N'USB-C'),
    (71,  2, N'USB 3.0'),
    -- 72. The Aurora's Glow: 2x USB-C + 4x USB 3.0
    (72,  2, N'USB-C'),
    (72,  4, N'USB 3.0'),
    -- 73. The Titan's Fist: 4x USB-C + 4x USB 3.0
    (73,  4, N'USB-C'),
    (73,  4, N'USB 3.0'),
    -- 74. The Andromeda's Light: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (74,  4, N'USB-C'),
    (74,  6, N'USB 3.0'),
    (74,  2, N'USB 2.0'),
    -- 75. The Nano's Drift: 4x USB 2.0 + 2x USB 3.0
    (75,  4, N'USB 2.0'),
    (75,  2, N'USB 3.0'),
    -- 76. The Goliath's Stride: 6x USB-C + 8x USB 3.0
    (76,  6, N'USB-C'),
    (76,  8, N'USB 3.0'),
    -- 77. The Photon's Beam: 4x USB-C + 6x USB 3.0 + 2x USB 2.0
    (77,  4, N'USB-C'),
    (77,  6, N'USB 3.0'),
    (77,  2, N'USB 2.0'),
    -- 78. The Specter's Hunt: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (78,  2, N'USB-C'),
    (78,  4, N'USB 3.0'),
    (78,  2, N'USB 2.0'),
    -- 79. The Nexus's Link: 2x USB-C + 4x USB 3.0
    (79,  2, N'USB-C'),
    (79,  4, N'USB 3.0'),
    -- 80. The Ion's Charge: 4x USB 2.0
    (80,  4, N'USB 2.0'),
    -- 81. The Cyclops's Gaze: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (81,  2, N'USB-C'),
    (81,  4, N'USB 3.0'),
    (81,  2, N'USB 2.0'),
    -- 82. The Drone's Flight: 4x USB 2.0 + 2x USB 3.0
    (82,  4, N'USB 2.0'),
    (82,  2, N'USB 3.0'),
    -- 83. The Flux's Current: 1x USB-C + 2x USB 3.0 + 2x USB 2.0
    (83,  1, N'USB-C'),
    (83,  2, N'USB 3.0'),
    (83,  2, N'USB 2.0'),
    -- 84. The Ronin's Code: 2x USB-C + 4x USB 3.0
    (84,  2, N'USB-C'),
    (84,  4, N'USB 3.0'),
    -- 85. The Samurai's Blade: 2x USB-C + 4x USB 3.0 + 2x USB 2.0
    (85,  2, N'USB-C'),
    (85,  4, N'USB 3.0'),
    (85,  2, N'USB 2.0'),
    -- 86. The Galactic's Surge: 4x USB-C + 6x USB 3.0
    (86,  4, N'USB-C'),
    (86,  6, N'USB 3.0'),
    -- 87. The Celestial's Arc: 6x USB-C + 8x USB 3.0 + 2x USB 2.0
    (87,  6, N'USB-C'),
    (87,  8, N'USB 3.0'),
    (87,  2, N'USB 2.0'),
    -- 88. The Quark's Spin: 4x USB 2.0 + 2x USB 3.0
    (88,  4, N'USB 2.0'),
    (88,  2, N'USB 3.0'),
    -- 89. The Nano's Pulse: 2x USB 2.0 + 2x USB 3.0
    (89,  2, N'USB 2.0'),
    (89,  2, N'USB 3.0'),
    -- 90. The Zenith's Apex: 8x USB-C + 10x USB 3.0 + 4x USB 2.0
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
