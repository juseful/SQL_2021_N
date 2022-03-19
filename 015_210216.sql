-- dlwlsdud
select '1.검사실코멘트' grp
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , a.ptno
     , a.pckg_cd
     , b.inpt_ctn
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C23432F47203C28 b
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.rprs_apnt_no = a.rprs_apnt_no
   and b.hlsc_exrm_cd in (
                        'AR09' --비조영 CT
                       ,'AR091' --조영 CT
                       ,'CF07' --CT
                       ,'CM19' --CT
                       ,'CU19' --CT
                       ,'F29' --비조영 CT
                       ,'M15' --비조영 CT
                       ,'M151' --조영 CT
                       ,'MT19' --외래CT
                       ,'T19' --외래CT
                       )
   and b.inpt_ctn like '%전처치%'
 group by a.ordr_ymd, a.ptno, a.pckg_cd, b.inpt_ctn
 order by a.ordr_ymd, a.ptno

select '2.선택처방'
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , a.ptno
     , a.pckg_cd
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C0E5B0C233C1528 b
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.apnt_no = a.apnt_no
   and b.pckg_exmn_cd in ('XCPHE4' -- 페니라민
                         ,'XEPIN'  --에피네프린
                         ,'XHCS'   -- 코티소루
                         )
   and b.cncl_dt is null
 group by a.ordr_ymd, a.ptno, a.pckg_cd

select '3.후처치대상' grp
     , a.PTNO --환자번호
     , to_char(a.ORDR_YMD,'yyyy-mm-dd') ordr_ymd --처방일자
     , a.ORDR_SNO --처방일련번호
     , a.SDEF_SNO --부작용일련번호
     , a.CNMD_CD --조영제코드
     , a.EXMN_CD --검사코드
     , a.TABO_YN --금기여부
     , a.DAT_NO --DAT번호
     , a.INTL_YN --초기여부
     , a.OTRS_HSPT_YN --타병원여부
     , a.ASTH_CD --천식코드
     , a.VEIN_WKNS_CD --정맥약화코드
     , a.SDEF_PRBL_CD --부작용문제점코드
     , a.PRBL_ETC_DETL_CD --문제점기타상세코드
     , a.PRVS_TX_YN --사전처치여부
     , a.SBCD_YN --SUBCIDE여부
     , a.MDCR_DPRT_CD --진료부서코드
     , a.CNDR_ID --확인의사ID
     , a.TX_PADV_CD --처치장소구분코드
     , a.SDEF_TXOR_DVSN_CMBN_CTN1 --부작용처치처방구분결합내용1
     , a.SDEF_TXOR_DVSN_CMBN_CTN2 --부작용처치처방구분결합내용2
     , a.SDEF_TXOR_DVSN_CMBN_CTN3 --부작용처치처방구분결합내용3
     , a.SDEF_TXOR_DVSN_CMBN_CTN4 --부작용처치처방구분결합내용4
     , a.SDEF_RESN_CMBN_CTN1 --부작용사유결합내용1
     , a.SDEF_RESN_CMBN_CTN2 --부작용사유결합내용2
     , a.SDEF_RESN_CMBN_CTN3 --부작용사유결합내용3
     , a.SDEF_RESN_CMBN_CTN4 --부작용사유결합내용4
     , a.SDEF_RESN_CMBN_CTN5 --부작용사유결합내용5
     , a.ENFR_DT --시행일시
     , a.CNMD_SDEF_EXCT_LCTN_CD1 --조영제부작용실행위치코드1
     , a.CNMD_SDEF_EXCT_LCTN_CD2 --조영제부작용실행위치코드2
     , a.CNMD_SDEF_EXCT_LCTN_CD3 --조영제부작용실행위치코드3
     , a.EXMN_LCDV_CD --검사위치구분코드
     , a.BR_IMPT_ID --BR실시자ID
     , a.POST_TX_CD --Post처치코드
     , a.AFTE_MDCR_DPRT_CD --후처치진료부서코드
     , a.AFTE_MDDR_ID --후처치진료의사ID
     , a.AFSD_TX_ORDV_CD1 --후처치부작용처치처방구분코드1
     , a.AFSD_TX_ORDV_CD2 --후처치부작용처치처방구분코드2
     , a.AFSD_TX_ORDV_CD3 --후처치부작용처치처방구분코드3
     , a.AFSD_TX_ORDV_CD4 --후처치부작용처치처방구분코드4
     , a.AFSD_TX_ORDV_CD5 --후처치부작용처치처방구분코드5
     , a.AFSD_RESN_CD1 --후처치부작용사유코드1
     , a.AFSD_RESN_CD2 --후처치부작용사유코드2
     , a.AFSD_RESN_CD3 --후처치부작용사유코드3
     , a.AFSD_RESN_CD4 --후처치부작용사유코드4
     , a.AFSD_RESN_CD5 --후처치부작용사유코드5
     , a.RN_IMPT_ID --RN실시자ID
     , a.AFSD_TX_OREX_LCTN_CD1 --후처치부작용처치처방실행위치코드1
     , a.AFSD_TX_OREX_LCTN_CD2 --후처치부작용처치처방실행위치코드2
     , a.AFSD_TX_OREX_LCTN_CD3 --후처치부작용처치처방실행위치코드3
     , a.AFTE_BR_IMPT_ID --후처치BR실시자ID
     , a.PTNT_SDEF_SIMS_CLSF_CD --환자부작용중증도분류코드
     , a.SMRT_YN --SMART여부
     , a.CPR_YN --CPR여부
     , a.RMRK_CTN --비고내용
     , a.FRST_RGSR_ID --최초등록자ID
     , a.FRST_RGST_IP --최초등록IP
     , a.FRST_RGST_DT --최초등록일시
     , a.FRST_RGST_SMCP_ID --최초등록SMC클라이언트프로그램ID
     , a.FRST_RGST_SMSP_ID --최초등록SMC서버프로그램ID
     , a.LAST_UPDR_ID --최종수정자ID
     , a.LAST_UPDT_IP --최종수정IP
     , a.LAST_UPDT_DT --최종수정일시
     , a.LAST_UPDT_SMCP_ID --최종수정SMC클라이언트프로그램ID
     , a.LAST_UPDT_SMSP_ID --최종수정SMC서버프로그램ID
     , a.SDEF_FLUP_DT --부작용FollowUp일시
     , a.SDEF_MNGN_ASNU_ID --부작용조치담당간호사ID
     , a.SDEF_DSCR_RCVR_CTN --부작용설명수신자내용
     , a.SDEF_MNGN_CASB_CTN --부작용조치주의사항내용
     , a.EXVS_FLUP_DT --혈관외부누출FollowUp일시
     , a.EXVS_MNGN_ASNU_ID --혈관외부누출조치담당간호사ID
     , a.EXVS_DSCR_RCVR_CTN --혈관외부누출설명수신자내용
     , a.EXVS_MNGN_CASB_CTN --혈관외부누출조치주의사항내용
     , a.AFTE_EXMN_AFSS_CTN --후처치검사이후상태내용
     , a.AFTE_GOHM_DT --후처치귀가일시
     , a.AFTE_ASGN_ID --후처치담당자ID
     , a.AFTE_TRSF_PTSS_CTN --후처치이송환자상태내용
     , a.AFTE_TRSF_PLAC_CTN --후처치이송장소내용
     , a.AFTE_TRSF_MTHD_CTN --후처치이송방법내용
     , a.COST_CTN --의식상태내용
     , a.MNTG_KEEP_YN --모니터링유지여부
     , a.O2_KEEP_YN --산소유지여부
     , a.VEIJ_KEEP_YN --정맥주사유지여부
     , a.TRSF_MENS_CTN --이송수단내용
     , a.TRSF_VLTN_CTN --이송평가내용
     , a.EXVS_DVSN_CD --혈관외부누출구분코드
     , a.EXVS_RGSD_SITE_CTN --혈관외부누출우측부위내용
     , a.EXVS_LFSD_SITE_CTN --혈관외부누출좌측부위내용
     , a.EXVS_BRDH_SIZE_VL --혈관외부누출가로크기값
     , a.EXVS_VRTC_SIZE_VL --혈관외부누출세로크기값
     , a.EXVS_VLM_VL --혈관외부누출용량값
     , a.EXVS_INRN_MNGM_CTN --혈관외부누출삽입관리내용
     , a.EXVS_ENHN_MNGM_CTN --혈관외부누출보완관리내용
     , a.EXVS_TX_SIMPLE_DRSN_YN --혈관외부누출처치간편드레싱여부
     , a.EXVS_TX_CLPC_YN --혈관외부누출처치냉찜질여부
     , a.EXVS_TX_BNEL_YN --혈관외부누출처치탄력붕대여부
     , a.EXVS_TX_ETC_YN --혈관외부누출처치기타여부
     , a.EXVS_TX_ETC_CTN --혈관외부누출처치기타내용
     , a.EXVS_DSCV_PNTM_VL --혈관외부누출발견시점값
     , a.EXVS_IFSN_SPED_VL --혈관외부누출주입속도값
     , a.EXVS_RDGR_CTN --혈관외부누출방사선사내용
  from 스키마.3E433E3F1543333C28 a
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_Date('20201231','yyyymmdd')
   and a.AFTE_MDCR_DPRT_CD = '113000'
   and a.mdcr_dprt_cd is null
