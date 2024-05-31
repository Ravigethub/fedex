-- 1. Number of Shipments per Carrier
SELECT Carrier_Name, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY Carrier_Name
ORDER BY TotalShipments DESC;

-- 2. Average Shipment Delay per Carrier
SELECT Carrier_Name, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
GROUP BY Carrier_Name
ORDER BY AverageDelay DESC;

-- 3. Most Delayed Shipments
SELECT *, ROW_NUMBER() OVER (ORDER BY Shipment_Delay DESC) AS DelayRank
FROM fedex_data.fedextable 
WHERE Shipment_Delay > 0
ORDER BY Shipment_Delay DESC;

-- 4. Shipments with Longest Planned Travel Time
SELECT *, ROW_NUMBER() OVER (ORDER BY Planned_TimeofTravel DESC) AS TravelTimeRank
FROM fedex_data.fedextable
ORDER BY Planned_TimeofTravel DESC;

-- 5.  Shipments by Month
SELECT MONTH(Actual_Shipment_Time) AS ShipmentMonth, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable 
GROUP BY ShipmentMonth
ORDER BY ShipmentMonth;

-- 6. Average Shipment Delay by Day of Week
SELECT DayOfWeek, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
GROUP BY DayOfWeek
ORDER BY AverageDelay DESC;

-- 7. Top 5 Destinations by Number of Shipments
SELECT Destination, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY Destination
ORDER BY TotalShipments DESC
LIMIT 5;

-- 8. Top 5 Source Airports with Longest Average Delays
SELECT Source, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
WHERE Shipment_Delay > 0
GROUP BY Source
ORDER BY AverageDelay DESC
LIMIT 5;

-- 9. Shipments by Delivery Status
SELECT Delivery_Status, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY Delivery_Status
ORDER BY TotalShipments DESC;

-- 10. Average Distance Traveled for Delayed Shipments
SELECT AVG(Distance) AS AverageDistance
FROM fedex_data.fedextable
WHERE Shipment_Delay > 0;

-- 11. Shipments with the Largest Distance Traveled
SELECT *, ROW_NUMBER() OVER (ORDER BY Distance DESC) AS DistanceRank
FROM fedex_data.fedextable
ORDER BY Distance DESC;

-- 12. Percentage of Delayed Shipments
SELECT (SUM(CASE WHEN Shipment_Delay > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS PercentageDelayed
FROM fedex_data.fedextable;

-- 13. Average Shipment Delay for Each Source-Destination Pair
SELECT Source, Destination, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
GROUP BY Source, Destination
ORDER BY AverageDelay DESC;

-- 14. Shipments by Year
SELECT YEAR(Actual_Shipment_Time) AS ShipmentYear, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY ShipmentYear
ORDER BY ShipmentYear;

-- 15. Distribution of Shipment Delays
SELECT 
    CASE
        WHEN Shipment_Delay BETWEEN 0 AND 10 THEN '0-10'
        WHEN Shipment_Delay BETWEEN 11 AND 20 THEN '11-20'
        WHEN Shipment_Delay BETWEEN 21 AND 30 THEN '21-30'
        ELSE 'Over 30'
    END AS DelayRange,
    COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY DelayRange
ORDER BY DelayRange;

-- 16. Average Shipment Delay for Each Carrier on Each Day of Week
SELECT Carrier_Name, DayOfWeek, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
GROUP BY Carrier_Name, DayOfWeek
ORDER BY Carrier_Name, DayOfWeek;

-- 17. Top 5 Destinations with the Highest Average Shipment Delays
SELECT Destination, AVG(Shipment_Delay) AS AverageDelay
FROM fedex_data.fedextable
WHERE Shipment_Delay > 0
GROUP BY Destination
ORDER BY AverageDelay DESC
LIMIT 5;

-- 18. Shipments by Time of Day (Hour)
SELECT DATEPART(hour, Actual_Shipment_Time) AS ShipmentHour, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY ShipmentHour
ORDER BY ShipmentHour;

-- 19. Average Planned Travel Time by Carrier
SELECT Carrier_Name, AVG(Planned_TimeofTravel) AS AverageTravelTime
FROM fedex_data.fedextable
GROUP BY Carrier_Name
ORDER BY AverageTravelTime DESC;

-- 20.  Shipments by Day of Month
SELECT DayofMonth, COUNT(*) AS TotalShipments
FROM fedex_data.fedextable
GROUP BY DayofMonth
ORDER BY DayofMonth;
