-- whtnwls
select a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , d.gend_cd
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.3C15332B3C20431528 c
     , 스키마.0E5B5B285B28402857 d
 where a.ordr_ymd between to_date('20090901','yyyymmdd') and to_date('20210630','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and c.ptno = a.ptno
   and c.ordr_ymd = a.ordr_ymd
   and c.ordr_cd = 'RM11103C'
   and nvl(c.dc_dvsn_cd,'N') = 'N'
   and a.ptno not in (
                      &not_in_ptno
                     )
   /* 정보 동의여부자만 대상 */
   and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
   and d.ptno = a.ptno
   and substr(d.brrn,1,1) not in ('5','6','7','8')
