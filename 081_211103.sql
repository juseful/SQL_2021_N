-- ghkdwjdgP
-- DRH. Cleaned RSLT
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd like 'SM04%'
                 and c.ordr_cd != 'SM0460'
                 and nvl(c.dc_dvsn_cd,'N') != 'X'
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y' /* 동의여부자만 대상 */
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) CDW_ID
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.exmn_cd,'BL2011',b.cleaned_ncvl_vl,'')) BL2011
     , max(decode(b.exmn_cd,'BL2013',b.cleaned_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2016',b.cleaned_ncvl_vl,'')) BL2016
     , max(decode(b.exmn_cd,'BL201806',b.cleaned_ncvl_vl,'')) BL201806
     , max(decode(b.exmn_cd,'BL201807',b.cleaned_ncvl_vl,'')) BL201807
     , max(decode(b.exmn_cd,'BL201809',b.cleaned_ncvl_vl,'')) BL201809
     , max(decode(b.exmn_cd,'BL3114',b.cleaned_ncvl_vl,'')) BL3114
     , max(decode(b.exmn_cd,'BL3115',b.cleaned_ncvl_vl,'')) BL3115
     , max(decode(b.exmn_cd,'BL3116',b.cleaned_ncvl_vl,'')) BL3116
     , max(decode(b.exmn_cd,'BL3118',b.cleaned_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3119',b.cleaned_ncvl_vl,'')) BL3119
     , max(decode(b.exmn_cd,'BL3120',b.cleaned_ncvl_vl,'')) BL3120
     , max(decode(b.exmn_cd,'BL312002',b.cleaned_ncvl_vl,'')) BL312002
     , max(decode(b.exmn_cd,'BL3121',b.cleaned_ncvl_vl,'')) BL3121
     , max(decode(b.exmn_cd,'BL3135',b.cleaned_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3140',b.cleaned_ncvl_vl,'')) BL3140
     , max(decode(b.exmn_cd,'BL3141',b.cleaned_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.cleaned_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.cleaned_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL3164',b.cleaned_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL3303',b.cleaned_ncvl_vl,'')) BL3303
     , max(decode(b.exmn_cd,'BL3901',b.cleaned_ncvl_vl,'')) BL3901
     , max(decode(b.exmn_cd,'BL393401',b.cleaned_ncvl_vl,'')) BL393401
     , max(decode(b.exmn_cd,'BL393501',b.cleaned_ncvl_vl,'')) BL393501
     , max(decode(b.exmn_cd,'BL399201',b.cleaned_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.cleaned_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.cleaned_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL326501',b.cleaned_ncvl_vl,'')) BL326501
     , max(decode(b.exmn_cd,'NR2301',b.cleaned_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.cleaned_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR2401',b.cleaned_ncvl_vl,'')) NR2401
     , max(decode(b.exmn_cd,'NR5101',b.cleaned_ncvl_vl,'')) NR5101
     , max(decode(b.exmn_cd,'NR5106',b.cleaned_ncvl_vl,'')) NR5106
     , max(decode(b.exmn_cd,'NR6105',b.cleaned_ncvl_vl,'')) NR6105
     , max(decode(b.exmn_cd,'SM0101',b.cleaned_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.cleaned_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM316001',b.cleaned_ncvl_vl
                           ,'SM3160'  ,b.cleaned_ncvl_vl,'')) SM316001 
  from temp a
     , 스키마.1543294D47144D43333E2E1428 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.sm_date = a.ordr_ymd
   and b.exmn_cd in ('BL2011','BL2013','BL2016','BL201806','BL201807','BL201809','BL3114','BL3115','BL3116','BL3118','BL3119','BL3120','BL312002'
                    ,'BL3121','BL3135','BL3140','BL3141','BL3142','BL314201','BL3164','BL3303','BL3901','BL393401','BL393501','BL399201','BL399202'
                    ,'BL399203','BL326501','NR2301','NR2302','NR2401','NR5101','NR5106','NR6105','SM0101','SM0102','SM316001','SM3160'
                    )
   and c.ptno = a.ptno
   and substr(c.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- DRH. same variables rslt
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20170101','yyyymmdd') and to_date('20170110','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd like 'SM04%'
                 and c.ordr_cd != 'SM0460'
                 and nvl(c.dc_dvsn_cd,'N') != 'X'
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y' /* 동의여부자만 대상 */
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) CDW_ID
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.exmn_cd,'BL2011',b.exrs_ncvl_vl,'')) BL2011
     , max(decode(b.exmn_cd,'BL2013',b.exrs_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2016',b.exrs_ncvl_vl,'')) BL2016
     , max(decode(b.exmn_cd,'BL201806',b.exrs_ncvl_vl,'')) BL201806
     , max(decode(b.exmn_cd,'BL201807',b.exrs_ncvl_vl,'')) BL201807
     , max(decode(b.exmn_cd,'BL201809',b.exrs_ncvl_vl,'')) BL201809
     , max(decode(b.exmn_cd,'BL3114',b.exrs_ncvl_vl,'')) BL3114
     , max(decode(b.exmn_cd,'BL3115',b.exrs_ncvl_vl,'')) BL3115
     , max(decode(b.exmn_cd,'BL3116',b.exrs_ncvl_vl,'')) BL3116
     , max(decode(b.exmn_cd,'BL3118',b.exrs_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3119',b.exrs_ncvl_vl,'')) BL3119
     , max(decode(b.exmn_cd,'BL3120',b.exrs_ncvl_vl,'')) BL3120
     , max(decode(b.exmn_cd,'BL312002',b.exrs_ncvl_vl,'')) BL312002
     , max(decode(b.exmn_cd,'BL3121',b.exrs_ncvl_vl,'')) BL3121
     , max(decode(b.exmn_cd,'BL3135',b.exrs_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3140',b.exrs_ncvl_vl,'')) BL3140
     , max(decode(b.exmn_cd,'BL3141',b.exrs_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.exrs_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.exrs_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL3164',b.exrs_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL3303',b.exrs_ncvl_vl,'')) BL3303
     , max(decode(b.exmn_cd,'BL3901',b.exrs_ncvl_vl,'')) BL3901
     , max(decode(b.exmn_cd,'BL393401',b.exrs_ncvl_vl,'')) BL393401
     , max(decode(b.exmn_cd,'BL393501',b.exrs_ncvl_vl,'')) BL393501
     , max(decode(b.exmn_cd,'BL399201',b.exrs_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.exrs_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.exrs_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL326501',b.exrs_ncvl_vl,'')) BL326501
     , max(decode(b.exmn_cd,'NR2301',b.exrs_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.exrs_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR2401',b.exrs_ncvl_vl,'')) NR2401
     , max(decode(b.exmn_cd,'NR5101',b.exrs_ncvl_vl,'')) NR5101
     , max(decode(b.exmn_cd,'NR5106',b.exrs_ncvl_vl,'')) NR5106
     , max(decode(b.exmn_cd,'NR6105',b.exrs_ncvl_vl,'')) NR6105
     , max(decode(b.exmn_cd,'SM0101',b.exrs_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.exrs_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM316001',b.exrs_ncvl_vl
                           ,'SM3160'  ,b.exrs_ncvl_vl,'')) SM316001 
  from temp a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in ('BL2011','BL2013','BL2016','BL201806','BL201807','BL201809','BL3114','BL3115','BL3116','BL3118','BL3119','BL3120','BL312002'
                    ,'BL3121','BL3135','BL3140','BL3141','BL3142','BL314201','BL3164','BL3303','BL3901','BL393401','BL393501','BL399201','BL399202'
                    ,'BL399203','BL326501','NR2301','NR2302','NR2401','NR5101','NR5106','NR6105','SM0101','SM0102','SM316001','SM3160'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
   and c.ptno = a.ptno
   and substr(c.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- uncleaned variable rslt
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20161231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd like 'SM04%'
                 and c.ordr_cd != 'SM0460'
                 and nvl(c.dc_dvsn_cd,'N') != 'X'
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y' /* 동의여부자만 대상 */
             )
select /*+ index(b 3E3243333E2E143C28_pk) */
       a.ptno
     , 펑션.등록번호변환펑션(a.ptno) CDW_ID
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.exmn_cd,'SM0153',b.exrs_ncvl_vl,'')) SM0153
     , max(decode(b.exmn_cd,'SM015301',b.exrs_ncvl_vl,'')) SM015301
     , max(decode(b.exmn_cd,'SM0154',b.exrs_ncvl_vl,'')) SM0154
     , max(decode(b.exmn_cd,'SM015401',b.exrs_ncvl_vl,'')) SM015401
     , max(decode(b.exmn_cd,'SM0155',b.exrs_ncvl_vl,'')) SM0155
     , max(decode(b.exmn_cd,'SM015501',b.exrs_ncvl_vl,'')) SM015501
     , max(decode(b.exmn_cd,'SM3140',b.exrs_ncvl_vl,'')) SM3140
     , max(decode(b.exmn_cd,'SM0401',b.exrs_ncvl_vl,'')) SM0401
     , max(decode(b.exmn_cd,'SM040101',b.exrs_ncvl_vl,'')) SM040101
     , max(decode(b.exmn_cd,'SM0402',b.exrs_ncvl_vl,'')) SM0402
     , max(decode(b.exmn_cd,'SM040201',b.exrs_ncvl_vl,'')) SM040201
     , max(decode(b.exmn_cd,'SM0403',b.exrs_ncvl_vl,'')) SM0403
     , max(decode(b.exmn_cd,'SM0404',b.exrs_ncvl_vl,'')) SM0404
     , max(decode(b.exmn_cd,'SM040401',b.exrs_ncvl_vl,'')) SM040401
     , max(decode(b.exmn_cd,'SM0405',b.exrs_ncvl_vl,'')) SM0405
     , max(decode(b.exmn_cd,'SM040501',b.exrs_ncvl_vl,'')) SM040501
     , max(decode(b.exmn_cd,'SM0450',to_char(b.exrs_ctn),'')) SM0450
  from temp a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in ('SM0153','SM015301','SM0154','SM015401','SM0155','SM015501','SM3140'
                    ,'SM0401','SM040101','SM0402','SM040201','SM0403','SM0404','SM040401','SM0405','SM040501','SM0450'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select /*+ INDEX(x 3C15332B3C20431528_pk) */
                      'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
   and c.ptno = a.ptno
   and substr(c.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- QUESTIONNAIRE DRH.
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd like 'SM04%'
                 and c.ordr_cd != 'SM0460'
                 and nvl(c.dc_dvsn_cd,'N') != 'X'
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y' /* 동의여부자만 대상 */
             )
select distinct a.ptno
     , 펑션.등록번호변환펑션(a.ptno) CDW_ID
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , b.smk_ys
     , b.smk
     , b.smk_duration
     , b.smk_current_amount
     , b.smk_start_age
     , b.smk_endyr
     , b.smk_packyrs
     , b.alc_ys
     , b.alc
     , b.alc_freq
     , b.alc_amount_drinks
     , b.alc_start_age
     , b.alc_duration
     , b.alc_endyr
     , b.alc_amount_grams
     , b.phy
     , b.overall_physical_activity
     , b.phy_freq_2009
     , b.phy_duration_2009
     , b.phy_freq
     , b.phy_duration
     , b.history_tuberculosis
     , b.trt_tuberculosis
     , b.status_tuberculosis
     , b.trt_tuberculosis_op
     , b.tuberculosis_age_diag
     , b.history_hypertension
     , b.trt_hypertension
     , b.status_hypertension
     , b.history_hyperlipidemia
     , b.trt_hyperlipidemia
     , b.status_hyperlipidemia
     , b.history_stroke
     , b.trt_stroke
     , b.status_stroke
     , b.history_diabetes
     , b.trt_diabetes
     , b.status_diabetes
     , b.history_copd
     , b.trt_history_copd
     , b.status_history_copd
     , b.copd_age_diag
     , b.history_asthma_allergy
     , b.trt_asthma_allergy
     , b.asthma_allergy_age_diag
     , b.history_asthma
     , b.trt_asthma
     , b.status_asthma
     , b.asthma_age_diag
     , b.history_coronary_dis
     , b.trt_coronary_dis
     , b.history_angina
     , b.trt_angina
     , b.status_angina
     , b.history_mi
     , b.trt_mi
     , b.status_mi
     , b.history_cancer_lung
     , b.cancer_lung_age_diag
     , b.trt_cancer_lung
     , b.trt_cancer_lung_op
     , b.trt_cancer_lung_ch
     , b.trt_cancer_lung_ra
     , b.trt_cancer_lung_ot
     , b.history_cancer_breast
     , b.cancer_breast_age_diag
     , b.trt_cancer_breast_ra
     , b.trt_cancer_breast_ot
     , b.history_cancer_esophagus
     , b.trt_cancer_esophagus_op
     , b.trt_cancer_esophagus_ch
     , b.trt_cancer_esophagus_ra
     , b.trt_cancer_esophagus_ot
     , b.history_cancer_other
     , b.cancer_other_age_diag
     , b.trt_cancer_other
     , b.trt_cancer_other_op
     , b.trt_cancer_other_ch
     , b.trt_cancer_other_ra
     , b.trt_cancer_other_ot
     , b.med_respiratory_dis
     , b.trt_med_respiratory_dis
     , b.fh_asthma_copd_f
     , b.fh_asthma_copd_m
     , b.fh_asthma_copd_sib
     , b.fh_asthma_copd_ch
     , b.fh_cancer_lung_f
     , b.fh_cancer_lung_m
     , b.fh_cancer_lung_sib
     , b.fh_cancer_lung_ch
     , b.postmenopausal
     , b.sy2_1
     , b.sy2_2
     , b.sy2_3
     , b.sy2_4
     , b.sy2_5
     , b.sy2_6
     , b.sy2_7
  from temp a
     , 스키마.1543294D47144D302E333E0E28 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_ymd
   and c.ptno = a.ptno
   and substr(c.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )

-- QUESTIONNAIRE DRH. 이후 데이터, BACHP에서 작업필요.
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28@DAWNR_SMCDWS a
                   , 스키마.3E3C3C5B0C233C3E28@DAWNR_SMCDWS b
                   , 스키마.3C15332B3C20431528@DAWNR_SMCDWS c
               where a.ordr_ymd between to_date('20170101','yyyymmdd') and to_date('20170110','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd like 'SM04%'
                 and c.ordr_cd != 'SM0460'
                 and nvl(c.dc_dvsn_cd,'N') != 'X'
--                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y' /* 동의여부자만 대상 */
             )
select distinct a.ptno
     , '' CDW_ID
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , '' age
     , b.smk_ys
     , b.smk
     , b.smk_duration
     , b.smk_current_amount
     , b.smk_start_age
     , b.smk_endyr
     , b.smk_packyrs
     , b.alc_ys
     , b.alc
     , b.alc_freq
     , b.alc_amount_drinks
     , b.alc_start_age
     , b.alc_duration
     , b.alc_endyr
     , b.alc_amount_grams
     , b.phy
     , b.overall_physical_activity
     , b.phy_freq_2009
     , b.phy_duration_2009
     , b.phy_freq
     , b.phy_duration
     , b.history_tuberculosis
     , b.trt_tuberculosis
     , b.status_tuberculosis
     , b.trt_tuberculosis_op
     , b.tuberculosis_age_diag
     , b.history_hypertension
     , b.trt_hypertension
     , b.status_hypertension
     , b.history_hyperlipidemia
     , b.trt_hyperlipidemia
     , b.status_hyperlipidemia
     , b.history_stroke
     , b.trt_stroke
     , b.status_stroke
     , b.history_diabetes
     , b.trt_diabetes
     , b.status_diabetes
     , b.history_copd
     , b.trt_history_copd
     , b.status_history_copd
     , b.copd_age_diag
     , b.history_asthma_allergy
     , b.trt_asthma_allergy
     , b.asthma_allergy_age_diag
     , b.history_asthma
     , b.trt_asthma
     , b.status_asthma
     , b.asthma_age_diag
     , b.history_coronary_dis
     , b.trt_coronary_dis
     , b.history_angina
     , b.trt_angina
     , b.status_angina
     , b.history_mi
     , b.trt_mi
     , b.status_mi
     , b.history_cancer_lung
     , b.cancer_lung_age_diag
     , b.trt_cancer_lung
     , b.trt_cancer_lung_op
     , b.trt_cancer_lung_ch
     , b.trt_cancer_lung_ra
     , b.trt_cancer_lung_ot
     , b.history_cancer_breast
     , b.cancer_breast_age_diag
     , b.trt_cancer_breast_ra
     , b.trt_cancer_breast_ot
     , b.history_cancer_esophagus
     , b.trt_cancer_esophagus_op
     , b.trt_cancer_esophagus_ch
     , b.trt_cancer_esophagus_ra
     , b.trt_cancer_esophagus_ot
     , b.history_cancer_other
     , b.cancer_other_age_diag
     , b.trt_cancer_other
     , b.trt_cancer_other_op
     , b.trt_cancer_other_ch
     , b.trt_cancer_other_ra
     , b.trt_cancer_other_ot
     , b.med_respiratory_dis
     , b.trt_med_respiratory_dis
     , b.fh_asthma_copd_f
     , b.fh_asthma_copd_m
     , b.fh_asthma_copd_sib
     , b.fh_asthma_copd_ch
     , b.fh_cancer_lung_f
     , b.fh_cancer_lung_m
     , b.fh_cancer_lung_sib
     , b.fh_cancer_lung_ch
     , b.postmenopausal
     , b.sy2_1
     , b.sy2_2
     , b.sy2_3
     , b.sy2_4
     , b.sy2_5
     , b.sy2_6
     , b.sy2_7
  from temp a
     , 스키마.1543294D47144D302E333E0E28 b
     , 스키마.0E5B5B285B28402857@DAWNR_SMCDWS c
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_ymd
   and c.ptno = a.ptno
   and substr(c.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )

-- CIS IMAGE MATCHING INFO
SELECT c.ptno
     , 펑션.등록번호변환펑션(c.ptno) id
     , to_char(c.ordr_dt,'yyyy-mm-dd') ordr_ymd
     , to_char(c.rptn_dt,'yyyymmddhh24miss') dd
  FROM 스키마.szintfmmt c
 where c.ordr_dt between to_date('20070409','yyyymmdd') and to_date('20201231','yyyymmdd')
   AND C.EXMN_CD = 'SM0450'
   and c.ordr_stts_cd = 'Y'

