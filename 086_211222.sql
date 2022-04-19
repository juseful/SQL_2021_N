-- rkddmstnr
-- 정밀 단체건진자
select a.ptno
     , d.ptnt_nm
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , b.pckg_cd
     , c.pckg_type_cd
     , b.ctrc_no
     , substr(b.ctrc_no,1,6) cnpl_cd
     , (
        select x.cnpl_nm
          from 스키마.3E3C194720473C5B28 x
         where substr(b.ctrc_no,1,6) = x.hlsc_cnpl_cd
       ) cnpl_nm
     , (
        select distinct 'Y'
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno
           and x.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and (y.pckg_type_cd like '1%'
               or
                y.pckg_type_cd = '3C'
               )
       ) "2019YN"
     , (
        select distinct 'Y'
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno
           and x.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and (y.pckg_type_cd like '1%'
               or
                y.pckg_type_cd = '3C'
               )
       ) "2020YN"
     , (
        select count(a.ordr_ymd)
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno
           and x.ordr_ymd <= a.ordr_ymd
           and x.cncl_dt is null
           and y.pckg_cd = x.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
       ) SM_PKG_CNT
  from (
        select a.ptno, max(a.ordr_ymd) ordr_ymd
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20210101','yyyymmdd') and to_date('20211222','yyyymmdd')
           and a.cncl_dt is null
           and a.pckg_cd = b.pckg_cd
           and b.pckg_type_cd in ('1','3C')
           and b.pckg_cd in ('MG10'    ,'MG102'    ,'MG103'    ,'FG10'
                            ,'MG15'    ,'MG152'    ,'MG153'    ,'FG15'    ,'FG152'    ,'FG153'
                            ,'BYM1'    ,'BYM2'    ,'BYM4'    ,'BXM1'    ,'BXM3'    ,'BXM4'
                            ,'MVH'    ,'MVB'    ,'MVP'    ,'FVH'    ,'FVB'    ,'FVP'
                            ,'SBY'    ,'SCY'    ,'SPY'    ,'SBX'    ,'SCX'    ,'SPX'
                            )
           and a.ctrc_no is not null
         group by a.ptno
       ) a
       , 스키마.3E3C0E433E3C0E3E28 b
       , 스키마.3E3C3C5B0C233C3E28 c
       , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and c.pckg_cd = b.pckg_cd
   and c.pckg_type_cd in ('1','3C')
   and c.pckg_cd in ('MG10'    ,'MG102'    ,'MG103'    ,'FG10'
                    ,'MG15'    ,'MG152'    ,'MG153'    ,'FG15'    ,'FG152'    ,'FG153'
                    ,'BYM1'    ,'BYM2'    ,'BYM4'    ,'BXM1'    ,'BXM3'    ,'BXM4'
                    ,'MVH'    ,'MVB'    ,'MVP'    ,'FVH'    ,'FVB'    ,'FVP'
                    ,'SBY'    ,'SCY'    ,'SPY'    ,'SBX'    ,'SCX'    ,'SPX'
                    )
   and d.ptno = a.ptno
