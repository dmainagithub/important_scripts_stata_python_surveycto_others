/*
// Notes
//remove leading and trailing spaces, then encode to desired codes
label define yes_no 0 "No" 1 "Yes"
replace inthelastsixmonthshaveyoureceive = strltrim(strrtrim(inthelastsixmonthshaveyoureceive))
encode inthelastsixmonthshaveyoureceive, generate(q5) label(yes_no)
*/
// Remove 'NULL' in all variables of a dataset 
foreach var of varlist _all {
    // Check if the variable is a string type
    if !missing(substr(`"`: type `var''`'"', 1, 1)) & substr(`"`: type `var''`'"', 1, 1) == "s" {
        replace `var' = "." if `var' == "NULL"
		replace `var' = strltrim(strrtrim(`var'))
    }
}
 

// Value labels
//Categorical variables
cap drop site
#delimit 
;  
label define  site   
1	"Agincourt"
2	"Nairobi"
3	"Digkale"
4	"Nanoro"
5	"Navrongo"
6	"Soweto"
; 
#delimit cr

// replace hdss_name="3" if hdss_name=="NAIROBI" | hdss_name=="Nairobi"

cap drop dataset
#delimit 
;  
label define  dataset   
101 "HDSS"
102 "AWI-Gen I"
103 "AWI-Gen II"
104 "HAALSI I"
105 "HAALSI II"
106 "HAALSI III"
107 "HAALSI IV"
108 "Nkateko I"
109 "Nkateko II"
110 "HIV NCD"
111 "ARK I"
112 "ARK II"
113 "MHFUS I"
114 "WHO SAGE"
115 "WHO SAGE HDSS I"
116 "SCALEUP Clinic Baseline"
117 "SCALEUP Clinic Endline "
118 "SCALEUP Population Baseline"
119 "SCALEUP Population Endline"
120 "SCALEUP First clinic "
121 "SCALEUP  Followup Clinic"
122 "Assess Linkages Main"
123 "Assess Linkages Alcohol"
124 "Diabetics Baseline"
125 "Diabetics Followup"
; 
#delimit cr

// replace source="1"   if source=="AWIGEN_I"
// replace source="2"   if source=="AWIGEN_II"
// replace source="6"   if source=="SU_Clinic_baseline"
// replace source="7"   if source=="SU_Clinic_endline"
// replace source="8"   if source=="SU_Population_Baseline"
// replace source="9"   if source=="SU_Population_Endline"
// replace source="10"   if source=="assess_l_main"
// replace source="11"   if source=="assess_link_alcohol"
// replace source="12"   if source=="diabetics_b"
// replace source="13"   if source=="diabetics_fu"
// replace source="14"   if source=="su_first_clinic"
// replace source="15"   if source=="su_followup_clinic"


#delimit 
;  
label define  yesno_dontknow   
1 "Yes"
0 "No" 
333 "don't know"
444 "refused"
888 "not applicable"
999 "missing"
; 
#delimit cr

destring, replace  
// destring trad_rx_ever contracep, replace 
label values  hdss_name  site
label values  source  dataset
label values  trad_rx_ever  yesno_dontknow
label values  contracep  yesno_dontknow
label values  adv_stp_smk  yesno_dontknow
label values  adv_stp_alcohol  yesno_dontknow
label values  adv_ex  yesno_dontknow
label values  adv_wt_loss  yesno_dontknow
label values  adv_change_diet  yesno_dontknow
label values  preg   yesno_dontknow
label values  bp_measured_ever  yesno_dontknow
label values  hpt_preg  yesno_dontknow
label values  hpt_12m  yesno_dontknow
label values  hpt_rx_current  yesno_dontknow
label values  hpt_rx_ever  yesno_dontknow
label values  hpt_rx_2w  yesno_dontknow
label values  hpt_rx_12m  yesno_dontknow
label values  hpt_trad_ever  yesno_dontknow
label values  hpt_rx_trad  yesno_dontknow
label values  hpt_rx_other  yesno_dontknow
// label values  hpt_adv_rd_Salt  yesno_dontknow
label values  hpt_adv_wt_loss  yesno_dontknow
label values  hpt_adv_wt_loss_30d  yesno_dontknow
label values  hpt_adv_stp_smk  yesno_dontknow
label values  hpt_adv_stp_smk_30d  yesno_dontknow
label values  hpt_adv_ex  yesno_dontknow
label values  hpt_adv_ex_30d  yesno_dontknow
label values  hpt_fhx  yesno_dontknow
label values  hpt_other  yesno_dontknow
label values  hpt_parents  yesno_dontknow
label values  hpt_mom  yesno_dontknow
label values  hpt_dad  yesno_dontknow
label values  hpt_sibling  yesno_dontknow
label values  hpt_children  yesno_dontknow
label values  diab_hx  yesno_dontknow
label values  diab_12m  yesno_dontknow
label values  diab_rx_ever  yesno_dontknow
label values  diab_rx_current  yesno_dontknow
label values  diab_pills  yesno_dontknow
label values  diab_insu  yesno_dontknow
label values  diab_insu_today  yesno_dontknow
label values  diab_insu_2w  yesno_dontknow
label values  diab_insu_12m  yesno_dontknow
label values  diab_rx_wt_loss  yesno_dontknow
label values  diab_rx_diet  yesno_dontknow
label values  diab_rx_phy_act  yesno_dontknow
label values  diab_rx_other  yesno_dontknow
label values  diab_rx_2w  yesno_dontknow
label values  diab_rx_12m  yesno_dontknow
label values  diab_adv_wt_loss  yesno_dontknow
label values  diab_adv_stp_smk  yesno_dontknow
label values  diab_adv_ex  yesno_dontknow
label values  diab_rx_trad_ever  yesno_dontknow
label values  diab_rx_trad_curr  yesno_dontknow
label values  diab_measured  yesno_dontknow
label values  diab_fhx  yesno_dontknow
label values  diab_parents  yesno_dontknow
label values  diab_mom  yesno_dontknow
label values  diab_dad  yesno_dontknow
label values  diab_sibling  yesno_dontknow
label values  diab_children  yesno_dontknow
label values  diab_other_fam  yesno_dontknow
label values  diab_rx_other_2w  yesno_dontknow
label values  stroke_ever  yesno_dontknow
label values  stroke_year_first  yesno_dontknow
label values  trans_isc  yesno_dontknow
label values  stroke_wkness  yesno_dontknow
label values  stroke_numb  yesno_dontknow
label values  stroke_SufferedParalysis  yesno_dontknow
label values  vision_problem  yesno_dontknow
label values  stroke_blind  yesno_dontknow
label values  stroke_hl_vis  yesno_dontknow
label values  stroke_undstn  yesno_dontknow
label values  stroke_verb_e  yesno_dontknow
label values  stroke_rx_ever  yesno_dontknow
label values  stroke_rx_2w  yesno_dontknow
label values  stroke_rx_12m  yesno_dontknow
label values  stroke_rx_current  yesno_dontknow
label values  stroke_rx_trad  yesno_dontknow
label values  stroke_fhx  yesno_dontknow
label values  stroke_parents  yesno_dontknow
label values  stroke_mom  yesno_dontknow
label values  stroke_dad  yesno_dontknow
label values  stroke_sibling  yesno_dontknow
label values  stroke_children  yesno_dontknow
label values  stroke_other  yesno_dontknow
label values  epi_hx  yesno_dontknow
label values  sex_ever  yesno_dontknow
label values  sex_4_money_ever  yesno_dontknow
label values  sex_4_money_condom  yesno_dontknow
label values  sex_violence  yesno_dontknow
label values  sex_violence_nocondom  yesno_dontknow
label values  sex_no_condom_hiv_person  yesno_dontknow
label values  asthma_ever  yesno_dontknow
label values  asthma_mom  yesno_dontknow
label values  asthma_dad  yesno_dontknow
label values  tobac_ever  yesno_dontknow
label values  tobac_cur  yesno_dontknow
label values  tobac_daily  yesno_dontknow
label values  tobac_smkls_ever  yesno_dontknow
label values  tobac_smkls_cur  yesno_dontknow
label values  tobac_smkls_daily  yesno_dontknow
label values  tobac_p_daily  yesno_dontknow
label values  smk_stop  yesno_dontknow
label values  angina_ever  yesno_dontknow
label values  angina_rx_ever  yesno_dontknow
label values  angina_rx_current  yesno_dontknow
label values  angina_rx_2w  yesno_dontknow
label values  angina_rx_12m  yesno_dontknow
label values  angina_rx_trad  yesno_dontknow
label values  angina_walk_uphill  yesno_dontknow
label values  angina_walk_ordinarily  yesno_dontknow
label values  angina_xp_leftarm  yesno_dontknow
label values  angina_xp_lowerchest  yesno_dontknow
label values  angina_xp_upperchest  yesno_dontknow
label values  angina_symptoms_2w  yesno_dontknow
label values  chest_pain  yesno_dontknow
label values  angina_fhx  yesno_dontknow
label values  angina_parents  yesno_dontknow
label values  angina_mom  yesno_dontknow
label values  angina_dad  yesno_dontknow
label values  angina_sibling  yesno_dontknow
label values  angina_children  yesno_dontknow
label values  angina_other  yesno_dontknow
label values  hrt_fail  yesno_dontknow
label values  hrt_fail_rx_ever  yesno_dontknow
label values  hrt_fail_rx_current  yesno_dontknow
label values  hrt_fail_rx_trad  yesno_dontknow
label values  hrt_atck_ever  yesno_dontknow
label values  hrt_atck_rx_ever  yesno_dontknow
label values  hrt_atck_rx_current  yesno_dontknow
label values  hrt_atck_rx_trad  yesno_dontknow
label values  hrt_other  yesno_dontknow
label values  hrt_fhx  yesno_dontknow
label values  hrt_parents  yesno_dontknow
label values  hrt_mom  yesno_dontknow
label values  hrt_dad  yesno_dontknow
label values  hrt_sibling  yesno_dontknow
label values  hrt_children  yesno_dontknow
label values  hrt_fam_other  yesno_dontknow
label values  alco_ever  yesno_dontknow
label values  alco_12m  yesno_dontknow
label values  alco_30d  yesno_dontknow
label values  alco_cur  yesno_dontknow
label values  alco_beer  yesno_dontknow
label values  alco_wine  yesno_dontknow
label values  alco_homebrew  yesno_dontknow
label values  alco_spirit  yesno_dontknow
label values  alco_other  yesno_dontknow
label values  alco_bing_y  yesno_dontknow
label values  alco_hangov  yesno_dontknow
label values  alco_cutdwon  yesno_dontknow
label values  drug_ever  yesno_dontknow
label values  drugs_injected  yesno_dontknow
label values  alcohol_drugs_fam  yesno_dontknow
label values  soft_drink_12m  yesno_dontknow
label values  sugar_add  yesno_dontknow
label values  chol_measured  yesno_dontknow

label values  stroke_trans_isc_ever  yesno_dontknow 
label values  stroke_wkness   yesno_dontknow
label values  stroke_numb  yesno_dontknow 
label values  stroke_paralysis_ever  yesno_dontknow

label values  vision_problem   yesno_dontknow
label values  stroke_blind  yesno_dontknow 
label values  stroke_hl_vis   yesno_dontknow
label values  stroke_undstn  yesno_dontknow 
label values  stroke_verbal  yesno_dontknow 
label values  stroke_rx_ever  yesno_dontknow 
label values  stroke_rx_2w  yesno_dontknow 
label values  stroke_rx_12m   yesno_dontknow
label values  stroke_rx_current  yesno_dontknow   
label values  stroke_rx_trad  yesno_dontknow 
label values  stroke_parents  yesno_dontknow 
label values  stroke_mom  yesno_dontknow 
label values  stroke_dad  yesno_dontknow

label values  stroke_interfere_daily_activity  yesno_dontknow
label values  stroke_fhx  yesno_dontknow
label values  sex_ever  yesno_dontknow
label values  sex_never_reason  yesno_dontknow
label values  sex_4_money_ever  yesno_dontknow
label values  sex_4_money_condom  yesno_dontknow
label values  sex_violence  yesno_dontknow
label values  sex_violence_nocondom  yesno_dontknow
label values  sex_choose_start  yesno_dontknow
label values  sex_no_condom_hiv_person  yesno_dontknow
label values  asthma_ever  yesno_dontknow
label values  tobac_smkls_daily  yesno_dontknow
label values  tobac_p_daily  yesno_dontknow
label values  asthma_mom  yesno_dontknow
label values  asthma_dad  yesno_dontknow
label values  tobac_ever  yesno_dontknow
label values  tobac_cur  yesno_dontknow
label values  tobac_daily  yesno_dontknow
label values  angina_children  yesno_dontknow
label values  angina_other  yesno_dontknow
label values  tobac_smkls_ever  yesno_dontknow
label values  tobac_smkls_cur  yesno_dontknow
label values  angina_ever  yesno_dontknow
label values  angina_rx_ever  yesno_dontknow
label values  angina_rx_current  yesno_dontknow
label values  angina_rx_2w  yesno_dontknow
label values  angina_rx_12m  yesno_dontknow
label values  angina_rx_trad  yesno_dontknow
label values  angina_walk_uphill  yesno_dontknow
label values  angina_walk_ordinarily  yesno_dontknow
label values  angina_do_when_pain  yesno_dontknow
label values  angina_parents  yesno_dontknow
label values  angina_mom  yesno_dontknow
label values  angina_dad  yesno_dontknow
label values  angina_sibling  yesno_dontknow
label values  angina_xp_leftarm  yesno_dontknow
label values  angina_xp_lowerchest  yesno_dontknow
label values  angina_xp_upperchest  yesno_dontknow
label values  angina_symptoms_2w  yesno_dontknow
label values  chest_pain  yesno_dontknow
label values  angina_fhx  yesno_dontknow
label values  hrt_fail  yesno_dontknow
label values  hrt_fail_rx_ever  yesno_dontknow
label values  hrt_fail_rx_current  yesno_dontknow
label values  hrt_fail_rx_trad  yesno_dontknow

label values  hrt_atck_ever  yesno_dontknow
label values  hrt_atck_rx_ever  yesno_dontknow
label values  hrt_atck_rx_current  yesno_dontknow
label values  hrt_atck_rx_trad  yesno_dontknow
label values  hrt_other  yesno_dontknow
label values  hrt_fhx  yesno_dontknow
label values  hrt_parents  yesno_dontknow
label values  hrt_mom  yesno_dontknow
label values  hrt_dad  yesno_dontknow
label values  alco_ever  yesno_dontknow
label values  alco_12m  yesno_dontknow
label values  alco_30d  yesno_dontknow
label values  alco_cur  yesno_dontknow
label values  soft_drink_12m  yesno_dontknow
label values  alco_bing_y  yesno_dontknow
label values  alco_hangov  yesno_dontknow
label values  alco_cutdwon  yesno_dontknow
label values  drug_ever  yesno_dontknow
label values  sugar_add  yesno_dontknow
label values  drugs_injected  yesno_dontknow
label values  alcohol_drugs_fam  yesno_dontknow
label values  chol_measured  yesno_dontknow
label values  chol_rx_ever  yesno_dontknow
label values  chol_rx_cur  yesno_dontknow
label values  chol_rx_2w  yesno_dontknow
label values  chol_rx_trad  yesno_dontknow
label values  chol_rx_wt_loss  yesno_dontknow
label values  chol_rx_diet  yesno_dontknow
label values  chol_rx_phy_act  yesno_dontknow
label values  chol_rx_other  yesno_dontknow
label values  chol_fam  yesno_dontknow
label values  chol_parents  yesno_dontknow
label values  chol_sibling  yesno_dontknow
label values  chol_children  yesno_dontknow
label values  chol_fam_other  yesno_dontknow
label values  chol_mom  yesno_dontknow
label values  chol_dad  yesno_dontknow
label values  actv_vpa  yesno_dontknow
label values  actv_mpa  yesno_dontknow
label values  att_clinic_priv_3m  yesno_dontknow
label values  att_clinic_public_3m  yesno_dontknow
label values  actv_mvpa  yesno_dontknow
label values  actv_sitting_or_standing  yesno_dontknow
label values  actv_walk_bicycle  yesno_dontknow
label values  actv_vigorous_sports  yesno_dontknow
label values  actv_moderate_sports  yesno_dontknow
label values  att_clinic_pub_ever  yesno_dontknow
label values  kidney_fail_hrd  yesno_dontknow
label values  kidney_low_func  yesno_dontknow
label values  kidney_disease_ever  yesno_dontknow
label values  kidney_rx  yesno_dontknow
label values  kidney_test_ever  yesno_dontknow
label values  kidney_fail_fh  yesno_dontknow
label values  kidney_fail_parents  yesno_dontknow
label values  kidney_fail_mom  yesno_dontknow
label values  kidney_fail_dad  yesno_dontknow
label values  kidney_fail_sibling  yesno_dontknow
label values  kidney_fail_children  yesno_dontknow
label values  kidney_fail_other  yesno_dontknow
label values  kidney_bladder_inf_ever  yesno_dontknow
label values  kidney_stones_ever  yesno_dontknow
label values  kidney_stones_parents  yesno_dontknow
label values  kidney_stones_mom  yesno_dontknow
label values  kidney_stones_dad  yesno_dontknow
label values  kidney_stones_sibling  yesno_dontknow
label values  kidney_stones_children  yesno_dontknow
label values  kidney_stones_fh  yesno_dontknow
label values  kidney_stones_other  yesno_dontknow
label values  kidney_problems  yesno_dontknow

label values  hiv_counselled  yesno_dontknow
label values  hiv_tested  yesno_dontknow
label values  hiv_status_slf_rpt  yesno_dontknow
label values  hiv_test_result  yesno_dontknow
label values  canc_other_cur  yesno_dontknow
label values  canc_other_rx_ever  yesno_dontknow
label values  hiv_care  yesno_dontknow
label values  hiv_rx_ever  yesno_dontknow
label values  hiv_rx_cur  yesno_dontknow
label values  hiv_rx_trad_cur  yesno_dontknow
label values  hiv_rx_trad_ever  yesno_dontknow
label values  tb_ever  yesno_dontknow
label values  tb_12m  yesno_dontknow
label values  tb_rx_ever  yesno_dontknow
label values  tb_rx_cur  yesno_dontknow
label values  tb_rx_trad_ever  yesno_dontknow
label values  canc_any_ever  yesno_dontknow
label values  tb_rx_trad_cur  yesno_dontknow
label values  tb_counsel  yesno_dontknow
label values  canc_brst_ever  yesno_dontknow
label values  canc_cerv_ever  yesno_dontknow
label values  canc_prost_ever  yesno_dontknow
label values  canc_other_ever  yesno_dontknow
label values  canc_cerv_mother  yesno_dontknow
label values  canc_prost_father  yesno_dontknow
label values  canc_breast_mother  yesno_dontknow
label values  std_trichomonas_ever  yesno_dontknow
label values  std_genital_herpes  yesno_dontknow
label values  std_syphilis  yesno_dontknow
label values  std_chancroid  yesno_dontknow
label values  std_pid  yesno_dontknow
label values  bil_swim_river  yesno_dontknow
label values  bil_bld_uri_ever  yesno_dontknow
label values  bil_bld_uri_12m  yesno_dontknow
label values  bil_test_ever  yesno_dontknow
label values  fd_veg_salt_cooking  yesno_dontknow
label values  bil_ever  yesno_dontknow
label values  bil_rx_cur  yesno_dontknow
label values  fd_veg_salt_eating  yesno_dontknow
label values  circumcised  yesno_dontknow
label values  fever_cur  yesno_dontknow
label values  schistosom  yesno_dontknow
label values  obes_mom  yesno_dontknow
label values  obes_dad  yesno_dontknow
label values  malaria_ever  yesno_dontknow
label values  malaria_ever_12m  yesno_dontknow
label values  pesticide_xp  yesno_dontknow
label values  thyroid_ever  yesno_dontknow
label values  liver_dis  yesno_dontknow
label values  pp_neur  yesno_dontknow
label values  poor_vision  yesno_dontknow
label values  amputation  yesno_dontknow
label values  body_swelling  yesno_dontknow
label values  oedema  yesno_dontknow
label values  other_comp  yesno_dontknow
label values  diff_brthng_ever  yesno_dontknow
label values  anaemia  yesno_dontknow
label values  dehydrated  yesno_dontknow
label values  convulsion  yesno_dontknow
label values  injury  yesno_dontknow
label values  any_rx_12h  yesno_dontknow
label values  fd_diet_change  yesno_dontknow
label values  kidney_disease  yesno_dontknow
label values  seizure  yesno_dontknow

label values  alco_beer  yesno_dontknow
label values  alco_wine  yesno_dontknow
label values  alco_homebrew  yesno_dontknow
label values  alco_spirit  yesno_dontknow
label values  alco_other  yesno_dontknow

label values  smk_stop  yesno_dontknow


//Nkosinat - 201 (label define and assign valkue abels)






