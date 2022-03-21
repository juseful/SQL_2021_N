-- tlsakfldk
select a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , a.pckg_cd
     , c.pckg_nm
     , (
        select 'Y'
          from 스키마.3C15332B3C20431528 x
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and x.ordr_cd = 'NX1001'
           and x.codv_cd = 'G'
           and nvl(x.dc_dvsn_cd,'N') = 'N'
           and x.enfr_dt is not null
       ) NX1001_exec_yn
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C0E5B0C233C1528 b
     , 스키마.3E3C3C5B0C233C3E28 c
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and a.pckg_cd in ('SMB','SFB','SMA','SFA')
   and b.apnt_no = a.apnt_no
   and b.pckg_exmn_cd = 'NX1001'
   and b.exmn_dvsn_cd = '1'
   and b.cncl_dt is null
   and c.pckg_cd = a.pckg_cd
