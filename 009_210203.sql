-- tlswldus
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw
     , d.gend_cd
     , to_char(a.ordr_ymd,'yyyy') yyyy
     , to_char(a.ordr_ymd,'mm') mm
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , b.pckg_cd
     , b.pckg_nm
     , b.pckg_type_cd
     , c.exmn_cd
     , c.hlsc_rslt_cd
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.3E3C15433E14332B28 c
     , 스키마.0E5B5B285B28402857 d
 where a.ordr_ymd between to_date('20180101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and a.pckg_cd = b.pckg_cd
   and substr(b.pckg_type_cd,1,1) = '0'
   and c.ptno = a.ptno
   and c.ordr_ymd = a.ordr_ymd
   and c.exmn_cd = 'RC1184'
   and c.hlsc_rslt_cd = 'Y200'
   and d.ptno = a.ptno
