-- chltjdcjf
-- DRH EXMN_DATA
select a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(c.exmn_cd,'BL2011',c.cleaned_ncvl_vl,'')) BL2011
     , max(decode(c.exmn_cd,'BL2013',c.cleaned_ncvl_vl,'')) BL2013
     , max(decode(c.exmn_cd,'BL2016',c.cleaned_ncvl_vl,'')) BL2016
     , max(decode(c.exmn_cd,'BL211103',c.cleaned_ncvl_vl,'')) BL211103
     , max(decode(c.exmn_cd,'BL3112',c.cleaned_ncvl_vl,'')) BL3112
     , max(decode(c.exmn_cd,'BL3113',c.cleaned_ncvl_vl,'')) BL3113
     , max(decode(c.exmn_cd,'BL3114',c.cleaned_ncvl_vl,'')) BL3114
     , max(decode(c.exmn_cd,'BL3115',c.cleaned_ncvl_vl,'')) BL3115
     , max(decode(c.exmn_cd,'BL3116',c.cleaned_ncvl_vl,'')) BL3116
     , max(decode(c.exmn_cd,'BL3117',c.cleaned_ncvl_vl,'')) BL3117
     , max(decode(c.exmn_cd,'BL3118',c.cleaned_ncvl_vl,'')) BL3118
     , max(decode(c.exmn_cd,'BL3119',c.cleaned_ncvl_vl,'')) BL3119
     , max(decode(c.exmn_cd,'BL3120',c.cleaned_ncvl_vl,'')) BL3120
     , max(decode(c.exmn_cd,'BL312002',c.cleaned_ncvl_vl,'')) BL312002
     , max(decode(c.exmn_cd,'BL3121',c.cleaned_ncvl_vl,'')) BL3121
     , max(decode(c.exmn_cd,'BL3125',c.cleaned_ncvl_vl,'')) BL3125
     , max(decode(c.exmn_cd,'BL3140',c.cleaned_ncvl_vl,'')) BL3140
     , max(decode(c.exmn_cd,'BL3141',c.cleaned_ncvl_vl,'')) BL3141
     , max(decode(c.exmn_cd,'BL3142',c.cleaned_ncvl_vl,'')) BL3142
     , max(decode(c.exmn_cd,'BL314201',c.cleaned_ncvl_vl,'')) BL314201
     , max(decode(c.exmn_cd,'BL3164',c.cleaned_ncvl_vl,'')) BL3164
     , max(decode(c.exmn_cd,'BL3249',c.cleaned_ncvl_vl,'')) BL3249
     , max(decode(c.exmn_cd,'BL3252',c.cleaned_ncvl_vl,'')) BL3252
     , max(decode(c.exmn_cd,'BL326501',c.cleaned_ncvl_vl,'')) BL326501
     , max(decode(c.exmn_cd,'BL3304',c.cleaned_ncvl_vl,'')) BL3304
     , max(decode(c.exmn_cd,'BL3305',c.cleaned_ncvl_vl,'')) BL3305
     , max(decode(c.exmn_cd,'BL3307',c.cleaned_ncvl_vl,'')) BL3307
     , max(decode(c.exmn_cd,'BL3653',c.cleaned_ncvl_vl,'')) BL3653
     , max(decode(c.exmn_cd,'BL3665',c.cleaned_ncvl_vl,'')) BL3665
     , max(decode(c.exmn_cd,'BL3711',c.cleaned_ncvl_vl,'')) BL3711
     , max(decode(c.exmn_cd,'BL399201',c.cleaned_ncvl_vl,'')) BL399201
     , max(decode(c.exmn_cd,'BL399202',c.cleaned_ncvl_vl,'')) BL399202
     , max(decode(c.exmn_cd,'BL399203',c.cleaned_ncvl_vl,'')) BL399203
     , max(decode(c.exmn_cd,'BL3A2502',c.cleaned_ncvl_vl,'')) BL3A2502
     , max(decode(c.exmn_cd,'BL5111',c.cleaned_ncvl_vl,'')) BL5111
     , max(decode(c.exmn_cd,'BL5112',c.cleaned_ncvl_vl,'')) BL5112
     , max(decode(c.exmn_cd,'BL5113',c.cleaned_ncvl_vl,'')) BL5113
     , max(decode(c.exmn_cd,'BL5115',c.cleaned_ncvl_vl,'')) BL5115
     , max(decode(c.exmn_cd,'BL5116',c.cleaned_ncvl_vl,'')) BL5116
     , max(decode(c.exmn_cd,'BL5117',c.cleaned_ncvl_vl,'')) BL5117
     , max(decode(c.exmn_cd,'BL512001',c.cleaned_ncvl_vl,'')) BL512001
     , max(decode(c.exmn_cd,'NR0101',c.cleaned_ncvl_vl,'')) NR0101
     , max(decode(c.exmn_cd,'NR0102',c.cleaned_ncvl_vl,'')) NR0102
     , max(decode(c.exmn_cd,'NR0103',c.cleaned_ncvl_vl,'')) NR0103
     , max(decode(c.exmn_cd,'NR0201',c.cleaned_ncvl_vl,'')) NR0201
     , max(decode(c.exmn_cd,'NR0202',c.cleaned_ncvl_vl,'')) NR0202
     , max(decode(c.exmn_cd,'NR0305',c.cleaned_ncvl_vl,'')) NR0305
     , max(decode(c.exmn_cd,'NR1101',c.cleaned_ncvl_vl,'')) NR1101
     , max(decode(c.exmn_cd,'NR4101',c.cleaned_ncvl_vl,'')) NR4101
     , max(decode(c.exmn_cd,'NR4102',c.cleaned_ncvl_vl,'')) NR4102
     , max(decode(c.exmn_cd,'NR4103',c.cleaned_ncvl_vl,'')) NR4103
     , max(decode(c.exmn_cd,'NR5101',c.cleaned_ncvl_vl,'')) NR5101
     , max(decode(c.exmn_cd,'NR5106',c.cleaned_ncvl_vl,'')) NR5106
     , max(decode(c.exmn_cd,'NR6104',c.cleaned_ncvl_vl,'')) NR6104
     , max(decode(c.exmn_cd,'NR6105',c.cleaned_ncvl_vl,'')) NR6105
     , max(decode(c.exmn_cd,'NR6106',c.cleaned_ncvl_vl,'')) NR6106
     , max(decode(c.exmn_cd,'NR7104',c.cleaned_ncvl_vl,'')) NR7104
     , max(decode(c.exmn_cd,'NR7105',c.cleaned_ncvl_vl,'')) NR7105
     , max(decode(c.exmn_cd,'RC118401',c.cleaned_ncvl_vl,'')) RC118401
     , max(decode(c.exmn_cd,'RC118402',c.cleaned_ncvl_vl,'')) RC118402
     , max(decode(c.exmn_cd,'SM0101',c.cleaned_ncvl_vl,'')) SM0101
     , max(decode(c.exmn_cd,'SM0102',c.cleaned_ncvl_vl,'')) SM0102
     , max(decode(c.exmn_cd,'SM053101',c.cleaned_ncvl_vl,'')) SM053101
     , max(decode(c.exmn_cd,'SM053111',c.cleaned_ncvl_vl,'')) SM053111
     , max(decode(c.exmn_cd,'SM0600DBP',c.cleaned_ncvl_vl,'')) SM0600DBP
     , max(decode(c.exmn_cd,'SM0600SBP',c.cleaned_ncvl_vl,'')) SM0600SBP
     , max(decode(c.exmn_cd,'SM316001',c.cleaned_ncvl_vl,'')) SM316001_error
     , nvl(round(max(decode(c.exmn_cd,'SM0102',c.cleaned_ncvl_vl,''))/((max(decode(c.exmn_cd,'SM0101',c.cleaned_ncvl_vl,''))/100)*(max(decode(c.exmn_cd,'SM0101',c.cleaned_ncvl_vl,''))/100)),1),0) SM316001
  from (                     
        select /*+ index(a 3C15332B3C20431528_i04) */
               a.ptno
             , a.ordr_ymd
          from 스키마.3C15332B3C20431528 a
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.ordr_cd in ('RS1010','RS1031','RS1010SM')
           and a.codv_cd = 'G'
           and a.excf_cd = 'SR'
           and nvl(a.dc_dvsn_cd,'N') = 'N'
       ) a
     , 스키마.0E5B5B285B28402857 b
     , 스키마.1543294D47144D43333E2E1428 c
 where b.ptno = a.ptno
    and b.ptno not in (/* 기본 제외대상자 */
                      &not_in_ptno
                     )
   /* 동의여부자만 대상 */
   and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
   /* 외국인 제외 */
   and substr(b.brrn,1,1) not in ('5','6','7','8')
   and c.ptno = a.ptno
   and c.sm_date = a.ordr_ymd
   and c.exmn_cd in (
                     'BL2011' ,'BL2013' ,'BL2016' ,'BL211103' ,'BL3112' ,'BL3113' ,'BL3114' ,'BL3115' ,'BL3116' ,'BL3117' ,'BL3118' ,'BL3119' ,'BL3120' ,'BL312002' 
                    ,'BL3121' ,'BL3125' ,'BL3140' ,'BL3141' ,'BL3142' ,'BL314201' ,'BL3164' ,'BL3249' ,'BL3252' ,'BL326501' ,'BL3304' ,'BL3305' ,'BL3307' ,'BL3653' 
                    ,'BL3665' ,'BL3711' ,'BL399201' ,'BL399202' ,'BL399203' ,'BL3A2502' ,'BL5111' ,'BL5112' ,'BL5113' ,'BL5115' ,'BL5116' ,'BL5117' ,'BL512001' 
                    ,'NR0101' ,'NR0102' ,'NR0103' ,'NR0201' ,'NR0202' ,'NR0305' ,'NR1101' ,'NR4101' ,'NR4102' ,'NR4103' ,'NR5101' ,'NR5106' ,'NR6104' ,'NR6105' ,'NR6106' ,'NR7104' ,'NR7105' 
                    ,'RC118401' ,'RC118402' ,'SM0101' ,'SM0102' ,'SM053101' ,'SM053111' ,'SM0600DBP' ,'SM0600SBP' ,'SM316001'
                    )
 group by a.ptno
     , a.ordr_ymd
     , b.gend_cd

-- DRH QUESAT DATA
select a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , c.foreign
     , c.marital_status
     , c.education
     , c.income
     , c.smk_ys
     , c.smk
     , c.smk_duration
     , c.smk_current_amount
     , c.smk_start_age
     , c.smk_endyr
     , c.smk_packyrs
     , c.alc_ys
     , c.alc
     , c.alc_freq
     , c.alc_amount_drinks
     , c.alc_start_age
     , c.alc_duration
     , c.alc_endyr
     , c.alc_amount_grams
     , c.phy
     , c.overall_physical_activity
     , c.phy_freq_2009
     , c.phy_duration_2009
     , c.phy_freq
     , c.phy_duration
     , c.phy_startyr
     , c.phy_walking
     , c.phy_jogging
     , c.phy_tennis
     , c.phy_golf
     , c.phy_swimming
     , c.phy_climbing
     , c.phy_aerobic
     , c.phy_fitness
     , c.phy_other
     , c.history_hypertension
     , c.trt_hypertension
     , c.status_hypertension
     , c.hypertension_age_diag
     , c.history_hyperlipidemia
     , c.trt_hyperlipidemia
     , c.status_hyperlipidemia
     , c.hyperlipidemia_age_diag
     , c.history_stroke
     , c.trt_stroke
     , c.status_stroke
     , c.trt_stroke_op
     , c.stroke_age_diag
     , c.history_diabetes
     , c.trt_diabetes
     , c.status_diabetes
     , c.diabetes_age_diag
     , c.history_fatty_liver
     , c.trt_fatty_liver
     , c.status_fatty_liver
     , c.fatty_liver_age_diag
     , c.history_thyroid_nodules
     , c.trt_hep_cirrhosis
     , c.hep_cirrhosis_age_diag
     , c.history_hbv
     , c.trt_hbv
     , c.status_hbv
     , c.hbv_age_diag
     , c.history_hcv
     , c.trt_hcv
     , c.status_hcv
     , c.hcv_age_diag
     , c.history_cirrhosis
     , c.trt_cirrhosis
     , c.status_cirrhosis
     , c.cirrhosis_age_diag
     , c.history_coronary_dis
     , c.trt_coronary_dis
     , c.coronary_dis_age_diag
     , c.history_angina
     , c.trt_angina
     , c.status_angina
     , c.trt_angina_op
     , c.angina_age_diag
     , c.history_mi
     , c.trt_mi
     , c.status_mi
     , c.trt_mi_op
     , c.mi_age_diag
     , c.history_kidney_urinary_dis
     , c.trt_kidney_urinary_dis
     , c.status_kidney_urinary_dis
     , c.trt_kidney_urinary_dis_op
     , c.kidney_urinary_dis_age_diag
     , c.history_kidney_dis
     , c.trt_kidney_dis
     , c.kidney_dis_age_diag
     , c.history_thyroid_dis1
     , c.trt_thyroid_dis1
     , c.thyroid_dis1_age_diag
     , c.history_cancer
     , c.history_cancer_stomach
     , c.cancer_stomach_age_diag
     , c.trt_cancer_stomach
     , c.trt_cancer_stomach_op
     , c.trt_cancer_stomach_ch
     , c.trt_cancer_stomach_ra
     , c.trt_cancer_stomach_ot
     , c.history_cancer_lung
     , c.cancer_lung_age_diag
     , c.trt_cancer_lung
     , c.trt_cancer_lung_op
     , c.trt_cancer_lung_ch
     , c.trt_cancer_lung_ra
     , c.trt_cancer_lung_ot
     , c.history_cancer_liver
     , c.cancer_liver_age_diag
     , c.trt_cancer_liver
     , c.trt_cancer_liver_op
     , c.trt_cancer_liver_ch
     , c.trt_cancer_liver_ra
     , c.trt_cancer_liver_ot
     , c.history_cancer_colorectal
     , c.cancer_colorectal_age_diag
     , c.trt_cancer_colorectal
     , c.trt_cancer_colorectal_op
     , c.trt_cancer_colorectal_ch
     , c.trt_cancer_colorectal_ra
     , c.trt_cancer_colorectal_ot
     , c.history_cancer_breast
     , c.cancer_breast_age_diag
     , c.trt_cancer_breast
     , c.trt_cancer_breast_op
     , c.trt_cancer_breast_ch
     , c.trt_cancer_breast_ra
     , c.trt_cancer_breast_ot
     , c.history_cancer_cervix
     , c.cancer_cervix_age_diag
     , c.trt_cancer_cervix
     , c.trt_cancer_cervix_op
     , c.trt_cancer_cervix_ch
     , c.trt_cancer_cervix_ra
     , c.trt_cancer_cervix_ot
     , c.history_cancer_thyroid
     , c.cancer_thyroid_age_diag
     , c.trt_cancer_thyroid
     , c.trt_cancer_thyroid_op
     , c.trt_cancer_thyroid_ch
     , c.trt_cancer_thyroid_ra
     , c.trt_cancer_thyroid_ot
     , c.history_cancer_bladder
     , c.cancer_bladder_age_diag
     , c.trt_cancer_bladder
     , c.trt_cancer_bladder_op
     , c.trt_cancer_bladder_ch
     , c.trt_cancer_bladder_ra
     , c.trt_cancer_bladder_ot
     , c.history_cancer_esophagus
     , c.cancer_esophagus_age_diag
     , c.trt_cancer_esophagus
     , c.trt_cancer_esophagus_op
     , c.trt_cancer_esophagus_ch
     , c.trt_cancer_esophagus_ra
     , c.trt_cancer_esophagus_ot
     , c.history_cancer_gb_biliary
     , c.cancer_gb_biliary_age_diag
     , c.trt_cancer_gb_biliary
     , c.trt_cancer_gb_biliary_op
     , c.trt_cancer_gb_biliary_ch
     , c.trt_cancer_gb_biliary_ra
     , c.trt_cancer_gb_biliary_ot
     , c.history_cancer_ovary
     , c.cancer_ovary_age_diag
     , c.trt_cancer_ovary
     , c.trt_cancer_ovary_op
     , c.trt_cancer_ovary_ch
     , c.trt_cancer_ovary_ra
     , c.trt_cancer_ovary_ot
     , c.history_cancer_prostate
     , c.cancer_prostate_age_diag
     , c.trt_cancer_prostate
     , c.trt_cancer_prostate_op
     , c.trt_cancer_prostate_ch
     , c.trt_cancer_prostate_ra
     , c.trt_cancer_prostate_ot
     , c.history_cancer_pancreas
     , c.cancer_pancreas_age_diag
     , c.trt_cancer_pancreas
     , c.trt_cancer_pancreas_op
     , c.trt_cancer_pancreas_ch
     , c.trt_cancer_pancreas_ra
     , c.trt_cancer_pancreas_ot
     , c.history_cancer_other
     , c.cancer_other_age_diag
     , c.trt_cancer_other
     , c.trt_cancer_other_op
     , c.trt_cancer_other_ch
     , c.trt_cancer_other_ra
     , c.trt_cancer_other_ot
     , c.med
     , c.med_hypertension
     , c.trt_med_hypertension
     , c.med_hypertension_duration
     , c.med_diabetes
     , c.trt_med_diabetes
     , c.med_diabetes_duration
     , c.med_aspirin
     , c.trt_med_aspirin
     , c.med_aspirin_duration
     , c.med_nsaids
     , c.trt_med_nsaids
     , c.med_nsaids_duration
     , c.med_calcium
     , c.trt_med_calcium
     , c.med_calcium_duration
     , c.med_iron
     , c.trt_med_iron
     , c.med_iron_duration
     , c.med_cam
     , c.trt_med_cam
     , c.med_cam_duration
     , c.med_beta_carotene
     , c.med_beta_carotene_duration
     , c.med_multi_vitamin
     , c.med_multi_vitamin_duration
     , c.med_vitamin_a
     , c.med_vitamin_a_duration
     , c.med_vitamin_b
     , c.med_vitamin_b_duration
     , c.med_vitamin_c
     , c.med_vitamin_c_duration
     , c.med_vitamin_e
     , c.med_vitamin_e_duration
     , c.med_other_supplements
     , c.med_other_supplements_duration
     , c.med_hyperlipidemia
     , c.trt_med_hyperlipidemia
     , c.med_warfarin
     , c.trt_med_warfarin
     , c.med_anticoagulant
     , c.trt_med_anticoagulant
     , c.med_arrhythmia
     , c.trt_med_arrhythmia
     , c.med_gi_digestives
     , c.trt_med_gi_digestives
     , c.med_liver
     , c.trt_med_liver
     , c.med_constipation
     , c.trt_med_constipation
     , c.med_thyroid_dis
     , c.trt_med_thyroid_dis
     , c.med_osteoporosis
     , c.trt_med_osteoporosis
     , c.med_female_hormones
     , c.trt_med_female_hormones
     , c.med_bph
     , c.trt_med_bph
     , c.med_respiratory_dis
     , c.trt_med_respiratory_dis
     , c.med_nutri_supplements
     , c.trt_med_nutri_supplements
     , c.med_sleeping_pills
     , c.med_sleeping_pills_duration
     , c.med_psychiatric
     , c.trt_med_psychiatric
     , c.med_other
     , c.trt_med_other
     , c.med_other_duration
     , c.menstruation_last_yy
     , c.menstruation_last_mm
     , c.menstruation_last_dd
     , c.menarche_age
     , c.no_menstruation
     , c.menstruation_avg_duration
     , c.abnormal_bleeding
     , c.vaginal_discharge
     , c.postmenopausal
     , c.menopause_age_cat
     , c.menopause_age
     , c.menopause_cause
     , c.female_hormones
     , c.trt_female_hormones
     , c.female_hormones_age
     , c.female_hormones_amount
     , c.female_hormones_duration
     , c.pregnancy
     , c.pregnancy_first_age
     , c.delivery
     , c.delivery_n
     , c.delivery_boy
     , c.delivery_girl
     , c.natural_childbirth
     , c.caesarean_section
     , c.delivery_first_age
     , c.delivery_last_age
     , c.premature_birth
     , c.premature_birth_n
     , c.miscarriage
     , c.miscarriage_natural_n
     , c.miscarriage_artificial_n
     , c.stress_q1
     , c.stress_q2
     , c.stress_q3
     , c.stress_q4
     , c.stress_q5
     , c.stress_q6
     , c.stress_q7
     , c.stress_q8
     , c.stress_q9
     , c.stress_q10
     , c.stress_q11
     , c.stress_q12
     , c.stress_q13
     , c.stress_q14
     , c.stress_q15
     , c.stress_q16
     , c.stress_q17
     , c.stress_q18
     , c.stress_q19
     , c.stress_q20
     , c.stress_q21
     , c.stress_score
  from (                     
        select /*+ index(a 3C15332B3C20431528_i04) */
               a.ptno
             , a.ordr_ymd
          from 스키마.3C15332B3C20431528 a
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.ordr_cd in ('RS1010','RS1031','RS1010SM')
           and a.codv_cd = 'G'
           and a.excf_cd = 'SR'
           and nvl(a.dc_dvsn_cd,'N') = 'N'
       ) a
     , 스키마.0E5B5B285B28402857 b
     , 스키마.1543294D47144D302E333E0E28 c
 where b.ptno = a.ptno
    and b.ptno not in (/* 기본 제외대상자 */
                      &not_in_ptno
                     )
   /* 동의여부자만 대상 */
   and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
   /* 외국인 제외 */
   and substr(b.brrn,1,1) not in ('5','6','7','8')
   and c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_ymd

-- INBODY DATA
select a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , max(decode(c.exmn_cd,'SM0104',c.exrs_ncvl_vl,'')) SM0104
     , max(decode(c.exmn_cd,'SM0106',c.exrs_ncvl_vl,'')) SM0106
     , max(decode(c.exmn_cd,'SM0111',c.exrs_ncvl_vl,'')) SM0111
     , max(decode(c.exmn_cd,'SM0112',c.exrs_ncvl_vl,'')) SM0112
     , max(decode(c.exmn_cd,'SM0126',c.exrs_ncvl_vl,'')) SM0126
     , max(decode(c.exmn_cd,'SM0131',c.exrs_ncvl_vl,'')) SM0131
     , max(decode(c.exmn_cd,'SM0132',c.exrs_ncvl_vl,'')) SM0132
     , max(decode(c.exmn_cd,'SM013201',c.exrs_ncvl_vl,'')) SM013201
     , max(decode(c.exmn_cd,'SM0133',c.exrs_ncvl_vl,'')) SM0133
     , max(decode(c.exmn_cd,'SM013301',c.exrs_ncvl_vl,'')) SM013301
     , max(decode(c.exmn_cd,'SM0134',c.exrs_ncvl_vl,'')) SM0134
     , max(decode(c.exmn_cd,'SM013401',c.exrs_ncvl_vl,'')) SM013401
     , max(decode(c.exmn_cd,'SM0151',c.exrs_ncvl_vl,'')) SM0151
     , max(decode(c.exmn_cd,'SM015101',c.exrs_ncvl_vl,'')) SM015101
     , max(decode(c.exmn_cd,'SM0152',c.exrs_ncvl_vl,'')) SM0152
     , max(decode(c.exmn_cd,'SM015201',c.exrs_ncvl_vl,'')) SM015201
     , max(decode(c.exmn_cd,'SM0153',c.exrs_ncvl_vl,'')) SM0153
     , max(decode(c.exmn_cd,'SM015301',c.exrs_ncvl_vl,'')) SM015301
     , max(decode(c.exmn_cd,'SM0154',c.exrs_ncvl_vl,'')) SM0154
     , max(decode(c.exmn_cd,'SM015401',c.exrs_ncvl_vl,'')) SM015401
     , max(decode(c.exmn_cd,'SM0155',c.exrs_ncvl_vl,'')) SM0155
     , max(decode(c.exmn_cd,'SM015501',c.exrs_ncvl_vl,'')) SM015501
     , max(decode(c.exmn_cd,'SM0161',c.exrs_ncvl_vl,'')) SM0161
     , max(decode(c.exmn_cd,'SM0162',c.exrs_ncvl_vl,'')) SM0162
     , max(decode(c.exmn_cd,'SM0163',c.exrs_ncvl_vl,'')) SM0163
     , max(decode(c.exmn_cd,'SM0164',c.exrs_ncvl_vl,'')) SM0164
     , max(decode(c.exmn_cd,'SM3140',c.exrs_ncvl_vl,'')) SM3140
     , max(decode(c.exmn_cd,'SM3150',c.exrs_ncvl_vl,'')) SM3150
     , max(decode(c.exmn_cd,'SM3170',c.exrs_ncvl_vl,'')) SM3170
     , max(decode(c.exmn_cd,'SM3180',c.exrs_ncvl_vl,'')) SM3180 
  from (                     
        select /*+ index(a 3C15332B3C20431528_i04) */
               a.ptno
             , a.ordr_ymd
          from 스키마.3C15332B3C20431528 a
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.ordr_cd in ('RS1010','RS1031','RS1010SM')
           and a.codv_cd = 'G'
           and a.excf_cd = 'SR'
           and nvl(a.dc_dvsn_cd,'N') = 'N'
       ) a
     , 스키마.0E5B5B285B28402857 b
     , 스키마.3E3243333E2E143C28 c
 where b.ptno = a.ptno
    and b.ptno not in (/* 기본 제외대상자 */
                      &not_in_ptno
                     )
   /* 동의여부자만 대상 */
   and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
   /* 외국인 제외 */
   and substr(b.brrn,1,1) not in ('5','6','7','8')
   and c.ptno = a.ptno
   and c.ordr_ymd = a.ordr_ymd
   and c.exmn_cd in (
                     'SM0104','SM0106','SM0111','SM0112','SM0126','SM0131','SM0132','SM013201','SM0133','SM013301'
                    ,'SM0134','SM013401','SM0151','SM015101','SM0152','SM015201','SM0153','SM015301','SM0154','SM015401'
                    ,'SM0155','SM015501','SM0161','SM0162','SM0163','SM0164','SM3140','SM3150','SM3170','SM3180'
                    )
   and nvl(c.exrs_updt_yn,'N') != 'Y'
 group by a.ptno
     , a.ordr_ymd
