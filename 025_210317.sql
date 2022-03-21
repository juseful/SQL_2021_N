-- rkdrudgml
select a.yyyy
     , a.yyyymm
--     , a.ordr_ymd
     , a.hslc_dvsn_cd
     , a.exam_grp
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
     , a.ordr_cd
     , case 
            when a.ordr_cd like 'RM%' then '01.MRI'
            when a.ordr_cd like 'NX%' then '02.PET'
            when a.ordr_cd like 'BP1A15%' and a.ordr_cd not like 'BP1A156%' then '03.endo_biopsy'
            when a.ordr_cd like 'BP1A156%' then '04.cervix_biopsy'
            when a.ordr_cd like 'BP2E0%' then '04.cervix_biopsy'
            when a.ordr_cd like 'BP8I1%' then '04.cervix_biopsy'
            else ''
       end exam_grp
  from 스키마.3C15332B3C20431528 a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20180101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and (a.ordr_cd like 'RM%' -- MRI
       or
        a.ordr_cd like 'NX%' -- PET
       or
        a.ordr_cd like 'BP1A15%' and a.ordr_cd not like 'BP1A159%' -- 내시경, 부인과 BIOPSY
       or 
        a.ordr_cd like 'BP2E0%' or a.ordr_cd like 'BP8I1%' -- 부인과 BIOPSY
       )
   and a.codv_cd = 'G'
--   and a.excf_cd = 'SR'
   and nvl(a.dc_dvsn_cd,'N') = 'N'
   and a.enfr_dt is not null
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.apnt_no = a.hlsc_apnt_no
   and c.ptno = a.ptno
       ) a
 group by a.yyyy, a.yyyymm--, a.ordr_ymd
        , a.hslc_dvsn_cd, a.exam_grp
 order by 1, 2, 3, 4
