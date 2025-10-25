-- Find the number of states where the customer reside.
SELECT COUNT(DISTINCT CustState) AS NumberOfStates
FROM Customers


-- What is the lowest line item total for order 433.

SELECT *
FROM Order_Details

SELECT MIN(OD.QuotedPrice * OD.QuantityOrdered ) AS lineitemtotal
FROM Order_Details AS OD
WHERE OrderNumber = 433

-- Show how many different products were ordered on order number 533,
-- and what was the total cost of that order?

SELECT *
FROM Order_Details

SELECT COUNT (DISTINCT ProductNumber) AS NumberOfProducts, SUM(QuantityOrdered*QuotedPrice) AS TotalCost
FROM Order_Details 
WHERE OrderNumber = 533

-- What products have never been ordered?

SELECT P.ProductName
FROM Products AS P
LEFT JOIN Order_Details AS OD ON P.ProductNumber = OD.ProductNumber
WHERE OD.ProductNumber IS NULL
-- The result set is same as the upper one 
SELECT P.ProductName
FROM Products AS P
WHERE P.ProductNumber NOT IN (
    SELECT OD.ProductNumber
    FROM Order_Details AS OD
)