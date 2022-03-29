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
    ,target as (-- 안압 2회 이상 측정자 중 식생활설문 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.smcfoodst x
                     , 스키마.3E3C0E433E3C0E3E28 y
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20160701','yyyymmdd')-- to_date('20080101','yyyymmdd') and to_date('20081231','yyyymmdd')
                   and y.ptno = x.ptno
                   and y.ordr_prrn_ymd = x.ordr_prrn_ymd
                   and y.ordr_ymd is not null
                   and y.cncl_dt is null
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
    ,target as (-- 안압 2회 이상 측정자 중 식생활설문 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.smcfoodst x
                     , 스키마.3E3C0E433E3C0E3E28 y
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                   and y.ptno = x.ptno
                   and y.ordr_prrn_ymd = x.ordr_prrn_ymd
                   and y.ordr_ymd is not null
                   and y.cncl_dt is null
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
    ,target as (-- 안압 2회 이상 측정자 중 식생활설문 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.smcfoodst x
                     , 스키마.3E3C0E433E3C0E3E28 y
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20201231','yyyymmdd')
                   and y.ptno = x.ptno
                   and y.ordr_prrn_ymd = x.ordr_prrn_ymd
                   and y.ordr_ymd is not null
                   and y.cncl_dt is null
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
    ,target as (-- 안압 2회 이상 측정자 중 식생활설문 문진 작성
                select x.ptno, x.ordr_prrn_ymd
                  from temp a
                     , 스키마.smcfoodst x
                     , 스키마.3E3C0E433E3C0E3E28 y
                 where x.ptno = a.ptno
                   and x.ordr_prrn_ymd between to_date('20071101','yyyymmdd') and to_date('20160701','yyyymmdd')
                   and y.ptno = x.ptno
                   and y.ordr_prrn_ymd = x.ordr_prrn_ymd
                   and y.ordr_ymd is not null
                   and y.cncl_dt is null
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
