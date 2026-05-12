

--1	Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.

SELECT *
FROM [dbo].['Employee Info$']


SELECT
      UPPER([EmpFname])as Empname
FROM[dbo].['Employee Info$']

--2	Write a query to fetch the number of employees working in the department ‘HR’.

SELECT
     count(*)  [EmpID] 
FROM [dbo].['Employee Info$']
WHERE [Department] = 'HR'


--3	Write a query to get the current date.

SELECT GETDATE() AS CurrentDate

--4	Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT 
       LEFT([EmpLname],4) AS FRIST_FOUR_CHARACTERS
FROM[dbo].['Employee Info$']

--5	Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT 
      LEFT([Address], CHARINDEX('(',[Address]) -1) AS PLACE_NAME
FROM[dbo].['Employee Info$']

--6	Write a query to create a new table that consists of data and structure copied from the other table.

CREATE TABLE NEW_EMPLOYEE_POSITION_TABLE (EMPID VARCHAR(250),
                                          EMPPOSTION VARCHAR(250),
                                          DATE_OF_JOINING DATE,
                                          SALARY INT)
INSERT INTO[dbo].[NEW_EMPLOYEE_POSITION_TABLE]
VALUES('ID1','MANGER','2022/5/1','500000'),
      ('ID2','EXCUTIVE','2022/5/2','75000'),
      ('ID3','MANAGER','2022/5/1','90000'),
      ('ID4','LEAD','2022/5/2','85000'),
      ('ID4','EXCUTIVE','2022/5/1','300000')

--7	Write a query to find all the employees whose salary is between 50000 to 100000.

SELECT *
FROM[dbo].['Employee position$']
WHERE SALARY BETWEEN 50000 AND 100000

--8	Write a query to find the names of employees that begin with ‘S’

SELECT *
FROM [dbo].['Employee Info$']
WHERE [EmpFname] LIKE 'S%'

--9	Write a query to fetch top N records.

SELECT TOP 5 *
FROM [dbo].['Employee position$']
ORDER BY Salary DESC

--10	Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT 
  CONCAT([EmpFname], ' ',
  [EmpLname] ) AS FullName
FROM [dbo].['Employee Info$']

--11	Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1995 and are grouped according to gender

SELECT
      [Gender],
      COUNT (*) AS EMPLOYEE_COUNT
FROM [dbo].['Employee Info$']
WHERE DOB BETWEEN '1970/5/2' AND '1995/12/31'
GROUP BY [Gender]

--12	Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

SELECT *
FROM[dbo].['Employee Info$']
ORDER BY[EmpLname] DESC, [Department] ASC

--13	Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT *
FROM [dbo].['Employee Info$']
WHERE [EmpLname] LIKE '____A'

--14	Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT *
FROM[dbo].['Employee Info$']
WHERE [EmpFname] NOT IN ('SANJAY','SONIA')

--15	Write a query to fetch details of employees with the address as “DELHI(DEL)”

SELECT *
FROM[dbo].['Employee Info$']
WHERE [Address] = 'DELHI(DEL)'

--16	Write a query to fetch all employees who also hold the managerial position.

SELECT *
FROM[dbo].['Employee position$']
WHERE [EmpPosition] = 'MANAGER'

--17	Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order

SELECT 
      [Department], 
      COUNT(*) AS Employee_Count
FROM [dbo].['Employee Info$']
GROUP BY [Department]
ORDER BY Employee_Count ASC

--18	Write a query to fecth Male employees in HR department

SELECT *
FROM[dbo].['Employee Info$']
WHERE [Gender] = 'M' AND [Department] = 'HR'

--19	Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table

SELECT I.[EmpID]
      ,I.[EmpFname]
      ,I.[EmpLname]
      ,I.[Department]
      ,I.[Project]
      ,I.[Address]
      ,I.[DOB]
      ,I.[Gender]
      ,[DateOfJoining]
  FROM [dbo].['Employee Info$'] I
  JOIN [dbo].['Employee position$'] P
  ON I.[EmpID] = P.[EmpID]

--20	Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table

WITH CTE AS (
SELECT *,
        RANK() OVER(ORDER BY [Salary] DESC) HIGHEST_SALARY,
        RANK() OVER(ORDER BY [Salary] ASC) LOWEST_SALARY

FROM [dbo].['Employee position$']
)

SELECT 
      [EmpID],
      [Salary]    
FROM CTE 
WHERE HIGHEST_SALARY <=2 OR LOWEST_SALARY <=2
