select * from finance_1
select * from finance_2

select count(*) from finance_1
select count(*) from finance_2

-- KPI- 1
-- Year wise loan amount Stats

select CONCAT('20',RIGHT(issue_d,2)) as Year_of_issue_d, sum(loan_amnt) as Total_loan_amnt
from finance_1
group by Year_of_issue_d
order by Year_of_issue_d

-- KPI-2
-- Grade and sub grade wise revol_bal

select grade, sub_grade, sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade

-- KPI-3
-- Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status, sum(total_pymnt) as Total_payment
from finance_1 inner join finance_2
where finance_1.id = finance_2.id
group by verification_status
order by verification_status

-- KPI-4
-- State wise and month wise loan status

select addr_state, MONTHNAME(STR_TO_DATE(CONCAT('01-',issue_d),'%d-%b-%y')) AS Month_of_issue_d, loan_status
from finance_1
group by addr_state,Month_of_issue_d,loan_status
order by loan_status

-- KPI-5
-- Home ownership Vs last payment date stats

select home_ownership, sum(last_pymnt_amnt) as Total_last_pymnt_amnt
from finance_1 inner join finance_2
where finance_1.id = finance_2.id
group by home_ownership
order by home_ownership

select home_ownership, last_pymnt_d
from finance_1 inner join finance_2
where finance_1.id = finance_2.id
group by home_ownership, last_pymnt_d
order by home_ownership, last_pymnt_d

-- KPI-6
-- avg dti ratio depending upon emp_length

select avg(dti) as avg_dti, emp_length
from finance_1
group by emp_length
