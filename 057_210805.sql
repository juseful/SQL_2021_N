-- qkrdmsdk
select A.EXMN_CD
,A.HLSC_RSLT_CD
,A.RSLT_CD_NM
,A.RFRC_SBJC_CTN
,A.ABNR_OPNN_YN
,A.CSTZ_HLSC_ABNR_OPNN_YN
,A.FRST_RGSR_ID
,A.FRST_RGST_IP
,to_char(A.FRST_RGST_DT,'yyyy-mm-dd hh24:mi:ss') FRST_RGST_DT
,A.FRST_RGST_SMCP_ID
,A.FRST_RGST_SMSP_ID
,A.LAST_UPDR_ID
,A.LAST_UPDT_IP
,to_char(A.LAST_UPDT_DT,'yyyy-mm-dd hh24:mi:ss') LAST_UPDT_DT
,A.LAST_UPDT_SMCP_ID
,A.LAST_UPDT_SMSP_ID
,A.CSTZ_CYCL_VL
,A.CSTZ_CYCL_RESN_CTN
,A.RSLT_CD_FVRT_CTN
,A.CANC_YN
,A.HLSC_RSLT_CD_USE_YN
,A.HLSC_RSLT_CLSF_CTN
,A.HLSC_ANRP_INLS_YN
  from 스키마.3E3C4743282B284728 a
 where exmn_cd = 'BS2111'
 
select A.EXMN_CD
,A.HLSC_RSLT_CD
,A.JDGN_CD
,A.UPLM_LWLM_DVSN_CD
,A.JDGN_KIND_CD
,A.JDGN_CTN
,A.ABNR_OPNN_YN
,A.JDGN_PERD_EN
,A.PERD_KIND_CD
,A.IMDT_RERN_YN
,A.TUMR_MNGM_TRGT_YN
,A.SPCC_DISS_MNGM_TRGT_YN
,A.REGN_HSPT_SLCT_YN
,A.MCDP_CD
,A.NXTR_PCKG_CD
,A.MDCR_IPRG_YN
,A.TRCK_EXMN_YN
,A.ENSN_JDGN_CTN
,A.CHRT_JDGN_CTN
,A.ETC_ADVC_SBJC_CTN
,A.JPNS_JDGN_CTN
,A.RSLN_JDGN_CTN
,A.USE_YN
,A.FRST_RGSR_ID
,A.FRST_RGST_IP
,to_char(A.FRST_RGST_DT,'yyyy-mm-dd hh24:mi:ss') FRST_RGST_DT
,A.FRST_RGST_SMCP_ID
,A.FRST_RGST_SMSP_ID
,A.LAST_UPDR_ID
,A.LAST_UPDT_IP
,to_char(A.LAST_UPDT_DT,'yyyy-mm-dd hh24:mi:ss') LAST_UPDT_DT
,A.LAST_UPDT_SMCP_ID
,A.LAST_UPDT_SMSP_ID
  from 스키마.3E3C15433E14283C28 A
 where exmn_cd = 'BS2111'