#create synthetic data

clear
set obs 50000
set seed 2341
gen id = _n

gen gender = runiformint(0,1)
gen education = runiformint(8,14)

gen round_1 = 1
gen treat_1 = cond(uniform()<.8,1,0)
gen convert_1 = cond(uniform()<.2,1,0)
gen expcost_1 = 0.2 if treat_1 !=.
gen cdays_1 = runiformint(1,25) if convert_1 == 1
gen gain_pc_1 = 5-0.1 if convert_1 == 1

gen round_2 = 2
gen treat_2 = cond(uniform()<.8,1,0) if convert_1 == 0
gen convert_2 = cond(uniform()<.15,1,0) if treat_2 !=.
gen expcost_2 = 1.0 if treat_2 !=.
gen cdays_2 = runiformint(1,15) if convert_2 == 1
gen gain_pc_2 = 5-0.1-0.2 if convert_2 == 1

gen round_3 = 3
gen treat_3 = cond(uniform()<.8,1,0) if convert_2 == 0
gen convert_3 = cond(uniform()<.1,1,0) if treat_3 !=.
gen expcost_3 = 1.5 if treat_3 !=.
gen cdays_3 = runiformint(1,12) if convert_3 == 1
gen gain_pc_3 = 5-0.1-0.2-0.5 if convert_3 == 1

export delimited using "C:\...\uplift.csv", replace