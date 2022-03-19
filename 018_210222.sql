-- tlswldus
select a.ptno
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,sysdate) age
     , to_char(a.psbl_ymd,'yyyy-mm-dd') psbl_ymd
     , a.pckg_cd
     , b.pckg_nm
     , b.pckg_type_cd
     , to_char(c.pre_ordr_ymd,'yyyy-mm-dd') pre_ordr_ymd
     , c.pre_pckg_cd
     , c.pre_pckg_nm
     , c.pre_pckg_type_cd
     , c.pre_cstz_hlsc_crdt_id
     , c.pre_cstz_hlsc_crdt_nm
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , (-- 19년도 정규건진자
        select a.ordr_ymd pre_ordr_ymd
             , a.ptno
             , a.pckg_cd pre_pckg_cd
             , b.pckg_nm pre_pckg_nm
             , b.pckg_type_cd pre_pckg_type_cd
             , a.cstz_hlsc_crdt_id pre_cstz_hlsc_crdt_id
             , (
                select x.user_nm
                  from 스키마.47472E3E43155B2928 x
                 where x.user_id = a.cstz_hlsc_crdt_id
               ) pre_cstz_hlsc_crdt_nm
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           and a.cncl_dt is null
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
       ) c
     , 스키마.0E5B5B285B28402857 d
 where a.psbl_ymd between to_date('20200201','yyyymmdd') and to_date('20201231','yyyymmdd') -- 보류일자 기준으로 조회
   and a.ordr_prrn_ymd is null
   and a.ordr_ymd is null
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and b.pckg_type_cd = '0'
   and c.ptno = a.ptno
   and not exists (-- 21년 예약 및 수진자 제외
                   select 'Y'
                     from 스키마.3E3C0E433E3C0E3E28 x
                        , 스키마.3E3C3C5B0C233C3E28 y
                    where x.ptno = c.ptno
                      and X.ORDR_PRRN_YMD between to_date('20210101','yyyymmdd') and to_date('20211231','yyyymmdd')
                      and x.cncl_dt is null
                      and y.pckg_cd = x.pckg_cd
                      and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                  )
   and d.ptno = a.ptno
