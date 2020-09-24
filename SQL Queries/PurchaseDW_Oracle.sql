--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Team7_Model.DM1
--
-- Date Created : Sunday, February 23, 2020 23:54:05
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Dim_RejectCodes 
--

CREATE TABLE Dim_RejectCodes(
    DI_Reject_SK            NUMBER(38, 0)    NOT NULL,
    DI_RejectCode           NUMBER(38, 0)    NOT NULL,
    DI_RejectReason         NCHAR(80),
    DI_RejectDescription    NCHAR(255),
    SOR_ID                  NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    DI_Job_ID               VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date          DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date        DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (DI_Reject_SK)
)
;



-- 
-- TABLE: Dim_SORSystem 
--

CREATE TABLE Dim_SORSystem(
    SOR_ID              NUMBER(38, 0)    NOT NULL,
    SOR_Name            NCHAR(20),
    SOR_Type            VARCHAR2(80),
    SOR_FileType        VARCHAR2(80),
    DI_Job_ID           VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date      DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date    DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (SOR_ID)
)
;



-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateSK               NUMBER(38, 0)    NOT NULL,
    FullDateAK           DATE             NOT NULL,
    DayNumberOfWeek      NUMBER(38, 0)    NOT NULL,
    DayNameOfWeek        NVARCHAR2(10)    NOT NULL,
    DayNameOfWeekAbbr    NVARCHAR2(3)     NOT NULL,
    DayNumberOfMonth     NUMBER(38, 0)    NOT NULL,
    DayNumberOfYear      NUMBER(38, 0)    NOT NULL,
    WeekNumberOfYear     NUMBER(38, 0)    NOT NULL,
    MonthName            NVARCHAR2(10)    NOT NULL,
    MonthNameAbbr        NVARCHAR2(3)     NOT NULL,
    MonthNumberOfYear    NUMBER(38, 0)    NOT NULL,
    CalendarQuarter      NUMBER(38, 0)    NOT NULL,
    CalendarYear         NUMBER(38, 0)    NOT NULL,
    SOR_ID               NUMBER(38, 0)    DEFAULT 'what_DI_Tool?' NOT NULL,
    DI_Job_ID            VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date       DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date     DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (DateSK)
)
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeSK            NUMBER(38, 0)     NOT NULL,
    BusinessEntityID      NUMBER(38, 0)     NOT NULL,
    EmployeeNationalID    NVARCHAR2(15),
    GeoSK                 NUMBER(38, 0),
    AddressLine1          NVARCHAR2(60),
    AddressLine2          NVARCHAR2(60),
    AddressType           NVARCHAR2(50),
    Purchase_Buyer        NUMBER(38, 0)     DEFAULT (0) NOT NULL,
    FirstName             NVARCHAR2(50)     NOT NULL,
    LastName              NVARCHAR2(50)     NOT NULL,
    MiddleName            NVARCHAR2(50),
    NameStyle             NUMBER(38, 0),
    JobTitle              NVARCHAR2(50),
    LoginID               NVARCHAR2(256),
    EmailAddress          NVARCHAR2(50),
    Phone                 NVARCHAR2(25),
    PhoneNumberType       NVARCHAR2(50),
    MaritalStatus         NCHAR(1),
    SalariedFlag          NUMBER(38, 0),
    Gender                NCHAR(1),
    PayFrequency          NUMBER(38, 0),
    BaseRate              NUMBER(9, 0),
    VacationHours         NUMBER(38, 0),
    SickLeaveHours        NUMBER(38, 0),
    CurrentFlag           NUMBER(38, 0)     NOT NULL,
    SalesPersonFlag       NUMBER(38, 0)     NOT NULL,
    DepartmentName        NVARCHAR2(50),
    Status                NVARCHAR2(50),
    SOR_ID                NUMBER(38, 0)     DEFAULT (-1) NOT NULL,
    SOR_LoadDate          DATE,
    SOR_UpdateDate        DATE,
    DI_Job_ID             VARCHAR2(40)      DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date        DATE              DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date      DATE              DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (EmployeeSK)
)
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeoSK                      NUMBER(38, 0)    NOT NULL,
    City                       NVARCHAR2(30),
    StateProvinceCode          NVARCHAR2(3),
    StateProvinceName          NVARCHAR2(50),
    IsOnlyStateProvinceFlag    NUMBER(38, 0),
    CountryRegionCode          NVARCHAR2(3),
    CountryRegionName          NVARCHAR2(50),
    TerriroyID                 NUMBER(38, 0),
    PostalCode                 NVARCHAR2(15),
    SOR_ID                     NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate               DATE,
    SOR_UpdateDate             DATE,
    DI_Job_ID                  VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date             DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date           DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (GeoSK)
)
;



-- 
-- TABLE: DimLocation 
--

CREATE TABLE DimLocation(
    LocationSK          NUMBER(38, 0)    NOT NULL,
    LocationID          NUMBER(38, 0)    NOT NULL,
    LocationName        VARCHAR2(50)     NOT NULL,
    CostRate            NUMBER(9, 0)     NOT NULL,
    Availability        NUMBER(9, 0)     NOT NULL,
    ModifiedDate        DATE             NOT NULL,
    SOR_ID              NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate        DATE,
    SOR_UpdateDate      DATE,
    DI_Job_ID           VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date      DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date    DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (LocationSK)
)
;



-- 
-- TABLE: DimPayHistory 
--

CREATE TABLE DimPayHistory(
    PayHistorySK        NUMBER(38, 0)    NOT NULL,
    EmployeeSK          NUMBER(38, 0)    NOT NULL,
    Rate                NUMBER(9, 0)     NOT NULL,
    PayFrequency        NUMBER(38, 0)    NOT NULL,
    ModifiedDate        DATE             NOT NULL,
    scd_start           DATE,
    scd_end             DATE,
    scd_Version         NUMBER(38, 0),
    scd_Active          NUMBER(38, 0),
    SOR_ID              NUMBER(38, 0)    DEFAULT (-1),
    DI_Job_ID           VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date      DATE             DEFAULT (getdate()),
    DI_Modified_Date    DATE             DEFAULT (getdate()),
    PRIMARY KEY (PayHistorySK)
)
;



-- 
-- TABLE: DimProductCostHistory 
--

CREATE TABLE DimProductCostHistory(
    ProductCostHistorySK    NUMBER(38, 0)    NOT NULL,
    StandardCost            NUMBER(9, 0)     NOT NULL,
    ModifiedDate            DATE             NOT NULL,
    scd_start               DATE,
    scd_end                 DATE,
    scd_Version             NUMBER(38, 0),
    scd_Active              NUMBER(38, 0),
    SOR_ID                  NUMBER(38, 0)    DEFAULT (-1),
    DI_Job_ID               VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date          DATE             DEFAULT (getdate()),
    DI_Modified_Date        DATE             DEFAULT (getdate()),
    ProductPurchasedSK      NUMBER(38, 0)    NOT NULL,
    PRIMARY KEY (ProductCostHistorySK)
)
;



-- 
-- TABLE: DimProductPriceHistory 
--

CREATE TABLE DimProductPriceHistory(
    ProductPriceHistorySK    NUMBER(38, 0)    NOT NULL,
    ListPrice                NUMBER(9, 0)     NOT NULL,
    ModifiedDate             DATE             NOT NULL,
    scd_start                DATE,
    scd_end                  DATE,
    scd_Version              NUMBER(38, 0),
    scd_Active               NUMBER(38, 0),
    SOR_ID                   NUMBER(38, 0)    DEFAULT (-1),
    DI_Job_ID                VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date           DATE             DEFAULT (getdate()),
    DI_Modified_Date         DATE             DEFAULT (getdate()),
    ProductPurchasedSK       NUMBER(38, 0)    NOT NULL,
    PRIMARY KEY (ProductPriceHistorySK)
)
;



-- 
-- TABLE: DimProducts_Purchased 
--

CREATE TABLE DimProducts_Purchased(
    ProductPurchasedSK        NUMBER(38, 0)    NOT NULL,
    ProductID                 NUMBER(38, 0)    NOT NULL,
    ProductNumber             VARCHAR2(25),
    ProductName               VARCHAR2(50),
    ProductSubcategoryID      NUMBER(38, 0),
    ProductSubcategoryName    VARCHAR2(50),
    ProductCategoryID         NUMBER(38, 0),
    ProductCategoryName       VARCHAR2(50),
    ProductModelID            NUMBER(38, 0),
    ModelName                 VARCHAR2(50),
    FinishedGoodsFlag         NUMBER(38, 0),
    MakeFlag                  NUMBER(38, 0),
    StandardCost              NUMBER(9, 0),
    ListPrice                 NUMBER(9, 0),
    ProductLine               CHAR(2),
    ProductClass              CHAR(2),
    ProductStyle              CHAR(2),
    WeightUnitMeasureCode     CHAR(3),
    SizeUnitMeasureCode       CHAR(3),
    ProductColor              VARCHAR2(15),
    SafetyStockLevel          NUMBER(38, 0),
    ReorderPoint              NUMBER(38, 0),
    ProductSize               VARCHAR2(50),
    ProductWeight             NUMBER(9, 0),
    DaysToManufacture         NUMBER(38, 0),
    SellStartDate             DATE,
    SellEndDate               DATE,
    DiscontinuedDate          DATE,
    SOR_ID                    NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate              DATE,
    SOR_UpdateDate            DATE,
    DI_Job_ID                 VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date            DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date          DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (ProductPurchasedSK)
)
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendorSK       NUMBER(38, 0)    NOT NULL,
    ProductPurchasedSK    NUMBER(38, 0),
    VendorSK              NUMBER(38, 0),
    ProductID             NUMBER(38, 0)    NOT NULL,
    VendorID              NUMBER(38, 0)    NOT NULL,
    AverageLeadTime       NUMBER(38, 0)    NOT NULL,
    StandardPrice         NUMBER(9, 0)     NOT NULL,
    LastReceiptCost       NUMBER(9, 0),
    LastReceiptDateSK     NUMBER(38, 0),
    LastReceiptDate       DATE,
    MinOrderQty           NUMBER(38, 0)    NOT NULL,
    MaxOrderQty           NUMBER(38, 0)    NOT NULL,
    OnOrderQty            NUMBER(38, 0),
    UnitMeasureCode       NCHAR(3)         NOT NULL,
    SOR_ID                NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate          DATE,
    SOR_UpdateDate        DATE,
    DI_Job_ID             VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date        DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date      DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (ProductVendorSK)
)
;



-- 
-- TABLE: DimScrapReason 
--

CREATE TABLE DimScrapReason(
    ScrapReasonSK       NUMBER(38, 0)    NOT NULL,
    ScrapReasonID       NUMBER(38, 0)    NOT NULL,
    ScrapReasonName     VARCHAR2(50)     NOT NULL,
    SOR_ID              NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate        DATE,
    SOR_UpdateDate      DATE,
    DI_Job_ID           VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date      DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date    DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (ScrapReasonSK)
)
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethodSK        NUMBER(38, 0)    NOT NULL,
    ShipMethodID        NUMBER(38, 0)    NOT NULL,
    ShipMethodName      NVARCHAR2(50)    NOT NULL,
    ShipBase            NUMBER(9, 0)     NOT NULL,
    ShipRate            NUMBER(9, 0)     NOT NULL,
    SOR_ID              NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate        DATE,
    SOR_UpdateDate      DATE,
    DI_Job_ID           VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date      DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date    DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (ShipMethodSK)
)
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContacts_SK          NUMBER(38, 0)    NOT NULL,
    Person_BusinessEntityID    NUMBER(38, 0)    NOT NULL,
    VendorSK                   NUMBER(38, 0)    NOT NULL,
    Vendor_BusinessEntityID    NUMBER(38, 0)    NOT NULL,
    ContactType                NVARCHAR2(50)    NOT NULL,
    Title                      NVARCHAR2(8),
    FirstName                  NVARCHAR2(50)    NOT NULL,
    MiddleName                 NVARCHAR2(50),
    LastName                   NVARCHAR2(50)    NOT NULL,
    Suffix                     NVARCHAR2(10),
    PhoneNumber                NVARCHAR2(25),
    PhoneNumberType            NVARCHAR2(50),
    EmailAddress               NVARCHAR2(50),
    SOR_ID                     NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate               DATE,
    SOR_UpdateDate             DATE,
    DI_Job_ID                  VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date             DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date           DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (VendorContacts_SK)
)
;



-- 
-- TABLE: DimVendors 
--

CREATE TABLE DimVendors(
    VendorSK                 NUMBER(38, 0)    NOT NULL,
    BusinessEntityID         NUMBER(38, 0)    NOT NULL,
    AccountNumber            VARCHAR2(15)     NOT NULL,
    VendorName               VARCHAR2(50)     NOT NULL,
    CreditRating             NUMBER(38, 0)    NOT NULL,
    PreferredVendorStatus    VARCHAR2(1)      NOT NULL,
    ActiveFlag               NUMBER(38, 0)    NOT NULL,
    AddressTypeName          VARCHAR2(50)     NOT NULL,
    AddressLine1             VARCHAR2(60)     NOT NULL,
    AddressLine2             VARCHAR2(60),
    GeoSK                    NUMBER(38, 0),
    SOR_ID                   NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate             DATE,
    SOR_UpdateDate           DATE,
    DI_Job_ID                VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date           DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date         DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (VendorSK)
)
;



-- 
-- TABLE: Fact_WorkOrder 
--

CREATE TABLE Fact_WorkOrder(
    WorkOrderSK              NUMBER(38, 0)    NOT NULL,
    WorkOrderID              NUMBER(38, 0)    NOT NULL,
    ProductPurchasedSK       NUMBER(38, 0)    NOT NULL,
    OrderQty                 NUMBER(38, 0)    NOT NULL,
    StockedQty               NUMBER(38, 0)    DEFAULT (0) NOT NULL,
    ScrappedQty              NUMBER(38, 0)    NOT NULL,
    WorkOrder_StartDateSK    NUMBER(38, 0),
    WorkOrder_EndDateSK      NUMBER(38, 0),
    WorkOrder_DueDateSK      NUMBER(38, 0),
    StartDate                DATE             NOT NULL,
    EndDate                  DATE,
    DueDate                  DATE             NOT NULL,
    ScrapReasonSK            NUMBER(38, 0),
    SOR_ID                   NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate             DATE,
    SOR_UpdateDate           DATE,
    DI_Job_ID                VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date           DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date         DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (WorkOrderSK)
)
;



-- 
-- TABLE: Fact_WorkOrder_Rejects 
--

CREATE TABLE Fact_WorkOrder_Rejects(
    RejectWorkOrderRoutingSK    NUMBER(38, 0)    NOT NULL,
    ProductPurchasedSK          NUMBER(38, 0)    NOT NULL,
    WorkOrderID                 NUMBER(38, 0),
    OrderQty                    NUMBER(38, 0),
    StockedQty                  NUMBER(38, 0)    DEFAULT (0),
    ScrappedQty                 NUMBER(38, 0),
    WorkOrder_StartDateSK       NUMBER(38, 0),
    WorkOrder_EndDateSK         NUMBER(38, 0),
    WorkOrder_DueDateSK         NUMBER(38, 0),
    StartDate                   DATE,
    EndDate                     DATE,
    DueDate                     DATE,
    ProductID                   NUMBER(38, 0),
    ScrapReasonSK               NUMBER(38, 0),
    DI_Reject_SK                NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_ID                      NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate                DATE,
    SOR_UpdateDate              DATE,
    DI_Job_ID                   VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date              DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date            DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)
;



-- 
-- TABLE: Fact_WorkOrderRouting 
--

CREATE TABLE Fact_WorkOrderRouting(
    WorkOrderRoutingSK      NUMBER(38, 0)    NOT NULL,
    WorkOrderSK             NUMBER(38, 0)    NOT NULL,
    ProductPurchasedSK      NUMBER(38, 0)    NOT NULL,
    OperationSequence       NUMBER(38, 0)    NOT NULL,
    LocationSK              NUMBER(38, 0)    NOT NULL,
    ScheduledStartDate      DATE             NOT NULL,
    ScheduledEndDate        DATE             NOT NULL,
    ActualStartDate         DATE,
    ActualEndDate           DATE,
    ActualResourceHrs       NUMBER(9, 0),
    PlannedCost             NUMBER(9, 0),
    ActualCost              NUMBER(9, 0),
    SOR_ID                  NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate            DATE,
    SOR_UpdateDate          DATE,
    DI_Job_ID               VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date          DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date        DATE             DEFAULT (getdate()) NOT NULL,
    ScheduledStartDateSK    NUMBER(38, 0),
    ScheduledEndDateSK      NUMBER(38, 0),
    ActualStartDateSK       NUMBER(38, 0),
    ActualEndDateSK         NUMBER(38, 0),
    PRIMARY KEY (WorkOrderRoutingSK)
)
;



-- 
-- TABLE: Fact_WorkOrderRouting_Rejects 
--

CREATE TABLE Fact_WorkOrderRouting_Rejects(
    RejectWorkOrderRoutingSK    NUMBER(38, 0)    NOT NULL,
    WorkOrderSK                 NUMBER(38, 0),
    OperationSequence           NUMBER(38, 0),
    LocationSK                  NUMBER(38, 0),
    ScheduledStartDate          DATE,
    ScheduledEndDate            DATE,
    ActualStartDate             DATE,
    ActualEndDate               DATE,
    ActualResourceHrs           NUMBER(9, 0),
    PlannedCost                 NUMBER(9, 0),
    ActualCost                  NUMBER(9, 0),
    WorkOrderID                 NUMBER(38, 0),
    ProductID                   NUMBER(38, 0),
    LocationID                  NUMBER(38, 0),
    DI_Reject_SK                NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_ID                      NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate                DATE,
    SOR_UpdateDate              DATE,
    DI_Job_ID                   VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date              DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date            DATE             DEFAULT (getdate()) NOT NULL,
    ProductPurchasedSK          NUMBER(38, 0)    NOT NULL,
    ScheduledStartDateSK        NUMBER(38, 0),
    ScheduledEndDateSK          NUMBER(38, 0),
    ActualStartDateSK           NUMBER(38, 0),
    ActualEndDateSK             NUMBER(38, 0),
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)
;



-- 
-- TABLE: FactPurchases 
--

CREATE TABLE FactPurchases(
    PurchaseSK               NUMBER(38, 0)    NOT NULL,
    PurchaseOrderID          NUMBER(38, 0)    NOT NULL,
    PurchaseOrderDetailID    NUMBER(38, 0)    NOT NULL,
    Status                   NUMBER(38, 0)    NOT NULL,
    EmployeeSK               NUMBER(38, 0),
    VendorSK                 NUMBER(38, 0),
    ShipMethodSK             NUMBER(38, 0),
    EmployeeID               NUMBER(38, 0)    NOT NULL,
    VendorID                 NUMBER(38, 0)    NOT NULL,
    ShipMethodID             NUMBER(38, 0)    NOT NULL,
    OrderDateSK              NUMBER(38, 0)    NOT NULL,
    ShipDateSK               NUMBER(38, 0),
    OrderDate                DATE             NOT NULL,
    ShipDate                 DATE,
    ProductPurchasedSK       NUMBER(38, 0)    NOT NULL,
    SubTotal                 NUMBER(9, 0)     NOT NULL,
    TaxAmt                   NUMBER(9, 0)     NOT NULL,
    Freight                  NUMBER(9, 0)     NOT NULL,
    TotalDue                 NUMBER(9, 0)     NOT NULL,
    DueDate                  DATE             NOT NULL,
    OrderQty                 NUMBER(38, 0)    NOT NULL,
    UnitPrice                NUMBER(9, 0)     NOT NULL,
    LineTotal                NUMBER(9, 0)     NOT NULL,
    ReceivedQty              NUMBER(38, 0)    NOT NULL,
    RejectedQty              NUMBER(38, 0)    NOT NULL,
    StockedQty               NUMBER(38, 0)    NOT NULL,
    LineTaxAmount            NUMBER(9, 0)     NOT NULL,
    LineFreight              NUMBER(9, 0)     NOT NULL,
    LineTotalDue             NUMBER(9, 0),
    SOR_ID                   NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate             DATE,
    SOR_UpdateDate           DATE,
    DI_Job_ID                VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date           DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date         DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (PurchaseSK)
)
;



-- 
-- TABLE: FactPurchases_Rejects 
--

CREATE TABLE FactPurchases_Rejects(
    PurchaseSK               NUMBER(38, 0)    NOT NULL,
    PurchaseOrderID          NUMBER(38, 0),
    PurchaseOrderDetailID    NUMBER(38, 0),
    Status                   NUMBER(38, 0),
    EmployeeSK               NUMBER(38, 0),
    VendorSK                 NUMBER(38, 0),
    ShipMethodSK             NUMBER(38, 0),
    EmployeeID               NUMBER(38, 0),
    VendorID                 NUMBER(38, 0),
    ShipMethodID             NUMBER(38, 0),
    OrderDateSK              NUMBER(38, 0),
    ShipDateSK               NUMBER(38, 0),
    OrderDate                DATE,
    ShipDate                 DATE,
    ProductPurchasedSK       NUMBER(38, 0),
    SubTotal                 NUMBER(9, 0),
    TaxAmt                   NUMBER(9, 0),
    Freight                  NUMBER(9, 0),
    TotalDue                 NUMBER(9, 0),
    DueDate                  DATE,
    OrderQty                 NUMBER(38, 0),
    UnitPrice                NUMBER(9, 0),
    LineTotal                NUMBER(9, 0),
    ReceivedQty              NUMBER(38, 0),
    RejectedQty              NUMBER(38, 0),
    StockedQty               NUMBER(38, 0),
    LineTaxAmount            NUMBER(9, 0),
    LineFreight              NUMBER(9, 0),
    LineTotalDue             NUMBER(9, 0),
    DI_Reject_SK             NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_ID                   NUMBER(38, 0)    DEFAULT (-1) NOT NULL,
    SOR_LoadDate             DATE,
    SOR_UpdateDate           DATE,
    DI_Job_ID                VARCHAR2(40)     DEFAULT ('no_job_id') NOT NULL,
    DI_Create_Date           DATE             DEFAULT (getdate()) NOT NULL,
    DI_Modified_Date         DATE             DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY (PurchaseSK)
)
;



