-- dlwlsdud
-- DR.H 기간내 데이터
select a.ptno
     , decode(a.gend_cd,'M','1','2') gend_cd
     , a.fst_age
     , to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
     , to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
     , a.ldct_cnt
     , x.question_type
     , x.smk_ys
     , x.smk
     , x.smk_duration
     , x.smk_current_amount
     , x.smk_start_age
     , x.smk_endyr
     , x.smk_packyrs
     , x.history_cancer
     , x.history_cancer_stomach
     , x.history_cancer_lung
     , x.history_cancer_liver
     , x.history_cancer_colorectal
     , x.history_cancer_breast
     , x.history_cancer_cervix
     , x.history_cancer_thyroid
     , x.history_cancer_bladder
     , x.history_cancer_esophagus
     , x.history_cancer_gb_biliary
     , x.history_cancer_ovary
     , x.history_cancer_prostate
     , x.history_cancer_pancreas
     , x.history_cancer_other
     , x.fh_cancer_lung_f
     , x.fh_cancer_lung_m
     , x.fh_cancer_lung_sib
     , x.fh_cancer_lung_ch
     , x.fh_cancer_lung_ff
     , x.fh_cancer_lung_fm
     , x.fh_cancer_lung_mf
     , x.fh_cancer_lung_mm
  from (-- 기본대상자
        select a.ptno
             , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
             , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
             , a.ldct_cnt
             , b.gend_cd
             , b.brrn
             , 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) fst_age
             , min(to_char(y.mdcr_ymd,'yyyy-mm-dd')) c34_mdcr_ymd
          from (
                select /*+ index(a 3C15332B3C20431528_i04) */
                       a.ptno
                     , min(a.ordr_ymd) fst_ordr_ymd
                     , max(a.ordr_ymd) lst_ordr_ymd
                     , count(a.ordr_ymd) ldct_cnt
                  from 스키마.3C15332B3C20431528 a
                 where a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                   and a.ordr_cd ='RC1241'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SR'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
                   and a.enfr_dt is not null
                 group by a.ptno
               ) a
             , 스키마.0E5B5B285B28402857 b
             , 스키마.3C155B0E153F0E2328 x
             , 스키마.0E5B4347435B284028 y
         where a.ptno = b.ptno
           and 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) > 49
           and x.ptno = a.ptno
           and nvl(x.main_scin_yn,'Y') = 'Y'
           and x.scin_cd like 'C34%'
           and y.mdrp_no = x.mdrp_no
           and y.mdcr_ymd > a.fst_ordr_ymd
           and (-- 부도 내역 제외 조건
                 (-- 선택 조건1
                  y.mdcr_ymd <  trunc(sysdate)
                  and y.mdcr_yn = 'Y'
                 )
                /* 미래진료이력 제외 */
                 and y.cncl_dt is null -- 필수조건
               )
           and a.ptno not in (/* 기본 제외대상자 */
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
           /* 외국인 제외 */
           and substr(b.brrn,1,1) not in ('5','6','7','8')
         group by a.ptno, a.fst_ordr_ymd, a.lst_ordr_ymd, a.ldct_cnt, b.gend_cd, b.brrn
       ) a
     , 스키마.1543294D47144D302E333E0E28 x
 where a.fst_ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20160701','yyyymmdd')
   and x.ptno = a.ptno 
   and x.ordr_prrn_ymd = a.fst_ordr_ymd

-- DR.H 기간외 데이터, 문진1
select a.ptno
     , decode(a.gend_cd,'M','1','2') gend_cd
     , a.fst_age
     , to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
     , to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
     , a.ldct_cnt
     , f.inpc_cd question_type
     /* Smoking */
     , case
            when /* 흡연력 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end smk_ys
     , case
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM57Y' ,'2'
                                                            ,'AM58Y' ,'1'--,''))  AMQ0074
                                                            ,'AM57'  ,'2'
                                                            ,'AM58'  ,'1'--,''))  AMQ0074
                                                            ,'RR46Y' ,'2'
                                                            ,'RR48Y' ,'1'--,''))                                         RRQ05
                                                            ,'RR46' ,'2'
                                                            ,'RR48' ,'1'--,''))                                         RRQ05
                                                            ,'MA17Y' ,'1'
                                                            ,'MA18Y' ,'2'--,''))             MA1Q02
                        ,''))
       end smk
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM54'  ,f.inqy_rspn_ctn1 
                                                  ,'AM54Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0072
                                                  ,'MA110' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) -- 데이터 첫 자리 값이 '0'으로 시작하면 빼기
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_duration
     , min(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM55'  ,f.inqy_rspn_ctn1 
                                                  ,'AM55Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0073
                                                  ,'RR47'  ,f.inqy_rspn_ctn1
                                                  ,'RR47Y' ,f.inqy_rspn_ctn1--,''))                                  RRQ0501
                                                  ,'MA112Y','0'
                                                  ,'MA113Y','1'
                                                  ,'MA114Y','2'
                                                  ,'MA115Y','3'--,''))                                               MA1Q0203
                 ,'')
          ) smk_current_amount
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM53'  ,f.inqy_rspn_ctn1 
                                                  ,'AM53Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0071
                                                  ,'MA19' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1)--,''))                                  MA1Q0201
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_start_age
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM58'  ,f.inqy_rspn_ctn1 
                                                  ,'AM58Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0074
                                                  ,'MA117Y','0'
                                                  ,'MA118Y','1'
                                                  ,'MA119Y','2'
                                                  ,'MA120Y','3'
                                                  ,'MA121Y','4'--,''))                                               MA1Q0204
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_endyr
     , min(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA112Y',5--'M0'
                                                  ,'MA113Y',15--'M1'
                                                  ,'MA114Y',25--'M2'
                                                  ,'MA115Y',35--'M3'--,''))                                               MA1Q0203
                 ,''
                 )
          ) 
       /20
       *
       case 
            when regexp_replace(max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA110' ,f.inqy_rspn_ctn1,'')),'^-?[0-9]+((\.[0-9]+)([Ee][+-][0-9]+)?)?','') is null 
            then max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA110' ,f.inqy_rspn_ctn1,''))
            else ''
       end smk_packyrs
--     , x.history_cancer
--     , x.history_cancer_stomach
--     , x.history_cancer_lung
--     , x.history_cancer_liver
--     , x.history_cancer_colorectal
--     , x.history_cancer_breast
--     , x.history_cancer_cervix
--     , x.history_cancer_thyroid
--     , x.history_cancer_bladder
--     , x.history_cancer_esophagus
--     , x.history_cancer_gb_biliary
--     , x.history_cancer_ovary
--     , x.history_cancer_prostate
--     , x.history_cancer_pancreas
--     , x.history_cancer_other
/* 가족력 - 폐암 */
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,1,1)
                                                            ,'MA1457Y','1','0'))--,'')
             ) fh_cancer_lung_f
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,2,1)
                                                            ,'MA1458Y','1','0'))--,'')
             ) fh_cancer_lung_m
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,3,1)
                                                            ,'MA1459Y','1','0'))--,'')
             ) fh_cancer_lung_sib
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,4,1)
                                                            ,'MA1460Y','1','0'))--,'')
             ) fh_cancer_lung_ch
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,5,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,5,1)
                                                            ,'MA1461Y','1','0'))--,'')
             ) fh_cancer_lung_ff
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,6,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,6,1)
                                                            ,'MA1462Y','1','0'))--,'')
             ) fh_cancer_lung_fm
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,7,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,7,1)
                                                            ,'MA1463Y','1','0'))--,'')
             ) fh_cancer_lung_mf
     , decode(f.inpc_cd,'RR' ,'9999'
--                       ,decode(a.family        ,'0','0'
--                                               ,'1'
                                               ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM164Y',SUBSTR(f.inqy_rspn_ctn1,8,1)
                                                            ,'AM164' ,SUBSTR(f.inqy_rspn_ctn1,8,1)
                                                            ,'MA1464Y','1','0'))--,'')
             ) fh_cancer_lung_mm
  from (-- 기본대상자
        select a.ptno
             , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
             , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
             , a.ldct_cnt
             , b.gend_cd
             , b.brrn
             , 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) fst_age
             , min(to_char(y.mdcr_ymd,'yyyy-mm-dd')) c34_mdcr_ymd
          from (
                select /*+ index(a 3C15332B3C20431528_i04) */
                       a.ptno
                     , min(a.ordr_ymd) fst_ordr_ymd
                     , max(a.ordr_ymd) lst_ordr_ymd
                     , count(a.ordr_ymd) ldct_cnt
                  from 스키마.3C15332B3C20431528 a
                 where a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                   and a.ordr_cd ='RC1241'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SR'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
                   and a.enfr_dt is not null
                 group by a.ptno
               ) a
             , 스키마.0E5B5B285B28402857 b
             , 스키마.3C155B0E153F0E2328 x
             , 스키마.0E5B4347435B284028 y
         where a.ptno = b.ptno
           and 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) > 49
           and x.ptno = a.ptno
           and nvl(x.main_scin_yn,'Y') = 'Y'
           and x.scin_cd like 'C34%'
           and y.mdrp_no = x.mdrp_no
           and y.mdcr_ymd > a.fst_ordr_ymd
           and (-- 부도 내역 제외 조건
                 (-- 선택 조건1
                  y.mdcr_ymd <  trunc(sysdate)
                  and y.mdcr_yn = 'Y'
                 )
                /* 미래진료이력 제외 */
                 and y.cncl_dt is null -- 필수조건
               )
           and a.ptno not in (/* 기본 제외대상자 */
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
           /* 외국인 제외 */
           and substr(b.brrn,1,1) not in ('5','6','7','8')
         group by a.ptno, a.fst_ordr_ymd, a.lst_ordr_ymd, a.ldct_cnt, b.gend_cd, b.brrn
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where a.fst_ordr_ymd between to_date('20160702','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
   and f.ptno = a.ptno 
   and f.ordr_prrn_ymd = a.fst_ordr_ymd
   and f.inpc_cd = 'MA1'
   and (
        f.item_sno between   7 and 21  -- 흡연력
       or
        f.item_sno between 456 and 465 -- 가족력 중 폐암
       ) 
 group by a.ptno
     , a.gend_cd
     , a.fst_age
     , a.fst_ordr_ymd
     , a.lst_ordr_ymd
     , a.ldct_cnt
     , f.inpc_cd

-- DR.H 기간외 데이터, 문진2 암병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.PTNO
     , decode(a.gend_cd,'M','1','2') gend_cd
     , a.fst_age
     , to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
     , to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
     , a.ldct_cnt
     , f.inpc_cd question_type
     , a.history_cancer
/* 위암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','1'
                                                                                   ,'MA1300Y','1'
                                                                                   ,'MA1301Y','1'
                                                                                   ,'MA1302Y','1'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_stomach
/* 폐암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1305Y','1'
                                                                                   ,'MA1306Y','1'
                                                                                   ,'MA1307Y','1'
                                                                                   ,'MA1308Y','1'
                                                                                   ,'MA1309' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_lung
/* 간암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','1'
                                                                                   ,'MA1312Y','1'
                                                                                   ,'MA1313Y','1'
                                                                                   ,'MA1314Y','1'
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_liver
/* 대장암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1317Y','1'
                                                                                   ,'MA1318Y','1'
                                                                                   ,'MA1319Y','1'
                                                                                   ,'MA1320Y','1'
                                                                                   ,'MA1321' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_colorectal
/* 유방암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1323Y','1'
                                                                                   ,'MA1324Y','1'
                                                                                   ,'MA1325Y','1'
                                                                                   ,'MA1326Y','1'
                                                                                   ,'MA1327' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_breast
/* 자궁경부암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer,'0','0'
                                                     ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1329Y','1'
                                                                                   ,'MA1330Y','1'
                                                                                   ,'MA1331Y','1'
                                                                                   ,'MA1332Y','1'
                                                                                   ,'MA1333' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )     
                       ,''
             ) history_cancer_cervix
/* 갑상선암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','1'
                                                                                   ,'MA1336Y','1'
                                                                                   ,'MA1337Y','1'
                                                                                   ,'MA1338Y','1'
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_thyroid
/* 방광암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1341Y','1'
                                                                                   ,'MA1342Y','1'
                                                                                   ,'MA1343Y','1'
                                                                                   ,'MA1344Y','1'
                                                                                   ,'MA1345' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_bladder
/* 식도암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1347Y','1'
                                                                                   ,'MA1348Y','1'
                                                                                   ,'MA1349Y','1'
                                                                                   ,'MA1350Y','1'
                                                                                   ,'MA1351' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_esophagus
/* 담도암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1353Y','1'
                                                                                   ,'MA1354Y','1'
                                                                                   ,'MA1355Y','1'
                                                                                   ,'MA1356Y','1'
                                                                                   ,'MA1357' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_gb_biliary
/* 난소암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer,'0','0'
                                                     ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1359Y','1'
                                                                                   ,'MA1360Y','1'
                                                                                   ,'MA1361Y','1'
                                                                                   ,'MA1362Y','1'
                                                                                   ,'MA1363' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )     
                       ,''
             ) history_cancer_ovary
/* 전립선암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer,'0','0'
                                                     ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1365Y','1'
                                                                                   ,'MA1366Y','1'
                                                                                   ,'MA1367Y','1'
                                                                                   ,'MA1368Y','1'
                                                                                   ,'MA1369' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )     
                       ,''
             ) history_cancer_prostate
/* 췌장암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer,'0','0'
                                                     ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1371Y','1'
                                                                                   ,'MA1372Y','1'
                                                                                   ,'MA1373Y','1'
                                                                                   ,'MA1374Y','1'
                                                                                   ,'MA1375' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )     
                       ,''
             )  history_cancer_pancreas
/* 기타암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1377Y','1'
                                                                                   ,'MA1378Y','1'
                                                                                   ,'MA1379Y','1'
                                                                                   ,'MA1380Y','1'
                                                                                   ,'MA1376' ,DECODE(f.inqy_rspn_ctn1,'','','1')
                                                                                   ,'MA1381' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_other
  from (-- 암병력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               b.PTNO
             , b.gend_cd
             , b.fst_age
             , b.fst_ordr_ymd
             , b.lst_ordr_ymd
             , b.ldct_cnt
             , a.inpc_cd
        /* 암병력 */
             , case 
                    when /*case3. 암관련 응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd||a.item_sno            = 'AM127' then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    when /*case1. 암병력 응답내역이 아무것도 없고, 암병력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case 
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA1297Y' then a.ceck_yn
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 타/질병력 내역이 있거나, 질병력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM' and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    else ''
                               end
                              ) != 0
                         or
                         count(
                               case 
                                    when a.inpc_cd||a.item_sno            = 'AM130' then a.inqy_rspn_cd
                                    else ''
                               end
                              ) = 1
                    then '0'
                    else max(decode(a.inpc_cd,'RR','9999',''))
               end history_cancer
          from (-- 기본대상자
                select a.ptno
                     , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
                     , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
                     , a.ldct_cnt
                     , b.gend_cd
                     , b.brrn
                     , 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) fst_age
                     , min(to_char(y.mdcr_ymd,'yyyy-mm-dd')) c34_mdcr_ymd
                  from (
                        select /*+ index(a 3C15332B3C20431528_i04) */
                               a.ptno
                             , min(a.ordr_ymd) fst_ordr_ymd
                             , max(a.ordr_ymd) lst_ordr_ymd
                             , count(a.ordr_ymd) ldct_cnt
                          from 스키마.3C15332B3C20431528 a
                         where a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                           and a.ordr_cd ='RC1241'
                           and a.codv_cd = 'G'
                           and a.excf_cd = 'SR'
                           and nvl(a.dc_dvsn_cd,'N') = 'N'
                           and a.enfr_dt is not null
                         group by a.ptno
                       ) a
                     , 스키마.0E5B5B285B28402857 b
                     , 스키마.3C155B0E153F0E2328 x
                     , 스키마.0E5B4347435B284028 y
                 where a.ptno = b.ptno
                   and 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) > 49
                   and x.ptno = a.ptno
                   and nvl(x.main_scin_yn,'Y') = 'Y'
                   and x.scin_cd like 'C34%'
                   and y.mdrp_no = x.mdrp_no
                   and y.mdcr_ymd > a.fst_ordr_ymd
                   and (-- 부도 내역 제외 조건
                         (-- 선택 조건1
                          y.mdcr_ymd <  trunc(sysdate)
                          and y.mdcr_yn = 'Y'
                         )
                        /* 미래진료이력 제외 */
                         and y.cncl_dt is null -- 필수조건
                       )
                   and a.ptno not in (/* 기본 제외대상자 */
                                      &not_in_ptno
                                     )
                   /* 동의여부자만 대상 */
                   and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                   /* 외국인 제외 */
                   and substr(b.brrn,1,1) not in ('5','6','7','8')
                 group by a.ptno, a.fst_ordr_ymd, a.lst_ordr_ymd, a.ldct_cnt, b.gend_cd, b.brrn
               ) b
             , 스키마.3E3C23302E333E0E28 a
         where 
               b.fst_ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.fst_ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 296 and 382)
               )
         group by b.PTNO
             , b.gend_cd
             , b.fst_age
             , b.fst_ordr_ymd
             , b.lst_ordr_ymd
             , b.ldct_cnt
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.fst_ordr_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 296 and 382)
       )
 group by a.PTNO
     , a.gend_cd
     , a.fst_age
     , a.fst_ordr_ymd
     , a.lst_ordr_ymd
     , a.ldct_cnt
     , f.inpc_cd
     , a.history_cancer
 order by 5,7,4,2

-- 기타데이터, 키, 몸무게, C34 상병코드, PFT 결과
select a.ptno
     , decode(a.gend_cd,'M','1','2') gend_cd
     , a.fst_age
     , to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
     , to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
     , a.ldct_cnt
     , a.c34_mdcr_ymd
     , to_char(a.pft_fst_ymd,'yyyy-mm-dd') pft_fst_ymd
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.fst_ordr_ymd and x.exmn_cd = 'SM0101'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0101
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.fst_ordr_ymd and x.exmn_cd = 'SM0102'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0102
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM0401'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0401
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM040101' and nvl(x.exrs_updt_yn,'N') != 'Y') SM040101
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM0402'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0402  
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM040201' and nvl(x.exrs_updt_yn,'N') != 'Y') SM040201
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM0403'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0403  
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM0404'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0404  
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM040401' and nvl(x.exrs_updt_yn,'N') != 'Y') SM040401
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM0405'   and nvl(x.exrs_updt_yn,'N') != 'Y') SM0405  
     , (select max(x.exrs_ncvl_vl) from 스키마.3E3243333E2E143C28 x where x.ptno = a.ptno and x.ordr_ymd = a.pft_fst_ymd  and x.exmn_cd = 'SM040501' and nvl(x.exrs_updt_yn,'N') != 'Y') SM040501
  from (-- 기본대상자
        select a.ptno
             , a.fst_ordr_ymd-- to_char(a.fst_ordr_ymd,'yyyy-mm-dd') fst_ordr_ymd
             , a.lst_ordr_ymd-- to_char(a.lst_ordr_ymd,'yyyy-mm-dd') lst_ordr_ymd
             , a.ldct_cnt
             , b.gend_cd
             , b.brrn
             , 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) fst_age
             , min(to_char(y.mdcr_ymd,'yyyy-mm-dd')) c34_mdcr_ymd
             , (
                select min(x.ordr_ymd)
                  from 스키마.3C15332B3C20431528 x
                 where x.ptno = a.ptno
                   and x.ordr_ymd between a.fst_ordr_ymd and a.lst_ordr_ymd
                   and x.ordr_cd = 'SM0450'
                   and x.codv_cd = 'G'
                   and nvl(x.dc_dvsn_cd,'N') = 'N'
                   and x.enfr_dt is not null
               ) pft_fst_ymd
          from (
                select /*+ index(a 3C15332B3C20431528_i04) */
                       a.ptno
                     , min(a.ordr_ymd) fst_ordr_ymd
                     , max(a.ordr_ymd) lst_ordr_ymd
                     , count(a.ordr_ymd) ldct_cnt
                  from 스키마.3C15332B3C20431528 a
                 where a.ordr_ymd between to_date('20010101','yyyy-mm-dd') and to_date('20201231','yyyymmdd')
                   and a.ordr_cd ='RC1241'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SR'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
                   and a.enfr_dt is not null
                 group by a.ptno
               ) a
             , 스키마.0E5B5B285B28402857 b
             , 스키마.3C155B0E153F0E2328 x
             , 스키마.0E5B4347435B284028 y
         where a.ptno = b.ptno
           and 펑션.나이계산펑션(a.ptno,a.fst_ordr_ymd) > 49
           and x.ptno = a.ptno
           and nvl(x.main_scin_yn,'Y') = 'Y'
           and x.scin_cd like 'C34%'
           and y.mdrp_no = x.mdrp_no
           and y.mdcr_ymd > a.fst_ordr_ymd
           and (-- 부도 내역 제외 조건
                 (-- 선택 조건1
                  y.mdcr_ymd <  trunc(sysdate)
                  and y.mdcr_yn = 'Y'
                 )
                /* 미래진료이력 제외 */
                 and y.cncl_dt is null -- 필수조건
               )
           and a.ptno not in (/* 기본 제외대상자 */
                              &not_in_ptno
                             )
           /* 동의여부자만 대상 */
           and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
           /* 외국인 제외 */
           and substr(b.brrn,1,1) not in ('5','6','7','8')
         group by a.ptno, a.fst_ordr_ymd, a.lst_ordr_ymd, a.ldct_cnt, b.gend_cd, b.brrn
       ) a
