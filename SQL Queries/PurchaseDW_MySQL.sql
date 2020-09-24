--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Team7_Model.DM1
--
-- Date Created : Monday, February 24, 2020 13:46:49
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Dim_RejectCodes 
--

CREATE TABLE Dim_RejectCodes(
    DI_Reject_SK            INT                   NOT NULL,
    DI_RejectCode           INT                   NOT NULL,
    DI_RejectReason         NATIONAL CHAR(80),
    DI_RejectDescription    NATIONAL CHAR(255),
    SOR_ID                  INT                   NOT NULL,
    DI_Job_ID               VARCHAR(40)           NOT NULL,
    DI_Create_Date          DATETIME              NOT NULL,
    DI_Modified_Date        DATETIME              NOT NULL,
    PRIMARY KEY (DI_Reject_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_SORSystem 
--

CREATE TABLE Dim_SORSystem(
    SOR_ID              INT                  NOT NULL,
    SOR_Name            NATIONAL CHAR(20),
    SOR_Type            VARCHAR(80),
    SOR_FileType        VARCHAR(80),
    DI_Job_ID           VARCHAR(40)          NOT NULL,
    DI_Create_Date      DATETIME             NOT NULL,
    DI_Modified_Date    DATETIME             NOT NULL,
    PRIMARY KEY (SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimDate 
--

CREATE TABLE DimDate(
    DateSK               INT                     NOT NULL,
    FullDateAK           DATE                    NOT NULL,
    DayNumberOfWeek      INT                     NOT NULL,
    DayNameOfWeek        NATIONAL VARCHAR(10)    NOT NULL,
    DayNameOfWeekAbbr    NATIONAL VARCHAR(3)     NOT NULL,
    DayNumberOfMonth     INT                     NOT NULL,
    DayNumberOfYear      INT                     NOT NULL,
    WeekNumberOfYear     INT                     NOT NULL,
    MonthName            NATIONAL VARCHAR(10)    NOT NULL,
    MonthNameAbbr        NATIONAL VARCHAR(3)     NOT NULL,
    MonthNumberOfYear    INT                     NOT NULL,
    CalendarQuarter      INT                     NOT NULL,
    CalendarYear         INT                     NOT NULL,
    SOR_ID               INT                     NOT NULL,
    DI_Job_ID            VARCHAR(40)             NOT NULL,
    DI_Create_Date       DATETIME                NOT NULL,
    DI_Modified_Date     DATETIME                NOT NULL,
    PRIMARY KEY (DateSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimEmployee 
--

CREATE TABLE DimEmployee(
    EmployeeSK            INT                      NOT NULL,
    BusinessEntityID      INT                      NOT NULL,
    EmployeeNationalID    NATIONAL VARCHAR(15),
    GeoSK                 INT,
    AddressLine1          NATIONAL VARCHAR(60),
    AddressLine2          NATIONAL VARCHAR(60),
    AddressType           NATIONAL VARCHAR(50),
    Purchase_Buyer        INT                      NOT NULL,
    FirstName             NATIONAL VARCHAR(50)     NOT NULL,
    LastName              NATIONAL VARCHAR(50)     NOT NULL,
    MiddleName            NATIONAL VARCHAR(50),
    NameStyle             INT,
    JobTitle              NATIONAL VARCHAR(50),
    LoginID               NATIONAL VARCHAR(256),
    EmailAddress          NATIONAL VARCHAR(50),
    Phone                 NATIONAL VARCHAR(25),
    PhoneNumberType       NATIONAL VARCHAR(50),
    MaritalStatus         NATIONAL CHAR(1),
    SalariedFlag          INT,
    Gender                NATIONAL CHAR(1),
    PayFrequency          INT,
    BaseRate              DECIMAL(9, 0),
    VacationHours         INT,
    SickLeaveHours        INT,
    CurrentFlag           INT                      NOT NULL,
    SalesPersonFlag       INT                      NOT NULL,
    DepartmentName        NATIONAL VARCHAR(50),
    Status                NATIONAL VARCHAR(50),
    SOR_ID                INT                      NOT NULL,
    SOR_LoadDate          DATETIME,
    SOR_UpdateDate        DATETIME,
    DI_Job_ID             VARCHAR(40)              NOT NULL,
    DI_Create_Date        DATETIME                 NOT NULL,
    DI_Modified_Date      DATETIME                 NOT NULL,
    PRIMARY KEY (EmployeeSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimGeography 
--

CREATE TABLE DimGeography(
    GeoSK                      INT                     NOT NULL,
    City                       NATIONAL VARCHAR(30),
    StateProvinceCode          NATIONAL VARCHAR(3),
    StateProvinceName          NATIONAL VARCHAR(50),
    IsOnlyStateProvinceFlag    INT,
    CountryRegionCode          NATIONAL VARCHAR(3),
    CountryRegionName          NATIONAL VARCHAR(50),
    TerriroyID                 INT,
    PostalCode                 NATIONAL VARCHAR(15),
    SOR_ID                     INT                     NOT NULL,
    SOR_LoadDate               DATETIME,
    SOR_UpdateDate             DATETIME,
    DI_Job_ID                  VARCHAR(40)             NOT NULL,
    DI_Create_Date             DATETIME                NOT NULL,
    DI_Modified_Date           DATETIME                NOT NULL,
    PRIMARY KEY (GeoSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimLocation 
--

CREATE TABLE DimLocation(
    LocationSK          INT              NOT NULL,
    LocationID          INT              NOT NULL,
    LocationName        VARCHAR(50)      NOT NULL,
    CostRate            DECIMAL(9, 0)    NOT NULL,
    Availability        DECIMAL(9, 0)    NOT NULL,
    ModifiedDate        DATETIME         NOT NULL,
    SOR_ID              INT              NOT NULL,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(40)      NOT NULL,
    DI_Create_Date      DATETIME         NOT NULL,
    DI_Modified_Date    DATETIME         NOT NULL,
    PRIMARY KEY (LocationSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimPayHistory 
--

CREATE TABLE DimPayHistory(
    PayHistorySK        INT              NOT NULL,
    EmployeeSK          INT              NOT NULL,
    Rate                DECIMAL(9, 0)    NOT NULL,
    PayFrequency        INT              NOT NULL,
    ModifiedDate        DATETIME         NOT NULL,
    scd_start           DATETIME,
    scd_end             DATETIME,
    scd_Version         INT,
    scd_Active          INT,
    SOR_ID              INT              ,
    DI_Job_ID           VARCHAR(40)      NOT NULL,
    DI_Create_Date      DATETIME         ,
    DI_Modified_Date    DATETIME         ,
    PRIMARY KEY (PayHistorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductCostHistory 
--

CREATE TABLE DimProductCostHistory(
    ProductCostHistorySK    INT              NOT NULL,
    StandardCost            DECIMAL(9, 0)    NOT NULL,
    ModifiedDate            DATETIME         NOT NULL,
    scd_start               DATETIME,
    scd_end                 DATETIME,
    scd_Version             INT,
    scd_Active              INT,
    SOR_ID                  INT              ,
    DI_Job_ID               VARCHAR(40)      NOT NULL,
    DI_Create_Date          DATETIME         ,
    DI_Modified_Date        DATETIME         ,
    ProductPurchasedSK      INT              NOT NULL,
    PRIMARY KEY (ProductCostHistorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductPriceHistory 
--

CREATE TABLE DimProductPriceHistory(
    ProductPriceHistorySK    INT              NOT NULL,
    ListPrice                DECIMAL(9, 0)    NOT NULL,
    ModifiedDate             DATETIME         NOT NULL,
    scd_start                DATETIME,
    scd_end                  DATETIME,
    scd_Version              INT,
    scd_Active               INT,
    SOR_ID                   INT              ,
    DI_Job_ID                VARCHAR(40)      NOT NULL,
    DI_Create_Date           DATETIME         ,
    DI_Modified_Date         DATETIME         ,
    ProductPurchasedSK       INT              NOT NULL,
    PRIMARY KEY (ProductPriceHistorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProducts_Purchased 
--

CREATE TABLE DimProducts_Purchased(
    ProductPurchasedSK        INT              NOT NULL,
    ProductID                 INT              NOT NULL,
    ProductNumber             VARCHAR(25),
    ProductName               VARCHAR(50),
    ProductSubcategoryID      INT,
    ProductSubcategoryName    VARCHAR(50),
    ProductCategoryID         INT,
    ProductCategoryName       VARCHAR(50),
    ProductModelID            INT,
    ModelName                 VARCHAR(50),
    FinishedGoodsFlag         INT,
    MakeFlag                  INT,
    StandardCost              DECIMAL(9, 0),
    ListPrice                 DECIMAL(9, 0),
    ProductLine               CHAR(2),
    ProductClass              CHAR(2),
    ProductStyle              CHAR(2),
    WeightUnitMeasureCode     CHAR(3),
    SizeUnitMeasureCode       CHAR(3),
    ProductColor              VARCHAR(15),
    SafetyStockLevel          INT,
    ReorderPoint              INT,
    ProductSize               VARCHAR(50),
    ProductWeight             DECIMAL(9, 0),
    DaysToManufacture         INT,
    SellStartDate             DATE,
    SellEndDate               DATE,
    DiscontinuedDate          DATE,
    SOR_ID                    INT              NOT NULL,
    SOR_LoadDate              DATETIME,
    SOR_UpdateDate            DATETIME,
    DI_Job_ID                 VARCHAR(40)      NOT NULL,
    DI_Create_Date            DATETIME         NOT NULL,
    DI_Modified_Date          DATETIME         NOT NULL,
    PRIMARY KEY (ProductPurchasedSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimProductVendor 
--

CREATE TABLE DimProductVendor(
    ProductVendorSK       INT                 NOT NULL,
    ProductPurchasedSK    INT,
    VendorSK              INT,
    ProductID             INT                 NOT NULL,
    VendorID              INT                 NOT NULL,
    AverageLeadTime       INT                 NOT NULL,
    StandardPrice         DECIMAL(9, 0)       NOT NULL,
    LastReceiptCost       DECIMAL(9, 0),
    LastReceiptDateSK     INT,
    LastReceiptDate       DATETIME,
    MinOrderQty           INT                 NOT NULL,
    MaxOrderQty           INT                 NOT NULL,
    OnOrderQty            INT,
    UnitMeasureCode       NATIONAL CHAR(3)    NOT NULL,
    SOR_ID                INT                 NOT NULL,
    SOR_LoadDate          DATETIME,
    SOR_UpdateDate        DATETIME,
    DI_Job_ID             VARCHAR(40)         NOT NULL,
    DI_Create_Date        DATETIME            NOT NULL,
    DI_Modified_Date      DATETIME            NOT NULL,
    PRIMARY KEY (ProductVendorSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimScrapReason 
--

CREATE TABLE DimScrapReason(
    ScrapReasonSK       INT            NOT NULL,
    ScrapReasonID       INT            NOT NULL,
    ScrapReasonName     VARCHAR(50)    NOT NULL,
    SOR_ID              INT            NOT NULL,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(40)    NOT NULL,
    DI_Create_Date      DATETIME       NOT NULL,
    DI_Modified_Date    DATETIME       NOT NULL,
    PRIMARY KEY (ScrapReasonSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimShipMethod 
--

CREATE TABLE DimShipMethod(
    ShipMethodSK        INT                     NOT NULL,
    ShipMethodID        INT                     NOT NULL,
    ShipMethodName      NATIONAL VARCHAR(50)    NOT NULL,
    ShipBase            DECIMAL(9, 0)           NOT NULL,
    ShipRate            DECIMAL(9, 0)           NOT NULL,
    SOR_ID              INT                     NOT NULL,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(40)             NOT NULL,
    DI_Create_Date      DATETIME                NOT NULL,
    DI_Modified_Date    DATETIME                NOT NULL,
    PRIMARY KEY (ShipMethodSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendorContacts 
--

CREATE TABLE DimVendorContacts(
    VendorContacts_SK          INT                     NOT NULL,
    Person_BusinessEntityID    INT                     NOT NULL,
    VendorSK                   INT                     NOT NULL,
    Vendor_BusinessEntityID    INT                     NOT NULL,
    ContactType                NATIONAL VARCHAR(50)    NOT NULL,
    Title                      NATIONAL VARCHAR(8),
    FirstName                  NATIONAL VARCHAR(50)    NOT NULL,
    MiddleName                 NATIONAL VARCHAR(50),
    LastName                   NATIONAL VARCHAR(50)    NOT NULL,
    Suffix                     NATIONAL VARCHAR(10),
    PhoneNumber                NATIONAL VARCHAR(25),
    PhoneNumberType            NATIONAL VARCHAR(50),
    EmailAddress               NATIONAL VARCHAR(50),
    SOR_ID                     INT                     NOT NULL,
    SOR_LoadDate               DATETIME,
    SOR_UpdateDate             DATETIME,
    DI_Job_ID                  VARCHAR(40)             NOT NULL,
    DI_Create_Date             DATETIME                NOT NULL,
    DI_Modified_Date           DATETIME                NOT NULL,
    PRIMARY KEY (VendorContacts_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimVendors 
--

CREATE TABLE DimVendors(
    VendorSK                 INT            NOT NULL,
    BusinessEntityID         INT            NOT NULL,
    AccountNumber            VARCHAR(15)    NOT NULL,
    VendorName               VARCHAR(50)    NOT NULL,
    CreditRating             INT            NOT NULL,
    PreferredVendorStatus    VARCHAR(1)     NOT NULL,
    ActiveFlag               INT            NOT NULL,
    AddressTypeName          VARCHAR(50)    NOT NULL,
    AddressLine1             VARCHAR(60)    NOT NULL,
    AddressLine2             VARCHAR(60),
    GeoSK                    INT,
    SOR_ID                   INT            NOT NULL,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(40)    NOT NULL,
    DI_Create_Date           DATETIME       NOT NULL,
    DI_Modified_Date         DATETIME       NOT NULL,
    PRIMARY KEY (VendorSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_WorkOrder 
--

CREATE TABLE Fact_WorkOrder(
    WorkOrderSK              INT            NOT NULL,
    WorkOrderID              INT            NOT NULL,
    ProductPurchasedSK       INT            NOT NULL,
    OrderQty                 INT            NOT NULL,
    StockedQty               INT            NOT NULL,
    ScrappedQty              INT            NOT NULL,
    WorkOrder_StartDateSK    INT,
    WorkOrder_EndDateSK      INT,
    WorkOrder_DueDateSK      INT,
    StartDate                DATETIME       NOT NULL,
    EndDate                  DATETIME,
    DueDate                  DATETIME       NOT NULL,
    ScrapReasonSK            INT,
    SOR_ID                   INT            NOT NULL,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(40)    NOT NULL,
    DI_Create_Date           DATETIME       NOT NULL,
    DI_Modified_Date         DATETIME       NOT NULL,
    PRIMARY KEY (WorkOrderSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_WorkOrder_Rejects 
--

CREATE TABLE Fact_WorkOrder_Rejects(
    RejectWorkOrderRoutingSK    INT            NOT NULL,
    ProductPurchasedSK          INT            NOT NULL,
    WorkOrderID                 INT,
    OrderQty                    INT,
    StockedQty                  INT            ,
    ScrappedQty                 INT,
    WorkOrder_StartDateSK       INT,
    WorkOrder_EndDateSK         INT,
    WorkOrder_DueDateSK         INT,
    StartDate                   DATETIME,
    EndDate                     DATETIME,
    DueDate                     DATETIME,
    ProductID                   INT,
    ScrapReasonSK               INT,
    DI_Reject_SK                INT            NOT NULL,
    SOR_ID                      INT            NOT NULL,
    SOR_LoadDate                DATETIME,
    SOR_UpdateDate              DATETIME,
    DI_Job_ID                   VARCHAR(40)    NOT NULL,
    DI_Create_Date              DATETIME       NOT NULL,
    DI_Modified_Date            DATETIME       NOT NULL,
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_WorkOrderRouting 
--

CREATE TABLE Fact_WorkOrderRouting(
    WorkOrderRoutingSK      INT              NOT NULL,
    WorkOrderSK             INT              NOT NULL,
    ProductPurchasedSK      INT              NOT NULL,
    OperationSequence       INT              NOT NULL,
    LocationSK              INT              NOT NULL,
    ScheduledStartDate      DATETIME         NOT NULL,
    ScheduledEndDate        DATETIME         NOT NULL,
    ActualStartDate         DATETIME,
    ActualEndDate           DATETIME,
    ActualResourceHrs       DECIMAL(9, 0),
    PlannedCost             DECIMAL(9, 0),
    ActualCost              DECIMAL(9, 0),
    SOR_ID                  INT              NOT NULL,
    SOR_LoadDate            DATETIME,
    SOR_UpdateDate          DATETIME,
    DI_Job_ID               VARCHAR(40)      NOT NULL,
    DI_Create_Date          DATETIME         NOT NULL,
    DI_Modified_Date        DATETIME         NOT NULL,
    ScheduledStartDateSK    INT,
    ScheduledEndDateSK      INT,
    ActualStartDateSK       INT,
    ActualEndDateSK         INT,
    PRIMARY KEY (WorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_WorkOrderRouting_Rejects 
--

CREATE TABLE Fact_WorkOrderRouting_Rejects(
    RejectWorkOrderRoutingSK    INT              NOT NULL,
    WorkOrderSK                 INT,
    OperationSequence           INT,
    LocationSK                  INT,
    ScheduledStartDate          DATETIME,
    ScheduledEndDate            DATETIME,
    ActualStartDate             DATETIME,
    ActualEndDate               DATETIME,
    ActualResourceHrs           DECIMAL(9, 0),
    PlannedCost                 DECIMAL(9, 0),
    ActualCost                  DECIMAL(9, 0),
    WorkOrderID                 INT,
    ProductID                   INT,
    LocationID                  INT,
    DI_Reject_SK                INT              NOT NULL,
    SOR_ID                      INT              NOT NULL,
    SOR_LoadDate                DATETIME,
    SOR_UpdateDate              DATETIME,
    DI_Job_ID                   VARCHAR(40)      NOT NULL,
    DI_Create_Date              DATETIME         NOT NULL,
    DI_Modified_Date            DATETIME         NOT NULL,
    ProductPurchasedSK          INT              NOT NULL,
    ScheduledStartDateSK        INT,
    ScheduledEndDateSK          INT,
    ActualStartDateSK           INT,
    ActualEndDateSK             INT,
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchases 
--

CREATE TABLE FactPurchases(
    PurchaseSK               INT              NOT NULL,
    PurchaseOrderID          INT              NOT NULL,
    PurchaseOrderDetailID    INT              NOT NULL,
    Status                   INT              NOT NULL,
    EmployeeSK               INT,
    VendorSK                 INT,
    ShipMethodSK             INT,
    EmployeeID               INT              NOT NULL,
    VendorID                 INT              NOT NULL,
    ShipMethodID             INT              NOT NULL,
    OrderDateSK              INT              NOT NULL,
    ShipDateSK               INT,
    OrderDate                DATETIME         NOT NULL,
    ShipDate                 DATETIME,
    ProductPurchasedSK       INT              NOT NULL,
    SubTotal                 DECIMAL(9, 0)    NOT NULL,
    TaxAmt                   DECIMAL(9, 0)    NOT NULL,
    Freight                  DECIMAL(9, 0)    NOT NULL,
    TotalDue                 DECIMAL(9, 0)    NOT NULL,
    DueDate                  DATETIME         NOT NULL,
    OrderQty                 INT              NOT NULL,
    UnitPrice                DECIMAL(9, 0)    NOT NULL,
    LineTotal                DECIMAL(9, 0)    NOT NULL,
    ReceivedQty              INT              NOT NULL,
    RejectedQty              INT              NOT NULL,
    StockedQty               INT              NOT NULL,
    LineTaxAmount            DECIMAL(9, 0)    NOT NULL,
    LineFreight              DECIMAL(9, 0)    NOT NULL,
    LineTotalDue             DECIMAL(9, 0),
    SOR_ID                   INT              NOT NULL,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(40)      NOT NULL,
    DI_Create_Date           DATETIME         NOT NULL,
    DI_Modified_Date         DATETIME         NOT NULL,
    PRIMARY KEY (PurchaseSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FactPurchases_Rejects 
--

CREATE TABLE FactPurchases_Rejects(
    PurchaseSK               INT              NOT NULL,
    PurchaseOrderID          INT,
    PurchaseOrderDetailID    INT,
    Status                   INT,
    EmployeeSK               INT,
    VendorSK                 INT,
    ShipMethodSK             INT,
    EmployeeID               INT,
    VendorID                 INT,
    ShipMethodID             INT,
    OrderDateSK              INT,
    ShipDateSK               INT,
    OrderDate                DATETIME,
    ShipDate                 DATETIME,
    ProductPurchasedSK       INT,
    SubTotal                 DECIMAL(9, 0),
    TaxAmt                   DECIMAL(9, 0),
    Freight                  DECIMAL(9, 0),
    TotalDue                 DECIMAL(9, 0),
    DueDate                  DATETIME,
    OrderQty                 INT,
    UnitPrice                DECIMAL(9, 0),
    LineTotal                DECIMAL(9, 0),
    ReceivedQty              INT,
    RejectedQty              INT,
    StockedQty               INT,
    LineTaxAmount            DECIMAL(9, 0),
    LineFreight              DECIMAL(9, 0),
    LineTotalDue             DECIMAL(9, 0),
    DI_Reject_SK             INT              NOT NULL,
    SOR_ID                   INT              NOT NULL,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(40)      NOT NULL,
    DI_Create_Date           DATETIME         NOT NULL,
    DI_Modified_Date         DATETIME         NOT NULL,
    PRIMARY KEY (PurchaseSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_RejectCodes 
--

ALTER TABLE Dim_RejectCodes ADD CONSTRAINT RefDim_SORSystem291 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimEmployee 
--

ALTER TABLE DimEmployee ADD CONSTRAINT RefDimGeography121 
    FOREIGN KEY (GeoSK)
    REFERENCES DimGeography(GeoSK)
;

ALTER TABLE DimEmployee ADD CONSTRAINT RefDim_SORSystem281 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimGeography 
--

ALTER TABLE DimGeography ADD CONSTRAINT RefDim_SORSystem271 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimLocation 
--

ALTER TABLE DimLocation ADD CONSTRAINT RefDim_SORSystem261 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimPayHistory 
--

ALTER TABLE DimPayHistory ADD CONSTRAINT RefDimEmployee141 
    FOREIGN KEY (EmployeeSK)
    REFERENCES DimEmployee(EmployeeSK)
;

ALTER TABLE DimPayHistory ADD CONSTRAINT RefDim_SORSystem251 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProductCostHistory 
--

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDim_SORSystem241 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE DimProductCostHistory ADD CONSTRAINT RefDimProducts_Purchased691 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;


-- 
-- TABLE: DimProductPriceHistory 
--

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDim_SORSystem231 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE DimProductPriceHistory ADD CONSTRAINT RefDimProducts_Purchased701 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;


-- 
-- TABLE: DimProducts_Purchased 
--

ALTER TABLE DimProducts_Purchased ADD CONSTRAINT RefDim_SORSystem221 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimProductVendor 
--

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimProducts_Purchased71 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDim_SORSystem211 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimVendors431 
    FOREIGN KEY (VendorSK)
    REFERENCES DimVendors(VendorSK)
;

ALTER TABLE DimProductVendor ADD CONSTRAINT RefDimDate681 
    FOREIGN KEY (LastReceiptDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: DimScrapReason 
--

ALTER TABLE DimScrapReason ADD CONSTRAINT RefDim_SORSystem191 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimShipMethod 
--

ALTER TABLE DimShipMethod ADD CONSTRAINT RefDim_SORSystem181 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: DimVendorContacts 
--

ALTER TABLE DimVendorContacts ADD CONSTRAINT RefDim_SORSystem171 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE DimVendorContacts ADD CONSTRAINT RefDimVendors421 
    FOREIGN KEY (VendorSK)
    REFERENCES DimVendors(VendorSK)
;


-- 
-- TABLE: DimVendors 
--

ALTER TABLE DimVendors ADD CONSTRAINT RefDimGeography131 
    FOREIGN KEY (GeoSK)
    REFERENCES DimGeography(GeoSK)
;

ALTER TABLE DimVendors ADD CONSTRAINT RefDim_SORSystem361 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;


-- 
-- TABLE: Fact_WorkOrder 
--

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDimScrapReason41 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES DimScrapReason(ScrapReasonSK)
;

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDim_SORSystem351 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDimProducts_Purchased461 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDimDate471 
    FOREIGN KEY (WorkOrder_StartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDimDate481 
    FOREIGN KEY (WorkOrder_EndDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrder ADD CONSTRAINT RefDimDate491 
    FOREIGN KEY (WorkOrder_DueDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: Fact_WorkOrder_Rejects 
--

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDimScrapReason31 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES DimScrapReason(ScrapReasonSK)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDim_SORSystem341 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDim_RejectCodes391 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES Dim_RejectCodes(DI_Reject_SK)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDimProducts_Purchased501 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDimDate511 
    FOREIGN KEY (WorkOrder_StartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDimDate521 
    FOREIGN KEY (WorkOrder_EndDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrder_Rejects ADD CONSTRAINT RefDimDate531 
    FOREIGN KEY (WorkOrder_DueDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: Fact_WorkOrderRouting 
--

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimLocation111 
    FOREIGN KEY (LocationSK)
    REFERENCES DimLocation(LocationSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDim_SORSystem331 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefFact_WorkOrder411 
    FOREIGN KEY (WorkOrderSK)
    REFERENCES Fact_WorkOrder(WorkOrderSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimProducts_Purchased541 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimDate551 
    FOREIGN KEY (ScheduledStartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimDate561 
    FOREIGN KEY (ScheduledEndDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimDate571 
    FOREIGN KEY (ActualStartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting ADD CONSTRAINT RefDimDate581 
    FOREIGN KEY (ActualEndDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: Fact_WorkOrderRouting_Rejects 
--

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimLocation101 
    FOREIGN KEY (LocationSK)
    REFERENCES DimLocation(LocationSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDim_SORSystem321 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDim_RejectCodes381 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES Dim_RejectCodes(DI_Reject_SK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefFact_WorkOrder401 
    FOREIGN KEY (WorkOrderSK)
    REFERENCES Fact_WorkOrder(WorkOrderSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimProducts_Purchased591 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimDate601 
    FOREIGN KEY (ScheduledStartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimDate611 
    FOREIGN KEY (ScheduledEndDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimDate621 
    FOREIGN KEY (ActualStartDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE Fact_WorkOrderRouting_Rejects ADD CONSTRAINT RefDimDate631 
    FOREIGN KEY (ActualEndDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: FactPurchases 
--

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimShipMethod21 
    FOREIGN KEY (ShipMethodSK)
    REFERENCES DimShipMethod(ShipMethodSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimProducts_Purchased91 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimEmployee161 
    FOREIGN KEY (EmployeeSK)
    REFERENCES DimEmployee(EmployeeSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDim_SORSystem311 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimVendors451 
    FOREIGN KEY (VendorSK)
    REFERENCES DimVendors(VendorSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate641 
    FOREIGN KEY (OrderDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases ADD CONSTRAINT RefDimDate651 
    FOREIGN KEY (ShipDateSK)
    REFERENCES DimDate(DateSK)
;


-- 
-- TABLE: FactPurchases_Rejects 
--

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimShipMethod11 
    FOREIGN KEY (ShipMethodSK)
    REFERENCES DimShipMethod(ShipMethodSK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimProducts_Purchased81 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES DimProducts_Purchased(ProductPurchasedSK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimEmployee151 
    FOREIGN KEY (EmployeeSK)
    REFERENCES DimEmployee(EmployeeSK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDim_SORSystem301 
    FOREIGN KEY (SOR_ID)
    REFERENCES Dim_SORSystem(SOR_ID)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDim_RejectCodes371 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES Dim_RejectCodes(DI_Reject_SK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimVendors441 
    FOREIGN KEY (VendorSK)
    REFERENCES DimVendors(VendorSK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimDate661 
    FOREIGN KEY (OrderDateSK)
    REFERENCES DimDate(DateSK)
;

ALTER TABLE FactPurchases_Rejects ADD CONSTRAINT RefDimDate671 
    FOREIGN KEY (ShipDateSK)
    REFERENCES DimDate(DateSK)
;


