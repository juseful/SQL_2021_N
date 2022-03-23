-- wjdwjddbs
SELECT a.ptno
     , 펑션.등록번호변환펑션(a.ptno) id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , a.ordr_cd
     , (
        SELECT 'Y' 
          FROM 스키마.3E3C15433E14332B28 x
         WHERE x.ptno = a.ptno
           AND x.ordr_ymd = a.ordr_ymd
           AND x.exmn_cd = a.ordr_cd
           AND x.hlsc_rslt_cd = '1004' 
       ) bph_yn --       decode(b.hlsc_rslt_cd,'1004','Y','N') BPH_YN
     , (
        SELECT 'Y' 
          FROM 스키마.3E3C15433E14332B28 x
         WHERE x.ptno = a.ptno
           AND x.ordr_ymd = a.ordr_ymd
           AND x.exmn_cd = a.ordr_cd
           AND x.hlsc_rslt_cd IN ('100401','9995') 
       ) mild_bph_yn --       decode(b.hlsc_rslt_cd,'1004','Y','N') BPH_YN
  FROM 스키마.3C15332B3C20431528 a
     , 스키마.0E5B5B285B28402857 b
 WHERE a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   AND a.ordr_cd = 'RS1140'
   AND a.codv_cd = 'G'
   AND nvl(a.dc_dvsn_cd,'N') = 'N'
   AND b.ptno = a.ptno

SELECT a.ptno
     , 펑션.등록번호변환펑션(a.ptno) id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , a.ordr_cd
     , c.exrs_ncvl_vl
  FROM 스키마.3C15332B3C20431528 a
     , 스키마.0E5B5B285B28402857 b
     , 스키마.3E3243333E2E143C28 c
 WHERE a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   AND a.ordr_cd = 'BL3713'
   AND a.codv_cd = 'G'
   AND nvl(a.dc_dvsn_cd,'N') = 'N'
   AND b.ptno = a.ptno
   AND c.ptno = a.ptno
   AND c.ordr_ymd = a.ordr_ymd
   AND c.ordr_sno = a.ordr_sno
   AND nvl(c.exrs_updt_yn,'N') != 'Y'
