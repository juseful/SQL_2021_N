-- rlaguswn
select a.yyyy
     , a.ordr_cd
     , a.pkggrp
     , count(a.ptno) cnt
  from (
        select /*+ INDEX(A 3C15332B3C20431528_I04) */
               --b.pckg_cd, 
               b.pckg_cd
             , c.pckg_type_cd
             , decode(
                      c.pckg_cd,'SCEM','1.CEO'
                               ,'SCEF','1.CEO'
                               ,decode(c.pckg_type_cd,'4A','1.CEO','2.기타')
                     ) pkggrp
             , to_char(a.ordr_ymd,'yyyy') yyyy
             , a.*
          from 스키마.3C15332B3C20431528 a
             , 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C3C5B0C233C3E28 c
         where a.ordr_ymd between to_date('20180101','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.ordr_cd like 'RM2100%'
           and a.codv_cd = 'G'
           and nvl(a.dc_dvsn_cd,'N') != 'X'
           and b.ptno = a.ptno
           and b.ordr_ymd = a.ordr_ymd
           and b.apnt_no = a.hlsc_apnt_no
           and c.pckg_cd = b.pckg_cd
       ) a
 group by a.yyyy
     , a.ordr_cd
     , a.pkggrp
 order by 1, 2, 3
