-- dlgywls
-- 채혈, 내시경, SET검사 등 제외
with temp as (
              select 펑션.등록번호변환펑션(c.ptno) id
                   , to_char(c.ordr_ymd,'yyyy') yyyy
                   , to_char(c.ordr_ymd,'yyyy-mm-dd') ordr_ymd
                   , TO_CHAR(c.ordr_ymd,'D') DAY
                   , DECODE(TO_CHAR(c.ordr_ymd,'D'),'1','주말','7','주말','주중') DAY_GUBUN
                   , c.ordr_cd
                   , (
                      select x.annx_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) annx_exrm_cd
                   , (
                      select x.cahs_man_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_man_exrm_cd
                   , (
                      select x.cahs_feml_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_feml_exrm_cd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where ((a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd'))
                     or
                      (a.ordr_ymd between to_date('20210501','yyyymmdd') and to_date('20210831','yyyymmdd'))
                     )
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and b.pckg_type_cd != '7'
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd not in (-- 별도집계가 필요한 처방
                                       'BL613101','RG012L' --소변검사, 흉부촬영 중복건수 제외
                                       -- 중복건수 제외
                                      ,'SM0130', 'SM0150', 'SM0160', 'SM010502','SM0600' -- 신체측정
                                      ,'SM0210' -- 안저촬영
                                      ,'SM1801' -- 부인과 내진
                                      ,'SM1810' -- 골밀도 수치
                                      ,'SM0350' -- 청력
                                      ,'SM0520' -- 경동맥
                                      ,'SM0671' -- 복부내장지방
                                      ,'SM3001', 'SM3002', 'SM3100' -- 운동부하
                                       -- 내시경 처방 제외
                                      ,'BS4100','BS4141','BS4416GSM','BS4417','BS4152','BS4148','BS4480','BS4480GSM','BS4490GSM'
                                      )
                 and c.enfr_dt is not null
                 and not exists (-- 채혈 건수만 별도로 확인
                                 select 'y'
                                   from 스키마.3E3C3C204315434728 x
                                  where x.ordr_cd = c.ordr_cd
                                    and x.cahs_man_exrm_cd = 'M02'
                                )
             )
select a.yyyy
     , a.cahs_feml_exrm_type_nm
     , a.day_gubun
     , count(a.id)
  from (
        select a.*
             , (
                select max(x.exrm_type_nm)
                  from 스키마.3E3C3C3C33153E2B28 x
                 where x.hlsc_exrm_cd = a.cahs_feml_exrm_cd
               ) cahs_feml_exrm_type_nm
          from temp a
         where not exists (
                           select 'Y'
                             from 스키마.3E3C3C3C33153E2B28 x
                            where x.hlsc_exrm_cd = a.annx_exrm_cd
                              and x.exrm_type_cd in ('R51','R52','R53','R54','R60','R99','RMC','RR1','RR3','RRR','YAL','R093','R094','R260','R270','R28','R302','R31','R39','R40','R043','R142','R15','R271')
                          )
       ) a
 where a.cahs_feml_exrm_type_nm is not null
 group by a.yyyy
     , a.cahs_feml_exrm_type_nm
     , a.day_gubun

-- 채혈만
with temp as (
              select 펑션.등록번호변환펑션(c.ptno) id
                   , to_char(c.ordr_ymd,'yyyy') yyyy
                   , to_char(c.ordr_ymd,'yyyy-mm-dd') ordr_ymd
                   , TO_CHAR(c.ordr_ymd,'D') DAY
                   , DECODE(TO_CHAR(c.ordr_ymd,'D'),'1','주말','7','주말','주중') DAY_GUBUN
                   , c.ordr_cd
                   , (
                      select x.annx_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) annx_exrm_cd
                   , (
                      select x.cahs_man_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_man_exrm_cd
                   , (
                      select x.cahs_feml_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_feml_exrm_cd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where ((a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd'))
                     or
                      (a.ordr_ymd between to_date('20210501','yyyymmdd') and to_date('20210831','yyyymmdd'))
                     )
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and b.pckg_type_cd != '7'
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
--                 and c.ordr_cd not in (-- 별도집계가 필요한 처방
--                                       'BL613101','RG012L' --소변검사, 흉부촬영 중복건수 제외
--                                       -- 내시경 처방 제외
--                                      ,'BS4100','BS4141','BS4416GSM','BS4417','BS4152','BS4148','BS4480','BS4480GSM','BS4490GSM'
--                                      )
--                 and c.enfr_dt is not null
                 and exists (-- 채혈 건수만 별도로 확인
                                 select 'y'
                                   from 스키마.3E3C3C204315434728 x
                                  where x.ordr_cd = c.ordr_cd
                                    and x.cahs_man_exrm_cd = 'M02'
                                )
             )
select a.yyyy
     , a.cahs_feml_exrm_type_nm
     , a.day_gubun
     , count(a.id)
  from (
        select A.ID
              ,A.YYYY
              ,A.ORDR_YMD
              ,A.DAY
              ,A.DAY_GUBUN
              ,A.ANNX_EXRM_CD
              ,A.CAHS_MAN_EXRM_CD
              ,A.CAHS_FEML_EXRM_CD
             , (
                select max(x.exrm_type_nm)
                  from 스키마.3E3C3C3C33153E2B28 x
                 where x.hlsc_exrm_cd = a.cahs_feml_exrm_cd
               ) cahs_feml_exrm_type_nm
          from temp a
         where not exists (
                           select 'Y'
                             from 스키마.3E3C3C3C33153E2B28 x
                            where x.hlsc_exrm_cd = a.annx_exrm_cd
                              and x.exrm_type_cd in ('R51','R52','R53','R54','R60','R99','RMC','RR1','RR3','RRR','YAL','R093','R094','R260','R270','R28','R302','R31','R39','R40','R043','R142','R15')
                          )
         group by A.ID
              ,A.YYYY
              ,A.ORDR_YMD
              ,A.DAY
              ,A.DAY_GUBUN
              ,A.ANNX_EXRM_CD
              ,A.CAHS_MAN_EXRM_CD
              ,A.CAHS_FEML_EXRM_CD
       ) a
 where a.cahs_feml_exrm_type_nm is not null
 group by a.yyyy
     , a.cahs_feml_exrm_type_nm
     , a.day_gubun

-- 내시경 검사건수
with temp as (
              select 펑션.등록번호변환펑션(c.ptno) id
                   , to_char(c.ordr_ymd,'yyyy') yyyy
                   , to_char(c.ordr_ymd,'yyyy-mm-dd') ordr_ymd
                   , TO_CHAR(c.ordr_ymd,'D') DAY
                   , DECODE(TO_CHAR(c.ordr_ymd,'D'),'1','주말','7','주말','주중') DAY_GUBUN
                   , c.ordr_cd
                   , (
                      select x.annx_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) annx_exrm_cd
                   , (
                      select x.cahs_man_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_man_exrm_cd
                   , (
                      select x.cahs_feml_exrm_cd
                        from 스키마.3E3C3C204315434728 x
                       where x.ordr_cd = c.ordr_cd
                     ) cahs_feml_exrm_cd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where ((a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd'))
                     or
                      (a.ordr_ymd between to_date('20210501','yyyymmdd') and to_date('20210831','yyyymmdd'))
                     )
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and b.pckg_type_cd != '7'
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and c.codv_cd = 'G'
                 and c.ordr_cd in (-- 별도집계가 필요한 처방
                                       -- 내시경 처방
                                      'BS4100','BS4141','BS4416GSM','BS4417','BS4152','BS4148','BS4480','BS4480GSM','BS4490GSM'
                                      )
                 and c.enfr_dt is not null
             )
select a.yyyy
     , a.ordr_cd
     , a.day_gubun
     , count(a.id)
  from temp a
  group by a.yyyy
     , a.ordr_cd
     , a.day_gubun
