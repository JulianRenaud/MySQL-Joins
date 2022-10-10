/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT *
 FROM products p
 INNER JOIN categories c
 ON p.CategoryID = c.CategoryID
 WHERE c.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 SELECT Name, Price, rating
 FROM products p
 INNER JOIN reviews r
 ON p.ProductID = r.ProductID
 WHERE rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS TotalSold
 FROM employees e
 INNER JOIN sales s
 ON e.EmployeeID = s.EmployeeID
 GROUP BY e.EmployeeID
 ORDER BY TotalSold DESC
 LIMIT 1;
 


/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.Name AS "Department Name", c.Name AS "Category Name"
 FROM departments d
 INNER JOIN categories c
 ON d.DepartmentID = c.DepartmentID
 WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

 SELECT p.Name, Sum(s.Quantity) AS "Total Sold", Sum(s.Quantity * s.PricePerUnit) AS "Total Price" 
 FROM products p
 INNER JOIN sales s
 ON s.ProductID = p.ProductID
 WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.COMMENT, p.ProductID
FROM products p
INNER JOIN reviews r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */