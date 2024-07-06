create database if not exists bank_analysis_project;

select * from finance_1;
select * from finance_2;

select count(*) from finance_2;

## KPI 1 ###

select issue_d , loan_amnt
from finance_1;

select year(issue_d) as Year_of_issue_d,sum(loan_amnt) as _total_amnt
from finance_1
group by Year_of_issue_d
order by Year_of_issue_d;

### KPI 2###


select 
grade , sub_grade , sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;


## KPI 3 ##

select verification_status , round(sum(total_pymnt),0) as total_payment
from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)
group by verification_status;


### KPI 4  ###

select addr_State , last_Credit_Pull_D , loan_status

from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)

group by addr_State , last_Credit_Pull_D , loan_status
order by   addr_State;

### KPI 5 ##

select 
home_ownership , (last_pymnt_d)

from finance_1 inner join finance_2
on (finance_1.id = finance_2.id)

group by home_ownership , last_pymnt_d
 order by home_ownership , last_pymnt_d;



