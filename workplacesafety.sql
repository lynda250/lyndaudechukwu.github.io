---1	How many incidents occurred at each plant?

SELECT
      [Plant], 
      [Incident Type],
      COUNT([Incident Type]) NO_INCIDENT_TYPE
FROM[dbo].[WORKPLACE_SAFETY]
GROUP BY [Plant],[Incident Type]

---2	What is the total incident cost per department?

SELECT 
       [Department],
       sum([Incident Cost]) TOTAL_INCIDENT_COST
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Department]

---3	Which incident type resulted in the highest total days lost?

SELECT 
       TOP(1)[Incident Type], 
       SUM([Days Lost]) TOTAL_DAYS_LOST 
FROM[dbo].[WORKPLACE_SAFETY]
GROUP BY [Incident Type]
ORDER BY TOTAL_DAYS_LOST DESC

---4	What is the distribution of incident types by shift?

SELECT 
      [Shift],
      COUNT(*)INCIDENT_COUNT
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Shift]

---5	What is the average incident cost for each injury location?

SELECT 
      [Injury Location],
      AVG([Incident Cost]) AVG_INCIDENT_COST
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Injury Location]

---6	Which age group has the highest number of incidents?

SELECT 
      TOP(1) [Age Group], 
      COUNT(*) INCIDENT_COUNT
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Age Group]
ORDER BY INCIDENT_COUNT DESC

---7	How many incidents were reported as 'Lost Time' by each plant?

SELECT 
      [Plant], 
      COUNT(*)INCIDENT_COUNT
FROM [dbo].[WORKPLACE_SAFETY]
WHERE [Report Type] = 'LOST TIME'
GROUP BY [Plant] 

---8	Which department had the highest number of 'Crush & Pinch' incidents?

SELECT 
      TOP (1)[Department], 
      COUNT(*)CRUSH_PINCH
FROM[dbo].[WORKPLACE_SAFETY]
WHERE[Incident Type] = 'CRUSH & PINCH'
GROUP BY [Department]
ORDER BY CRUSH_PINCH DESC

---9	Which plants reported the most "Near Miss" incidents?

SELECT 
      TOP(5)[Plant], 
      COUNT(*) NEAR_MISS
FROM[dbo].[WORKPLACE_SAFETY]
WHERE[Report Type] = 'NEAR MISS'
GROUP BY[Plant] 
ORDER BY NEAR_MISS DESC

---10	What is the total number of incidents by year and month?

SELECT 
      [Month],
      [Year], 
      COUNT(*) [Incident Type]
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Month],[Year]
        --OR
SELECT 
    FORMAT([Date], 'yyyy-MM') AS YearMonth,
    COUNT(*) AS total_incidents
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY FORMAT([Date], 'yyyy-MM')
ORDER BY YearMonth


---11	Which gender has the most reported incidents?

SELECT 
      [Gender], 
      COUNT(*) INCIDENTS_COUNT
FROM[dbo].[WORKPLACE_SAFETY]
GROUP BY [Gender]

---12	What is the total cost of incidents per year?

SELECT 
      [Year],
      SUM([Incident Cost]) TOTAL_COST_INCIDENT_PER_YR
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Year]

---13	Which incident resulted in the highest cost?

SELECT 
      TOP (1)[Incident Type],
      SUM([Incident Cost])INCIDENT_COST
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Incident Type]
ORDER BY INCIDENT_COST DESC 

---14	What is the total cost of incidents for each report type?

SELECT 
      [Report Type], 
      SUM([Incident Cost])
FROM[dbo].[WORKPLACE_SAFETY]
GROUP BY [Report Type]

---15	Which departments had incidents with more than 2 days lost?

SELECT 
      DISTINCT[Department]
FROM [dbo].[WORKPLACE_SAFETY]
WHERE[Days Lost] >2 

---16	What is the average number of days lost per incident type?

SELECT
      [Incident Type], 
      AVG([Days Lost]) AVG_DAYS_LOST
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Incident Type]

---17	What is the distribution of incidents by shift (Day, Afternoon, Night)?

SELECT 
      [Shift],
      COUNT(*)INCIDENT_COUNT
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Shift]

---18	Which months have the highest number of incidents?

SELECT 
     TOP(3) [Month],
      COUNT(*) INCIDENT_COUNT
FROM [dbo].[WORKPLACE_SAFETY]
GROUP BY [Month]
ORDER BY INCIDENT_COUNT DESC

---19	What is the total cost of "Vehicle" related incidents?

SELECT 
      SUM([Incident Cost]) TOTAL_COST
FROM [dbo].[WORKPLACE_SAFETY]
WHERE [Incident Type] = 'VEHICLE'

---20	Which age group is most affected by "Falling Object" incidents?

SELECT 
      TOP(1) [Age Group], 
      COUNT(*) FALLING_OBJECT_COUNT
FROM[dbo].[WORKPLACE_SAFETY]
WHERE [Incident Type] = 'FALLING OBJECT'
GROUP BY [Age Group]
ORDER BY FALLING_OBJECT_COUNT DESC

 

SELECT *
FROM[dbo].[WORKPLACE_SAFETY] 
