-- rkdalfk
-- 년도별로 분할작업 함.
-- uncleaned_data, ADD DATA. SM010502, BS2231
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
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
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(d.exmn_cd,'SM010502',d.exrs_ncvl_vl,'')) SM010502
     , max(decode(d.exmn_cd,'BS2231',TO_CHAR(D.EXRS_CTN),'')) BS2231
  from temp a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.3E3243333E2E143C28 d
     , 스키마.0E5B5B285B28402857 e
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and d.ptno = b.ptno
   and d.ordr_ymd = b.ordr_ymd
   and d.exmn_cd IN ('SM010502','BS2231')
   and nvl(d.exrs_updt_yn,'N') != 'Y'
   and exists (
               select /*+ INDEX(X 3C15332B3C20431528_PK) */
                      'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = d.ptno
                  and x.ordr_ymd = d.ordr_ymd
                  and x.ordr_sno = d.ordr_sno
                  and x.codv_cd = 'G'
              )
   and e.ptno = a.ptno
 group by b.ptno
     , b.ordr_ymd
     , e.gend_cd
     , a.fst_abd_us_ymd
