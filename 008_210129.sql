-- rhwldnjs
select a.CTRC_NO
     , a.HLSC_CNPL_CD
     , (
        select x.cnpl_nm
          from 스키마.3E3C194720473C5B28 x
         where x.hlsc_cnpl_cd = a.hlsc_cnpl_cd
       ) hlsc_cnpl_nm
     , to_char(a.CTRC_YMD,'yyyy-mm-dd') ctrc_ymd
     , to_char(a.STRT_YMD,'yyyy-mm-dd') STRT_YMD
     , to_char(a.FNSH_YMD,'yyyy-mm-dd') FNSH_YMD
     , a.PRRN_PRSN_CNT
     , a.MOBR_YN
     , a.RMRK_CTN
     , a.LIMT_AMT
     , a.MNPY_PYMN_MTHD_CD
     , a.MNPY_PYMN_MTHD_DETL_CD
     , a.ALCM_YN
     , a.CLAM_UNSL_CTN
     , a.BILL_ASGN_DVSN_CD
     , a.OFDC_SNDG_DVSN_CD
     , a.FRST_RGSR_ID
     , a.FRST_RGST_IP
     , a.FRST_RGST_DT
     , a.FRST_RGST_SMCP_ID
     , a.FRST_RGST_SMSP_ID
     , a.LAST_UPDR_ID
     , a.LAST_UPDT_IP
     , a.LAST_UPDT_DT
     , a.LAST_UPDT_SMCP_ID
     , a.LAST_UPDT_SMSP_ID
     , a.INIF_OFFR_AGRM_YN
     , a.EMPL_YN
  from 스키마.3E3C19472047204028 a
 where a.strt_ymd > to_date('20201231','yyyymmdd')
    or a.fnsh_ymd > to_date('20201231','yyyymmdd')
 order by 2,5,6 
