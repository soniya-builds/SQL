-- Question 1:
-- Create a simple stored procedure "SPdetails" to find Acc_holder_name, Amount,
-- Branch_Name and Zone_Name.

CREATE PROCEDURE SPdetails
AS
BEGIN
    SELECT 
        Acc_holder_name,
        Amount,
        Branch_Name,
        Name AS Zone_Name
    FROM Account_Detail
    INNER JOIN Branch
    ON Account_Detail.Branch_Id = Branch.Br_Id
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
END


-- Question 2:
-- Create a simple stored procedure "SPaverage" to find Branch_name and Amount
-- where amount will be greater than a particular amount.

CREATE PROCEDURE SPaverage
    @Amount MONEY
AS
BEGIN
    SELECT 
        Branch_Name,
        Amount
    FROM Account_Detail
    INNER JOIN Branch
    ON Account_Detail.Branch_Id = Branch.Br_Id
    WHERE Amount > @Amount
END


-- Question 3:
-- Create a simple stored procedure "SPbalance" to find Amount of a particular zone.
-- Zone name will be passed by parameter and amount will be shown using return value.

CREATE PROCEDURE SPbalance
    @ZoneName VARCHAR(50)
AS
BEGIN
    DECLARE @TotalAmount INT

    SELECT @TotalAmount = SUM(Amount)
    FROM Account_Detail
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
    WHERE Name = @ZoneName

    RETURN @TotalAmount
END


-- Question 4:
-- Create a simple stored procedure "SPamount" to find all account holders name
-- with their branch name and zone name whose name has substring 'Mr.'
-- and Amount less than Maximum Amount.

CREATE PROCEDURE SPamount
AS
BEGIN
    DECLARE @MaxAmount MONEY

    SELECT @MaxAmount = MAX(Amount)
    FROM Account_Detail

    SELECT
        Acc_holder_name,
        Branch_Name,
        Name AS Zone_Name,
        Amount
    FROM Account_Detail
    INNER JOIN Branch
    ON Account_Detail.Branch_Id = Branch.Br_Id
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
    WHERE Acc_holder_name LIKE '%Mr.%'
    AND Amount < @MaxAmount
END


-- Question 5:
-- Create a simple stored procedure "SPdetailsInfo" to find number of customer
-- of each Zone. Number of customers will be output parameter.

CREATE PROCEDURE SPdetailsInfo
    @ZoneName VARCHAR(50),
    @CustomerCount INT OUTPUT
AS
BEGIN
    SELECT @CustomerCount = COUNT(*)
    FROM Account_Detail
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
    WHERE Name = @ZoneName
END


-- Question 6:
-- Create procedure like "spEmployeeSalaryDetails1"
-- Find number of Branch_Name whose amount between StartAmount and EndAmount
-- and Branch_Name contains substring.

CREATE PROCEDURE spEmployeeSalaryDetails1
    @StartAmount MONEY,
    @EndAmount MONEY,
    @BranchName VARCHAR(50),
    @TotalBranch INT OUTPUT
AS
BEGIN
    SELECT @TotalBranch = COUNT(*)
    FROM Account_Detail
    INNER JOIN Branch
    ON Account_Detail.Branch_Id = Branch.Br_Id
    WHERE Amount BETWEEN @StartAmount AND @EndAmount
    AND Branch_Name LIKE '%' + @BranchName + '%'
END


-- Question 7:
-- Create a simple stored procedure to find Zone_name and number of customer
-- of a specific Zone.

CREATE PROCEDURE SPdetailsInfoZone
    @ZoneName VARCHAR(50)
AS
BEGIN
    SELECT
        Name AS Zone_Name,
        COUNT(Account_no) AS Number_Of_Customers
    FROM Account_Detail
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
    WHERE Name = @ZoneName
    GROUP BY Name
END


-- Question 8:
-- Create a simple stored procedure "SPdetailsInfo1"
-- to find Zone_name and number of Branch of a specific Zone.

CREATE PROCEDURE SPdetailsInfo1
    @BranchName VARCHAR(50)
AS
BEGIN
    SELECT
        Name AS Zone_Name,
        COUNT(Br_Id) AS Number_Of_Branch
    FROM Account_Detail
    INNER JOIN Branch
    ON Account_Detail.Branch_Id = Branch.Br_Id
    INNER JOIN Zone
    ON Account_Detail.Zone_Id = Zone.Zone_Id
    WHERE Branch_Name = @BranchName
    GROUP BY Name
END