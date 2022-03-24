-- dlgywls
select to_char(a.ordr_ymd,'yyyy') yyyy
     , to_char(a.ordr_ymd,'mm') mm
     , a.pckg_cd
     , a.ctrc_no
     , count(a.ptno) cnt
     , sum(pet_yn) pet_cnt
  from (
        select a.ptno, a.ordr_ymd, a.pckg_cd, substr(a.ctrc_no,1,6) ctrc_no
             , (
                select 1
                  from 스키마.3C15332B3C20431528 x
                 where x.ptno = a.ptno
                   and x.ordr_ymd = a.ordr_ymd
                   and x.codv_Cd = 'G'
                   and X.ORDR_CD LIKE 'NX1%'
                   and nvl(x.dc_dvsn_cd,'N') = 'N'
               ) PET_YN
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C3C5B0C233C3E28 b
         where a.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.cncl_dt is null
           and substr(a.ctrc_no,1,6) in ('100136','100138','100139','100140')
           and b.pckg_cd = a.pckg_cd
           and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4','5')
       ) a
 group by to_char(a.ordr_ymd,'yyyy')
     , to_char(a.ordr_ymd,'mm')
     , a.pckg_cd
     , a.ctrc_no
