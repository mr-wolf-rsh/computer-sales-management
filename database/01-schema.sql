-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Schema Definition (SQL Server 2022)
-- =============================================================================
-- Creates the normalized database schema for managing computer inventory
-- with lookup tables for processors and GPUs, and child tables for
-- storage drives and USB ports.
-- =============================================================================

USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'CompuPalace')
    CREATE DATABASE CompuPalace;
GO

USE CompuPalace;
GO

-- =============================================================================
-- Processors - Lookup table for CPU models
-- =============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Processors') AND type = 'U')
CREATE TABLE Processors (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(200) NOT NULL,
    Brand       NVARCHAR(50)  NOT NULL, -- 'Intel' or 'AMD'
    CreatedAt   DATETIME2     DEFAULT SYSUTCDATETIME()
);
GO

-- =============================================================================
-- Gpus - Lookup table for GPU models
-- =============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Gpus') AND type = 'U')
CREATE TABLE Gpus (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(200) NOT NULL,
    Brand       NVARCHAR(50)  NOT NULL, -- 'NVIDIA' or 'AMD'
    CreatedAt   DATETIME2     DEFAULT SYSUTCDATETIME()
);
GO

-- =============================================================================
-- Computers - Main entity representing a computer product
-- =============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Computers') AND type = 'U')
CREATE TABLE Computers (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(200)   NOT NULL,   -- Royal product name
    RamAmountMB INT             NOT NULL,
    Price       DECIMAL(10,2)   NOT NULL,
    ImageUrl    NVARCHAR(500)   NULL,
    Weight      DECIMAL(6,2)    NOT NULL,
    WeightUnit  NVARCHAR(5)     NOT NULL,   -- 'kg' or 'lb'
    PsuWattage  INT             NOT NULL,
    ProcessorId INT             NOT NULL,
    GpuId       INT             NOT NULL,
    Status      NVARCHAR(20)    NOT NULL DEFAULT 'New',
    CreatedAt   DATETIME2       DEFAULT SYSUTCDATETIME(),
    UpdatedAt   DATETIME2       NULL,

    CONSTRAINT FK_Computers_Processors FOREIGN KEY (ProcessorId)
        REFERENCES Processors(Id),
    CONSTRAINT FK_Computers_Gpus FOREIGN KEY (GpuId)
        REFERENCES Gpus(Id),
    CONSTRAINT CK_Computers_WeightUnit CHECK (WeightUnit IN ('kg', 'lb')),
    CONSTRAINT CK_Computers_Price CHECK (Price >= 0),
    CONSTRAINT CK_Computers_RamAmountMB CHECK (RamAmountMB > 0),
    CONSTRAINT CK_Computers_Status CHECK (Status IN ('New', 'Active', 'Discontinued'))
);
GO

-- =============================================================================
-- StorageDrives - Child table: one computer can have multiple drives
-- =============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'StorageDrives') AND type = 'U')
CREATE TABLE StorageDrives (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    ComputerId  INT             NOT NULL,
    CapacityGB  INT             NOT NULL,
    Type        NVARCHAR(10)    NOT NULL,   -- 'SSD', 'HDD'
    CreatedAt   DATETIME2       DEFAULT SYSUTCDATETIME(),

    CONSTRAINT FK_StorageDrives_Computers FOREIGN KEY (ComputerId)
        REFERENCES Computers(Id) ON DELETE CASCADE,
    CONSTRAINT CK_StorageDrives_Type CHECK (Type IN ('SSD', 'HDD')),
    CONSTRAINT CK_StorageDrives_CapacityGB CHECK (CapacityGB > 0)
);
GO

-- =============================================================================
-- UsbPorts - Child table: one computer can have multiple USB port groups
-- =============================================================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'UsbPorts') AND type = 'U')
CREATE TABLE UsbPorts (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    ComputerId  INT             NOT NULL,
    Count       INT             NOT NULL,
    UsbType     NVARCHAR(10)    NOT NULL,   -- 'USB 2.0', 'USB 3.0', 'USB-C'
    CreatedAt   DATETIME2       DEFAULT SYSUTCDATETIME(),

    CONSTRAINT FK_UsbPorts_Computers FOREIGN KEY (ComputerId)
        REFERENCES Computers(Id) ON DELETE CASCADE,
    CONSTRAINT CK_UsbPorts_UsbType CHECK (UsbType IN ('USB 2.0', 'USB 3.0', 'USB-C')),
    CONSTRAINT CK_UsbPorts_Count CHECK (Count > 0)
);
GO

-- =============================================================================
-- Indexes
-- =============================================================================

-- Unique indexes on lookup table names (prevent duplicate entries)
CREATE UNIQUE INDEX UX_Processors_Name ON Processors(Name);
CREATE UNIQUE INDEX UX_Gpus_Name ON Gpus(Name);

-- Foreign key indexes for join performance
CREATE INDEX IX_Computers_ProcessorId ON Computers(ProcessorId);
CREATE INDEX IX_Computers_GpuId ON Computers(GpuId);
CREATE INDEX IX_StorageDrives_ComputerId ON StorageDrives(ComputerId);
CREATE INDEX IX_UsbPorts_ComputerId ON UsbPorts(ComputerId);

-- Index on price for sorting/filtering
CREATE INDEX IX_Computers_Price ON Computers(Price);

PRINT 'Schema created successfully.';
GO
