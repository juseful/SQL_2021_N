-- whtnwls
select to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , 펑션.등록번호변환펑션(a.ptno) id
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , (
        select min(to_char(x.ordr_ymd,'yyyy-mm-dd'))
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno 
           and x.ordr_ymd between to_date('20010101','yyyymmdd') and a.ordr_ymd
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
       ) fst_ordr_ymd
     , a.ordr_ymd - 
       (
        select min(x.ordr_ymd)
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno 
           and x.ordr_ymd between to_date('20010101','yyyymmdd') and a.ordr_ymd
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
       ) duration
     , round((a.ordr_ymd - 
       (
        select min(x.ordr_ymd)
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno 
           and x.ordr_ymd between to_date('20010101','yyyymmdd') and a.ordr_ymd
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
       )
       )/365,2) duration_yrs
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and c.ptno = a.ptno
