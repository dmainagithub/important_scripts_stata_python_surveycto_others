// Remove 'NULL' in all variables of a dataset 
foreach var of varlist _all {
    // Check if the variable is a string type
    if !missing(substr(`"`: type `var''`'"', 1, 1)) & substr(`"`: type `var''`'"', 1, 1) == "s" {
        replace `var' = "." if `var' == "NULL"  //Replace a specific string in all the variables
		replace `var' = strltrim(strrtrim(`var')) //remove leading and trailing spaces
    }
}
 