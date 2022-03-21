-- dlwlsdud
-- 조영제 CT대상자
select /*+ index(a 3C15332B3C20431528_i04) */
       b.ptno
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , b.pckg_cd
     , a.ordr_cd
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.ordr_cd
       ) ordr_nm
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XCPHE4' -- 페니라민
           and x.cncl_dt is null
       ) XCPHE4
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XEPIN'  --에피네프린
           and x.cncl_dt is null
       ) XEPIN
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XHCS'   -- 코티소루
           and x.cncl_dt is null
       ) XHCS
     , (
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and x.exmn_cd = a.ordr_cd
           and x.mdcr_dprt_cd = '113000'
       ) side_pre
     , (
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and x.exmn_cd = a.ordr_cd
           and x.AFTE_MDCR_DPRT_CD = '113000'
       ) side_post
     , (-- 과거 조영제 side 여부
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd < a.ordr_ymd
           and x.exmn_cd like 'RC%'
           and x.AFTE_MDCR_DPRT_CD = '113000'
       ) past_side_post
     , (
        select max(decode(x.exmn_cd,'SM0101',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM0101'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM0101
     , (
        select max(decode(x.exmn_cd,'SM0102',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM0102'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM0102
     , (
        select max(decode(x.exmn_cd,'SM316001',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM316001'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM316001
     , (
        select max(decode(x.exmn_cd,'BL2011',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL2011'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL2011
     , (
        select max(decode(x.exmn_cd,'BL201806',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201806'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201806
     , (
        select max(decode(x.exmn_cd,'BL201807',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201807'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201807
     , (
        select max(decode(x.exmn_cd,'BL201809',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201809'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201809
     , (
        select max(decode(x.exmn_cd,'BL3140',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL3140'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL3140
     , (
        select max(decode(x.exmn_cd,'BL3121',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL3121'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL3121
     , (
        select count(x.ordr_ymd)
          from 스키마.3C15332B3C20431528 x
         where x.ptno = a.ptno
           and x.ordr_ymd < a.ordr_ymd
           and x.ordr_cd in (
                             select ordr_cd
                               from 스키마.3E3C3C204315434728
                              where annx_exrm_cd = 'AR091'
                                 or cahs_man_exrm_cd = 'M151'
                            )
           and x.codv_cd = 'G'
           and x.excf_cd = 'SR'
           and nvl(x.dc_dvsn_cd,'N') = 'N'
       ) contrast_ct_cnt
  from 스키마.3C15332B3C20431528 a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.ordr_cd in (
                     select ordr_cd
                       from 스키마.3E3C3C204315434728
                      where annx_exrm_cd = 'AR091'
                         or cahs_man_exrm_cd = 'M151'
                    )
   and a.codv_cd = 'G'
   and a.excf_cd = 'SR'
   and nvl(a.dc_dvsn_cd,'N') = 'N'
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.apnt_no = a.hlsc_apnt_no
   and c.ptno = a.ptno

-- 조영제 MRI 대상자
select /*+ index(a 3C15332B3C20431528_i04) */
       b.ptno
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , b.pckg_cd
     , a.ordr_cd
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.ordr_cd
       ) ordr_nm
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XCPHE4' -- 페니라민
           and x.cncl_dt is null
       ) XCPHE4
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XEPIN'  --에피네프린
           and x.cncl_dt is null
       ) XEPIN
     , (
        select distinct 'Y'
          from 스키마.3E3C0E5B0C233C1528 x
         where x.apnt_no = b.apnt_no
           and x.pckg_exmn_cd = 'XHCS'   -- 코티소루
           and x.cncl_dt is null
       ) XHCS
     , (
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and x.exmn_cd = a.ordr_cd
           and x.mdcr_dprt_cd = '113000'
       ) side_pre
     , (
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and x.exmn_cd = a.ordr_cd
           and x.AFTE_MDCR_DPRT_CD = '113000'
       ) side_post
     , (-- 과거 조영제 side 여부
        select 'Y'
          from 스키마.3E433E3F1543333C28 x
         where x.ptno = a.ptno
           and x.ordr_ymd < a.ordr_ymd
           and x.exmn_cd like 'RM%'
           and x.AFTE_MDCR_DPRT_CD = '113000'
       ) past_side_post
     , (
        select max(decode(x.exmn_cd,'SM0101',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM0101'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM0101
     , (
        select max(decode(x.exmn_cd,'SM0102',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM0102'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM0102
     , (
        select max(decode(x.exmn_cd,'SM316001',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'SM316001'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) SM316001
     , (
        select max(decode(x.exmn_cd,'BL2011',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL2011'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL2011
     , (
        select max(decode(x.exmn_cd,'BL201806',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201806'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201806
     , (
        select max(decode(x.exmn_cd,'BL201807',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201807'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201807
     , (
        select max(decode(x.exmn_cd,'BL201809',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL201809'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL201809
     , (
        select max(decode(x.exmn_cd,'BL3140',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL3140'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL3140
     , (
        select max(decode(x.exmn_cd,'BL3121',x.exrs_ncvl_vl,''))
          from 스키마.3E3243333E2E143C28 x
         where x.ptno = b.ptno
           and x.ordr_ymd = b.ordr_ymd
           and exmn_cd = 'BL3121'
           and nvl(x.exrs_updt_yn,'N') != 'Y'
       ) BL3121
     , (
        select count(x.ordr_ymd)
          from 스키마.3C15332B3C20431528 x
         where x.ptno = a.ptno
           and x.ordr_ymd < a.ordr_ymd
           and x.ordr_cd in (
                             '코드'
                            )
           and x.codv_cd = 'G'
           and x.excf_cd = 'SR'
           and nvl(x.dc_dvsn_cd,'N') = 'N'
       ) contrast_mri_cnt
  from 스키마.3C15332B3C20431528 a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.ordr_cd in (
                     '코드'
                    )
   and a.codv_cd = 'G'
   and a.excf_cd = 'SR'
   and nvl(a.dc_dvsn_cd,'N') = 'N'
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.apnt_no = a.hlsc_apnt_no
   and c.ptno = a.ptno
