-- rkdalfk
select a.*
  from (
-- 영양분석 칼로리 계산값
select b.ptno
     , 펑션.등록번호변환펑션(b.ptno) id
     , to_char(b.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , d.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(e.fod_cd,'3A70101',e.ncvl_vl1,'')) "3A70101"
     , max(decode(e.fod_cd,'3A70103',e.ncvl_vl1,'')) "3A70103"
     , max(decode(e.fod_cd,'3A70104',e.ncvl_vl1,'')) "3A70104"
     , max(decode(e.fod_cd,'3A70105',e.ncvl_vl1,'')) "3A70105"
     , max(decode(e.fod_cd,'3A70106',e.ncvl_vl1,'')) "3A70106"
     , max(decode(e.fod_cd,'3A70107',e.ncvl_vl1,'')) "3A70107"
     , max(decode(e.fod_cd,'3A70108',e.ncvl_vl1,'')) "3A70108"
     , max(decode(e.fod_cd,'3A70109',e.ncvl_vl1,'')) "3A70109"
     , max(decode(e.fod_cd,'3A70110',e.ncvl_vl1,'')) "3A70110"
     , max(decode(e.fod_cd,'3A70111',e.ncvl_vl1,'')) "3A70111"
     , max(decode(e.fod_cd,'3A70112',e.ncvl_vl1,'')) "3A70112"
     , max(decode(e.fod_cd,'3A70113',e.ncvl_vl1,'')) "3A70113"
     , max(decode(e.fod_cd,'3A70114',e.ncvl_vl1,'')) "3A70114"
     , max(decode(e.fod_cd,'3A70115',e.ncvl_vl1,'')) "3A70115"
     , max(decode(e.fod_cd,'3A70116',e.ncvl_vl1,'')) "3A70116"
     , max(decode(e.fod_cd,'3A70117',e.ncvl_vl1,'')) "3A70117"
     , max(decode(e.fod_cd,'3A70118',e.ncvl_vl1,'')) "3A70118"
     , max(decode(e.fod_cd,'3A70119',e.ncvl_vl1,'')) "3A70119"
     , max(decode(e.fod_cd,'3A70120',e.ncvl_vl1,'')) "3A70120"
     , max(decode(e.fod_cd,'3A70121',e.ncvl_vl1,'')) "3A70121"
     , max(decode(e.fod_cd,'3A70122',e.ncvl_vl1,'')) "3A70122"
     , max(decode(e.fod_cd,'3A70123',e.ncvl_vl1,'')) "3A70123"
     , max(decode(e.fod_cd,'3A70124',e.ncvl_vl1,'')) "3A70124"
     , max(decode(e.fod_cd,'3A70125',e.ncvl_vl1,'')) "3A70125"
     , max(decode(e.fod_cd,'3A70126',e.ncvl_vl1,'')) "3A70126"
     , max(decode(e.fod_cd,'3A70127',e.ncvl_vl1,'')) "3A70127"
     , max(decode(e.fod_cd,'3A70128',e.ncvl_vl1,'')) "3A70128"
     , max(decode(e.fod_cd,'3A70129',e.ncvl_vl1,'')) "3A70129"
     , max(decode(e.fod_cd,'3A70130',e.ncvl_vl1,'')) "3A70130"
     , max(decode(e.fod_cd,'3A70131',e.ncvl_vl1,'')) "3A70131"
     , max(decode(e.fod_cd,'3A70132',e.ncvl_vl1,'')) "3A70132"
     , max(decode(e.fod_cd,'3A70133',e.ncvl_vl1,'')) "3A70133"
     , max(decode(e.fod_cd,'3A70134',e.ncvl_vl1,'')) "3A70134"
     , max(decode(e.fod_cd,'3A70135',e.ncvl_vl1,'')) "3A70135"
     , max(decode(e.fod_cd,'3A70136',e.ncvl_vl1,'')) "3A70136"
     , max(decode(e.fod_cd,'3A70137',e.ncvl_vl1,'')) "3A70137"
     , max(decode(e.fod_cd,'3A70138',e.ncvl_vl1,'')) "3A70138"
     , max(decode(e.fod_cd,'3A70139',e.ncvl_vl1,'')) "3A70139"
  from 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.0E5B5B285B28402857 d
     , 스키마.3E3C472F2020154328 e
 where b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20210531','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and d.ptno = b.ptno
   /* 외국인 제외 */
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and e.ptno = b.ptno
   and e.ordr_prrn_ymd = b.ordr_ymd
   and e.rprs_apnt_no = b.rprs_apnt_no
 group by b.ptno
     , b.ordr_ymd
     , d.gend_cd
     ) a
 where a."3A70101" < 700
    or a."3A70101" > 4000

-- FFQ 분석결과중 알코올 칼로리
select a.ptno, a.id, a.ordr_ymd, ROUND(sum(a.al_cal),2) al_cal
  from (-- 주종별 칼로리 계산
        SELECT /*+ index(h 3E3C23302E333E0E28_pk) */
               a.ptno
             , a.id
             , a.gend_cd
             , a.age
             , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
             , f.qstn_cd1
             , max(c.calr_qty)*(max(b.fod_base_qty)/100)*nvl(max(d.fod_base_qty),1)*max(e.fod_base_qty) al_cal
          from 
               (
                select b.ptno
                     , 펑션.등록번호변환펑션(b.ptno) id
                     , b.ordr_ymd
                     , d.gend_cd
                     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
                  from 스키마.3E3C0E433E3C0E3E28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                     , 스키마.0E5B5B285B28402857 d
                 where b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and b.ptno in (
                                 )
                   and b.cncl_dt is null
                   and c.pckg_cd = b.pckg_cd
                   and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
                   and d.ptno = b.ptno
                   /* 외국인 제외 */
                   and substr(d.brrn,1,1) not in ('5','6','7','8') 
               ) a
             , 스키마.3E3C23302E333E0E28 f
             , 스키마.3E3C23302E333E3C28 b
             , 스키마.3E2E3E3C472F154728 c
             , 스키마.3E3C23302E333E3C28 d
             , 스키마.3E3C23302E333E3C28 e
         where f.ptno = a.ptno
           and f.ordr_prrn_ymd = a.ordr_ymd
           and f.inpc_cd in ('FOOD','FXXD')
           and f.qstn_cd1 between 'QH32' and 'QH36'
           and f.qstn_cd1 = b.inqy_cd(+)
           and c.ntrt_bsdv_cd = 'A'
           and F.ORDR_PRRN_YMD between trunc(c.CD_RGST_YMD) and trunc(c.CD_VALD_FNSH_YMD)
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') >= trunc(c.CD_RGST_YMD)    -- 180212 KHS
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') <= trunc(c.CD_VALD_FNSH_YMD)
           and b.FOD_CD = c.HSPT_FOD_CD
           and f.INQY_RSPN_CTN2 = d.INQY_CD(+)
           and f.INQY_RSPN_CTN1 = e.INQY_CD(+)
         group by a.ptno
             , a.id
             , a.gend_cd
             , a.age
             , a.ordr_ymd
             , f.qstn_cd1
     ) a
 group
    by a.ptno, a.id, a.ordr_ymd
