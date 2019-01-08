use assignment;

#QUES1

#BAJAJ


update `bajaj auto` 
set Date=str_to_date(Date,'%d-%M-%Y');#changing month name to month number

select * 
from `bajaj auto`;#displaying bajaj stock table

create table bajaj1
 as select Date,`Close Price` 
 from `bajaj auto`;#Creating table bajaj1 from existing table in bajaj auto

select Date,`Close Price`,
      avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
      avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from bajaj1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function


#EicherMotors


update `eicher motors` 
set Date=str_to_date(Date,'%d-%M-%Y');#changing month name to month number

select * 
from `eicher motors`;#Displaying eicher motors stock table

create table eicher1 as 
select Date,`Close Price` 
from `eicher motors`;#Creating table eicher1 from existing table in eicher motors

select Date,`Close Price`,
       avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
       avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from eicher1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function

#HeroMotrcorp



update `hero motocorp` 
set Date=str_to_date(Date,'%d-%M-%Y');#changing month name to month number

select *
 from `hero motocorp`;#Displaying hero motocorp stock table
 
create table hero1 as 
select Date,`Close Price`
 from `hero motocorp`;#Creating table hero1 from existing table hero motocorp
 
select Date,`Close Price`,
       avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
       avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from hero1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function


#Infosys


update `Infosys` 
set Date=str_to_date(Date,'%d-%M-%Y');

select *
 from Infosys;#Displaying Infosys stock table
 
create table infosys1 as 
select Date,`Close Price` 
from `Infosys`;#Creating table infosys1 from existing table infosys

select Date,`Close Price`,
       avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
        avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from infosys1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function


#TCS


update tcs
 set Date=str_to_date(Date,'%d-%M-%Y');#changing month name to month number
 
select * 
from tcs;#Displaying TCS stock table

create table tcs1 as
 select Date,`Close Price` 
 from tcs;#Creating table tcs1 from existing table tcs
 
select Date,`Close Price`,
       avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
	   avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from tcs1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function


#TVS


update `tvs motors`
 set Date=str_to_date(Date,'%d-%M-%Y');#changing month name to month number
 
select *
 from `tvs motors`;#Displaying TVS motors stock table
 
create table tvs1 as
 select Date,`Close Price` 
 from `tvs motors`;#Creating table tvs1 from existing table tvs
 
select Date,`Close Price`,
	  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) as MA20 ,
      avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) as MA50 
from tvs1;#Displaying moving average 20 and 50 in column MA20 and MA50 using window function



#Ques2
create table masterTable as
select Date 
from `baja1`;#Creating Mater Table

alter table masterTable 
add Bajaj float;#Adding column Bajaj into masterTable

alter table masterTable
 add TCS float;#Adding column TCS into masterTable
 
alter table masterTable 
 add TVS float;#Adding column TVS into masterTable
 
alter table masterTable 
 add Infosys float;#Adding column Infosys into masterTable
 
alter table masterTable
 add Eicher float;#Adding column Eicher into masterTable
 
alter table masterTable
 add Hero float;#Adding column Hero into masterTable
 
UPDATE masterTable SET Bajaj = 
				(SELECT `Close Price` FROM bajaj1 where bajaj1.Date=masterTable.Date);#Adding close price of bajaj
                
UPDATE masterTable SET TCS =
				(SELECT `Close Price` FROM tcs1 where tcs1.Date=masterTable.Date);#Adding close price of tcs
                
UPDATE masterTable SET TVS =
				(SELECT `Close Price` FROM tvs1 where tvs1.Date=masterTable.Date);#Adding close price of tvs
                
UPDATE masterTable SET Infosys =
				(SELECT `Close Price` FROM infosys1 where infosys1.Date=masterTable.Date);#Adding close price of infosys
                
UPDATE masterTable SET Eicher =
				(SELECT `Close Price` FROM eicher1 where eicher1.Date=masterTable.Date);#Adding close price of eicher
                
UPDATE masterTable SET Hero =
				(SELECT `Close Price` FROM hero1 where hero1.Date=masterTable.Date);#Adding close price of hero
                
select * 
from masterTable;#Displaying masterTable





#Ques3

#BAJAJ

create
 table bajaj2 as select Date,`Close Price` 
 from bajaj1;#Creating table bajaj2 from baja1 in ques1

select Date,`Close Price`,
	   avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
       avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
from bajaj2;

#EICHER

create
 table eicher2 as select Date,`Close Price` 
 from eicher1;#Creating table eicher2 from eicher1 in ques1
  
  select Date,`Close Price`,
              avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
              avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
  from eicher2;
  
#HERO
  
create
 table hero2 as select Date,`Close Price` 
 from hero1;#Creating table hero2 from hero1 from ques1
  
  select Date,`Close Price`,
		avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
        avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
  from hero2;
  
  #INFOSYS
  
create
 table infosys2 as select Date,`Close Price` 
 from infosys1;#Creating table infosys2 from infosys1 from ques1
  
  select Date,`Close Price`,
		 avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
         avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
  from infosys2;

#TCS

create
 table tcs2 as select Date,`Close Price`
 from tcs1;#Creating table tcs2 from tcs1
  
  select Date,`Close Price`,
         avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
         avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
  from tcs2;
  
  
  #TVS
  
create
 table tvs2 as select Date,`Close Price` 
 from tvs1;#Creating tvs2 from tvs1
  
  select Date,`Close Price`,
         avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
         avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
  CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'#When short term average i.e MA20>MA50 WE HAVE TO MARK SIGNAL BUY
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'#WHEN LONG TERM AVERAGE I.E MA50>MA20 WE HAVE TO MARK SIGNAL SELL
        Else 'Hold'#WHEN LONG TERM AVERAGE IS EQUAL TO SHORT TERM AVERAGE I.E MA20=MA50
		END AS SignalFlag
  from tvs2;
  
  
  
 #QUES4
  

DELIMITER $$  
CREATE FUNCTION SIGNAL_FLAG_FUNC(dyte Date)
RETURNS char(10) 
deterministic
begin
    declare a char(10);
	set @a=(select SignalFlag  from (select Date,`Close Price`,
                                    avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) MA20 ,
                                    avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING)MA50,
		CASE WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING)> avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Buy'
		WHEN  avg(`Close Price`) over(ORDER BY Date ASC ROWS 19 PRECEDING) <avg(`Close Price`) over(ORDER BY Date ROWS 49 PRECEDING) THEN 'Sell'
        Else 'Hold'
		END AS SignalFlag
		from bajaj1) AS t where t.Date=dyte);#Selecting flag whose Date is passed into parameter of UDF
	return @a;
      
END$$
DELIMITER ;

select SIGNAL_FLAG_FUNC('2015-05-25') as Signal_Flag;#TESTING UDF CREATED ABOVE


