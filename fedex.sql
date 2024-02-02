select *from ravi.dbo.fedex
---union all
select 'Actual_Shipment_Time' from ravi.dbo.fedex unionall select 'Date' from ravi.dbo.prima_13
--union
select 'Actual_Shipment_Time' from ravi.dbo.fedex union select 'Date' from ravi.dbo.prima_13

select Machine_ID from  ravi.dbo.prima_13 unionall select Delivery_Status from ravi.dbo.fedex

select Machine_ID,Downtime from ravi.dbo.prima_13  join on ravi.dbo.prima_13.Downtime=ravi.dbo.prima_13.Downtime

---self join
SELECT t1.Machine_ID, t1.Downtime
FROM ravi.dbo.prima_13 t1
JOIN ravi.dbo.prima_13 t2 ON t1.Downtime = t2.Downtime;
