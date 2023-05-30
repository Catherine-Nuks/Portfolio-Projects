select * from ds_salaries

--1 change column name 
RENAME from the object explorer tab

--2 Update company size 
update ds_salaries
set Company_size = Case when company_size ='M' Then 'Medium'
                      when Company_size ='L' Then 'Large'
					  when Company_size ='S' Then 'Small'
Else Company_size
end 

--3 Update employment type
update ds_salaries
set employment_type = Case when employment_type ='FT' Then 'Full time'
                      when employment_type ='CT' Then 'Contract'
					  
Else employment_type
end

update ds_salaries
set employment_type = Case when employment_type ='FL' Then 'Freelance'
                     				  
Else employment_type
end

--4 Update employment type
set employment_type = Case when employment_type ='PT' Then 'Part time'
                     					  
Else employment_type
end

select * from ds_salaries

 --5 Convert salary to currency

Alter table ds_salaries
Alter Column  Salary_in_usd varchar(20) not null

 SELECT '$'+replace(convert(varchar,cast(Salary_in_usd as money),1), '.00','') 
  from ds_salaries

 Update ds_salaries
 set Salary_in_usd= '$'+replace(convert(varchar,cast(Salary_in_usd as money),1), '.00','') 



 





