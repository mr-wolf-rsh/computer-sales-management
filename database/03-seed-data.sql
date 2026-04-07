-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Seed Data
-- =============================================================================
-- Inserts 100 computers with royal-themed names.
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
-- Tier scoring: score = (RamAmountMB/1024)*0.3 + (totalStorageGB/1000)*0.2 + (Price/200)*0.3 + (PsuWattage/100)*0.2
--   Page     : score < 3
--   Squire   : score 3-5
--   Knight   : score 5-7
--   Baron    : score 7-9
--   Duke     : score 9-11
--   Prince   : score 11-13
--   Sovereign: score >= 13
--
-- Image URL pool (gaming PCs by tier, via Pexels):
--   sovereign = https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop  (score >= 13)
--   prince    = https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop     (score 11-13)
--   duke      = https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop       (score 9-11)
--   baron     = https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop      (score 7-9)
--   knight    = https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop     (score 5-7)
--   squire    = https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop     (score 3-5)
--   page      = https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop       (score < 3)
-- =============================================================================

INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId, Status) VALUES
    -- 1. The Archduke's Engine — Sovereign: RAM=131072,Storage=12000,Price=3499.99,PSU=1200 => score~48.45
    (N'The Archduke''s Engine',        131072,  3499.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',  9.50, N'kg', 1200, 9,  8,  N'Active'),
    -- 2. The Emperor's Dominion — Sovereign: RAM=131072,Storage=12000,Price=4999.99,PSU=1200 => score~50.70
    (N'The Emperor''s Dominion',       131072,  4999.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 11.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 3. The Regent's Might — Sovereign: RAM=131072,Storage=12000,Price=3999.99,PSU=1200 => score~49.20
    (N'The Regent''s Might',           131072,  3999.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 10.20, N'kg', 1200, 15, 15, N'Active'),
    -- 4. The Paladin's Core — Duke: RAM=16384,Storage=3000,Price=2199.99,PSU=950 => score~10.60
    (N'The Paladin''s Core',            16384,  2199.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       8.80, N'kg',  950, 9,  9,  N'Active'),
    -- 5. The Warden's Watch — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Warden''s Watch',             8192,   999.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     7.50, N'kg',  700, 11, 11, N'Active'),
    -- 6. The Chancellor's Decree — Prince: RAM=32768,Storage=256,Price=699.99,PSU=450 => score~11.60
    (N'The Chancellor''s Decree',       32768,   699.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     9.00, N'kg',  450, 10, 10, N'Active'),
    -- 7. The Viceroy's Command — Baron: RAM=16384,Storage=512,Price=699.99,PSU=600 => score~7.15
    (N'The Viceroy''s Command',         16384,   699.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.30, N'kg',  600, 12, 13, N'Active'),
    -- 8. The Marshal's Banner — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Marshal''s Banner',           8192,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    14.00, N'lb',  700, 13, 12, N'Active'),
    -- 9. The Constable's Keep — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Constable''s Keep',           8192,   299.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    11.00, N'lb',  300, 1,  3,  N'Active'),
    -- 10. The Chamberlain's Vault — Duke: RAM=16384,Storage=2000,Price=1999.99,PSU=900 => score~10.00
    (N'The Chamberlain''s Vault',       16384,  1999.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       7.20, N'kg',  900, 14, 14, N'Active'),
    -- 11. The Steward's Watch — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Steward''s Watch',            8192,   999.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     6.80, N'kg',  700, 11, 9,  N'Active'),
    -- 12. The Banneret's Standard — Knight: RAM=8192,Storage=512,Price=1099.99,PSU=750 => score~5.65
    (N'The Banneret''s Standard',        8192,  1099.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    13.50, N'lb',  750, 7,  2,  N'Active'),
    -- 13. The Thane's Bastion — Duke: RAM=16384,Storage=2000,Price=1799.99,PSU=850 => score~9.60
    (N'The Thane''s Bastion',           16384,  1799.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       8.50, N'kg',  850, 12, 15, N'Active'),
    -- 14. The Liegeman's Post — Squire: RAM=8192,Storage=128,Price=199.99,PSU=250 => score~3.23
    (N'The Liegeman''s Post',            8192,   199.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    10.00, N'lb',  250, 3,  3,  N'Active'),
    -- 15. The Seneschal's Hall — Prince: RAM=32768,Storage=500,Price=899.99,PSU=500 => score~12.05
    (N'The Seneschal''s Hall',          32768,   899.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     9.80, N'kg',  500, 15, 8,  N'Active'),
    -- 16. The Castellan's Tower — Duke: RAM=16384,Storage=1000,Price=2199.99,PSU=1000 => score~10.80
    (N'The Castellan''s Tower',         16384,  2199.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       8.00, N'kg', 1000, 10, 9,  N'Active'),
    -- 17. The Warlord's Siege — Prince: RAM=32768,Storage=256,Price=799.99,PSU=450 => score~11.75
    (N'The Warlord''s Siege',           32768,   799.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    12.00, N'kg',  450, 9,  8,  N'Active'),
    -- 18. The Envoy's Dispatch — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Envoy''s Dispatch',           8192,   299.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     5.50, N'kg',  300, 13, 12, N'Active'),
    -- 19. The Tribune's Oration — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Tribune''s Oration',          8192,   999.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     7.80, N'kg',  700, 14, 11, N'Active'),
    -- 20. The Legate's Decree — Baron: RAM=16384,Storage=1000,Price=799.99,PSU=650 => score~7.50
    (N'The Legate''s Decree',           16384,   799.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     18.00, N'lb',  650, 2,  6,  N'Active'),
    -- 21. The Prelate's Sanctum — Duke: RAM=16384,Storage=1000,Price=1999.99,PSU=900 => score~10.00
    (N'The Prelate''s Sanctum',         16384,  1999.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       8.20, N'kg',  900, 16, 10, N'Active'),
    -- 22. The Exarch's Domain — Prince: RAM=32768,Storage=500,Price=999.99,PSU=550 => score~12.30
    (N'The Exarch''s Domain',           32768,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    10.50, N'kg',  550, 15, 15, N'Active'),
    -- 23. The Patriarch's Legacy — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Patriarch''s Legacy',         8192,   299.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    12.00, N'lb',  300, 3,  6,  N'Active'),
    -- 24. The Prefect's Order — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Prefect''s Order',            8192,   299.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     6.20, N'kg',  300, 7,  2,  N'Active'),
    -- 25. The Tribune's Voice — Knight: RAM=8192,Storage=512,Price=1099.99,PSU=750 => score~5.65
    (N'The Tribune''s Voice',            8192,  1099.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     8.90, N'kg',  750, 11, 13, N'Active'),
    -- 26. The Praetor's Judgment — Baron: RAM=16384,Storage=1000,Price=999.99,PSU=700 => score~7.90
    (N'The Praetor''s Judgment',        16384,   999.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      9.30, N'kg',  700, 12, 14, N'Active'),
    -- 27. The Consul's Authority — Sovereign: RAM=65536,Storage=8000,Price=2699.99,PSU=1000 => score~23.85
    (N'The Consul''s Authority',         65536,  2699.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 11.50, N'kg', 1000, 16, 8,  N'Active'),
    -- 28. The Procurator's Ledger — Squire: RAM=8192,Storage=500,Price=399.99,PSU=350 => score~3.75
    (N'The Procurator''s Ledger',        8192,   399.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    14.50, N'lb',  350, 4,  5,  N'Active'),
    -- 29. The Strategos' Gambit — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Strategos'' Gambit',          8192,   999.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     8.60, N'kg',  700, 14, 9,  N'Active'),
    -- 30. The Eparch's Edict — Page: RAM=4096,Storage=128,Price=249.99,PSU=300 => score~2.20
    (N'The Eparch''s Edict',             4096,   249.99, N'https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       20.00, N'lb',  300, 1,  3,  N'Active'),
    -- 31. The Archon's Seal — Duke: RAM=16384,Storage=2000,Price=1799.99,PSU=850 => score~9.60
    (N'The Archon''s Seal',             16384,  1799.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       7.70, N'kg',  850, 10, 10, N'Active'),
    -- 32. The Tyrant's Grip — Prince: RAM=32768,Storage=512,Price=799.99,PSU=450 => score~11.80
    (N'The Tyrant''s Grip',             32768,   799.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    10.80, N'kg',  450, 9,  15, N'Active'),
    -- 33. The Oligarch's Reserve — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Oligarch''s Reserve',         8192,   299.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    11.00, N'lb',  300, 2,  6,  N'Active'),
    -- 34. The Satrap's Province — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Satrap''s Province',          8192,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     7.40, N'kg',  700, 6,  4,  N'Active'),
    -- 35. The Vizier's Counsel — Baron: RAM=16384,Storage=1000,Price=1099.99,PSU=750 => score~8.20
    (N'The Vizier''s Counsel',          16384,  1099.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.10, N'kg',  750, 12, 15, N'Active'),
    -- 36. The Sultan's Pavilion — Duke: RAM=16384,Storage=2000,Price=1999.99,PSU=900 => score~10.00
    (N'The Sultan''s Pavilion',         16384,  1999.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      11.20, N'kg',  900, 15, 8,  N'Active'),
    -- 37. The Caliph's Fortress — Sovereign: RAM=131072,Storage=12000,Price=4599.99,PSU=1200 => score~51.80
    (N'The Caliph''s Fortress',         131072,  4599.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 12.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 38. The Emir's Outpost — Knight: RAM=8192,Storage=512,Price=1099.99,PSU=750 => score~5.65
    (N'The Emir''s Outpost',             8192,  1099.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    15.50, N'lb',  750, 5,  5,  N'Active'),
    -- 39. The Pasha's Enclave — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Pasha''s Enclave',            8192,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    8.30, N'kg',  700, 11, 11, N'Active'),
    -- 40. The Bey's Crossing — Page: RAM=4096,Storage=128,Price=249.99,PSU=300 => score~2.20
    (N'The Bey''s Crossing',             4096,   249.99, N'https://images.pexels.com/photos/7862505/pexels-photo-7862505.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       17.00, N'lb',  300, 1,  6,  N'Active'),
    -- 41. The Shogun's Stronghold — Prince: RAM=32768,Storage=256,Price=999.99,PSU=500 => score~12.15
    (N'The Shogun''s Stronghold',       32768,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     9.90, N'kg',  500, 9,  8,  N'Active'),
    -- 42. The Daimyo's Keep — Duke: RAM=16384,Storage=1000,Price=2199.99,PSU=1000 => score~10.80
    (N'The Daimyo''s Keep',             16384,  2199.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       8.70, N'kg', 1000, 10, 10, N'Active'),
    -- 43. The Samurai's Edge — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Samurai''s Edge',             8192,   999.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    7.10, N'kg',  700, 14, 14, N'Active'),
    -- 44. The Ronin's Path — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Ronin''s Path',               8192,   299.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     5.80, N'kg',  300, 13, 11, N'Active'),
    -- 45. The Ninja's Shadow — Squire: RAM=8192,Storage=500,Price=399.99,PSU=350 => score~3.75
    (N'The Ninja''s Shadow',             8192,   399.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    10.00, N'lb',  350, 3,  3,  N'Active'),
    -- 46. The Warlord's Dominion — Duke: RAM=16384,Storage=2000,Price=2099.99,PSU=950 => score~10.45
    (N'The Warlord''s Dominion',        16384,  2099.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      10.00, N'kg',  950, 15, 15, N'Active'),
    -- 47. The Chieftain's Hearth — Baron: RAM=16384,Storage=1000,Price=999.99,PSU=700 => score~7.90
    (N'The Chieftain''s Hearth',        16384,   999.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.00, N'kg',  700, 12, 13, N'Active'),
    -- 48. The Jarl's Hall — Baron: RAM=16384,Storage=1000,Price=899.99,PSU=650 => score~7.65
    (N'The Jarl''s Hall',               16384,   899.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      9.40, N'kg',  650, 10, 9,  N'Active'),
    -- 49. The Thegn's Holding — Baron: RAM=16384,Storage=1000,Price=799.99,PSU=600 => score~7.40
    (N'The Thegn''s Holding',           16384,   799.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     12.50, N'lb',  600, 2,  5,  N'Active'),
    -- 50. The Housecarl's Post — Page: RAM=2048,Storage=128,Price=249.99,PSU=300 => score~1.60
    (N'The Housecarl''s Post',           2048,   249.99, N'https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       14.00, N'lb',  300, 7,  2,  N'Active'),
    -- 51. The Overlord's Citadel — Sovereign: RAM=131072,Storage=12000,Price=4799.99,PSU=1200 => score~52.05
    (N'The Overlord''s Citadel',        131072,  4799.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 13.00, N'kg', 1200, 16, 8,  N'Active'),
    -- 52. The Suzerain's Court — Sovereign: RAM=65536,Storage=8000,Price=3299.99,PSU=1200 => score~27.75
    (N'The Suzerain''s Court',           65536,  3299.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 11.80, N'kg', 1200, 15, 10, N'Active'),
    -- 53. The Potentate's Chamber — Duke: RAM=16384,Storage=2000,Price=1799.99,PSU=850 => score~9.60
    (N'The Potentate''s Chamber',       16384,  1799.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      9.10, N'kg',  850, 9,  9,  N'Active'),
    -- 54. The Magnate's Study — Duke: RAM=16384,Storage=1000,Price=1799.99,PSU=850 => score~9.40
    (N'The Magnate''s Study',           16384,  1799.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.40, N'kg',  850, 11, 13, N'Active'),
    -- 55. The Patrician's Villa — Prince: RAM=32768,Storage=128,Price=499.99,PSU=350 => score~11.08
    (N'The Patrician''s Villa',         32768,   499.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     7.20, N'kg',  350, 6,  4,  N'Active'),
    -- 56. The Centurion's Camp — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Centurion''s Camp',           8192,   299.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   11.50, N'lb',  300, 4,  6,  N'Active'),
    -- 57. The Legionnaire's March — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Legionnaire''s March',        8192,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    6.50, N'kg',  700, 5,  5,  N'Active'),
    -- 58. The Tribune's Rostrum — Baron: RAM=16384,Storage=1000,Price=1099.99,PSU=750 => score~8.20
    (N'The Tribune''s Rostrum',         16384,  1099.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      9.20, N'kg',  750, 14, 12, N'Active'),
    -- 59. The Prefect's Fortress — Duke: RAM=16384,Storage=2000,Price=1999.99,PSU=900 => score~10.00
    (N'The Prefect''s Fortress',        16384,  1999.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.80, N'kg',  900, 12, 14, N'Active'),
    -- 60. The Praetor's Command — Prince: RAM=32768,Storage=512,Price=999.99,PSU=550 => score~12.30
    (N'The Praetor''s Command',         32768,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    10.40, N'kg',  550, 16, 15, N'Active'),
    -- 61. The Dictator's Seat — Sovereign: RAM=65536,Storage=8000,Price=3599.99,PSU=1200 => score~28.20
    (N'The Dictator''s Seat',            65536,  3599.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 12.20, N'kg', 1200, 9,  8,  N'Active'),
    -- 62. The Imperator's Will — Sovereign: RAM=131072,Storage=12000,Price=4299.99,PSU=1200 => score~51.30
    (N'The Imperator''s Will',          131072,  4299.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop', 11.60, N'kg', 1200, 15, 8,  N'Active'),
    -- 63. The Triumvir's Alliance — Page: RAM=4096,Storage=128,Price=249.99,PSU=300 => score~2.20
    (N'The Triumvir''s Alliance',        4096,   249.99, N'https://images.pexels.com/photos/7862505/pexels-photo-7862505.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       19.00, N'lb',  300, 2,  3,  N'Active'),
    -- 64. The Aedile's Square — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Aedile''s Square',            8192,   299.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   11.00, N'lb',  300, 3,  6,  N'Active'),
    -- 65. The Quaestor's Treasury — Knight: RAM=8192,Storage=512,Price=1099.99,PSU=750 => score~5.65
    (N'The Quaestor''s Treasury',        8192,  1099.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    7.00, N'kg',  750, 7,  2,  N'Active'),
    -- 66. The Censor's Ledger — Baron: RAM=16384,Storage=1000,Price=999.99,PSU=700 => score~7.90
    (N'The Censor''s Ledger',           16384,   999.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.20, N'kg',  700, 11, 11, N'Active'),
    -- 67. The Pontifex's Shrine — Prince: RAM=32768,Storage=256,Price=699.99,PSU=450 => score~11.60
    (N'The Pontifex''s Shrine',         32768,   699.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     9.60, N'kg',  450, 10, 10, N'Active'),
    -- 68. The Augur's Vision — Sovereign: RAM=65536,Storage=12000,Price=2799.99,PSU=1000 => score~26.20
    (N'The Augur''s Vision',             65536,  2799.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',10.70, N'kg', 1000, 16, 15, N'Active'),
    -- 69. The Haruspex's Oracle — Page: RAM=4096,Storage=128,Price=249.99,PSU=300 => score~2.20
    (N'The Haruspex''s Oracle',          4096,   249.99, N'https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       21.00, N'lb',  300, 1,  7,  N'Active'),
    -- 70. The Flamen's Altar — Page: RAM=2048,Storage=128,Price=249.99,PSU=300 => score~1.60
    (N'The Flamen''s Altar',             2048,   249.99, N'https://images.pexels.com/photos/7862505/pexels-photo-7862505.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       12.00, N'lb',  300, 2,  6,  N'Active'),
    -- 71. The Vestal's Hearth — Baron: RAM=16384,Storage=1000,Price=799.99,PSU=600 => score~7.40
    (N'The Vestal''s Hearth',           16384,   799.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     5.90, N'kg',  600, 13, 12, N'Active'),
    -- 72. The Sibyl's Prophecy — Baron: RAM=16384,Storage=1000,Price=899.99,PSU=650 => score~7.65
    (N'The Sibyl''s Prophecy',          16384,   899.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     7.60, N'kg',  650, 14, 9,  N'Active'),
    -- 73. The Oracle's Revelation — Prince: RAM=32768,Storage=256,Price=799.99,PSU=450 => score~11.75
    (N'The Oracle''s Revelation',       32768,   799.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    8.30, N'kg',  450, 12, 15, N'Active'),
    -- 74. The Prophet's Ascent — Prince: RAM=32768,Storage=256,Price=999.99,PSU=500 => score~12.15
    (N'The Prophet''s Ascent',          32768,   999.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   11.40, N'kg',  500, 9,  8,  N'Active'),
    -- 75. The Hierophant's Mystery — Page: RAM=2048,Storage=128,Price=299.99,PSU=350 => score~1.78
    (N'The Hierophant''s Mystery',       2048,   299.99, N'https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       18.50, N'lb',  350, 3,  7,  N'Active'),
    -- 76. The Archmage's Tower — Sovereign: RAM=131072,Storage=8000,Price=3749.99,PSU=1200 => score~48.00
    (N'The Archmage''s Tower',          131072,  3749.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',10.10, N'kg', 1200, 15, 8,  N'Active'),
    -- 77. The Sorcerer's Sanctum — Prince: RAM=32768,Storage=500,Price=1199.99,PSU=600 => score~12.70
    (N'The Sorcerer''s Sanctum',        32768,  1199.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    8.90, N'kg',  600, 16, 10, N'Active'),
    -- 78. The Warlock's Pact — Duke: RAM=16384,Storage=1000,Price=1999.99,PSU=900 => score~10.00
    (N'The Warlock''s Pact',            16384,  1999.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      7.50, N'kg',  900, 10, 14, N'Active'),
    -- 79. The Wizard's Workshop — Duke: RAM=16384,Storage=1000,Price=1799.99,PSU=850 => score~9.40
    (N'The Wizard''s Workshop',         16384,  1799.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      6.40, N'kg',  850, 11, 13, N'Active'),
    -- 80. The Conjurer's Circle — Page: RAM=4096,Storage=128,Price=249.99,PSU=300 => score~2.20
    (N'The Conjurer''s Circle',          4096,   249.99, N'https://images.pexels.com/photos/7862505/pexels-photo-7862505.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       23.00, N'lb',  300, 1,  7,  N'Active'),
    -- 81. The Enchanter's Forge — Prince: RAM=32768,Storage=128,Price=499.99,PSU=350 => score~11.08
    (N'The Enchanter''s Forge',         32768,   499.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    9.00, N'kg',  350, 12, 9,  N'Active'),
    -- 82. The Necromancer's Crypt — Knight: RAM=8192,Storage=512,Price=999.99,PSU=700 => score~5.40
    (N'The Necromancer''s Crypt',        8192,   999.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   13.00, N'lb',  700, 4,  5,  N'Active'),
    -- 83. The Alchemist's Lab — Baron: RAM=16384,Storage=512,Price=699.99,PSU=600 => score~7.15
    (N'The Alchemist''s Lab',           16384,   699.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     6.10, N'kg',  600, 7,  11, N'Active'),
    -- 84. The Sage's Tome — Duke: RAM=16384,Storage=1000,Price=2199.99,PSU=1000 => score~10.80
    (N'The Sage''s Tome',               16384,  2199.99, N'https://images.pexels.com/photos/3728099/pexels-photo-3728099.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',      8.10, N'kg', 1000, 14, 12, N'Active'),
    -- 85. The Scholar's Codex — Prince: RAM=32768,Storage=256,Price=799.99,PSU=450 => score~11.75
    (N'The Scholar''s Codex',           32768,   799.99, N'https://images.pexels.com/photos/5632399/pexels-photo-5632399.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    8.50, N'kg',  450, 10, 15, N'Active'),
    -- 86. The Archivist's Repository — Sovereign: RAM=65536,Storage=8000,Price=2499.99,PSU=1000 => score~25.15
    (N'The Archivist''s Repository',     65536,  2499.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',10.30, N'kg', 1000, 15, 8,  N'Active'),
    -- 87. The Lorekeeper's Vault — Sovereign: RAM=131072,Storage=12000,Price=4199.99,PSU=1200 => score~51.20
    (N'The Lorekeeper''s Vault',        131072,  4199.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',12.80, N'kg', 1200, 16, 8,  N'Active'),
    -- 88. The Chronicler's Annals — Squire: RAM=8192,Storage=256,Price=299.99,PSU=300 => score~3.50
    (N'The Chronicler''s Annals',        8192,   299.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   10.50, N'lb',  300, 3,  6,  N'Active'),
    -- 89. The Scribe's Scriptorium — Page: RAM=2048,Storage=128,Price=249.99,PSU=300 => score~1.60
    (N'The Scribe''s Scriptorium',       2048,   249.99, N'https://images.pexels.com/photos/3528500/pexels-photo-3528500.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',       16.00, N'lb',  300, 2,  3,  N'Active'),
    -- 90. The Grand Sovereign's Apex — Sovereign: RAM=131072,Storage=12000,Price=4999.99,PSU=1200 => score~52.10
    (N'The Grand Sovereign''s Apex',    131072,  4999.99, N'https://images.pexels.com/photos/7858743/pexels-photo-7858743.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',13.50, N'kg', 1200, 16, 8,  N'Active'),
    -- 91. The Page's Companion (New) — Squire: score~4.35
    (N'The Page''s Companion',           8192,   499.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    8.10, N'kg',  500, 1,  1,  N'New'),
    -- 92. The Squire's Arsenal (New) — Baron: score~7.17
    (N'The Squire''s Arsenal',          16384,   649.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    12.00, N'kg',  500, 2,  2,  N'New'),
    -- 93. The Herald's Tower (New) — Squire: score~4.52
    (N'The Herald''s Tower',             8192,   549.99, N'https://images.pexels.com/photos/699122/pexels-photo-699122.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   16.00, N'lb',  450, 3,  3,  N'New'),
    -- 94. The Knight's Fortress (New) — Baron: score~7.95
    (N'The Knight''s Fortress',         16384,   899.99, N'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    13.80, N'lb',  500, 4,  4,  N'New'),
    -- 95. The Baron's Citadel (New) — Sovereign: score~13.35
    (N'The Baron''s Citadel',           32768,  1099.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',  7.00, N'kg', 1000, 5,  5,  N'New'),
    -- 96. The Duke's Sanctum (New) — Prince: score~12.77
    (N'The Duke''s Sanctum',            32768,  1249.99, N'https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    6.00, N'kg',  450, 6,  6,  N'New'),
    -- 97. The Prince's Armory (New) — Knight: score~5.92
    (N'The Prince''s Armory',            8192,   749.99, N'https://images.pexels.com/photos/2878465/pexels-photo-2878465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',   15.00, N'lb', 1000, 7,  4,  N'New'),
    -- 98. The Viscount's Chamber (New) — Baron: score~7.30
    (N'The Viscount''s Chamber',        16384,   599.99, N'https://images.pexels.com/photos/8099640/pexels-photo-8099640.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     8.00, N'lb',  750, 7,  1,  N'New'),
    -- 99. The Sovereign's Throne (New) — Squire: score~4.25
    (N'The Sovereign''s Throne',         2048,  1499.99, N'https://images.pexels.com/photos/12786602/pexels-photo-12786602.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',    9.00, N'kg',  500, 8,  7,  N'New'),
    -- 100. The Court Jester's Box (New) — Page: score~2.55
    (N'The Court Jester''s Box',         2048,   349.99, N'https://images.pexels.com/photos/7862505/pexels-photo-7862505.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop',     22.00, N'lb',  700, 7,  5,  N'New');
GO

-- =============================================================================
-- Storage Drives
-- =============================================================================
INSERT INTO StorageDrives (ComputerId, CapacityGB, Type) VALUES
    -- 1. The Archduke's Engine: 4 TB SSD + 8 TB HDD
    (1,  4000, N'SSD'),
    (1,  8000, N'HDD'),
    -- 2. The Emperor's Dominion: 4 TB SSD + 8 TB HDD
    (2,  4000, N'SSD'),
    (2,  8000, N'HDD'),
    -- 3. The Regent's Might: 4 TB SSD + 8 TB HDD
    (3,  4000, N'SSD'),
    (3,  8000, N'HDD'),
    -- 4. The Paladin's Core: 1 TB SSD + 2 TB HDD
    (4,  1000, N'SSD'),
    (4,  2000, N'HDD'),
    -- 5. The Warden's Watch: 512 GB SSD
    (5,   512, N'SSD'),
    -- 6. The Chancellor's Decree: 256 GB SSD
    (6,   256, N'SSD'),
    -- 7. The Viceroy's Command: 512 GB SSD
    (7,   512, N'SSD'),
    -- 8. The Marshal's Banner: 512 GB SSD
    (8,   512, N'SSD'),
    -- 9. The Constable's Keep: 256 GB HDD
    (9,   256, N'HDD'),
    -- 10. The Chamberlain's Vault: 2 TB SSD
    (10,  2000, N'SSD'),
    -- 11. The Steward's Watch: 512 GB SSD
    (11,   512, N'SSD'),
    -- 12. The Banneret's Standard: 512 GB SSD
    (12,   512, N'SSD'),
    -- 13. The Thane's Bastion: 2 TB SSD
    (13,  2000, N'SSD'),
    -- 14. The Liegeman's Post: 128 GB SSD
    (14,   128, N'SSD'),
    -- 15. The Seneschal's Hall: 500 GB SSD
    (15,   500, N'SSD'),
    -- 16. The Castellan's Tower: 1 TB SSD
    (16,  1000, N'SSD'),
    -- 17. The Warlord's Siege: 256 GB SSD
    (17,   256, N'SSD'),
    -- 18. The Envoy's Dispatch: 256 GB HDD
    (18,   256, N'HDD'),
    -- 19. The Tribune's Oration: 512 GB SSD
    (19,   512, N'SSD'),
    -- 20. The Legate's Decree: 1 TB HDD
    (20,  1000, N'HDD'),
    -- 21. The Prelate's Sanctum: 1 TB SSD
    (21,  1000, N'SSD'),
    -- 22. The Exarch's Domain: 500 GB SSD
    (22,   500, N'SSD'),
    -- 23. The Patriarch's Legacy: 256 GB HDD
    (23,   256, N'HDD'),
    -- 24. The Prefect's Order: 256 GB HDD
    (24,   256, N'HDD'),
    -- 25. The Tribune's Voice: 512 GB SSD
    (25,   512, N'SSD'),
    -- 26. The Praetor's Judgment: 1 TB SSD
    (26,  1000, N'SSD'),
    -- 27. The Consul's Authority: 8 TB HDD
    (27,  8000, N'HDD'),
    -- 28. The Procurator's Ledger: 500 GB HDD
    (28,   500, N'HDD'),
    -- 29. The Strategos' Gambit: 512 GB SSD
    (29,   512, N'SSD'),
    -- 30. The Eparch's Edict: 128 GB SSD
    (30,   128, N'SSD'),
    -- 31. The Archon's Seal: 2 TB SSD
    (31,  2000, N'SSD'),
    -- 32. The Tyrant's Grip: 512 GB SSD
    (32,   512, N'SSD'),
    -- 33. The Oligarch's Reserve: 256 GB HDD
    (33,   256, N'HDD'),
    -- 34. The Satrap's Province: 512 GB SSD
    (34,   512, N'SSD'),
    -- 35. The Vizier's Counsel: 1 TB SSD
    (35,  1000, N'SSD'),
    -- 36. The Sultan's Pavilion: 2 TB SSD
    (36,  2000, N'SSD'),
    -- 37. The Caliph's Fortress: 4 TB SSD + 8 TB HDD
    (37,  4000, N'SSD'),
    (37,  8000, N'HDD'),
    -- 38. The Emir's Outpost: 512 GB SSD
    (38,   512, N'SSD'),
    -- 39. The Pasha's Enclave: 512 GB SSD
    (39,   512, N'SSD'),
    -- 40. The Bey's Crossing: 128 GB SSD
    (40,   128, N'SSD'),
    -- 41. The Shogun's Stronghold: 256 GB SSD
    (41,   256, N'SSD'),
    -- 42. The Daimyo's Keep: 1 TB SSD
    (42,  1000, N'SSD'),
    -- 43. The Samurai's Edge: 512 GB SSD
    (43,   512, N'SSD'),
    -- 44. The Ronin's Path: 256 GB HDD
    (44,   256, N'HDD'),
    -- 45. The Ninja's Shadow: 500 GB HDD
    (45,   500, N'HDD'),
    -- 46. The Warlord's Dominion: 2 TB SSD
    (46,  2000, N'SSD'),
    -- 47. The Chieftain's Hearth: 1 TB SSD
    (47,  1000, N'SSD'),
    -- 48. The Jarl's Hall: 1 TB SSD
    (48,  1000, N'SSD'),
    -- 49. The Thegn's Holding: 1 TB HDD
    (49,  1000, N'HDD'),
    -- 50. The Housecarl's Post: 128 GB SSD
    (50,   128, N'SSD'),
    -- 51. The Overlord's Citadel: 4 TB SSD + 8 TB HDD
    (51,  4000, N'SSD'),
    (51,  8000, N'HDD'),
    -- 52. The Suzerain's Court: 8 TB HDD
    (52,  8000, N'HDD'),
    -- 53. The Potentate's Chamber: 2 TB SSD
    (53,  2000, N'SSD'),
    -- 54. The Magnate's Study: 1 TB SSD
    (54,  1000, N'SSD'),
    -- 55. The Patrician's Villa: 128 GB SSD
    (55,   128, N'SSD'),
    -- 56. The Centurion's Camp: 256 GB HDD
    (56,   256, N'HDD'),
    -- 57. The Legionnaire's March: 512 GB SSD
    (57,   512, N'SSD'),
    -- 58. The Tribune's Rostrum: 1 TB SSD
    (58,  1000, N'SSD'),
    -- 59. The Prefect's Fortress: 2 TB SSD
    (59,  2000, N'SSD'),
    -- 60. The Praetor's Command: 512 GB SSD
    (60,   512, N'SSD'),
    -- 61. The Dictator's Seat: 8 TB HDD
    (61,  8000, N'HDD'),
    -- 62. The Imperator's Will: 4 TB SSD + 8 TB HDD
    (62,  4000, N'SSD'),
    (62,  8000, N'HDD'),
    -- 63. The Triumvir's Alliance: 128 GB SSD
    (63,   128, N'SSD'),
    -- 64. The Aedile's Square: 256 GB HDD
    (64,   256, N'HDD'),
    -- 65. The Quaestor's Treasury: 512 GB SSD
    (65,   512, N'SSD'),
    -- 66. The Censor's Ledger: 1 TB SSD
    (66,  1000, N'SSD'),
    -- 67. The Pontifex's Shrine: 256 GB SSD
    (67,   256, N'SSD'),
    -- 68. The Augur's Vision: 4 TB SSD + 8 TB HDD
    (68,  4000, N'SSD'),
    (68,  8000, N'HDD'),
    -- 69. The Haruspex's Oracle: 128 GB SSD
    (69,   128, N'SSD'),
    -- 70. The Flamen's Altar: 128 GB SSD
    (70,   128, N'SSD'),
    -- 71. The Vestal's Hearth: 1 TB SSD
    (71,  1000, N'SSD'),
    -- 72. The Sibyl's Prophecy: 1 TB SSD
    (72,  1000, N'SSD'),
    -- 73. The Oracle's Revelation: 256 GB SSD
    (73,   256, N'SSD'),
    -- 74. The Prophet's Ascent: 256 GB SSD
    (74,   256, N'SSD'),
    -- 75. The Hierophant's Mystery: 128 GB HDD
    (75,   128, N'HDD'),
    -- 76. The Archmage's Tower: 8 TB HDD
    (76,  8000, N'HDD'),
    -- 77. The Sorcerer's Sanctum: 500 GB SSD
    (77,   500, N'SSD'),
    -- 78. The Warlock's Pact: 1 TB SSD
    (78,  1000, N'SSD'),
    -- 79. The Wizard's Workshop: 1 TB SSD
    (79,  1000, N'SSD'),
    -- 80. The Conjurer's Circle: 128 GB SSD
    (80,   128, N'SSD'),
    -- 81. The Enchanter's Forge: 128 GB SSD
    (81,   128, N'SSD'),
    -- 82. The Necromancer's Crypt: 512 GB SSD
    (82,   512, N'SSD'),
    -- 83. The Alchemist's Lab: 512 GB SSD
    (83,   512, N'SSD'),
    -- 84. The Sage's Tome: 1 TB SSD
    (84,  1000, N'SSD'),
    -- 85. The Scholar's Codex: 256 GB SSD
    (85,   256, N'SSD'),
    -- 86. The Archivist's Repository: 8 TB HDD
    (86,  8000, N'HDD'),
    -- 87. The Lorekeeper's Vault: 4 TB SSD + 8 TB HDD
    (87,  4000, N'SSD'),
    (87,  8000, N'HDD'),
    -- 88. The Chronicler's Annals: 256 GB HDD
    (88,   256, N'HDD'),
    -- 89. The Scribe's Scriptorium: 128 GB SSD
    (89,   128, N'SSD'),
    -- 90. The Grand Sovereign's Apex: 4 TB SSD + 8 TB HDD
    (90,  4000, N'SSD'),
    (90,  8000, N'HDD'),
    -- 91. The Page's Companion: 1 TB SSD
    (91,  1000, N'SSD'),
    -- 92. The Squire's Arsenal: 2 TB HDD
    (92,  2000, N'HDD'),
    -- 93. The Herald's Tower: 2 TB HDD
    (93,  2000, N'HDD'),
    -- 94. The Knight's Fortress: 4 TB HDD
    (94,  4000, N'HDD'),
    -- 95. The Baron's Citadel: 512 GB SSD
    (95,   512, N'SSD'),
    -- 96. The Duke's Sanctum: 2 TB SSD
    (96,  2000, N'SSD'),
    -- 97. The Prince's Armory: 2 TB HDD
    (97,  2000, N'HDD'),
    -- 98. The Viscount's Chamber: 500 GB SSD
    (98,   500, N'SSD'),
    -- 99. The Sovereign's Throne: 2 TB HDD
    (99,  2000, N'HDD'),
    -- 100. The Court Jester's Box: 128 GB SSD
    (100,  128, N'SSD');
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
    (90,  8, N'USB-C'),
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
