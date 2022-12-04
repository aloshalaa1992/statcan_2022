#task 4.1

with count_of_unemployed_per_mounth as(SELECT 
`combined_pub`.`SURVMNTH`,
count(*) as unemployed_count,  
`combined_pub`.`QUARTER`
FROM `project_statcan`.`combined_pub`
where `combined_pub`.`LFSSTAT` like '%Unemployed%'
group by  `combined_pub`.`LFSSTAT`, `combined_pub`.`SURVMNTH`,  `combined_pub`.`QUARTER` ),

 count_of_employed_per_mounth as(
 SELECT 
`combined_pub`.`SURVMNTH`,
count(*) as employed_count,  
`combined_pub`.`QUARTER`
FROM `project_statcan`.`combined_pub`
where `combined_pub`.`LFSSTAT` like 'Employed%'
group by   `combined_pub`.`SURVMNTH`,  `combined_pub`.`QUARTER` ),

unemployement_rates_per_month as (

select 
a.SURVMNTH,
b.unemployed_count/(b.unemployed_count+ a.employed_count) as unemployed_rate,
a.QUARTER
from count_of_employed_per_mounth a
join count_of_unemployed_per_mounth b on a.SURVMNTH = b.SURVMNTH 

),

unemployement_rates_per_quarter as (
#select the last month of the quarter because it would be the latest data of the population
select QUARTER,
 unemployed_rate 
from unemployement_rates_per_month
where SURVMNTH in (3,6,9,12)
)

select * from unemployement_rates_per_quarter;


###Q1	0.0584
###Q2	0.0457
###Q3	0.0449


#task 4.2
#select * from combined_pub
#select * from educ

with youth_post_educ as (select  b.en_label as prov, count(*) as youth_with_post from combined_pub a left join prov b on a.prov = b.code where AGE_12 in (1,2,3) and EDUC >=4 group by a.prov),
youth_without_post_educ as (select  b.en_label as prov, count(*) as youth_without_post from combined_pub a left join prov b on a.prov = b.code where AGE_12 in (1,2,3) and EDUC <4 group by a.prov),
youth_tertiary_rate as (select a.prov, a.youth_with_post / (a.youth_with_post + b.youth_without_post) as tertiary_rate from youth_post_educ a left join  youth_without_post_educ b on a.prov=b.prov    )
select * from youth_tertiary_rate;


#Alberta	0.3067
#Ontario	0.3951
#Manitoba	0.3167
#British Columbia	0.3735
#New Brunswick	0.3549
#Quebec	0.4634
#Saskatchewan	0.3021
#Nova Scotia	0.3928
#Newfoundland and Labrador	0.3656
#Prince Edward Island	0.3689



#task 4.3
#select * from combined_pub;
with vol_pt as  (select b.en_label as industry, count(*) as vol_pt_workers from combined_pub a left join naics_21 b on a.naics_21 = b.code where voluntary_pt = 1 group by a.naics_21 ),
non_vol_pt as (select b.en_label as industry, count(*) as non_vol_pt_workers from combined_pub a left join naics_21 b on a.naics_21 = b.code where voluntary_pt = 0 group by a.naics_21 ),
non_vol_rate as ( select  a.industry, a.non_vol_pt_workers/(a.non_vol_pt_workers+b.vol_pt_workers) as invol_pt_rate from non_vol_pt a  join vol_pt b on a.industry=b.industry)
select * from non_vol_rate order by invol_pt_rate desc limit 5;

#Utilities	0.9990
#Manufacturing - durable goods	0.9980
#Mining, quarrying, and oil and gas extraction	0.9975
#Forestry and logging and support activities for forestry	0.9969
#Public administration	0.9965



#task 5
/**
In this task I will be focusing on the target and indicator 5.5.2: Proportion of women in managerial positions. 

The thought process is to investigate the counts and rates of employed women in managerial positions (NOC_40 =1 Senior management occupations) throughout the year.alter

In the first CTE, we calculate the number of women with Senior management occupations, and then we calculate the rate of those indiviudals over all employed women in different fields. We repeat the same for men, and we report the results. 

Interestingly, the rates are not very far although the counts can be a bit deceiving. In Jan, the rate of employed men in senior positions is 0.03% while rate of employed women in senior positions is 0.02%. The rates were equal in the month of Arpil with 0.03%.

**/


with women_in_senior as (select SURVMNTH, count(*) count_women_in_senior, count(*)/(select count(*) from combined_pub where sex = 'Female' and lfsstat like 'employed%') as rate_working_women_in_senior from combined_pub where sex = 'Female' and noc_40 = 1 group by SURVMNTH),
 men_in_senior as (select SURVMNTH, count(*) count_men_in_senior, count(*)/(select count(*) from combined_pub where sex = 'male' and lfsstat like 'employed%') as rate_working_men_in_senior from combined_pub where sex = 'male' and noc_40 = 1 group by SURVMNTH),
 combined_data as (select men_in_senior.SURVMNTH, count_men_in_senior, rate_working_men_in_senior, count_women_in_senior, rate_working_women_in_senior from men_in_senior join women_in_senior on women_in_senior.SURVMNTH = men_in_senior.SURVMNTH)
 select * from combined_data;
#month		count of senior mgmt (m) 	rate of senior mgmt to employed (m)			count of senior mgmt (w)		rate of senior mgmt to employed (w)
#1			103							0.0003										49								0.0002
#2			91							0.0003										54								0.0002
#3			104							0.0004										64								0.0002
#4			102							0.0003										75								0.0003
#5			95							0.0003										69								0.0002
#6			108							0.0004										69								0.0002
#7			114							0.0004										61								0.0002
#8			146							0.0005										76								0.0003
#9			143							0.0005										76								0.0003

/**
We repeated the same analysis for (NOC_40 =2,3,4  Specialized middle management occupations, Middle management occupations in retail and wholesale trade and customer services, Middle management occupations in trades, transportation, production and utilities)
and we notice a similar trend. The difference between men and women in middle management is higher than senior management. However, the trend in the rates is getting better for women in middle management positions comparing Jan to September,
and the difference between men's rate and women's rate is getting slimer.

**/

with women_in_mgmt as (select SURVMNTH, count(*) count_women_in_senior, count(*)/(select count(*) from combined_pub where sex = 'Female' and lfsstat like 'employed%') as rate_working_women_in_senior from combined_pub where sex = 'Female' and noc_40 in (2,3,4) group by SURVMNTH),
 men_in_mgmt as (select SURVMNTH, count(*) count_men_in_senior, count(*)/(select count(*) from combined_pub where sex = 'male' and lfsstat like 'employed%') as rate_working_men_in_senior from combined_pub where sex = 'male' and noc_40 in (2,3,4) group by SURVMNTH),
 combined_data as (select men_in_mgmt.SURVMNTH, count_men_in_senior, rate_working_men_in_senior, count_women_in_senior, rate_working_women_in_senior from men_in_mgmt join women_in_mgmt on women_in_mgmt.SURVMNTH = men_in_mgmt.SURVMNTH)
 select * from combined_data;
 
#month		count of senior mgmt (m) 	rate of senior mgmt to employed (m)			count of senior mgmt (w)		rate of senior mgmt to employed (w) 
#1			3427						0.0116										1924							0.0069
#2			3739						0.0126										2067							0.0074
#3			3962						0.0134										2175							0.0078
#4			4110						0.0139										2257							0.0081
#5			4116						0.0139										2256							0.0081
#6			4147						0.0140										2336							0.0084
#7			4144						0.0140										2464							0.0088
#8			4175						0.0141										2436							0.0087
#9			4106						0.0139										2400							0.0086