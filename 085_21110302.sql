-- ghkdwjdgP
-- uncleaned variable rslt
with temp as (-- 기본 대상자
              select a.ptno
                   , a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20110101','yyyymmdd') and to_date('20111231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) = '5'
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
     , max(decode(b.exmn_cd,'SM0101',b.exrs_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.exrs_ncvl_vl,'')) SM0102
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
   and b.exmn_cd in ('SM0101','SM0102'
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
