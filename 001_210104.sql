-- rladlsrud
select a.hlsc_cnpl_cd
     , sum(a.nx1001)  nx1001
     , sum(a.rc32542) rc32542
     , sum(a.rc1184)  rc1184
  from (
        select C.*
             , b.hlsc_cnpl_cd
             , case
                    when c.pckg_exmn_cd = 'NX1001'  then 1
                    else 0
               end nx1001
             , case
                    when c.pckg_exmn_cd = 'RC32542' then 1
                    else 0
               end RC32542
             , case
                    when c.pckg_exmn_cd = 'RC1184'  then 1
                    else 0
               end RC1184
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C194720473C5B28 b
             , 스키마.3E3C0E5B0C233C1528 c 
         where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.cncl_dt is null
           and b.hlsc_cnpl_cd = substr(a.ctrc_no,1,6)
           and b.hlsc_cnpl_cd in ('100136','100139')
           and c.apnt_no = a.apnt_no
           and c.cncl_dt is null
           and c.exmn_dvsn_cd = '1' -- 추가
           and c.pckg_exmn_cd in ('NX1001','RC32542','RC1184')
       ) a
 group by a.hlsc_cnpl_cd
 order by 1
