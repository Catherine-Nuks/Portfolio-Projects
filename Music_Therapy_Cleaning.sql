--1 Check full Dataset
select * 
from [music.csv]

--2 Convert datatype in timestamp to datetime
select Timestamp, TRY_CONVERT(datetime2,Timestamp)
from [music.csv]

--3 Insert converted columns
ALTER TABLE [music.csv]
ADD  Time_stamp datetime

--4 Insert values into new column
Update [music.csv]
Set Time_stamp=TRY_CONVERT(datetime2,Timestamp)

--5 Confirm insertion
select * from [music.csv]

-- 6 Split column into Date and Time column
Select LEFT(Time_stamp,11),RIGHT(Time_stamp,7)
from [music.csv]

--Select PARSENAME(REPLACE(Time_stamp,'    ','    '),3),
--PARSENAME(REPLACE(Time_stamp,'    ','   '),2),
--PARSENAME(REPLACE(Time_stamp,'   ','   '),1)
--From [music.csv]

--7 Add new columns( Date,Time) to main table 
ALTER TABLE [music.csv]
ADD Date DATE

ALTER TABLE [music.csv]
ADD  Time Time

-- 8 Values into new columns ( Date,Time)
Update [music.csv]
Set Date= LEFT(Time_stamp,11)

Update [music.csv]
Set Time= RIGHT(Time_stamp,7)

--Confirm insertion
select * from [music.csv]

-- 9 Readjust Date Format (dd/mm/yyyy)
SELECT  CAST(Date as date),convert(varchar, Date,101)
from [music.csv]

ALTER TABLE [music.csv]
Add Dates varchar (20)

Update [music.csv]
Set Dates=convert(varchar, Date,101)

select left(Time,5)
from [music.csv]

ALTER TABLE [music.csv]
Add Times varchar (20)

update [music.csv]
set Times=left(Time,5)

--10 Confirm insertion
select * from [music.csv]

--11 Remove unwanted columns
Alter table [music.csv]
Drop column Timestamp,Date,Time,Time_stamp

--12 Renamed BPM To Beats_Per_min
-- Check distinct rows
select distinct([Primary streaming service])
from [music.csv]

--13 Replace 'I do not use a streaming service' with none 
Update [music.csv]
Set [Primary streaming service]='None'
where [Primary streaming service]='I do not use a streaming service.'

Update [music.csv]
Set [Primary streaming service]='Others'
where [Primary streaming service] ='Other streaming service'

Update [music.csv]
Set [Primary streaming service]='NULL'
where [Primary streaming service] =' '

--14 Confirm updates
select distinct([Primary streaming service])
from [music.csv]

select *
from [music.csv]

--15 Rectify all empty rows
select *
from [music.csv]
where Age=' '

--16 Rearrange column order
--( right-click the table, design,highlight the column to move,drag it to desired position and drop).
-- save it and refresh table

--Confirm reorder
Select * from [music.csv]






