-- dlwlsdud
-- DR.H 기간내 데이터
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_no 
     , to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
     , to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
     , x.fh_cancer_stomach_f
     , x.fh_cancer_stomach_m
     , x.fh_cancer_stomach_sib
     , x.fh_cancer_stomach_ch
     , x.fh_cancer_breast_f
     , x.fh_cancer_breast_m
     , x.fh_cancer_breast_sib
     , x.fh_cancer_breast_ch
     , x.fh_cancer_colorectal_f
     , x.fh_cancer_colorectal_m
     , x.fh_cancer_colorectal_sib
     , x.fh_cancer_colorectal_ch
     , x.fh_cancer_lung_f
     , x.fh_cancer_lung_m
     , x.fh_cancer_lung_sib
     , x.fh_cancer_lung_ch
     , x.fh_cancer_uterine_f
     , x.fh_cancer_uterine_m
     , x.fh_cancer_uterine_sib
     , x.fh_cancer_uterine_ch
     , x.fh_cancer_liver_f
     , x.fh_cancer_liver_m
     , x.fh_cancer_liver_sib
     , x.fh_cancer_liver_ch
     , x.fh_cancer_thyroid_f
     , x.fh_cancer_thyroid_m
     , x.fh_cancer_thyroid_sib
     , x.fh_cancer_thyroid_ch
     , x.fh_cancer_ovary_f
     , x.fh_cancer_ovary_m
     , x.fh_cancer_ovary_sib
     , x.fh_cancer_ovary_ch
     , x.fh_cancer_cervix_f
     , x.fh_cancer_cervix_m
     , x.fh_cancer_cervix_sib
     , x.fh_cancer_cervix_ch
     , x.fh_cancer_gb_biliary_f
     , x.fh_cancer_gb_biliary_m
     , x.fh_cancer_gb_biliary_sib
     , x.fh_cancer_gb_biliary_ch
     , x.fh_cancer_bladder_f
     , x.fh_cancer_bladder_m
     , x.fh_cancer_bladder_sib
     , x.fh_cancer_bladder_ch
     , x.fh_cancer_esophagus_f
     , x.fh_cancer_esophagus_m
     , x.fh_cancer_esophagus_sib
     , x.fh_cancer_esophagus_ch
     , x.fh_cancer_prostate_f
     , x.fh_cancer_prostate_m
     , x.fh_cancer_prostate_sib
     , x.fh_cancer_prostate_ch
     , x.fh_cancer_pancreas_f
     , x.fh_cancer_pancreas_m
     , x.fh_cancer_pancreas_sib
     , x.fh_cancer_pancreas_ch
     , x.fh_cancer_other_f
     , x.fh_cancer_other_m
     , x.fh_cancer_other_sib
     , x.fh_cancer_other_ch
     , x.history_tuberculosis
     , x.trt_tuberculosis
     , x.status_tuberculosis
     , x.trt_tuberculosis_op
     , x.tuberculosis_age_diag
  from (-- 기본대상자
        select a.ptno
             , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
             , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
             , a.ldct_cnt
          from (
                select 
                       a.ptno
                     , min(a.ordr_ymd) fst_ordr_ymd
                     , max(a.ordr_ymd) lst_ordr_ymd
                     , count(a.ordr_ymd) ldct_cnt
                  from 스키마.3C15332B3C20431528 a
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                   and a.ordr_cd ='RC1241'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SR'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
                   and a.enfr_dt is not null
                 group by a.ptno
               ) a
       ) a
     , 스키마.1543294D47144D302E333E0E28 x
 where a.fst_ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20160701','yyyymmdd')
   and x.ptno = a.ptno 
   and x.ordr_prrn_ymd = a.fst_ordr_ymd

-- 가족력, uncleaned data
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
/* 가족력 - 위암 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM161Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM161' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1448Y','1','0')),'')
             ) fh_cancer_stomach_f
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM161Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM161' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1449Y','1','0')),'')
             ) fh_cancer_stomach_m
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM161Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM161' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1450Y','1','0')),'')
             ) fh_cancer_stomach_sib
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM161Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM161' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1451Y','1','0')),'')
             ) fh_cancer_stomach_ch
/* 가족력 - 유방암 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM162Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM162' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1484Y','1','0')),'')
             ) fh_cancer_breast_f
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM162Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM162' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1485Y','1','0')),'')
             ) fh_cancer_breast_m
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM162Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM162' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1486Y','1','0')),'')
             ) fh_cancer_breast_sib
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM162Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM162' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1487Y','1','0')),'')
             ) fh_cancer_breast_ch
/* 가족력 - 대장암/직장암 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM163Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM163' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1475Y','1','0')),'')
             ) fh_cancer_colorectal_f
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM163Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM163' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1476Y','1','0')),'')
             ) fh_cancer_colorectal_m
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM163Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM163' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1477Y','1','0')),'')
             ) fh_cancer_colorectal_sib
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM163Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM163' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1478Y','1','0')),'')
             ) fh_cancer_colorectal_ch
/* 가족력 - 폐암 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1457Y','1','0')),'')
             ) fh_cancer_lung_f
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1458Y','1','0')),'')
             ) fh_cancer_lung_m
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1459Y','1','0')),'')
             ) fh_cancer_lung_sib
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1460Y','1','0')),'')
             ) fh_cancer_lung_ch
/* 가족력 - 자궁암 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'RR' ,'9999'
                       ,'AM' ,decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM165Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM165' ,SUBSTR(f.inqy_rspn_ctn1,1,1),'0')),'')
                       ,''
             ) fh_cancer_uterine_f
     , decode(f.inpc_cd,'MA1','9999'
                       ,'RR' ,'9999'
                       ,'AM' ,decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM165Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM165' ,SUBSTR(f.inqy_rspn_ctn1,2,1),'0')),'')
                       ,''
             ) fh_cancer_uterine_m
     , decode(f.inpc_cd,'MA1','9999'
                       ,'RR' ,'9999'
                       ,'AM' ,decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM165Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM165' ,SUBSTR(f.inqy_rspn_ctn1,3,1),'0')),'')
                       ,''
             ) fh_cancer_uterine_sib
     , decode(f.inpc_cd,'MA1','9999'
                       ,'RR' ,'9999'
                       ,'AM' ,decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM165Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM165' ,SUBSTR(f.inqy_rspn_ctn1,4,1),'0')),'')
                       ,''
             ) fh_cancer_uterine_ch
/* 가족력 - 간암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1466Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_liver_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1467Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_liver_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1468Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_liver_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1469Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_liver_ch
/* 가족력 - 갑상선암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1502Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_thyroid_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1503Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_thyroid_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1504Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_thyroid_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1505Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_thyroid_ch
/* 가족력 - 난소암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1538Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_ovary_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1539Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_ovary_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1540Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_ovary_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1541Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_ovary_ch
/* 가족력 - 자궁경부암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1493Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_cervix_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1494Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_cervix_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1495Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_cervix_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1496Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_cervix_ch
/* 가족력 - 담낭/담도암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1529Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_gb_biliary_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1530Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_gb_biliary_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1531Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_gb_biliary_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1532Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_gb_biliary_ch
/* 가족력 - 방광암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1511Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_bladder_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1512Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_bladder_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1513Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_bladder_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1514Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_bladder_ch
/* 가족력 - 식도암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1520Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_esophagus_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1521Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_esophagus_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1522Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_esophagus_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1523Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_esophagus_ch
/* 가족력 - 전립선암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1547Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_prostate_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1548Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_prostate_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1549Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_prostate_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1550Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_prostate_ch
/* 가족력 - 췌장암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1556Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_pancreas_f
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1557Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_pancreas_m
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1558Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_pancreas_sib
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.family             ,'0','0'
                                                          ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1559Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) fh_cancer_pancreas_ch
/* 가족력 - 기타암, AM/MA1 문진 통합 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM166Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM166' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM167Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM167' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1565Y','1','0')),'')
             ) fh_cancer_other_f
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM166Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM166' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM167Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM167' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1566Y','1','0')),'')
             ) fh_cancer_other_m
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM166Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM166' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM167Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM167' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1567Y','1','0')),'')
             ) fh_cancer_other_sib
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,decode(a.family        ,'0','0'
                                               ,'1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM166Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM166' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM167Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM167' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1568Y','1','0')),'')
             ) fh_cancer_other_ch
  from (-- 가족력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C05' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 가족력 */
             , case
                    when
                         count(case /* case1. 가족력에 응답 내역이 없고, 가족력 없다에 체크된 경우 0 */
                                    when a.inpc_cd = 'AM' and (a.item_sno between 150 and 167) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 385 and 572) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 385 and 572) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM168' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA1383Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when
                         count(case /* case2. 가족력에 응답 내역이 있으면 1 */
                                    when a.inpc_cd = 'AM' and (a.item_sno between 150 and 167) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 385 and 572) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 385 and 572) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
               else max(decode(a.inpc_cd,'RR','9999',''))
               end family
          from (-- 기본대상자
                select a.ptno
                     , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
                     , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
                     , a.ldct_cnt
                  from (
                        select 
                               a.ptno
                             , min(a.ordr_ymd) fst_ordr_ymd
                             , max(a.ordr_ymd) lst_ordr_ymd
                             , count(a.ordr_ymd) ldct_cnt
                          from 스키마.3C15332B3C20431528 a
                         where a.ptno in (
                                         )
                           and a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                           and a.ordr_cd ='RC1241'
                           and a.codv_cd = 'G'
                           and a.excf_cd = 'SR'
                           and nvl(a.dc_dvsn_cd,'N') = 'N'
                           and a.enfr_dt is not null
                         group by a.ptno
                       ) a
               ) b
             ,스키마.3E3C23302E333E0E28 a
         where b.fst_ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.fst_ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 382 and 572)
               )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 382 and 572)
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.family
     , b.gend_cd
 order by 5,7,4,2

-- 질병력, uncleaned data
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
/* 결핵 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM104Y' ,'1'
                                                                                   ,'AM104'  ,'1'
                                                                                   ,'RR78Y'  ,'1'
                                                                                   ,'RR78'   ,'1'
                                                                                   ,'MA1152Y','1'
                                                                                   ,'MA1153Y','1'
                                                                                   ,'MA1154Y','1'
                                                                                   ,'MA1155Y','1'
                                                                                   ,'MA1156Y','1'
                                                                                   ,'MA1157' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_tuberculosis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM104YY','1','AM104YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1152Y','0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA1153Y','0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA1154Y','1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_tuberculosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1152Y','0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA1153Y','1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA1154Y','2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_tuberculosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1155Y','1'      --,'MA1155Y','1' 수술/시술: 예
                                                                         ,'MA1152Y','0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA1153Y','0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA1154Y','0'      --,'MA1154Y','3' 현재치료중.
                                                                         ,'MA1157' ,DECODE(f.inqy_rspn_ctn1,'','','0')
                                                                         ,''))
             ,''
             ) trt_tuberculosis_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM104Y',f.inqy_rspn_ctn2 
                                                                         ,'AM104' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1157',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) tuberculosis_age_diag
  from (-- 질병력 전체값 고려, MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C02' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 질병력 */
             , case 
                    when /*case1. 질병응답내역이 아무것도 없고, 질병력없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM130' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno            = 'RR101' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA165Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 다른 질병응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    else ''
               end history_comorbidity 
          from (-- 기본대상자
                select a.ptno
                     , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
                     , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
                     , a.ldct_cnt
                  from (
                        select 
                               a.ptno
                             , min(a.ordr_ymd) fst_ordr_ymd
                             , max(a.ordr_ymd) lst_ordr_ymd
                             , count(a.ordr_ymd) ldct_cnt
                          from 스키마.3C15332B3C20431528 a
                         where a.ptno in (
                                         )
                           and a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                           and a.ordr_cd ='RC1241'
                           and a.codv_cd = 'G'
                           and a.excf_cd = 'SR'
                           and nvl(a.dc_dvsn_cd,'N') = 'N'
                           and a.enfr_dt is not null
                         group by a.ptno
                       ) a
               ) b
             , 스키마.3E3C23302E333E0E28 a
         where b.fst_ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.fst_ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500 and a.item_sno != 127)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 64  and 227 and a.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
               )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 64  and 227 and f.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_comorbidity
     , b.gend_cd
 order by 5,7,6,4,2
