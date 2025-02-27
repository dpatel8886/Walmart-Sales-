
 -- Business Problems
 --Q1 for each different payment method find number of transactions,no. of qty sold

 select 
	payment_method,
	count(*) Transactions,
	sum(quantity) Qty_sold
from walmart
group by payment_method;

--Q2 Identify the highest-rated category in each branch,displaying the branch,category avg rating
select * from 
(select 
	Branch,
	category,
	AVG(rating) avg_rating,
	RANK() over (partition by Branch order by  AVG(rating)desc) rnk 
from walmart 
group by Branch,category)b
where rnk=1;

--Q3 identify the busiest day for each branch based on the number of transactions
select * from
	(select Branch,
		format(date,'dddd') as busiest_day,
		COUNT(*) No_of_transactions,
		RANK() over (partition by branch order by COUNT(*) desc) rnk 
	from walmart 
	group by Branch,format(date,'dddd'))b
where rnk=1;

--Q4 calculate the total quantity of items sold per payment method. list payment methof and total quamtity
select 
	payment_method,
	sum(quantity) Qty_sold
from walmart
group by payment_method;

--Q5 Determine the average,minimum,and maximum rating of products for each city.
--list the city,average_rating,min_rating, and max_rating.

select City,category,
	AVG(rating) average_rating,
	min(rating) min_rating,
	max(rating) max_rating
from walmart 
group by City,category
order by City

--Q6 Calculate the total profit for each category by considering total profit as 
--(unit_price * quantity * profit_margin).list category and total_profit,ordered from highest to lowest profit.

select category,
	sum(unit_price*quantity*profit_margin) Total_profit
from walmart 
group by category
order by sum(unit_price*quantity*profit_margin) desc;


--Q7 Determine the most common Payment method for each branch.
--Display branch and the preferred payment method.
select * from
(
select Branch,payment_method,
	COUNT(*) cnt,
	RANK() over (partition by branch order by count(*) desc) rnk
from walmart
group by Branch,payment_method)b
where rnk =1;

--Q8 -- categorize sales into 3 groups Morning,Afternoon,Evening
-- Find out each of the shift and number of invocies

select 
	case when datepart(HOUR,time)< 12 then 'Morning'
	when datepart(HOUR,time) between 12 and 17 then 'Afternoon'
	else 'Evening'
	end Day_time,
	COUNT(*)
from walmart
group by case when datepart(HOUR,time)< 12 then 'Morning'
		when datepart(HOUR,time) between 12 and 17 then 'Afternoon'
		else 'Evening'
		end;

--Q9 Identify 5 branch with highest decrese ratio in revenue compare to last year (current year 2023 and last year 2022)


with revenue_2022 As
(select Branch,SUM(Total) revenue from walmart 
where datepart(YEAR,date) = 2022
group by Branch
),
revenue_2023 as(
select Branch,SUM(Total) revenue_2023 from walmart 
where datepart(YEAR,date) = 2023
group by Branch)

select top 5 ls.Branch as Branch,
ls.revenue as ls_revenue,
cr.revenue_2023 as cr_revenue,
round((ls.revenue-cr.revenue_2023)*100/ls.revenue,2) revenue_dec_ratio
from revenue_2022 as ls
join
revenue_2023 as cr
on ls.branch = cr.branch
where ls.revenue>cr.revenue_2023
order by 4 desc
