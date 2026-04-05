-- =============================================================================
-- Compu Palace - Computer Sales Management
-- Stored Procedures
-- =============================================================================
-- CRUD operations, paginated search, and dashboard statistics.
-- =============================================================================

USE CompuPalace;
GO

-- =============================================================================
-- sp_GetComputersPaged
-- Returns a paginated list of computers with processor and GPU details.
-- Uses OFFSET/FETCH for SQL Server 2012+ pagination.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_GetComputersPaged
    @PageNumber INT = 1,
    @PageSize   INT = 10,
    @TotalCount INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Get total count
    SELECT @TotalCount = COUNT(*) FROM Computers;

    -- Return paginated results with related data
    SELECT
        c.Id,
        c.Name,
        c.RamAmountMB,
        c.Price,
        c.ImageUrl,
        c.Weight,
        c.WeightUnit,
        c.PsuWattage,
        c.ProcessorId,
        p.Name        AS ProcessorName,
        p.Brand       AS ProcessorBrand,
        c.GpuId,
        g.Name        AS GpuName,
        g.Brand       AS GpuBrand,
        c.CreatedAt,
        c.UpdatedAt
    FROM Computers c
    INNER JOIN Processors p ON c.ProcessorId = p.Id
    INNER JOIN Gpus g       ON c.GpuId = g.Id
    ORDER BY c.Id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO

-- =============================================================================
-- sp_SearchComputers
-- Full-text-like search across computer name, processor name, GPU name,
-- and storage type using LIKE with wildcards.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_SearchComputers
    @SearchTerm NVARCHAR(200),
    @PageNumber INT = 1,
    @PageSize   INT = 10,
    @TotalCount INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Term NVARCHAR(202) = N'%' + @SearchTerm + N'%';

    -- Get total count of matching records
    SELECT @TotalCount = COUNT(DISTINCT c.Id)
    FROM Computers c
    INNER JOIN Processors p    ON c.ProcessorId = p.Id
    INNER JOIN Gpus g          ON c.GpuId = g.Id
    LEFT  JOIN StorageDrives s ON s.ComputerId = c.Id
    WHERE c.Name LIKE @Term
       OR p.Name LIKE @Term
       OR g.Name LIKE @Term
       OR s.Type LIKE @Term;

    -- Return paginated results
    SELECT DISTINCT
        c.Id,
        c.Name,
        c.RamAmountMB,
        c.Price,
        c.ImageUrl,
        c.Weight,
        c.WeightUnit,
        c.PsuWattage,
        c.ProcessorId,
        p.Name        AS ProcessorName,
        p.Brand       AS ProcessorBrand,
        c.GpuId,
        g.Name        AS GpuName,
        g.Brand       AS GpuBrand,
        c.CreatedAt,
        c.UpdatedAt
    FROM Computers c
    INNER JOIN Processors p    ON c.ProcessorId = p.Id
    INNER JOIN Gpus g          ON c.GpuId = g.Id
    LEFT  JOIN StorageDrives s ON s.ComputerId = c.Id
    WHERE c.Name LIKE @Term
       OR p.Name LIKE @Term
       OR g.Name LIKE @Term
       OR s.Type LIKE @Term
    ORDER BY c.Id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO

-- =============================================================================
-- sp_GetComputerById
-- Returns a single computer with all related data: processor, GPU,
-- storage drives, and USB ports.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_GetComputerById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Computer with processor and GPU
    SELECT
        c.Id,
        c.Name,
        c.RamAmountMB,
        c.Price,
        c.ImageUrl,
        c.Weight,
        c.WeightUnit,
        c.PsuWattage,
        c.ProcessorId,
        p.Name        AS ProcessorName,
        p.Brand       AS ProcessorBrand,
        c.GpuId,
        g.Name        AS GpuName,
        g.Brand       AS GpuBrand,
        c.CreatedAt,
        c.UpdatedAt
    FROM Computers c
    INNER JOIN Processors p ON c.ProcessorId = p.Id
    INNER JOIN Gpus g       ON c.GpuId = g.Id
    WHERE c.Id = @Id;

    -- Storage drives for this computer
    SELECT
        Id,
        ComputerId,
        CapacityGB,
        Type,
        CreatedAt
    FROM StorageDrives
    WHERE ComputerId = @Id
    ORDER BY Id;

    -- USB ports for this computer
    SELECT
        Id,
        ComputerId,
        Count,
        UsbType,
        CreatedAt
    FROM UsbPorts
    WHERE ComputerId = @Id
    ORDER BY UsbType;
END;
GO

-- =============================================================================
-- sp_CreateComputer
-- Inserts a new computer record and returns the generated ID.
-- Child records (StorageDrives, UsbPorts) should be inserted separately.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_CreateComputer
    @Name        NVARCHAR(200),
    @RamAmountMB INT,
    @Price       DECIMAL(10,2),
    @ImageUrl    NVARCHAR(500) = NULL,
    @Weight      DECIMAL(6,2),
    @WeightUnit  NVARCHAR(5),
    @PsuWattage  INT,
    @ProcessorId INT,
    @GpuId       INT,
    @NewId       INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Computers (Name, RamAmountMB, Price, ImageUrl, Weight, WeightUnit, PsuWattage, ProcessorId, GpuId)
    VALUES (@Name, @RamAmountMB, @Price, @ImageUrl, @Weight, @WeightUnit, @PsuWattage, @ProcessorId, @GpuId);

    SET @NewId = SCOPE_IDENTITY();
END;
GO

-- =============================================================================
-- sp_UpdateComputer
-- Updates an existing computer by ID. Sets UpdatedAt automatically.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_UpdateComputer
    @Id          INT,
    @Name        NVARCHAR(200),
    @RamAmountMB INT,
    @Price       DECIMAL(10,2),
    @ImageUrl    NVARCHAR(500) = NULL,
    @Weight      DECIMAL(6,2),
    @WeightUnit  NVARCHAR(5),
    @PsuWattage  INT,
    @ProcessorId INT,
    @GpuId       INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Computers
    SET
        Name        = @Name,
        RamAmountMB = @RamAmountMB,
        Price       = @Price,
        ImageUrl    = @ImageUrl,
        Weight      = @Weight,
        WeightUnit  = @WeightUnit,
        PsuWattage  = @PsuWattage,
        ProcessorId = @ProcessorId,
        GpuId       = @GpuId,
        UpdatedAt   = SYSUTCDATETIME()
    WHERE Id = @Id;

    IF @@ROWCOUNT = 0
        THROW 50001, 'Computer not found.', 1;
END;
GO

-- =============================================================================
-- sp_DeleteComputer
-- Deletes a computer by ID. CASCADE on StorageDrives and UsbPorts
-- handles child record cleanup automatically.
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_DeleteComputer
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Computers WHERE Id = @Id;

    IF @@ROWCOUNT = 0
        THROW 50002, 'Computer not found.', 1;
END;
GO

-- =============================================================================
-- sp_GetDashboardStats
-- Returns aggregate statistics for the dashboard:
--   Result Set 1: General stats (totals, averages, min/max)
--   Result Set 2: Count of drives by storage type
--   Result Set 3: Count of computers by GPU brand
-- =============================================================================
CREATE OR ALTER PROCEDURE sp_GetDashboardStats
AS
BEGIN
    SET NOCOUNT ON;

    -- General statistics
    SELECT
        COUNT(*)                    AS TotalComputers,
        CAST(AVG(Price) AS DECIMAL(10,2))
                                    AS AvgPrice,
        AVG(RamAmountMB)            AS AvgRamMB,
        MIN(Price)                  AS MinPrice,
        MAX(Price)                  AS MaxPrice
    FROM Computers;

    -- Storage type distribution
    SELECT
        Type            AS StorageType,
        COUNT(*)        AS DriveCount
    FROM StorageDrives
    GROUP BY Type
    ORDER BY Type;

    -- GPU brand distribution
    SELECT
        g.Brand         AS GpuBrand,
        COUNT(*)        AS ComputerCount
    FROM Computers c
    INNER JOIN Gpus g ON c.GpuId = g.Id
    GROUP BY g.Brand
    ORDER BY g.Brand;
END;
GO

PRINT 'Stored procedures created successfully.';
GO
