-- qkrdmsdk
select /*+ index(a 3C15332B3C20431528_i04) */
       a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , to_char(a.ordr_ymd,'yyyy-mm') mths
     , b.pckg_cd
  from 스키마.3C15332B3C20431528 a
     , 스키마.3E3C0E433E3C0E3E28 b
 where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.ordr_cd = 'BL310101'
   and a.codv_cd = 'G'
   and a.excf_cd = 'SL'
   and nvl(a.dc_dvsn_cd,'N') != 'X'
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.cncl_dt is null
 group by a.ptno, a.ordr_ymd, b.pckg_cd
 having 펑션.나이계산펑션(a.ptno,a.ordr_ymd) < 18
