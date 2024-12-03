// Change directory
cd "D:\APHRC\GoogleDrive_ii\data_science\madiva\DMAC\databases\ncd_indicators\"

// Load data
import delimited "NCDs_indicators_raw.csv", bindquote(strict) varnames(1) clear

// Label variables
do "label_NCDIndicators_variables"

// Label values
do "label_NCDIndicators_values" 

// Save dataset
save "NCDs_indicators_cleaned_here.dta", replace

