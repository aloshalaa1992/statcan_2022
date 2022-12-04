
INSERT INTO `project_statcan`.`combined_pub`
(`SURVMNTH`,
`LFSSTAT`,
`PROV`,
`AGE_12`,
`SEX`,
`EDUC`,
`NAICS_21`,
`NOC_10`,
`NOC_40`,
`COWMAIN`,
`FTPTMAIN`,
`QUARTER`,
`VOLUNTARY_PT`)
SELECT 
    `raw_pub`.`SURVMNTH`,
	case when `raw_pub`.`LFSSTAT` = 1 then "Employed, at work"
		 when `raw_pub`.`LFSSTAT` = 2 then "Employed, absent from work"
         when `raw_pub`.`LFSSTAT` = 3 then "Unemployed"
          when `raw_pub`.`LFSSTAT` = 4 then "Not in labour force"
          else NULL
		end,
    `raw_pub`.`PROV`,
    `raw_pub`.`AGE_12`,
    case when `raw_pub`.`SEX` =1 then "Male"
			when `raw_pub`.`SEX` =2 then "Female"
            else NULL
    end,
    `raw_pub`.`EDUC`,
   `raw_pub`.`NAICS_21`,
    `raw_pub`.`NOC_10`,
    `raw_pub`.`NOC_40`,
    `raw_pub`.`COWMAIN`,
    `raw_pub`.`FTPTMAIN`,
    case 	when `raw_pub`.`SURVMNTH` >= 1 and `raw_pub`.`SURVMNTH` <= 3 then "Q1" 
			 when `raw_pub`.`SURVMNTH` >= 4 and `raw_pub`.`SURVMNTH` <= 6 then "Q2" 
             when `raw_pub`.`SURVMNTH` >= 7 and `raw_pub`.`SURVMNTH` <= 9 then "Q3" 
             when `raw_pub`.`SURVMNTH` >= 10 and `raw_pub`.`SURVMNTH` <= 12 then "Q4" 
             else NULL
    end,
    
    case when `raw_pub`.`WHYPT` = 0 then TRUE 
    else False end
    
FROM `project_statcan`.`raw_pub`;


select * from `project_statcan`.`combined_pub` where `VOLUNTARY_PT` =1;

