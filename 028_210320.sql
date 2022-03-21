-- RKDALFK
-- cleaned 검사결과
select b.ptno
     , 펑션.등록번호변환펑션(b.ptno) id
     , to_char(b.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , d.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(e.exmn_cd,'BL2011',e.cleaned_ncvl_vl,'')) BL2011
     , max(decode(e.exmn_cd,'BL2012',e.cleaned_ncvl_vl,'')) BL2012
     , max(decode(e.exmn_cd,'BL2013',e.cleaned_ncvl_vl,'')) BL2013
     , max(decode(e.exmn_cd,'BL2014',e.cleaned_ncvl_vl,'')) BL2014
     , max(decode(e.exmn_cd,'BL201401',e.cleaned_ncvl_vl,'')) BL201401
     , max(decode(e.exmn_cd,'BL201402',e.cleaned_ncvl_vl,'')) BL201402
     , max(decode(e.exmn_cd,'BL201403',e.cleaned_ncvl_vl,'')) BL201403
     , max(decode(e.exmn_cd,'BL2015',e.cleaned_ncvl_vl,'')) BL2015
     , max(decode(e.exmn_cd,'BL2016',e.cleaned_ncvl_vl,'')) BL2016
     , max(decode(e.exmn_cd,'BL2017',e.cleaned_ncvl_vl,'')) BL2017
     , max(decode(e.exmn_cd,'BL201701',e.cleaned_ncvl_vl,'')) BL201701
     , max(decode(e.exmn_cd,'BL201801',e.cleaned_ncvl_vl,'')) BL201801
     , max(decode(e.exmn_cd,'BL201802',e.cleaned_ncvl_vl,'')) BL201802
     , max(decode(e.exmn_cd,'BL201803',e.cleaned_ncvl_vl,'')) BL201803
     , max(decode(e.exmn_cd,'BL201804',e.cleaned_ncvl_vl,'')) BL201804
     , max(decode(e.exmn_cd,'BL201805',e.cleaned_ncvl_vl,'')) BL201805
     , max(decode(e.exmn_cd,'BL201806',e.cleaned_ncvl_vl,'')) BL201806
     , max(decode(e.exmn_cd,'BL201807',e.cleaned_ncvl_vl,'')) BL201807
     , max(decode(e.exmn_cd,'BL201808',e.cleaned_ncvl_vl,'')) BL201808
     , max(decode(e.exmn_cd,'BL201809',e.cleaned_ncvl_vl,'')) BL201809
     , max(decode(e.exmn_cd,'BL201810',e.cleaned_ncvl_vl,'')) BL201810
     , max(decode(e.exmn_cd,'BL201811',e.cleaned_ncvl_vl,'')) BL201811
     , max(decode(e.exmn_cd,'BL201812',e.cleaned_ncvl_vl,'')) BL201812
     , max(decode(e.exmn_cd,'BL201813',e.cleaned_ncvl_vl,'')) BL201813
     , max(decode(e.exmn_cd,'BL201814',e.cleaned_ncvl_vl,'')) BL201814
     , max(decode(e.exmn_cd,'BL201815',e.cleaned_ncvl_vl,'')) BL201815
     , max(decode(e.exmn_cd,'BL201816',e.cleaned_ncvl_vl,'')) BL201816
     , max(decode(e.exmn_cd,'BL2021',e.cleaned_ncvl_vl,'')) BL2021
     , max(decode(e.exmn_cd,'BL211101',e.cleaned_ncvl_vl,'')) BL211101
     , max(decode(e.exmn_cd,'BL211102',e.cleaned_ncvl_vl,'')) BL211102
     , max(decode(e.exmn_cd,'BL211103',e.cleaned_ncvl_vl,'')) BL211103
     , max(decode(e.exmn_cd,'BL2112',e.cleaned_ncvl_vl,'')) BL2112
     , max(decode(e.exmn_cd,'BL2113',e.cleaned_ncvl_vl,'')) BL2113
     , max(decode(e.exmn_cd,'BL2136',e.cleaned_ncvl_vl,'')) BL2136
     , max(decode(e.exmn_cd,'BL2141',e.cleaned_ncvl_vl,'')) BL2141
     , max(decode(e.exmn_cd,'BL3111',e.cleaned_ncvl_vl,'')) BL3111
     , max(decode(e.exmn_cd,'BL3112',e.cleaned_ncvl_vl,'')) BL3112
     , max(decode(e.exmn_cd,'BL311201',e.cleaned_ncvl_vl,'')) BL311201
     , max(decode(e.exmn_cd,'BL311202',e.cleaned_ncvl_vl,'')) BL311202
     , max(decode(e.exmn_cd,'BL3113',e.cleaned_ncvl_vl,'')) BL3113
     , max(decode(e.exmn_cd,'BL3114',e.cleaned_ncvl_vl,'')) BL3114
     , max(decode(e.exmn_cd,'BL3115',e.cleaned_ncvl_vl,'')) BL3115
     , max(decode(e.exmn_cd,'BL3116',e.cleaned_ncvl_vl,'')) BL3116
     , max(decode(e.exmn_cd,'BL3117',e.cleaned_ncvl_vl,'')) BL3117
     , max(decode(e.exmn_cd,'BL3118',e.cleaned_ncvl_vl,'')) BL3118
     , max(decode(e.exmn_cd,'BL3119',e.cleaned_ncvl_vl,'')) BL3119
     , max(decode(e.exmn_cd,'BL3120',e.cleaned_ncvl_vl,'')) BL3120
     , max(decode(e.exmn_cd,'BL312001',e.cleaned_ncvl_vl,'')) BL312001
     , max(decode(e.exmn_cd,'BL312002',e.cleaned_ncvl_vl,'')) BL312002
     , max(decode(e.exmn_cd,'BL3121',e.cleaned_ncvl_vl,'')) BL3121
     , max(decode(e.exmn_cd,'BL3122',e.cleaned_ncvl_vl,'')) BL3122
     , max(decode(e.exmn_cd,'BL3123',e.cleaned_ncvl_vl,'')) BL3123
     , max(decode(e.exmn_cd,'BL3125',e.cleaned_ncvl_vl,'')) BL3125
     , max(decode(e.exmn_cd,'BL3131',e.cleaned_ncvl_vl,'')) BL3131
     , max(decode(e.exmn_cd,'BL3132',e.cleaned_ncvl_vl,'')) BL3132
     , max(decode(e.exmn_cd,'BL3133',e.cleaned_ncvl_vl,'')) BL3133
     , max(decode(e.exmn_cd,'BL3134',e.cleaned_ncvl_vl,'')) BL3134
     , max(decode(e.exmn_cd,'BL3141',e.cleaned_ncvl_vl,'')) BL3141
     , max(decode(e.exmn_cd,'BL3142',e.cleaned_ncvl_vl,'')) BL3142
     , max(decode(e.exmn_cd,'BL314201',e.cleaned_ncvl_vl,'')) BL314201
     , max(decode(e.exmn_cd,'BL3164',e.cleaned_ncvl_vl,'')) BL3164
     , max(decode(e.exmn_cd,'BL316401',e.cleaned_ncvl_vl,'')) BL316401
     , max(decode(e.exmn_cd,'BL316402',e.cleaned_ncvl_vl,'')) BL316402
     , max(decode(e.exmn_cd,'BL3303',e.cleaned_ncvl_vl,'')) BL3303
     , max(decode(e.exmn_cd,'BL3901',e.cleaned_ncvl_vl,'')) BL3901
     , max(decode(e.exmn_cd,'BL399201',e.cleaned_ncvl_vl,'')) BL399201
     , max(decode(e.exmn_cd,'BL399202',e.cleaned_ncvl_vl,'')) BL399202
     , max(decode(e.exmn_cd,'BL399203',e.cleaned_ncvl_vl,'')) BL399203
     , max(decode(e.exmn_cd,'BL3A2502',e.cleaned_ncvl_vl,'')) BL3A2502
     , max(decode(e.exmn_cd,'BL5111',e.cleaned_ncvl_vl,'')) BL5111
     , max(decode(e.exmn_cd,'BL5112',e.cleaned_ncvl_vl,'')) BL5112
     , max(decode(e.exmn_cd,'BL5113',e.cleaned_ncvl_vl,'')) BL5113
     , max(decode(e.exmn_cd,'BL5115',e.cleaned_ncvl_vl,'')) BL5115
     , max(decode(e.exmn_cd,'BL5116',e.cleaned_ncvl_vl,'')) BL5116
     , max(decode(e.exmn_cd,'BL5117',e.cleaned_ncvl_vl,'')) BL5117
     , max(decode(e.exmn_cd,'BL512001',e.cleaned_ncvl_vl,'')) BL512001
     , max(decode(e.exmn_cd,'BL3249',e.cleaned_ncvl_vl,'')) BL3249
     , max(decode(e.exmn_cd,'BL3252',e.cleaned_ncvl_vl,'')) BL3252
     , max(decode(e.exmn_cd,'BL326501',e.cleaned_ncvl_vl,'')) BL326501
     , max(decode(e.exmn_cd,'BL6113',e.cleaned_ncvl_vl,'')) BL6113
     , max(decode(e.exmn_cd,'BL6115',e.cleaned_ncvl_vl,'')) BL6115
     , max(decode(e.exmn_cd,'BL6116',e.cleaned_ncvl_vl,'')) BL6116
     , max(decode(e.exmn_cd,'BL6117',e.cleaned_ncvl_vl,'')) BL6117
     , max(decode(e.exmn_cd,'BL6118',e.cleaned_ncvl_vl,'')) BL6118
     , max(decode(e.exmn_cd,'BL6119',e.cleaned_ncvl_vl,'')) BL6119
     , max(decode(e.exmn_cd,'NR0101',e.cleaned_ncvl_vl,'')) NR0101
     , max(decode(e.exmn_cd,'NR0102',e.cleaned_ncvl_vl,'')) NR0102
     , max(decode(e.exmn_cd,'NR0103',e.cleaned_ncvl_vl,'')) NR0103
     , max(decode(e.exmn_cd,'NR0201',e.cleaned_ncvl_vl,'')) NR0201
     , max(decode(e.exmn_cd,'NR0202',e.cleaned_ncvl_vl,'')) NR0202
     , max(decode(e.exmn_cd,'NR0305',e.cleaned_ncvl_vl,'')) NR0305
     , max(decode(e.exmn_cd,'NR2301',e.cleaned_ncvl_vl,'')) NR2301
     , max(decode(e.exmn_cd,'NR2302',e.cleaned_ncvl_vl,'')) NR2302
     , max(decode(e.exmn_cd,'NR2401',e.cleaned_ncvl_vl,'')) NR2401
     , max(decode(e.exmn_cd,'NR4101',e.cleaned_ncvl_vl,'')) NR4101
     , max(decode(e.exmn_cd,'NR4102',e.cleaned_ncvl_vl,'')) NR4102
     , max(decode(e.exmn_cd,'NR4103',e.cleaned_ncvl_vl,'')) NR4103
     , max(decode(e.exmn_cd,'NR4202',e.cleaned_ncvl_vl,'')) NR4202
     , max(decode(e.exmn_cd,'NR4303',e.cleaned_ncvl_vl,'')) NR4303
     , max(decode(e.exmn_cd,'NR5106',e.cleaned_ncvl_vl,'')) NR5106
     , max(decode(e.exmn_cd,'RC118401',e.cleaned_ncvl_vl,'')) RC118401
     , max(decode(e.exmn_cd,'RC118402',e.cleaned_ncvl_vl,'')) RC118402
     , max(decode(e.exmn_cd,'SM053101',e.cleaned_ncvl_vl,'')) SM053101
     , max(decode(e.exmn_cd,'SM053111',e.cleaned_ncvl_vl,'')) SM053111
     , max(decode(e.exmn_cd,'SM0600SBP',e.cleaned_ncvl_vl,'')) SM0600SBP
     , max(decode(e.exmn_cd,'SM0600DBP',e.cleaned_ncvl_vl,'')) SM0600DBP
     , max(decode(e.exmn_cd,'SM0101',e.cleaned_ncvl_vl,'')) SM0101
     , max(decode(e.exmn_cd,'SM0102',e.cleaned_ncvl_vl,'')) SM0102
     , max(decode(e.exmn_cd,'SM316001',e.cleaned_ncvl_vl,'')) SM316001 
  from (-- 기본대상자
        select a.ptno
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
           and a.ptno not in (
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
         group by a.ptno
         having count(a.ordr_ymd) > 1
       ) a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.0E5B5B285B28402857 d
     , 스키마.1543294D47144D43333E2E1428 e
 where b.ptno = a.ptno
   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and d.ptno = a.ptno
   /* 외국인 제외 */
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and e.ptno = b.ptno
   and e.ordr_ymd = b.ordr_ymd
   and e.exmn_cd in (
                      'BL2011','BL2012','BL2013','BL2014','BL201401','BL201402','BL201403','BL2015','BL2016','BL2017','BL2017','BL201701','BL201801','BL201802','BL201803'
                     ,'BL201804','BL201805','BL201806','BL201807','BL201808','BL201809','BL201810','BL201811','BL201812','BL201813','BL201814','BL201815','BL201816'
                     ,'BL2021','BL211101','BL211102','BL211103','BL2112','BL2113','BL2136','BL2141'
                     ,'BL3111','BL3112','BL311201','BL311202','BL3113','BL3114','BL3115','BL3116','BL3117','BL3118','BL3119','BL3120','BL312001','BL312002','BL3121','BL3122','BL3123','BL3125'
                     ,'BL3131','BL3132','BL3133','BL3134','BL3141','BL3142','BL314201','BL3164','BL316401','BL316402','BL3303'
                     ,'BL3901','BL399201','BL399202','BL399203','BL3A2502'
                     ,'BL5111','BL5112','BL5113','BL5115','BL5116','BL5117','BL512001','BL3249','BL3252','BL326501'
                     ,'BL6113','BL6115','BL6116','BL6117','BL6118','BL6119'
                     ,'NR0101','NR0102','NR0103','NR0201','NR0202','NR0305','NR2301','NR2302','NR2401','NR4101','NR4102','NR4103','NR4202','NR4303','NR5106'
                     ,'RC118401','RC118402','SM053101','SM053111','SM0600SBP','SM0600DBP','SM0101','SM0102','SM316001'
                    )
 group by b.ptno
     , b.ordr_ymd
     , d.gend_cd

-- cleaned 문진결과
select b.ptno
     , 펑션.등록번호변환펑션(b.ptno) id
     , to_char(b.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , d.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , e.smk_ys
     , e.smk
     , e.smk_duration
     , e.smk_current_amount
     , e.smk_start_age
     , e.smk_endyr
     , e.smk_packyrs
     , e.alc_ys
     , e.alc_freq
     , e.alc_amount_drinks
     , e.alc_duration
     , e.alc_amount_grams
     , e.overall_physical_activity
     , e.phy_freq
     , e.phy_duration
     , e.history_hypertension
     , e.trt_hypertension
     , e.status_hypertension
     , e.hypertension_age_diag
     , e.history_hyperlipidemia
     , e.trt_hyperlipidemia
     , e.status_hyperlipidemia
     , e.hyperlipidemia_age_diag
     , e.history_stroke
     , e.trt_stroke
     , e.status_stroke
     , e.trt_stroke_op
     , e.stroke_age_diag
     , e.history_diabetes
     , e.trt_diabetes
     , e.status_diabetes
     , e.diabetes_age_diag
     , e.med
     , e.med_hypertension
     , e.trt_med_hypertension
     , e.med_hypertension_duration
     , e.med_diabetes
     , e.trt_med_diabetes
     , e.med_diabetes_duration
     , e.med_aspirin
     , e.trt_med_aspirin
     , e.med_aspirin_duration
     , e.med_hyperlipidemia
     , e.trt_med_hyperlipidemia
     , e.med_warfarin
     , e.trt_med_warfarin
     , e.med_anticoagulant
     , e.trt_med_anticoagulant
  from (-- 기본대상자
        select a.ptno
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
           and a.ptno not in (
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
         group by a.ptno
         having count(a.ordr_ymd) > 1
       ) a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.0E5B5B285B28402857 d
     , 스키마.1543294D47144D302E333E0E28 e
 where b.ptno = a.ptno
   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and d.ptno = a.ptno
   /* 외국인 제외 */
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and e.ptno = b.ptno
   and e.ordr_prrn_ymd = b.ordr_ymd

-- 영양분석 칼로리 계산값
select b.ptno
     , 펑션.등록번호변환펑션(b.ptno) id
     , to_char(b.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , d.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(e.fod_cd,'3A70101',e.ncvl_vl1,'')) "3A70101"
     , max(decode(e.fod_cd,'3A70103',e.ncvl_vl1,'')) "3A70103"
     , max(decode(e.fod_cd,'3A70104',e.ncvl_vl1,'')) "3A70104"
     , max(decode(e.fod_cd,'3A70105',e.ncvl_vl1,'')) "3A70105"
     , max(decode(e.fod_cd,'3A70106',e.ncvl_vl1,'')) "3A70106"
     , max(decode(e.fod_cd,'3A70107',e.ncvl_vl1,'')) "3A70107"
     , max(decode(e.fod_cd,'3A70108',e.ncvl_vl1,'')) "3A70108"
     , max(decode(e.fod_cd,'3A70109',e.ncvl_vl1,'')) "3A70109"
     , max(decode(e.fod_cd,'3A70110',e.ncvl_vl1,'')) "3A70110"
     , max(decode(e.fod_cd,'3A70111',e.ncvl_vl1,'')) "3A70111"
     , max(decode(e.fod_cd,'3A70112',e.ncvl_vl1,'')) "3A70112"
     , max(decode(e.fod_cd,'3A70113',e.ncvl_vl1,'')) "3A70113"
     , max(decode(e.fod_cd,'3A70114',e.ncvl_vl1,'')) "3A70114"
     , max(decode(e.fod_cd,'3A70115',e.ncvl_vl1,'')) "3A70115"
     , max(decode(e.fod_cd,'3A70116',e.ncvl_vl1,'')) "3A70116"
     , max(decode(e.fod_cd,'3A70117',e.ncvl_vl1,'')) "3A70117"
     , max(decode(e.fod_cd,'3A70118',e.ncvl_vl1,'')) "3A70118"
     , max(decode(e.fod_cd,'3A70119',e.ncvl_vl1,'')) "3A70119"
     , max(decode(e.fod_cd,'3A70120',e.ncvl_vl1,'')) "3A70120"
     , max(decode(e.fod_cd,'3A70121',e.ncvl_vl1,'')) "3A70121"
     , max(decode(e.fod_cd,'3A70122',e.ncvl_vl1,'')) "3A70122"
     , max(decode(e.fod_cd,'3A70123',e.ncvl_vl1,'')) "3A70123"
     , max(decode(e.fod_cd,'3A70124',e.ncvl_vl1,'')) "3A70124"
     , max(decode(e.fod_cd,'3A70125',e.ncvl_vl1,'')) "3A70125"
     , max(decode(e.fod_cd,'3A70126',e.ncvl_vl1,'')) "3A70126"
     , max(decode(e.fod_cd,'3A70127',e.ncvl_vl1,'')) "3A70127"
     , max(decode(e.fod_cd,'3A70128',e.ncvl_vl1,'')) "3A70128"
     , max(decode(e.fod_cd,'3A70129',e.ncvl_vl1,'')) "3A70129"
     , max(decode(e.fod_cd,'3A70130',e.ncvl_vl1,'')) "3A70130"
     , max(decode(e.fod_cd,'3A70131',e.ncvl_vl1,'')) "3A70131"
     , max(decode(e.fod_cd,'3A70132',e.ncvl_vl1,'')) "3A70132"
     , max(decode(e.fod_cd,'3A70133',e.ncvl_vl1,'')) "3A70133"
     , max(decode(e.fod_cd,'3A70134',e.ncvl_vl1,'')) "3A70134"
     , max(decode(e.fod_cd,'3A70135',e.ncvl_vl1,'')) "3A70135"
     , max(decode(e.fod_cd,'3A70136',e.ncvl_vl1,'')) "3A70136"
     , max(decode(e.fod_cd,'3A70137',e.ncvl_vl1,'')) "3A70137"
     , max(decode(e.fod_cd,'3A70138',e.ncvl_vl1,'')) "3A70138"
     , max(decode(e.fod_cd,'3A70139',e.ncvl_vl1,'')) "3A70139"
  from (-- 기본대상자
        select a.ptno
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
           and a.ptno not in (
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
         group by a.ptno
         having count(a.ordr_ymd) > 1
       ) a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.0E5B5B285B28402857 d
     , 스키마.3E3C472F2020154328 e
 where b.ptno = a.ptno
   and b.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and d.ptno = a.ptno
   /* 외국인 제외 */
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and e.ptno = b.ptno
   and e.ordr_prrn_ymd = b.ordr_ymd
   and e.rprs_apnt_no = b.rprs_apnt_no
 group by b.ptno
     , b.ordr_ymd
     , d.gend_cd

-- FFQ 분석결과중 알코올 칼로리
select a.ptno, a.id, a.ordr_ymd, ROUND(sum(a.al_cal),2) al_cal
  from (-- 주종별 칼로리 계산
        SELECT /*+ index(h 3E3C23302E333E0E28_pk) */
               a.ptno
             , a.id
             , a.gend_cd
             , a.age
             , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
             , f.qstn_cd1
             , max(c.calr_qty)*(max(b.fod_base_qty)/100)*nvl(max(d.fod_base_qty),1)*max(e.fod_base_qty) al_cal
          from 
               (
                select b.ptno
                     , 펑션.등록번호변환펑션(b.ptno) id
                     , b.ordr_ymd
                     , d.gend_cd
                     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
                  from (-- 기본대상자
                        select a.ptno
                          from 스키마.3E3C0E433E3C0E3E28 a
                             , 스키마.3E3C3C5B0C233C3E28 b
                         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                           and a.cncl_dt is null
                           and b.pckg_cd = a.pckg_cd
                           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                           and a.ptno not in (
                                              &not_in_ptno
                                             )
                           /* 동의여부자만 대상 */
                           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                         group by a.ptno
                         having count(a.ordr_ymd) > 1
                       ) a
                     , 스키마.3E3C0E433E3C0E3E28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                     , 스키마.0E5B5B285B28402857 d
                 where b.ptno = a.ptno
                   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                   and b.cncl_dt is null
                   and c.pckg_cd = b.pckg_cd
                   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
                   and d.ptno = a.ptno
                   /* 외국인 제외 */
                   and substr(d.brrn,1,1) not in ('5','6','7','8') 
               ) a
             , 스키마.3E3C23302E333E0E28 f
             , 스키마.3E3C23302E333E3C28 b
             , 스키마.3E2E3E3C472F154728 c
             , 스키마.3E3C23302E333E3C28 d
             , 스키마.3E3C23302E333E3C28 e
         where f.ptno = a.ptno
           and f.ordr_prrn_ymd = a.ordr_ymd
           and f.inpc_cd in ('FOOD','FXXD')
           and f.qstn_cd1 between 'QH32' and 'QH36'
           and f.qstn_cd1 = b.inqy_cd(+)
           and c.ntrt_bsdv_cd = 'A'
           and F.ORDR_PRRN_YMD between trunc(c.CD_RGST_YMD) and trunc(c.CD_VALD_FNSH_YMD)
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') >= trunc(c.CD_RGST_YMD)    -- 180212 KHS
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') <= trunc(c.CD_VALD_FNSH_YMD)
           and b.FOD_CD = c.HSPT_FOD_CD
           and f.INQY_RSPN_CTN2 = d.INQY_CD(+)
           and f.INQY_RSPN_CTN1 = e.INQY_CD(+)
         group by a.ptno
             , a.id
             , a.gend_cd
             , a.age
             , a.ordr_ymd
             , f.qstn_cd1
     ) a
 group
    by a.ptno, a.id, a.ordr_ymd

-- uncleaned 검사결과
select /*+ INDEX(B 3E3C0E433E3C0E3E28_I01) INDEX(E 3E3243333E2E143C28_PK) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) id
     , to_char(b.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , d.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(e.exmn_cd,'SM0101',e.exrs_ncvl_vl,'')) SM0101
     , max(decode(e.exmn_cd,'SM0102',e.exrs_ncvl_vl,'')) SM0102
     , max(decode(e.exmn_cd,'SM0104',e.exrs_ncvl_vl,'')) SM0104
     , max(decode(e.exmn_cd,'SM0106',e.exrs_ncvl_vl,'')) SM0106
     , max(decode(e.exmn_cd,'SM0111',e.exrs_ncvl_vl,'')) SM0111
     , max(decode(e.exmn_cd,'SM0112',e.exrs_ncvl_vl,'')) SM0112
     , max(decode(e.exmn_cd,'SM3140',e.exrs_ncvl_vl,'')) SM3140
     , max(decode(e.exmn_cd,'SM3150',e.exrs_ncvl_vl,'')) SM3150
     , max(decode(e.exmn_cd,'SM316001',e.exrs_ncvl_vl,'')) SM316001
     , max(decode(e.exmn_cd,'SM3170',e.exrs_ncvl_vl,'')) SM3170
     , max(decode(e.exmn_cd,'SM3180',e.exrs_ncvl_vl,'')) SM3180
     , max(decode(e.exmn_cd,'SM0131',e.exrs_ncvl_vl,'')) SM0131
     , max(decode(e.exmn_cd,'SM0132',e.exrs_ncvl_vl,'')) SM0132
     , max(decode(e.exmn_cd,'SM013201',e.exrs_ncvl_vl,'')) SM013201
     , max(decode(e.exmn_cd,'SM0133',e.exrs_ncvl_vl,'')) SM0133
     , max(decode(e.exmn_cd,'SM013301',e.exrs_ncvl_vl,'')) SM013301
     , max(decode(e.exmn_cd,'SM0134',e.exrs_ncvl_vl,'')) SM0134
     , max(decode(e.exmn_cd,'SM013401',e.exrs_ncvl_vl,'')) SM013401
     , max(decode(e.exmn_cd,'SM0126',e.exrs_ncvl_vl,'')) SM0126
     , max(decode(e.exmn_cd,'SM0151',e.exrs_ncvl_vl,'')) SM0151
     , max(decode(e.exmn_cd,'SM015101',e.exrs_ncvl_vl,'')) SM015101
     , max(decode(e.exmn_cd,'SM0152',e.exrs_ncvl_vl,'')) SM0152
     , max(decode(e.exmn_cd,'SM015201',e.exrs_ncvl_vl,'')) SM015201
     , max(decode(e.exmn_cd,'SM0153',e.exrs_ncvl_vl,'')) SM0153
     , max(decode(e.exmn_cd,'SM015301',e.exrs_ncvl_vl,'')) SM015301
     , max(decode(e.exmn_cd,'SM0154',e.exrs_ncvl_vl,'')) SM0154
     , max(decode(e.exmn_cd,'SM015401',e.exrs_ncvl_vl,'')) SM015401
     , max(decode(e.exmn_cd,'SM0155',e.exrs_ncvl_vl,'')) SM0155
     , max(decode(e.exmn_cd,'SM015501',e.exrs_ncvl_vl,'')) SM015501
     , max(decode(e.exmn_cd,'SM0161',e.exrs_ncvl_vl,'')) SM0161
     , max(decode(e.exmn_cd,'SM0162',e.exrs_ncvl_vl,'')) SM0162
     , max(decode(e.exmn_cd,'SM0163',e.exrs_ncvl_vl,'')) SM0163
     , max(decode(e.exmn_cd,'SM0164',e.exrs_ncvl_vl,'')) SM0164
     , max(decode(e.exmn_cd,'RG9214',to_char(e.exrs_ctn),'')) RG9214_rslt
     , max(decode(e.exmn_cd,'RG9214',to_char(e.cnls_dx_ctn),'')) RG9214_cnls
  from (-- 기본대상자
        select a.ptno
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
           and a.ptno not in (
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
         group by a.ptno
         having count(a.ordr_ymd) > 1
       ) a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.0E5B5B285B28402857 d
     , 스키마.3E3243333E2E143C28 e
 where b.ptno = a.ptno
   and b.cncl_dt is null
   and b.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and d.ptno = a.ptno
   /* 외국인 제외 */
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and e.ptno = b.ptno
   and e.ordr_ymd = b.ordr_ymd
   and e.exmn_cd in (
                     'SM0101','SM0102','SM0104','SM0106','SM0111','SM0112','SM3140','SM3150','SM316001','SM3170','SM3180'
                    ,'SM0131','SM0132','SM013201','SM0133','SM013301','SM0134','SM013401'
                    ,'SM0126','SM0151','SM015101','SM0152','SM015201','SM0153','SM015301','SM0154','SM015401','SM0155','SM015501'
                    ,'SM0161','SM0162','SM0163','SM0164'
                    ,'RG9214'
                    )
   and nvl(e.exrs_updt_yn,'N') != 'Y'
 group by b.ptno
     , b.ordr_ymd
     , d.gend_cd
