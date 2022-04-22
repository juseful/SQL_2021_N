-- qkrdmsdk
select /*+ index(a 3C15332B3C20431528_i04) */
       to_char(a.ordr_ymd,'yyyy') YYYY
     , a.ptno
     , 펑션.등록번호변환펑션(a.ptno) id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , A.ORDR_CD
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.ordr_cd
       ) ordr_nm
     , to_char(a.enfr_dt,'yyyy-mm-dd hh24:mi:ss') enfr_dt
--     , to_char(a.intr_dt,'yyyy-mm-dd hh24:mi:ss') intr_dt
     , to_char(a.rprt_dt,'yyyy-mm-dd hh24:mi:ss') rprt_dt
     , (
        select min(to_char(z.rslt_cnsl_apnt_ymd,'yyyy-mm-dd'))
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
             , 스키마.3E3C15433E47403C28 z
         where x.ptno = a.ptno
           and x.ordr_ymd = a.ordr_ymd
           and y.pckg_cd = x.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
           and z.apnt_no = x.apnt_no
           and z.cnsl_room_no LIKE 'M%'
       ) cnsl_ymd
     , a.indr_id1
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.indr_id1
       ) indr_id1_nm
     , (
        select y.detl_cd_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.4747473C4715153C28 y
         where x.user_id = a.indr_id1 
           and y.comn_grp_cd = 'MNI_009'
           and y.comn_dtls_cd = x.mdcr_dprt_cd
       ) indr_id1_dprt_cd
     , (
        select y.korn_dprt_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.2929292028153C3E28 y
         where x.user_id = a.indr_id1
           and x.mdcr_dprt_cd = y.ocdt_dprt_cd
       ) indr_id1_dprt_nm  
     , a.indr_id2
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.indr_id2
       ) indr_id2_nm
     , (
        select y.detl_cd_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.4747473C4715153C28 y
         where x.user_id = a.indr_id2 
           and y.comn_grp_cd = 'MNI_009'
           and y.comn_dtls_cd = x.mdcr_dprt_cd
       ) indr_id2_dprt_cd
     , (
        select y.korn_dprt_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.2929292028153C3E28 y
         where x.user_id = a.indr_id2
           and x.mdcr_dprt_cd = y.ocdt_dprt_cd
       ) indr_id2_dprt_nm
     , a.indr_id3
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.indr_id3
       ) indr_id3_nm
     , (
        select y.detl_cd_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.4747473C4715153C28 y
         where x.user_id = a.indr_id3 
           and y.comn_grp_cd = 'MNI_009'
           and y.comn_dtls_cd = x.mdcr_dprt_cd
       ) indr_id3_dprt_cd
     , (
        select y.korn_dprt_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.2929292028153C3E28 y
         where x.user_id = a.indr_id3
           and x.mdcr_dprt_cd = y.ocdt_dprt_cd
       ) indr_id3_dprt_nm
  from 스키마.3C15332B3C20431528 a
     , 스키마.0E5B5B285B28402857 b
 where a.ordr_ymd between to_date('20210101','yyyymmdd') and to_date('20211228','yyyymmdd')
   and a.ordr_cd = 'SM0350'
   and a.codv_cd = 'G'
   and a.excf_cd = 'SM'
   and nvl(a.dc_dvsn_cd,'N') !='X'
   and a.enfr_dt is not null
   and b.ptno = a.ptno
