CREATE TABLE EmployeeSales (
    EmployeeID VARCHAR(50),
    SaleDate VARCHAR(50),
    SaleAmount VARCHAR(50)
);


use sample;
desc sample;
drop table EmployeeSales;
CREATE TABLE EmployeeSales (
    EmployeeID VARCHAR(10),
    SaleDate DATE,
    SaleAmount INT
);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E01', '2023-11-01', 500);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E01', '2023-11-02', 300);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E02', '2023-11-01', 400);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E01', '2023-11-02', 200);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E02', '2023-11-03', 600);
INSERT INTO EmployeeSales (EmployeeID, SaleDate, SaleAmount) VALUES ('E02', '2023-11-03', 600);
select * from EmployeeSales;
truncate table EmployeeSales;
SELECT
    EmployeeID,
    SaleDate,
    SaleAmount,
    ROW_NUMBER() OVER (PARTITION BY EmployeeID ORDER BY SaleDate) AS SaleNumber
FROM EmployeeSales;

SELECT *
FROM sample.employeesales
WHERE SaleAmount > 200;
create database db_dict;
use db_dict;


CREATE TABLE dictionary_table (
    close_dt_reason VARCHAR(100),
    STOP_DT_OVRD_REASON VARCHAR(100),
    ROLE VARCHAR(100),
    region_cd VARCHAR(100)
);

INSERT INTO dictionary_table (close_dt_reason)
VALUES 
    (CASE WHEN 'Dormant' = 'Dormant' THEN '7' ELSE NULL END);
INSERT INTO dictionary_table (STOP_DT_OVRD_REASON)
VALUES 
    (CASE WHEN 'Dormant' = 'Dormant' THEN '5' ELSE NULL END),
    (CASE WHEN 'Escheatment Process' = 'Dormant' THEN '6' ELSE NULL END);
INSERT INTO dictionary_table(ROLE)
VALUES 
    (CASE WHEN 'Annuitant' = 'Annuitant' THEN '1' ELSE NULL END),
    (CASE WHEN 'Joint Annuitant' = 'Joint Annuitant' THEN '2' ELSE NULL END),
    (CASE WHEN 'Beneficiary' = 'Beneficiary' THEN '3' ELSE NULL END),
    (CASE WHEN 'QDRO' = 'QDRO' THEN '4' ELSE NULL END),
    (CASE WHEN 'Other' = 'Other' THEN '5' ELSE NULL END);
INSERT INTO dictionary_table (region_cd)
VALUES 
    (CASE WHEN 'Stable' = 'Stable' THEN '1' ELSE NULL END),
    (CASE WHEN 'Par' = 'Par' THEN '2' ELSE NULL END),
    (CASE WHEN 'Institutional' = 'Institutional' THEN '3' ELSE NULL END),
    (CASE WHEN 'Accounting' = 'Accounting' THEN '4' ELSE NULL END),
    (CASE WHEN 'Single Premium Service' = 'Single Premium Service' THEN '5' ELSE NULL END),
    (CASE WHEN 'Single Premium Installation' = 'Single Premium Installation' THEN '6' ELSE NULL END),
    (CASE WHEN 'unknown' = 'unknown' THEN '9' ELSE NULL END);

select * from dictionary_table;
drop table dictionary_table;
SELECT 
    CASE
        WHEN (close_dt_reason) = '7' OR (stop_dt_ovrd_reason) IN ('5', '6') AND (region_cd) IN ('1', '2', '3', '5')
            THEN CONCAT('DPED')
        
        WHEN (close_dt_reason) = '7' OR (stop_dt_ovrd_reason) IN ('5', '6') 
            THEN CONCAT('UKED')
        
        WHEN (ROLE) IN ('1', '2', '3') AND (region_cd) IN ('1', '2', '3', '5') 
            THEN CONCAT('DPEA')
        
        WHEN (ROLE) = '4' AND (region_cd) IN ('1', '2', '3', '5')
            THEN CONCAT('DPEQ')
        
        WHEN (ROLE) IN ('1', '2', '3') 
            THEN CONCAT('UKEA')
        
        WHEN (ROLE) = '4' 
            THEN CONCAT('UKEQ')
    END AS derived_value
FROM 
    dictionary_table;

select * from dictionary_table;
SELECT 
    CASE
        WHEN (close_dt_reason = '7' OR stop_dt_ovrd_reason = '6') AND region_cd = '2'
            THEN 'DPED'
        ELSE NULL 
    END AS derived_value
FROM 
    dictionary_table
WHERE
    close_dt_reason = '7'
    AND stop_dt_ovrd_reason = '6'
    AND ROLE = '4'
    AND region_cd = '2';



SELECT 
    CASE
        WHEN (close_dt_reason = '7' OR stop_dt_ovrd_reason = '6') AND region_cd = '2'
            THEN 'DPED'
        
        WHEN (close_dt_reason = '7' OR stop_dt_ovrd_reason = '6') 
            THEN 'UKED'
        
        WHEN ROLE = '4' AND region_cd = '2' 
            THEN 'DPEQ'
        
        WHEN ROLE = '4' 
            THEN 'UKEQ'
        
        ELSE NULL 
    END AS derived_value
FROM 
    dictionary_table
WHERE
    close_dt_reason = '7'
    AND stop_dt_ovrd_reason = '6'
    AND ROLE = '4'
    AND region_cd = '2';
