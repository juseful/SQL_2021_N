-- rkdalfk
-- DR.H RESULT
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20160701','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null -- 영양상담내용이 FOOD로 저장됨. SQL문에만 반영하고 데이터 작업은 FFQ 기준으로 하였음.
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_prrn_ymd) age
     , max(decode(b.exmn_cd,'BL2013',b.cleaned_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2014',b.cleaned_ncvl_vl,'')) BL2014
     , max(decode(b.exmn_cd,'BL3111',b.cleaned_ncvl_vl,'')) BL3111
     , max(decode(b.exmn_cd,'BL3113',b.cleaned_ncvl_vl,'')) BL3113
     , max(decode(b.exmn_cd,'BL3118',b.cleaned_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3122',b.cleaned_ncvl_vl,'')) BL3122
     , max(decode(b.exmn_cd,'BL3123',b.cleaned_ncvl_vl,'')) BL3123
     , max(decode(b.exmn_cd,'BL3131',b.cleaned_ncvl_vl,'')) BL3131
     , max(decode(b.exmn_cd,'BL3132',b.cleaned_ncvl_vl,'')) BL3132
     , max(decode(b.exmn_cd,'BL3135',b.cleaned_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3136',b.cleaned_ncvl_vl,'')) BL3136
     , max(decode(b.exmn_cd,'BL3137',b.cleaned_ncvl_vl,'')) BL3137
     , max(decode(b.exmn_cd,'BL3141',b.cleaned_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.cleaned_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.cleaned_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL314202',b.cleaned_ncvl_vl,'')) BL314202
     , max(decode(b.exmn_cd,'BL3164',b.cleaned_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL393401',b.cleaned_ncvl_vl,'')) BL393401
     , max(decode(b.exmn_cd,'BL393501',b.cleaned_ncvl_vl,'')) BL393501
     , max(decode(b.exmn_cd,'BL399201',b.cleaned_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.cleaned_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.cleaned_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL3A2502',b.cleaned_ncvl_vl,'')) BL3A2502
     , max(decode(b.exmn_cd,'NR2301',b.cleaned_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.cleaned_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR4101',b.cleaned_ncvl_vl,'')) NR4101
     , max(decode(b.exmn_cd,'NR4102',b.cleaned_ncvl_vl,'')) NR4102
     , max(decode(b.exmn_cd,'NR4103',b.cleaned_ncvl_vl,'')) NR4103
     , max(decode(b.exmn_cd,'NR4303',b.cleaned_ncvl_vl,'')) NR4303
     , max(decode(b.exmn_cd,'NR5101',b.cleaned_ncvl_vl,'')) NR5101
     , max(decode(b.exmn_cd,'NR5105',b.cleaned_ncvl_vl,'')) NR5105
     , max(decode(b.exmn_cd,'NR5106',b.cleaned_ncvl_vl,'')) NR5106
     , max(decode(b.exmn_cd,'NR6104',b.cleaned_ncvl_vl,'')) NR6104
     , max(decode(b.exmn_cd,'NR6105',b.cleaned_ncvl_vl,'')) NR6105
     , max(decode(b.exmn_cd,'NR7105',b.cleaned_ncvl_vl,'')) NR7105
     , max(decode(b.exmn_cd,'SM0101',b.cleaned_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.cleaned_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM0600SBP',b.cleaned_ncvl_vl,'')) SM0600SBP
     , max(decode(b.exmn_cd,'SM0600DBP',b.cleaned_ncvl_vl,'')) SM0600DBP
     , max(decode(b.exmn_cd,'SM316001',b.cleaned_ncvl_vl,''
                           ,'SM3160',b.cleaned_ncvl_vl,'')) SM316001 
  from target a
     , 스키마.1543294D47144D43333E2E1428 b
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_prrn_ymd
   and b.exmn_cd in ('BL2013','BL2014','BL3111','BL3113','BL3118','BL3122','BL3123','BL3131','BL3132','BL3135','BL3136','BL3137'
                    ,'BL3141','BL3142','BL314201','BL314202','BL3164','BL393401','BL393501','BL399201','BL399202','BL399203','BL3A2502'
                    ,'NR2301','NR2302','NR4101','NR4102','NR4103','NR4303','NR5101','NR5105','NR5106','NR6104','NR6105','NR7105'
                    ,'SM0101','SM0102','SM0600SBP','SM0600DBP','SM316001','SM3160'
                    )
   and c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and d.ptno = a.ptno
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno, a.ordr_prrn_ymd, d.gend_cd

-- DR.H SAME VARIABLE RESULT
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_prrn_ymd) age
     , max(decode(b.exmn_cd,'BL2013',b.exrs_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2014',b.exrs_ncvl_vl,'')) BL2014
     , max(decode(b.exmn_cd,'BL3111',b.exrs_ncvl_vl,'')) BL3111
     , max(decode(b.exmn_cd,'BL3113',b.exrs_ncvl_vl,'')) BL3113
     , max(decode(b.exmn_cd,'BL3118',b.exrs_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3122',b.exrs_ncvl_vl,'')) BL3122
     , max(decode(b.exmn_cd,'BL3123',b.exrs_ncvl_vl,'')) BL3123
     , max(decode(b.exmn_cd,'BL3131',b.exrs_ncvl_vl,'')) BL3131
     , max(decode(b.exmn_cd,'BL3132',b.exrs_ncvl_vl,'')) BL3132
     , max(decode(b.exmn_cd,'BL3135',b.exrs_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3136',b.exrs_ncvl_vl,'')) BL3136
     , max(decode(b.exmn_cd,'BL3137',b.exrs_ncvl_vl,'')) BL3137
     , max(decode(b.exmn_cd,'BL3141',b.exrs_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.exrs_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.exrs_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL314202',b.exrs_ncvl_vl,'')) BL314202
     , max(decode(b.exmn_cd,'BL3164',b.exrs_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL393401',b.exrs_ncvl_vl,'')) BL393401
     , max(decode(b.exmn_cd,'BL393501',b.exrs_ncvl_vl,'')) BL393501
     , max(decode(b.exmn_cd,'BL399201',b.exrs_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.exrs_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.exrs_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL3A2502',b.exrs_ncvl_vl,'')) BL3A2502
     , max(decode(b.exmn_cd,'NR2301',b.exrs_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.exrs_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR4101',b.exrs_ncvl_vl,'')) NR4101
     , max(decode(b.exmn_cd,'NR4102',b.exrs_ncvl_vl,'')) NR4102
     , max(decode(b.exmn_cd,'NR4103',b.exrs_ncvl_vl,'')) NR4103
     , max(decode(b.exmn_cd,'NR4303',b.exrs_ncvl_vl,'')) NR4303
     , max(decode(b.exmn_cd,'NR5101',b.exrs_ncvl_vl,'')) NR5101
     , max(decode(b.exmn_cd,'NR5105',b.exrs_ncvl_vl,'')) NR5105
     , max(decode(b.exmn_cd,'NR5106',b.exrs_ncvl_vl,'')) NR5106
     , max(decode(b.exmn_cd,'NR6104',b.exrs_ncvl_vl,'')) NR6104
     , max(decode(b.exmn_cd,'NR6105',b.exrs_ncvl_vl,'')) NR6105
     , max(decode(b.exmn_cd,'NR7105',b.exrs_ncvl_vl,'')) NR7105
     , max(decode(b.exmn_cd,'SM0101',b.exrs_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.exrs_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM0600',substr(b.exrs_ncvl_vl,1                           ,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0600SBP
     , max(decode(b.exmn_cd,'SM0600',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1)                             ,'')) SM0600DBP
     , max(decode(b.exmn_cd,'SM316001',b.exrs_ncvl_vl,'')) SM316001 
  from target a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_prrn_ymd
   and b.exmn_cd in ('BL2013','BL2014','BL3111','BL3113','BL3118','BL3122','BL3123','BL3131','BL3132','BL3135','BL3136','BL3137'
                    ,'BL3141','BL3142','BL314201','BL314202','BL3164','BL393401','BL393501','BL399201','BL399202','BL399203','BL3A2502'
                    ,'NR2301','NR2302','NR4101','NR4102','NR4103','NR4303','NR5101','NR5105','NR5106','NR6104','NR6105','NR7105'
                    ,'SM0101','SM0102','SM0600SBP','SM0600DBP','SM316001','SM3160','SM0600'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and d.ptno = a.ptno
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno, a.ordr_prrn_ymd, d.gend_cd

-- UNCLAEN VARIABLE RESULT
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_prrn_ymd) age
     , max(decode(b.exmn_cd,'BL3994'  ,b.exrs_ncvl_vl,'')) BL3994
     , max(decode(b.exmn_cd,'SM0104'  ,b.exrs_ncvl_vl,'')) SM0104
     , max(decode(b.exmn_cd,'SM010502',b.exrs_ncvl_vl,'')) SM010502
     , max(decode(b.exmn_cd,'SM0106'  ,b.exrs_ncvl_vl,'')) SM0106
     , max(decode(b.exmn_cd,'SM0112'  ,b.exrs_ncvl_vl,'')) SM0112
     , max(decode(b.exmn_cd,'SM0201'  ,b.exrs_ncvl_vl,'')) SM0201
     , max(decode(b.exmn_cd,'SM0201'  ,substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0201_R
     , max(decode(b.exmn_cd,'SM0201'  ,substr(b.exrs_ncvl_vl,  instr(b.exrs_ncvl_vl,'/')+1),'')) SM0201_L
     , max(decode(b.exmn_cd,'SM0203'  ,b.exrs_ncvl_vl,'')) SM0203
     , max(decode(b.exmn_cd,'SM0203'  ,substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0203_R
     , max(decode(b.exmn_cd,'SM0203'  ,substr(b.exrs_ncvl_vl,  instr(b.exrs_ncvl_vl,'/')+1),'')) SM0203_L
     , max(decode(b.exmn_cd,'SM0205'  ,b.exrs_ncvl_vl,'')) SM0205
     , max(decode(b.exmn_cd,'SM0205'  ,substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0205_R
     , max(decode(b.exmn_cd,'SM0205'  ,substr(b.exrs_ncvl_vl,  instr(b.exrs_ncvl_vl,'/')+1),'')) SM0205_L
     , max(decode(b.exmn_cd,'SM0210'  ,to_char(b.exrs_ctn),'')) SM0210 
  from target a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_prrn_ymd
   and b.exmn_cd in ('BL3994','SM0104','SM010502','SM0106','SM0112','SM0201','SM0203','SM0205','SM0210')
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and d.ptno = a.ptno
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno, a.ordr_prrn_ymd, d.gend_cd

-- DR.H QUESAT
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20160701','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , b.SMK_YS
     , b.SMK
     , b.SMK_DURATION
     , b.SMK_CURRENT_AMOUNT
     , b.SMK_START_AGE
     , b.SMK_ENDYR
     , b.ALC_YS
     , b.ALC
     , b.ALC_FREQ
     , b.ALC_AMOUNT_DRINKS
     , b.ALC_START_AGE
     , b.ALC_DURATION
     , b.ALC_ENDYR
     , b.PHY
     , b.OVERALL_PHYSICAL_ACTIVITY
     , b.PHY_FREQ_2009
     , b.PHY_DURATION_2009
     , b.PHY_FREQ
     , b.PHY_DURATION
     , b.PHY_STARTYR
     , b.PHY_WALKING
     , b.PHY_JOGGING
     , b.PHY_TENNIS
     , b.PHY_GOLF
     , b.PHY_SWIMMING
     , b.PHY_CLIMBING
     , b.PHY_AEROBIC
     , b.PHY_FITNESS
     , b.PHY_OTHER
     , b.MARITAL_STATUS
     , b.EDUCATION
     , b.HISTORY_HYPERTENSION
     , b.TRT_HYPERTENSION
     , b.STATUS_HYPERTENSION
     , b.HYPERTENSION_AGE_DIAG
     , b.HISTORY_DIABETES
     , b.TRT_DIABETES
     , b.STATUS_DIABETES
     , b.DIABETES_AGE_DIAG
     , b.HISTORY_HYPERLIPIDEMIA
     , b.TRT_HYPERLIPIDEMIA
     , b.STATUS_HYPERLIPIDEMIA
     , b.HYPERLIPIDEMIA_AGE_DIAG
     , b.HISTORY_THYROID_DIS1
     , b.TRT_THYROID_DIS1
     , b.THYROID_DIS1_AGE_DIAG
     , b.HISTORY_THYROID_DIS2
     , b.TRT_THYROID_DIS2
     , b.STATUS_THYROID_DIS2
     , b.TRT_THYROID_DIS2_OP
     , b.THYROID_DIS2_AGE_DIAG
     , b.HISTORY_THYROID_NODULES
     , b.TRT_THYROID_NODULES
     , b.STATUS_THYROID_NODULES
     , b.TRT_THYROID_NODULES_OP
     , b.THYROID_NODULES_AGE_DIAG
     , b.MED_ASPIRIN
     , b.TRT_MED_ASPIRIN
     , b.MED_ASPIRIN_DURATION
     , b.MED_WARFARIN
     , b.TRT_MED_WARFARIN
     , b.MED_ANTICOAGULANT
     , b.TRT_MED_ANTICOAGULANT
     , b.MED_NSAIDS
     , b.TRT_MED_NSAIDS
     , b.MED_NSAIDS_DURATION
     , b.MED_HYPERTENSION
     , b.TRT_MED_HYPERTENSION
     , b.MED_HYPERTENSION_DURATION
     , b.MED_DIABETES
     , b.TRT_MED_DIABETES
     , b.MED_DIABETES_DURATION
     , b.MED_MULTI_VITAMIN
     , b.MED_MULTI_VITAMIN_DURATION
     , b.MED_VITAMIN_A
     , b.MED_VITAMIN_A_DURATION
     , b.MED_VITAMIN_B
     , b.MED_VITAMIN_B_DURATION
     , b.MED_VITAMIN_C
     , b.MED_VITAMIN_C_DURATION
     , b.MED_VITAMIN_E
     , b.MED_VITAMIN_E_DURATION
     , b.MED_BETA_CAROTENE
     , b.MED_BETA_CAROTENE_DURATION
     , b.STRESS_SCORE
     , b.STRESS_Q1
     , b.STRESS_Q2
     , b.STRESS_Q3
     , b.STRESS_Q4
     , b.STRESS_Q5
     , b.STRESS_Q6
     , b.STRESS_Q7
     , b.STRESS_Q8
     , b.STRESS_Q9
     , b.STRESS_Q10
     , b.STRESS_Q11
     , b.STRESS_Q12
     , b.STRESS_Q13
     , b.STRESS_Q14
     , b.STRESS_Q15
     , b.STRESS_Q16
     , b.STRESS_Q17
     , b.STRESS_Q18
     , b.STRESS_Q19
     , b.STRESS_Q20
     , b.STRESS_Q21
  from target a
     , 스키마.1543294D47144D302E333E0E28 b
     , 스키마.3E3C0E433E3C0E3E28 c
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and a.ptno not in (
                      &not_in_ptno
                     )

-- DR.H SAME VARIABLE QUESAT
-- part01 생활습관
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     /* Smoking */
     , case
            when /* 흡연력 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end smk_ys
     , case
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM57Y' ,'2'
                                                            ,'AM58Y' ,'1'--,''))  AMQ0074
                                                            ,'AM57'  ,'2'
                                                            ,'AM58'  ,'1'--,''))  AMQ0074
                                                            ,'RR46Y' ,'2'
                                                            ,'RR48Y' ,'1'--,''))                                         RRQ05
                                                            ,'RR46' ,'2'
                                                            ,'RR48' ,'1'--,''))                                         RRQ05
                                                            ,'MA17Y' ,'1'
                                                            ,'MA18Y' ,'2'--,''))             MA1Q02
                        ,''))
       end smk
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM54'  ,f.inqy_rspn_ctn1 
                                                  ,'AM54Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0072
                                                  ,'MA110' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) -- 데이터 첫 자리 값이 '0'으로 시작하면 빼기
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_duration
     , min(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM55'  ,f.inqy_rspn_ctn1 
                                                  ,'AM55Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0073
                                                  ,'RR47'  ,f.inqy_rspn_ctn1
                                                  ,'RR47Y' ,f.inqy_rspn_ctn1--,''))                                  RRQ0501
                                                  ,'MA112Y','0'
                                                  ,'MA113Y','1'
                                                  ,'MA114Y','2'
                                                  ,'MA115Y','3'--,''))                                               MA1Q0203
                 ,'')
          ) smk_current_amount
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM53'  ,f.inqy_rspn_ctn1 
                                                  ,'AM53Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0071
                                                  ,'MA19' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1)--,''))                                  MA1Q0201
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_start_age
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM58'  ,f.inqy_rspn_ctn1 
                                                  ,'AM58Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0074
                                                  ,'MA117Y','0'
                                                  ,'MA118Y','1'
                                                  ,'MA119Y','2'
                                                  ,'MA120Y','3'
                                                  ,'MA121Y','4'--,''))                                               MA1Q0204
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_endyr
     /* Alcohol */
     , case
            when /* 음주 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA123Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end alc_ys
     , case
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM77Y'  ,'2'
                                                            ,'AM78Y'  ,'1'--,''))  AMQ0085
                                                            ,'RR51Y'  ,'2'
                                                            ,'RR64Y'  ,'1'
                                                            ,'AM77'   ,'2'
                                                            ,'AM78'   ,'1'--,''))  AMQ0085
                                                            ,'RR51'   ,'2'
                                                            ,'RR64'   ,'1'
                           ,DECODE(f.inpc_cd,'MA1','9999',''))
                    )
       end alc
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM65Y'  ,'0'--,'1'
                                                  ,'AM66Y'  ,'1'--,'2'
                                                  ,'AM67Y'  ,'2'--,'3'
                                                  ,'AM68Y'  ,'3'--,'4'
                                                  ,'AM69Y'  ,'4'--,'5'
                                                  ,'AM70Y'  ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53Y'  ,'0'--,'1'
                                                  ,'RR54Y'  ,'1'--,'2'
                                                  ,'RR55Y'  ,'2'--,'3'
                                                  ,'RR56Y'  ,'3'--,'4'
                                                  ,'RR57Y'  ,'4'--,'5'
                                                  ,'RR58Y'  ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'AM65'   ,'0'--,'1'
                                                  ,'AM66'   ,'1'--,'2'
                                                  ,'AM67'   ,'2'--,'3'
                                                  ,'AM68'   ,'3'--,'4'
                                                  ,'AM69'   ,'4'--,'5'
                                                  ,'AM70'   ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53'   ,'0'--,'1'
                                                  ,'RR54'   ,'1'--,'2'
                                                  ,'RR55'   ,'2'--,'3'
                                                  ,'RR56'   ,'3'--,'4'
                                                  ,'RR57'   ,'4'--,'5'
                                                  ,'RR58'   ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'MA127Y' ,'0'--,'1'
                                                  ,'MA128Y' ,'1'--,'2'
                                                  ,'MA129Y' ,'2'--,'3'
                                                  ,'MA130Y' ,'3'--,'4'
                                                  ,'MA131Y' ,'4'--,'5'
                                                  ,'MA132Y' ,'5'--,'6'--,''))                                                 MA1Q0302
                 ,'')) alc_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM72Y'  ,'0'--,'1'
                                                  ,'AM73Y'  ,'1'--,'2'
                                                  ,'AM74Y'  ,'2'--,'3'
                                                  ,'AM75Y'  ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60Y'  ,'0'--,'1'
                                                  ,'RR61Y'  ,'1'--,'2'
                                                  ,'RR62Y'  ,'2'--,'3'
                                                  ,'RR63Y'  ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'AM72'   ,'0'--,'1'
                                                  ,'AM73'   ,'1'--,'2'
                                                  ,'AM74'   ,'2'--,'3'
                                                  ,'AM75'   ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60'   ,'0'--,'1'
                                                  ,'RR61'   ,'1'--,'2'
                                                  ,'RR62'   ,'2'--,'3'
                                                  ,'RR63'   ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'MA134Y' ,'0'--,'1'
                                                  ,'MA135Y' ,'1'--,'2'
                                                  ,'MA136Y' ,'2'--,'3'
                                                  ,'MA137Y' ,'3'--,'4'--,''))                                                 MA1Q0303
                 ,'')) alc_amount_drinks
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM62'   ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                                                  ,'AM62Y'  ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                 ,'MA1','9999','')
                 )) alc_start_age
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM63'   ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'AM63Y'  ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'MA125'  ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                                                  ,'MA125Y' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                 ,DECODE(f.inpc_cd,'RR' ,'9999','')
                 )) alc_duration
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM78'   ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                                                  ,'AM78Y'  ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )) alc_endyr
     /* Physical activity */
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 운동 관련 응답 내역이 없고, 운동을 하지 않으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM50' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR44' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA149Y','1'                                                                       
                                                  ,'MA150Y','2'                                                                       
                                                  ,'MA151Y','3'                                                                       
                                                  ,'MA152Y','0'--,''))                                                                  MA1Q05
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'AM' ,'9999','')
                 )) overall_physical_activity
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM43Y'  ,'0'
                                                  ,'AM44Y'  ,'1'
                                                  ,'AM45Y'  ,'2'
                                                  ,'AM46Y'  ,'3'
                                                  ,'AM47Y'  ,'4'--,''))                                AMQ0062
                                                  ,'AM43'   ,'0'
                                                  ,'AM44'   ,'1'
                                                  ,'AM45'   ,'2'
                                                  ,'AM46'   ,'3'
                                                  ,'AM47'   ,'4'--,''))                                AMQ0062
                                                  ,'RR26Y'  ,'0'
                                                  ,'RR27Y'  ,'1'
                                                  ,'RR28Y'  ,'2'
                                                  ,'RR29Y'  ,'3'
                                                  ,'RR30Y'  ,'4'--,''))                                         RRQ0402
                                                  ,'RR26'   ,'0'
                                                  ,'RR27'   ,'1'
                                                  ,'RR28'   ,'2'
                                                  ,'RR29'   ,'3'
                                                  ,'RR30'   ,'4'--,''))                                         RRQ0402
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_freq_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM48'   ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'AM48Y'  ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'RR32Y'  ,'0'
                                                  ,'RR33Y'  ,'1'
                                                  ,'RR34Y'  ,'2'
                                                  ,'RR35Y'  ,'3'
                                                  ,'RR36Y'  ,'4'--,''))                                         RRQ0403
                                                  ,'RR32'   ,'0'
                                                  ,'RR33'   ,'1'
                                                  ,'RR34'   ,'2'
                                                  ,'RR35'   ,'3'
                                                  ,'RR36'   ,'4'--,''))                                         RRQ0403
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_duration_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA154Y' ,'0'                                                                       
                                                  ,'MA155Y' ,'1'                                                                       
                                                  ,'MA156Y' ,'2'                                                                       
                                                  ,'MA157Y' ,'3'--,''))                                                                  MA1Q0501
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA159Y' ,'0'
                                                  ,'MA160Y' ,'1'
                                                  ,'MA161Y' ,'2'
                                                  ,'MA162Y' ,'3'
                                                  ,'MA163Y' ,'4'--,''))                                                                  MA1Q0502
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_duration
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM49'   ,f.inqy_rspn_ctn1||' 년전'--,''))                        AMQ0064
                                                  ,'AM49Y'  ,f.inqy_rspn_ctn1||' 년전'--,''))                        AMQ0064
                                                  ,'RR38Y'  ,'0'
                                                  ,'RR39Y'  ,'1'
                                                  ,'RR40Y'  ,'2'
                                                  ,'RR41Y'  ,'3'
                                                  ,'RR42Y'  ,'4'
                                                  ,'RR43Y'  ,'5'--,''))                                         RRQ0404
                                                  ,'RR38'   ,'0'
                                                  ,'RR39'   ,'1'
                                                  ,'RR40'   ,'2'
                                                  ,'RR41'   ,'3'
                                                  ,'RR42'   ,'4'
                                                  ,'RR43'   ,'5'--,''))                                         RRQ0404
                 ,DECODE(f.inpc_cd,'MA1' ,'9999','')
                 )) phy_startyr
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM33Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM33'  ,'1'--,''))                                AMQ00611
                                                            ,'RR16Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR16'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_walking
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM34Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM34'  ,'1'--,''))                                AMQ00611
                                                            ,'RR17Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR17'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_jogging
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM35Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM35'  ,'1'--,''))                                AMQ00611
                                                            ,'RR18Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR18'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_TENNIS
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM36Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM36'  ,'1'--,''))                                AMQ00611
                                                            ,'RR19Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR19'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_GOLF
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM37Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM37'  ,'1'--,''))                                AMQ00611
                                                            ,'RR20Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR20'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_SWIMMING
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM38Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM38'  ,'1'--,''))                                AMQ00611
                                                            ,'RR21Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR21'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_CLIMBING
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM39Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM39'  ,'1'--,''))                                AMQ00611
                                                            ,'RR22Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR22'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_AEROBIC
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM40Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM40'  ,'1'--,''))                                AMQ00611
                                                            ,'RR23Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR23'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_FITNESS
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM41Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM41'  ,'1'--,''))                                AMQ00611
                                                            ,'RR24Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR24'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_OTHER
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM12Y' ,'0'
                                                  ,'AM13Y' ,'1'
                                                  ,'AM14Y' ,'2'
                                                  ,'AM15Y' ,'3'
                                                  ,'AM16Y' ,'4'
                                                  ,'RR8Y' ,'0'
                                                  ,'RR9Y' ,'1'
                                                  ,'RR10Y','2'
                                                  ,'RR11Y','3'
                                                  ,'RR12Y','4'
                                                  ,'AM12'  ,'0'
                                                  ,'AM13'  ,'1'
                                                  ,'AM14'  ,'2'
                                                  ,'AM15'  ,'3'
                                                  ,'AM16'  ,'4'
                                                  ,'RR8'  ,'0'
                                                  ,'RR9'  ,'1'
                                                  ,'RR10' ,'2'
                                                  ,'RR11' ,'3'
                                                  ,'RR12' ,'4'
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )
          ) marital_status
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM18Y' ,'0'
                                                  ,'AM19Y' ,'1'
                                                  ,'AM20Y' ,'2'
                                                  ,'AM21Y' ,'3'
                                                  ,'AM22Y' ,'4'
                                                  ,'AM23Y' ,'5'
                                                  ,'AM18'  ,'0'
                                                  ,'AM19'  ,'1'
                                                  ,'AM20'  ,'2'
                                                  ,'AM21'  ,'3'
                                                  ,'AM22'  ,'4'
                                                  ,'AM23'  ,'5'
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) education
  from target a
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and f.ptno = c.ptno
   and f.ordr_prrn_ymd = c.ordr_prrn_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
               or (f.inpc_cd = 'RR'  and f.item_sno between 1 and  300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 1 and  64)
       )
   and f.rprs_apnt_no = c.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno, a.ordr_prrn_ymd, f.inpc_cd

-- DR.H SAME VARIABLE QUESAT
-- part02 질병력
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
-- 질병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , a.inpc_cd
/* 고혈압 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y' ,'1'
                                                            ,'AM106'  ,'1'
                                                            ,'RR80Y'  ,'1'
                                                            ,'RR80'   ,'1'
                                                            ,'MA167Y' ,'1'
                                                            ,'MA168Y' ,'1'
                                                            ,'MA169Y' ,'1'
                                                            ,'MA170'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM106YY','1','AM106YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hypertension
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y',f.inqy_rspn_ctn2 
                                                                         ,'AM106' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA170' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hypertension_age_diag
/* 당뇨병 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y' ,'1'
                                                            ,'AM109'  ,'1'
                                                            ,'RR83Y'  ,'1'
                                                            ,'RR83'   ,'1'
                                                            ,'MA172Y' ,'1'
                                                            ,'MA173Y' ,'1'
                                                            ,'MA174Y' ,'1'
                                                            ,'MA175'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM109YY','1','AM109YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'1','')) --,'3' 현재치료중.
             ,''
             ) trt_diabetes
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'1'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'2','')) --,'3' 현재치료중.
             ,''
             ) status_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y',f.inqy_rspn_ctn2 
                                                                         ,'AM109' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA175' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) diabetes_age_diag
/* 고지혈증 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y' ,'1'
                                                            ,'AM107'  ,'1'
                                                            ,'RR81Y'  ,'1'
                                                            ,'RR81'   ,'1'
                                                            ,'MA177Y' ,'1'
                                                            ,'MA178Y' ,'1'
                                                            ,'MA179Y' ,'1'
                                                            ,'MA180'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM107YY','1','AM107YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y',f.inqy_rspn_ctn2 
                                                                         ,'AM107' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA180' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hyperlipidemia_age_diag
/* 갑상선 질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y' ,'1'
                                                                                   ,'AM122'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR96Y'  ,'1'
                                                                                   ,'RR96'   ,'1','0')),'')
             ,''
             ) history_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM122YY','1','AM122YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y',f.inqy_rspn_ctn2 
                                                                         ,'AM122' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) thyroid_dis1_age_diag
/* 갑상선 기능 저하증 및 항진증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','1'
                                                                                   ,'MA1167Y','1'
                                                                                   ,'MA1168Y','1'
                                                                                   ,'MA1169Y','1'
                                                                                   ,'MA1170Y','1'
                                                                                   ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1169Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_thyroid_dis2_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1171' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) thyroid_dis2_age_diag
/* 갑상선 결절 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','1'
                                                                                                          ,'MA1174Y','1'
                                                                                                          ,'MA1175Y','1'
                                                                                                          ,'MA1176Y','1'
                                                                                                          ,'MA1177Y','1'
                                                                                                          ,'MA1178' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1176Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1178' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_thyroid_nodules_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1178' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) thyroid_nodules_age_diag
  from (-- 질병력 전체값 고려, MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C02' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 질병력 */
             , case 
                    when /*case1. 질병응답내역이 아무것도 없고, 질병력없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM130' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno            = 'RR101' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA165Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 다른 질병응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    else ''
               end history_comorbidity 
          from target b
             , 스키마.3E3C0E433E3C0E3E28 c
             , 스키마.3E3C23302E333E0E28 a
         where c.ptno = b.ptno
           and c.ordr_prrn_ymd = b.ordr_prrn_ymd
           and c.cncl_dt is null
           and a.ptno = c.ptno
           and a.ordr_prrn_ymd = c.ordr_prrn_ymd
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500 and a.item_sno != 127)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 64  and 227 and a.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
               )
           and b.ptno not in (
                              &not_in_ptno
                             )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 64  and 227 and f.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
       )
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_comorbidity

-- DR.H SAME VARIABLE QUESAT
-- part03 약복용력
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
-- 약복용력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
/* 아스피린 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM132Y' ,'1'
                                                            ,'AM132'  ,'1'
                                                            ,'RR103Y' ,'1'
                                                            ,'RR103'  ,'1'
                                                            ,'MA1240Y','1'
                                                            ,'MA1241Y','1','0'))
                                   ,''
             ) med_aspirin
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1240Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1241Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_aspirin
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM132Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM132' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_aspirin_duration
/* 와파린 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1243Y','1'
                                                                                   ,'MA1244Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_warfarin
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1243Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1244Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_warfarin
/* 기타혈전방지제 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1246Y','1'
                                                                                   ,'MA1247Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_anticoagulant
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1246Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1247Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_anticoagulant
/* 소염진통제 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM133Y' ,'1'
                                                            ,'AM133'  ,'1'
                                                            ,'RR104Y' ,'1'
                                                            ,'RR104'  ,'1'
                                                            ,'MA1261Y','1'
                                                            ,'MA1262Y','1','0'))
                                   ,''
             ) med_nsaids
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1261Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1262Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_nsaids
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM133Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM133' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_nsaids_duration
/* 혈압약 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM134Y' ,'1'
                                                            ,'AM134'  ,'1'
                                                            ,'RR105Y' ,'1'
                                                            ,'RR105'  ,'1'
                                                            ,'MA1231Y','1'
                                                            ,'MA1232Y','1','0'))
                                   ,''
             ) med_hypertension
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1231Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1232Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM134Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM134' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_hypertension_duration
/* 당뇨약 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM135Y' ,'1'
                                                            ,'AM135'  ,'1'
                                                            ,'RR106Y' ,'1'
                                                            ,'RR106'  ,'1'
                                                            ,'MA1234Y','1'
                                                            ,'MA1235Y','1','0'))
                                   ,''
             ) med_diabetes
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1234Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1235Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM135Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM135' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_diabetes_duration
/* 종합비타민 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM136Y' ,'1'
                                                                                   ,'AM136'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR107Y' ,'1'
                                                                                   ,'RR107'  ,'1','0')),'')
             ,''
             ) med_multi_vitamin
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM136Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM136' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_multi_vitamin_duration
/* 비타민A */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM137Y' ,'1'
                                                                                   ,'AM137'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR108Y' ,'1'
                                                                                   ,'RR108'  ,'1','0')),'')
             ,''
             ) med_vitamin_a
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM137Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM137' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_vitamin_a_duration
/* 비타민b */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM138Y' ,'1'
                                                                                   ,'AM138'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR109Y' ,'1'
                                                                                   ,'RR109'  ,'1','0')),'')
             ,''
             ) med_vitamin_b
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM138Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM138' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_vitamin_b_duration
/* 비타민c */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM139Y' ,'1'
                                                                                   ,'AM139'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR110Y' ,'1'
                                                                                   ,'RR110'  ,'1','0')),'')
             ,''
             ) med_vitamin_c
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM139Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM139' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_vitamin_c_duration
/* 비타민e */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM140Y' ,'1'
                                                                                   ,'AM140'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR111Y' ,'1'
                                                                                   ,'RR111'  ,'1','0')),'')
             ,''
             ) med_vitamin_e
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM140Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM140' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_vitamin_e_duration
/* 베타 카로테인 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM141Y' ,'1'
                                                                                   ,'AM141'  ,'1','0')),'')
                       ,'RR' ,decode(a.med          ,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR112Y' ,'1'
                                                                                   ,'RR112'  ,'1','0')),'')
             ,''
             ) med_beta_carotene
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM141Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM141' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_beta_carotene_duration
  from (-- 약복용력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C03' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 약복용력 */
             , case 
                    when /*case1. 약물복용 응답내역이 아무것도 없고, 약물복용력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 132 and 147) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR' and (a.item_sno between 103 and 118) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.ceck_yn||a.inqy_rspn_ctn1--  MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM148' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno            = 'RR119' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA1229Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 다른 약물복용 응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 132 and 147) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR' and (a.item_sno between 103 and 118) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.ceck_yn||a.inqy_rspn_ctn1--  MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    else ''
               end med
          from target b
             , 스키마.3E3C0E433E3C0E3E28 c
             , 스키마.3E3C23302E333E0E28 a
         where c.ptno = b.ptno
           and c.ordr_prrn_ymd = b.ordr_prrn_ymd
           and c.cncl_dt is null
           and a.ptno = c.ptno
           and a.ordr_prrn_ymd = c.ordr_prrn_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 228 and 295)
               )
           and b.ptno not in (
                              &not_in_ptno
                             )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 228 and 295)
       )
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.med

-- DR.H SAME VARIABLE QUESAT
-- part04 스트레스
with temp as (-- 안압 2회 이상 측정한 사람
              select 
                     c.ptno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                    /* 정보 동의여부자만 대상 */
                 and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.ordr_cd = 'SM0200'
                 and c.codv_cd = 'G'
                 and nvl(c.dc_dvsn_cd,'N') != 'X' 
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (-- 안압 2회 이상 측정자 중 FFQ 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.3E3C23302E333E0E28 x
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and x.inpc_cd like 'F%' and x.qstn_cd1 is not null
                 group by x.ptno, x.ordr_prrn_ymd
               )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
/* 스트레스 */
     , case
            when f.inpc_cd = 'RR' then '9999' --> case문의 순서 때문에 먼저 고려해야 함.
            when (
                  case -- factor 1 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 342 and 345 then f.ceck_yn--               stress_q8
                                       when f.inpc_cd = 'AM'  and item_sno between 347 and 350 then f.ceck_yn--               stress_q9
                                       when f.inpc_cd = 'AM'  and item_sno between 352 and 355 then f.ceck_yn--               stress_q10
                                       when f.inpc_cd = 'AM'  and item_sno between 357 and 360 then f.ceck_yn--               stress_q11
                                       when f.inpc_cd = 'AM'  and item_sno between 362 and 365 then f.ceck_yn--               stress_q12
                                       when f.inpc_cd = 'AM'  and item_sno between 372 and 375 then f.ceck_yn--               stress_q14
                                       when f.inpc_cd = 'AM'  and item_sno between 387 and 390 then f.ceck_yn--               stress_q17
                                       when f.inpc_cd = 'AM'  and item_sno between 392 and 395 then f.ceck_yn--               stress_q18
                                       when f.inpc_cd = 'MA1' and item_sno between 848 and 851 then f.ceck_yn--               stress_q8
                                       when f.inpc_cd = 'MA1' and item_sno between 853 and 856 then f.ceck_yn--               stress_q9
                                       when f.inpc_cd = 'MA1' and item_sno between 858 and 861 then f.ceck_yn--               stress_q10
                                       when f.inpc_cd = 'MA1' and item_sno between 863 and 866 then f.ceck_yn--               stress_q11
                                       when f.inpc_cd = 'MA1' and item_sno between 868 and 871 then f.ceck_yn--               stress_q12
                                       when f.inpc_cd = 'MA1' and item_sno between 878 and 881 then f.ceck_yn--               stress_q14
                                       when f.inpc_cd = 'MA1' and item_sno between 893 and 896 then f.ceck_yn--               stress_q17
                                       when f.inpc_cd = 'MA1' and item_sno between 898 and 901 then f.ceck_yn--               stress_q18
                                       else ''
                                  end
                                 ) > 6 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 3 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 367 and 370 then f.ceck_yn--               stress_q13
                                       when f.inpc_cd = 'AM'  and item_sno between 377 and 380 then f.ceck_yn--               stress_q15
                                       when f.inpc_cd = 'AM'  and item_sno between 382 and 385 then f.ceck_yn--               stress_q16
                                       when f.inpc_cd = 'MA1' and item_sno between 873 and 876 then f.ceck_yn--               stress_q13
                                       when f.inpc_cd = 'MA1' and item_sno between 883 and 886 then f.ceck_yn--               stress_q15
                                       when f.inpc_cd = 'MA1' and item_sno between 888 and 891 then f.ceck_yn--               stress_q16
                                       else ''
                                  end
                                 ) > 1 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 2 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 307 and 310 then f.ceck_yn--               stress_q1
                                       when f.inpc_cd = 'AM'  and item_sno between 312 and 315 then f.ceck_yn--               stress_q2
                                       when f.inpc_cd = 'AM'  and item_sno between 317 and 320 then f.ceck_yn--               stress_q3
                                       when f.inpc_cd = 'AM'  and item_sno between 327 and 330 then f.ceck_yn--               stress_q5
                                       when f.inpc_cd = 'AM'  and item_sno between 332 and 335 then f.ceck_yn--               stress_q6
                                       when f.inpc_cd = 'MA1' and item_sno between 813 and 816 then f.ceck_yn--               stress_q1
                                       when f.inpc_cd = 'MA1' and item_sno between 818 and 821 then f.ceck_yn--               stress_q2
                                       when f.inpc_cd = 'MA1' and item_sno between 823 and 826 then f.ceck_yn--               stress_q3
                                       when f.inpc_cd = 'MA1' and item_sno between 833 and 836 then f.ceck_yn--               stress_q5
                                       when f.inpc_cd = 'MA1' and item_sno between 838 and 841 then f.ceck_yn--               stress_q6
                                       else ''
                                  end
                                 ) > 3 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 4 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 322 and 325 then f.ceck_yn--               stress_q4
                                       when f.inpc_cd = 'AM'  and item_sno between 337 and 340 then f.ceck_yn--               stress_q7
                                       when f.inpc_cd = 'MA1' and item_sno between 828 and 831 then f.ceck_yn--               stress_q4
                                       when f.inpc_cd = 'MA1' and item_sno between 843 and 846 then f.ceck_yn--               stress_q7
                                       else ''
                                  end
                                 ) > 0 then 'Y'
                       else 'X'
                  end
                 ) != 'YYYY'
            then ''
            else
                 decode(f.inpc_cd,'RR','9999'
                                 ,sum(
                                      DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM307Y' ,0
                                                                             ,'AM308Y' ,1
                                                                             ,'AM309Y' ,2
                                                                             ,'AM310Y' ,3
                                                                             ,'AM307' ,0
                                                                             ,'AM308' ,1
                                                                             ,'AM309' ,2
                                                                             ,'AM310' ,3
                                                                             ,'MA1813Y',to_number(g.fod_base_qty)
                                                                             ,'MA1814Y',to_number(g.fod_base_qty)
                                                                             ,'MA1815Y',to_number(g.fod_base_qty)
                                                                             ,'MA1816Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS01
                                                                             ,'AM312Y' ,3
                                                                             ,'AM313Y' ,2
                                                                             ,'AM314Y' ,1
                                                                             ,'AM315Y' ,0
                                                                             ,'AM312' ,3
                                                                             ,'AM313' ,2
                                                                             ,'AM314' ,1
                                                                             ,'AM315' ,0
                                                                             ,'MA1818Y',to_number(g.fod_base_qty)
                                                                             ,'MA1819Y',to_number(g.fod_base_qty)
                                                                             ,'MA1820Y',to_number(g.fod_base_qty)
                                                                             ,'MA1821Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS02
                                                                             ,'AM317Y' ,3
                                                                             ,'AM318Y' ,2
                                                                             ,'AM319Y' ,1
                                                                             ,'AM320Y' ,0
                                                                             ,'AM317' ,3
                                                                             ,'AM318' ,2
                                                                             ,'AM319' ,1
                                                                             ,'AM320' ,0
                                                                             ,'MA1823Y',to_number(g.fod_base_qty)
                                                                             ,'MA1824Y',to_number(g.fod_base_qty)
                                                                             ,'MA1825Y',to_number(g.fod_base_qty)
                                                                             ,'MA1826Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS03
                                                                             ,'AM322Y' ,3
                                                                             ,'AM323Y' ,2
                                                                             ,'AM324Y' ,1
                                                                             ,'AM325Y' ,0
                                                                             ,'AM322' ,3
                                                                             ,'AM323' ,2
                                                                             ,'AM324' ,1
                                                                             ,'AM325' ,0
                                                                             ,'MA1828Y',to_number(g.fod_base_qty)
                                                                             ,'MA1829Y',to_number(g.fod_base_qty)
                                                                             ,'MA1830Y',to_number(g.fod_base_qty)
                                                                             ,'MA1831Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS04
                                                                             ,'AM327Y' ,0
                                                                             ,'AM328Y' ,1
                                                                             ,'AM329Y' ,2
                                                                             ,'AM330Y' ,3
                                                                             ,'AM327' ,0
                                                                             ,'AM328' ,1
                                                                             ,'AM329' ,2
                                                                             ,'AM330' ,3
                                                                             ,'MA1833Y',to_number(g.fod_base_qty)
                                                                             ,'MA1834Y',to_number(g.fod_base_qty)
                                                                             ,'MA1835Y',to_number(g.fod_base_qty)
                                                                             ,'MA1836Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS05
                                                                             ,'AM332Y' ,0
                                                                             ,'AM333Y' ,1
                                                                             ,'AM334Y' ,2
                                                                             ,'AM335Y' ,3
                                                                             ,'AM332' ,0
                                                                             ,'AM333' ,1
                                                                             ,'AM334' ,2
                                                                             ,'AM335' ,3
                                                                             ,'MA1838Y',to_number(g.fod_base_qty)
                                                                             ,'MA1839Y',to_number(g.fod_base_qty)
                                                                             ,'MA1840Y',to_number(g.fod_base_qty)
                                                                             ,'MA1841Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS06
                                                                             ,'AM337Y' ,3
                                                                             ,'AM338Y' ,2
                                                                             ,'AM339Y' ,1
                                                                             ,'AM340Y' ,0
                                                                             ,'AM337' ,3
                                                                             ,'AM338' ,2
                                                                             ,'AM339' ,1
                                                                             ,'AM340' ,0
                                                                             ,'MA1843Y',to_number(g.fod_base_qty)
                                                                             ,'MA1844Y',to_number(g.fod_base_qty)
                                                                             ,'MA1845Y',to_number(g.fod_base_qty)
                                                                             ,'MA1846Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS07
                                                                             ,'AM342Y' ,0
                                                                             ,'AM343Y' ,1
                                                                             ,'AM344Y' ,2
                                                                             ,'AM345Y' ,3
                                                                             ,'AM342' ,0
                                                                             ,'AM343' ,1
                                                                             ,'AM344' ,2
                                                                             ,'AM345' ,3
                                                                             ,'MA1848Y',to_number(g.fod_base_qty)
                                                                             ,'MA1849Y',to_number(g.fod_base_qty)
                                                                             ,'MA1850Y',to_number(g.fod_base_qty)
                                                                             ,'MA1851Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS08
                                                                             ,'AM347Y' ,0
                                                                             ,'AM348Y' ,1
                                                                             ,'AM349Y' ,2
                                                                             ,'AM350Y' ,3
                                                                             ,'AM347' ,0
                                                                             ,'AM348' ,1
                                                                             ,'AM349' ,2
                                                                             ,'AM350' ,3
                                                                             ,'MA1853Y',to_number(g.fod_base_qty)
                                                                             ,'MA1854Y',to_number(g.fod_base_qty)
                                                                             ,'MA1855Y',to_number(g.fod_base_qty)
                                                                             ,'MA1856Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS09
                                                                             ,'AM352Y' ,0
                                                                             ,'AM353Y' ,1
                                                                             ,'AM354Y' ,2
                                                                             ,'AM355Y' ,3
                                                                             ,'AM352' ,0
                                                                             ,'AM353' ,1
                                                                             ,'AM354' ,2
                                                                             ,'AM355' ,3
                                                                             ,'MA1858Y',to_number(g.fod_base_qty)
                                                                             ,'MA1859Y',to_number(g.fod_base_qty)
                                                                             ,'MA1860Y',to_number(g.fod_base_qty)
                                                                             ,'MA1861Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS10
                                                                             ,'AM357Y' ,0
                                                                             ,'AM358Y' ,1
                                                                             ,'AM359Y' ,2
                                                                             ,'AM360Y' ,3
                                                                             ,'AM357' ,0
                                                                             ,'AM358' ,1
                                                                             ,'AM359' ,2
                                                                             ,'AM360' ,3
                                                                             ,'MA1863Y',to_number(g.fod_base_qty)
                                                                             ,'MA1864Y',to_number(g.fod_base_qty)
                                                                             ,'MA1865Y',to_number(g.fod_base_qty)
                                                                             ,'MA1866Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS11
                                                                             ,'AM362Y' ,0
                                                                             ,'AM363Y' ,1
                                                                             ,'AM364Y' ,2
                                                                             ,'AM365Y' ,3
                                                                             ,'AM362' ,0
                                                                             ,'AM363' ,1
                                                                             ,'AM364' ,2
                                                                             ,'AM365' ,3
                                                                             ,'MA1868Y',to_number(g.fod_base_qty)
                                                                             ,'MA1869Y',to_number(g.fod_base_qty)
                                                                             ,'MA1870Y',to_number(g.fod_base_qty)
                                                                             ,'MA1871Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS12
                                                                             ,'AM367Y' ,3
                                                                             ,'AM368Y' ,2
                                                                             ,'AM369Y' ,1
                                                                             ,'AM370Y' ,0
                                                                             ,'AM367' ,3
                                                                             ,'AM368' ,2
                                                                             ,'AM369' ,1
                                                                             ,'AM370' ,0
                                                                             ,'MA1873Y',to_number(g.fod_base_qty)
                                                                             ,'MA1874Y',to_number(g.fod_base_qty)
                                                                             ,'MA1875Y',to_number(g.fod_base_qty)
                                                                             ,'MA1876Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS13
                                                                             ,'AM372Y' ,0
                                                                             ,'AM373Y' ,1
                                                                             ,'AM374Y' ,2
                                                                             ,'AM375Y' ,3
                                                                             ,'AM372' ,0
                                                                             ,'AM373' ,1
                                                                             ,'AM374' ,2
                                                                             ,'AM375' ,3
                                                                             ,'MA1878Y',to_number(g.fod_base_qty)
                                                                             ,'MA1879Y',to_number(g.fod_base_qty)
                                                                             ,'MA1880Y',to_number(g.fod_base_qty)
                                                                             ,'MA1881Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS14
                                                                             ,'AM377Y' ,3
                                                                             ,'AM378Y' ,2
                                                                             ,'AM379Y' ,1
                                                                             ,'AM380Y' ,0
                                                                             ,'AM377' ,3
                                                                             ,'AM378' ,2
                                                                             ,'AM379' ,1
                                                                             ,'AM380' ,0
                                                                             ,'MA1883Y',to_number(g.fod_base_qty)
                                                                             ,'MA1884Y',to_number(g.fod_base_qty)
                                                                             ,'MA1885Y',to_number(g.fod_base_qty)
                                                                             ,'MA1886Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS15
                                                                             ,'AM382Y' ,3
                                                                             ,'AM383Y' ,2
                                                                             ,'AM384Y' ,1
                                                                             ,'AM385Y' ,0
                                                                             ,'AM382' ,3
                                                                             ,'AM383' ,2
                                                                             ,'AM384' ,1
                                                                             ,'AM385' ,0
                                                                             ,'MA1888Y',to_number(g.fod_base_qty)
                                                                             ,'MA1889Y',to_number(g.fod_base_qty)
                                                                             ,'MA1890Y',to_number(g.fod_base_qty)
                                                                             ,'MA1891Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS16
                                                                             ,'AM387Y' ,0
                                                                             ,'AM388Y' ,1
                                                                             ,'AM389Y' ,2
                                                                             ,'AM390Y' ,3
                                                                             ,'AM387' ,0
                                                                             ,'AM388' ,1
                                                                             ,'AM389' ,2
                                                                             ,'AM390' ,3
                                                                             ,'MA1893Y',to_number(g.fod_base_qty)
                                                                             ,'MA1894Y',to_number(g.fod_base_qty)
                                                                             ,'MA1895Y',to_number(g.fod_base_qty)
                                                                             ,'MA1896Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS17
                                                                             ,'AM392Y' ,0
                                                                             ,'AM393Y' ,1
                                                                             ,'AM394Y' ,2
                                                                             ,'AM395Y' ,3
                                                                             ,'AM392' ,0
                                                                             ,'AM393' ,1
                                                                             ,'AM394' ,2
                                                                             ,'AM395' ,3
                                                                             ,'MA1898Y',to_number(g.fod_base_qty)
                                                                             ,'MA1899Y',to_number(g.fod_base_qty)
                                                                             ,'MA1900Y',to_number(g.fod_base_qty)
                                                                             ,'MA1901Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS18
                                            )
                                     ) 
                       )
       end STRESS_score
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM307Y' ,0
                                                  ,'AM308Y' ,1
                                                  ,'AM309Y' ,2
                                                  ,'AM310Y' ,3
                                                  ,'AM307'  ,0
                                                  ,'AM308'  ,1
                                                  ,'AM309'  ,2
                                                  ,'AM310'  ,3
                                                  ,'MA1813Y',to_number(g.fod_base_qty)
                                                  ,'MA1814Y',to_number(g.fod_base_qty)
                                                  ,'MA1815Y',to_number(g.fod_base_qty)
                                                  ,'MA1816Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q1
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM312Y' ,3
                                                  ,'AM313Y' ,2
                                                  ,'AM314Y' ,1
                                                  ,'AM315Y' ,0
                                                  ,'AM312'  ,3
                                                  ,'AM313'  ,2
                                                  ,'AM314'  ,1
                                                  ,'AM315'  ,0
                                                  ,'MA1818Y',to_number(g.fod_base_qty)
                                                  ,'MA1819Y',to_number(g.fod_base_qty)
                                                  ,'MA1820Y',to_number(g.fod_base_qty)
                                                  ,'MA1821Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q2
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM317Y' ,3
                                                  ,'AM318Y' ,2
                                                  ,'AM319Y' ,1
                                                  ,'AM320Y' ,0
                                                  ,'AM317'  ,3
                                                  ,'AM318'  ,2
                                                  ,'AM319'  ,1
                                                  ,'AM320'  ,0
                                                  ,'MA1823Y',to_number(g.fod_base_qty)
                                                  ,'MA1824Y',to_number(g.fod_base_qty)
                                                  ,'MA1825Y',to_number(g.fod_base_qty)
                                                  ,'MA1826Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q3
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM322Y' ,3
                                                  ,'AM323Y' ,2
                                                  ,'AM324Y' ,1
                                                  ,'AM325Y' ,0
                                                  ,'AM322'  ,3
                                                  ,'AM323'  ,2
                                                  ,'AM324'  ,1
                                                  ,'AM325'  ,0
                                                  ,'MA1828Y',to_number(g.fod_base_qty)
                                                  ,'MA1829Y',to_number(g.fod_base_qty)
                                                  ,'MA1830Y',to_number(g.fod_base_qty)
                                                  ,'MA1831Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q4
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM327Y' ,0
                                                  ,'AM328Y' ,1
                                                  ,'AM329Y' ,2
                                                  ,'AM330Y' ,3
                                                  ,'AM327'  ,0
                                                  ,'AM328'  ,1
                                                  ,'AM329'  ,2
                                                  ,'AM330'  ,3
                                                  ,'MA1833Y',to_number(g.fod_base_qty)
                                                  ,'MA1834Y',to_number(g.fod_base_qty)
                                                  ,'MA1835Y',to_number(g.fod_base_qty)
                                                  ,'MA1836Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q5
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM332Y' ,0
                                                  ,'AM333Y' ,1
                                                  ,'AM334Y' ,2
                                                  ,'AM335Y' ,3
                                                  ,'AM332'  ,0
                                                  ,'AM333'  ,1
                                                  ,'AM334'  ,2
                                                  ,'AM335'  ,3
                                                  ,'MA1838Y',to_number(g.fod_base_qty)
                                                  ,'MA1839Y',to_number(g.fod_base_qty)
                                                  ,'MA1840Y',to_number(g.fod_base_qty)
                                                  ,'MA1841Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q6
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM337Y' ,3
                                                  ,'AM338Y' ,2
                                                  ,'AM339Y' ,1
                                                  ,'AM340Y' ,0
                                                  ,'AM337'  ,3
                                                  ,'AM338'  ,2
                                                  ,'AM339'  ,1
                                                  ,'AM340'  ,0
                                                  ,'MA1843Y',to_number(g.fod_base_qty)
                                                  ,'MA1844Y',to_number(g.fod_base_qty)
                                                  ,'MA1845Y',to_number(g.fod_base_qty)
                                                  ,'MA1846Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q7
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM342Y' ,0
                                                  ,'AM343Y' ,1
                                                  ,'AM344Y' ,2
                                                  ,'AM345Y' ,3
                                                  ,'AM342'  ,0
                                                  ,'AM343'  ,1
                                                  ,'AM344'  ,2
                                                  ,'AM345'  ,3
                                                  ,'MA1848Y',to_number(g.fod_base_qty)
                                                  ,'MA1849Y',to_number(g.fod_base_qty)
                                                  ,'MA1850Y',to_number(g.fod_base_qty)
                                                  ,'MA1851Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q8
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM347Y' ,0
                                                  ,'AM348Y' ,1
                                                  ,'AM349Y' ,2
                                                  ,'AM350Y' ,3
                                                  ,'AM347'  ,0
                                                  ,'AM348'  ,1
                                                  ,'AM349'  ,2
                                                  ,'AM350'  ,3
                                                  ,'MA1853Y',to_number(g.fod_base_qty)
                                                  ,'MA1854Y',to_number(g.fod_base_qty)
                                                  ,'MA1855Y',to_number(g.fod_base_qty)
                                                  ,'MA1856Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q9
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM352Y' ,0
                                                  ,'AM353Y' ,1
                                                  ,'AM354Y' ,2
                                                  ,'AM355Y' ,3
                                                  ,'AM352'  ,0
                                                  ,'AM353'  ,1
                                                  ,'AM354'  ,2
                                                  ,'AM355'  ,3
                                                  ,'MA1858Y',to_number(g.fod_base_qty)
                                                  ,'MA1859Y',to_number(g.fod_base_qty)
                                                  ,'MA1860Y',to_number(g.fod_base_qty)
                                                  ,'MA1861Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q10
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM357Y' ,0
                                                  ,'AM358Y' ,1
                                                  ,'AM359Y' ,2
                                                  ,'AM360Y' ,3
                                                  ,'AM357'  ,0
                                                  ,'AM358'  ,1
                                                  ,'AM359'  ,2
                                                  ,'AM360'  ,3
                                                  ,'MA1863Y',to_number(g.fod_base_qty)
                                                  ,'MA1864Y',to_number(g.fod_base_qty)
                                                  ,'MA1865Y',to_number(g.fod_base_qty)
                                                  ,'MA1866Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q11
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM362Y' ,0
                                                  ,'AM363Y' ,1
                                                  ,'AM364Y' ,2
                                                  ,'AM365Y' ,3
                                                  ,'AM362'  ,0
                                                  ,'AM363'  ,1
                                                  ,'AM364'  ,2
                                                  ,'AM365'  ,3
                                                  ,'MA1868Y',to_number(g.fod_base_qty)
                                                  ,'MA1869Y',to_number(g.fod_base_qty)
                                                  ,'MA1870Y',to_number(g.fod_base_qty)
                                                  ,'MA1871Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q12
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM367Y' ,3
                                                  ,'AM368Y' ,2
                                                  ,'AM369Y' ,1
                                                  ,'AM370Y' ,0
                                                  ,'AM367'  ,3
                                                  ,'AM368'  ,2
                                                  ,'AM369'  ,1
                                                  ,'AM370'  ,0
                                                  ,'MA1873Y',to_number(g.fod_base_qty)
                                                  ,'MA1874Y',to_number(g.fod_base_qty)
                                                  ,'MA1875Y',to_number(g.fod_base_qty)
                                                  ,'MA1876Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q13
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM372Y' ,0
                                                  ,'AM373Y' ,1
                                                  ,'AM374Y' ,2
                                                  ,'AM375Y' ,3
                                                  ,'AM372'  ,0
                                                  ,'AM373'  ,1
                                                  ,'AM374'  ,2
                                                  ,'AM375'  ,3
                                                  ,'MA1878Y',to_number(g.fod_base_qty)
                                                  ,'MA1879Y',to_number(g.fod_base_qty)
                                                  ,'MA1880Y',to_number(g.fod_base_qty)
                                                  ,'MA1881Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q14
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM377Y' ,3
                                                  ,'AM378Y' ,2
                                                  ,'AM379Y' ,1
                                                  ,'AM380Y' ,0
                                                  ,'AM377'  ,3
                                                  ,'AM378'  ,2
                                                  ,'AM379'  ,1
                                                  ,'AM380'  ,0
                                                  ,'MA1883Y',to_number(g.fod_base_qty)
                                                  ,'MA1884Y',to_number(g.fod_base_qty)
                                                  ,'MA1885Y',to_number(g.fod_base_qty)
                                                  ,'MA1886Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q15
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM382Y' ,3
                                                  ,'AM383Y' ,2
                                                  ,'AM384Y' ,1
                                                  ,'AM385Y' ,0
                                                  ,'AM382'  ,3
                                                  ,'AM383'  ,2
                                                  ,'AM384'  ,1
                                                  ,'AM385'  ,0
                                                  ,'MA1888Y',to_number(g.fod_base_qty)
                                                  ,'MA1889Y',to_number(g.fod_base_qty)
                                                  ,'MA1890Y',to_number(g.fod_base_qty)
                                                  ,'MA1891Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q16
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM387Y' ,0
                                                  ,'AM388Y' ,1
                                                  ,'AM389Y' ,2
                                                  ,'AM390Y' ,3
                                                  ,'AM387'  ,0
                                                  ,'AM388'  ,1
                                                  ,'AM389'  ,2
                                                  ,'AM390'  ,3
                                                  ,'MA1893Y',to_number(g.fod_base_qty)
                                                  ,'MA1894Y',to_number(g.fod_base_qty)
                                                  ,'MA1895Y',to_number(g.fod_base_qty)
                                                  ,'MA1896Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q17
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM392Y' ,0
                                                  ,'AM393Y' ,1
                                                  ,'AM394Y' ,2
                                                  ,'AM395Y' ,3
                                                  ,'AM392'  ,0
                                                  ,'AM393'  ,1
                                                  ,'AM394'  ,2
                                                  ,'AM395'  ,3
                                                  ,'MA1898Y',to_number(g.fod_base_qty)
                                                  ,'MA1899Y',to_number(g.fod_base_qty)
                                                  ,'MA1900Y',to_number(g.fod_base_qty)
                                                  ,'MA1901Y',to_number(g.fod_base_qty)
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q18
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM397Y' ,0
                                                  ,'AM398Y' ,1
                                                  ,'AM399Y' ,2
                                                  ,'AM400Y' ,3
                                                  ,'AM401Y' ,4
                                                  ,'AM397'  ,0
                                                  ,'AM398'  ,1
                                                  ,'AM399'  ,2
                                                  ,'AM400'  ,3
                                                  ,'AM401'  ,4
                                                  ,'MA1903Y',0
                                                  ,'MA1904Y',1
                                                  ,'MA1905Y',2
                                                  ,'MA1906Y',3
                                                  ,'MA1907Y',4
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q19
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM403Y' ,0
                                                  ,'AM404Y' ,1
                                                  ,'AM405Y' ,2
                                                  ,'AM406Y' ,3
                                                  ,'AM407Y' ,4
                                                  ,'AM403'  ,0
                                                  ,'AM404'  ,1
                                                  ,'AM405'  ,2
                                                  ,'AM406'  ,3
                                                  ,'AM407'  ,4
                                                  ,'MA1909Y',0
                                                  ,'MA1910Y',1
                                                  ,'MA1911Y',2
                                                  ,'MA1912Y',3
                                                  ,'MA1913Y',4
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q20
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM409Y' ,1
                                                  ,'AM410Y' ,0
                                                  ,'AM409'  ,1
                                                  ,'AM410'  ,0
                                                  ,'MA1915Y',1
                                                  ,'MA1916Y',0
                                                  ,decode(f.inpc_cd,'RR','9999','')))                stress_q21
  from target a
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where c.ptno = a.ptno
   and c.ordr_prrn_ymd = a.ordr_prrn_ymd
   and c.cncl_dt is null
   and f.ptno = c.ptno
   and f.ordr_prrn_ymd = c.ordr_prrn_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 657 and 917)
       )
   and f.rprs_apnt_no = c.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno, a.ordr_prrn_ymd, f.inpc_cd
