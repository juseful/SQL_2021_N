-- tlsakfldk
select 
       (
        select max(x.apfn_ymd)
          from 스키마.0E4747403343151428 x
         where x.ptno = a.ptno
       ) dc_apfn_ymd
     , a.*
  from 스키마.3E3C0E433E3C0E3E28 a
 where a.ordr_prrn_ymd between to_date('20210318','yyyymmdd') and to_date('20210331','yyyymmdd')
   and a.cncl_dt is null
   and a.ctrc_no like '111551%'
   and exists (
               select 'y'
                 from 스키마.0E4747403343151428 x
                where x.ptno = a.ptno
                having max(x.apfn_ymd) < a.ordr_prrn_ymd
              )
