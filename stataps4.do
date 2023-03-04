use third_grade
preserve

//Data subsetting
keep if math != . & verb != . & ses_index != .
gen total = math + verb
collapse (mean) math verb total (median) medmath = math medverb = verb medtotal = total (p75) pmath = math pverb = verb ptotal = total, by(ses_index)

//Regressions
regress total ses_index
regress medtotal ses_index
regress ptotal ses_index

//Graph Generation
tw (sc total ses_index) (lfit total ses_index), title("Mean Total Score on SES Index") ytitle("Mean Total Score Out of 60") xtitle("SES Index")
tw (sc medtotal ses_index) (lfit medtotal ses_index), title("Median Total Score on SES Index") ytitle("Median Total Score Out of 60") xtitle("SES Index")
tw (sc ptotal ses_index) (lfit ptotal ses_index), title("75th Percentile Total Score Out of 60") xtitle("SES Index")

restore