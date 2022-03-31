-- rkdalfk
select a.ptno
     , min(to_char(a.ordr_ymd,'yyyy-mm-dd')) ordr_ymd
     , min(to_char(a.enfr_dt,'yyyy-mm-dd hh24:mi:ss')) enfr_dt
  from 스키마.3C15332B3C20431528 a
 where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.ordr_cd like 'SM04%'
   and a.codv_cd = 'G'
   and a.enfr_dt is not null
   and nvl(a.dc_dvsn_cd,'N') = 'N'
 group by a.ptno
