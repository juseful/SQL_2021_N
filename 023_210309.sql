-- dlaudgk
select a.yyyy
     , a.yyyymm
--     , a.ordr_ymd
     , a.hslc_dvsn_cd
     , a.gend_cd
     , a.age
     , count(id) cnt
  from (
select /*+ index(a 3C15332B3C20431528_i04) */
       to_char(a.ordr_ymd,'yyyy')       yyyy
     , to_char(a.ordr_ymd,'yyyy-mm')    yyyymm
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , 펑션.등록번호변환펑션(a.ptno) id
     , c.gend_cd
     , b.hslc_dvsn_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
  from 스키마.3C15332B3C20431528 a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20210228','yyyymmdd')
   and a.ordr_cd = 'RS2010'
   and a.codv_cd = 'G'
   and a.excf_cd = 'SR'
   and nvl(a.dc_dvsn_cd,'N') = 'N'
   and a.enfr_dt is not null
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.apnt_no = a.hlsc_apnt_no
   and c.ptno = a.ptno
       ) a
 group by a.yyyy, a.yyyymm--, a.ordr_ymd
        , a.gend_cd, a.hslc_dvsn_cd, a.age
 order by 1, 2, 3, 4, 5
