-- vywjddml
-- cleaned 데이터
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.egd_enfr_dt
     , b.smk
     , b.smk_packyrs
     , b.alc
     , b.alc_amount_grams
     , b.surgery_stomach
     , b.history_helico_pylori
     , b.trt_helico_pylori
     , b.status_helico_pylori
     , b.helico_pylori_age_diag
     , b.history_cancer_stomach
     , b.cancer_stomach_age_diag
     , b.fh_cancer_stomach_f
     , b.fh_cancer_stomach_m
     , b.fh_cancer_stomach_sib
     , b.fh_cancer_stomach_ch
  from (
        select a.ordr_ymd
             , a.ptno
             , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3C15332B3C20431528 b
         where a.ptno in (
                         )
           and a.ordr_ymd between to_date('20050101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.ptno = a.ptno
           and b.ordr_ymd = a.ordr_ymd
           and b.ordr_cd = 'BS4100'
           and b.codv_cd = 'G'
           and nvl(b.dc_dvsn_cd,'N') = 'N'
        union
        select a.ordr_ymd
             , a.ptno
             , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3C15332B3C20431528 b
         where a.ptno in (
                         )
           and a.ordr_ymd between to_date('20050101','yyyymmdd') and to_date('20160701','yyyymmdd')
           and a.cncl_dt is null
           and b.ptno = a.ptno
           and b.ordr_ymd = a.ordr_ymd
           and b.ordr_cd = 'BS4100'
           and b.codv_cd = 'G'
           and nvl(b.dc_dvsn_cd,'N') = 'N'
         order by 2,1
       ) a
     , 스키마.1543294D47144D302E333E0E28 b
 where b.ptno(+) = a.ptno
   and b.ordr_prrn_ymd(+) = a.ordr_ymd

-- 흡연력, 수술력
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.egd_enfr_dt
     /* Smoking */
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
     /* Alcohol */
     , case
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM77Y'  ,'2'
                                                            ,'AM78Y'  ,'1'--,''))  AMQ0085
                                                            ,'RR51Y'  ,'2'
                                                            ,'RR64Y'  ,'1'
                                                            ,'AM77'   ,'2'
                                                            ,'AM78'   ,'1'--,''))  AMQ0085
                                                            ,'RR51'   ,'2'
                                                            ,'RR64'   ,'1'
                           ,DECODE(f.inpc_cd,'MA1','9999',''))
                    )
       end alc
     , round(
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA134Y' ,14.4 --'0'--,'1'
                                                  ,'MA135Y' ,28.8 --'1'--,'2'
                                                  ,'MA136Y' ,57.6 --'2'--,'3'
                                                  ,'MA137Y' ,115.2--'3'--,'4'--,''))                                                 MA1Q0303
                 ,'')) -- alc_amount_drinks
       *
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA127Y' ,0.033333--'0'--,'1'
                                                  ,'MA128Y' ,0.083333--'1'--,'2'
                                                  ,'MA129Y' ,0.214286--'2'--,'3'
                                                  ,'MA130Y' ,0.5     --'3'--,'4'
                                                  ,'MA131Y' ,0.785714--'4'--,'5'
                                                  ,'MA132Y' ,1       --'5'--,'6'--,''))                                                 MA1Q0302
                 ,''))-- alc_freq
            ,2)
       alc_amount_grams
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM93Y' ,'1'
                                                            ,'AM93'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_stomach
  from (
        select a.ordr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3C15332B3C20431528 b
         where a.ptno in (
                         )
           and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
           and a.cncl_dt is null
           and b.ptno = a.ptno
           and b.ordr_ymd = a.ordr_ymd
           and b.ordr_cd = 'BS4100'
           and b.codv_cd = 'G'
           and nvl(b.dc_dvsn_cd,'N') = 'N'
        union
        select a.ordr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3C15332B3C20431528 b
         where a.ptno in (
                         )
           and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
           and a.cncl_dt is null
           and b.ptno = a.ptno
           and b.ordr_ymd = a.ordr_ymd
           and b.ordr_cd = 'BS4100'
           and b.codv_cd = 'G'
           and nvl(b.dc_dvsn_cd,'N') = 'N'
         order by 2,1
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
               or (f.inpc_cd = 'RR'  and f.item_sno between 1 and  300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 1 and  64)
       )
   and f.rprs_apnt_no = a.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
 group by a.ptno
     , A.ORDR_YMD
     , a.egd_enfr_dt, f.inpc_cd

-- 질병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.egd_enfr_dt
/* 헬리코박터 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1130Y','1'
                                                                                   ,'MA1131Y','1'
                                                                                   ,'MA1132Y','1'
                                                                                   ,'MA1133' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_helico_pylori
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1130Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1131Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1132Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_helico_pylori
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1130Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1131Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1132Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_helico_pylori
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1133' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) helico_pylori_age_diag
  from (-- 질병력 전체값 고려, MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               b.ptno
             , 펑션.등록번호변환펑션(b.ptno) cdw_id
             , b.ordr_ymd
             , b.egd_enfr_dt
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
          from (
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                union
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                 order by 2,1
               ) b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500 and a.item_sno != 127)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 64  and 227 and a.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
               )
         group by b.PTNO
             , b.ordr_ymd
             , b.egd_enfr_dt
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 64  and 227 and f.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
       )
   and a.ptno = b.ptno
 group by a.ptno
     , A.ORDR_YMD
     , a.egd_enfr_dt, a.history_comorbidity, f.inpc_cd

-- 암병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.egd_enfr_dt
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
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1303' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cancer_stomach_age_diag
  from (-- 암병력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               b.ptno
             , 펑션.등록번호변환펑션(b.ptno) cdw_id
             , b.ordr_ymd
             , b.egd_enfr_dt
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
          from (
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                union
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                 order by 2,1
               ) b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 296 and 382)
               )
         group by b.PTNO
             , b.ordr_ymd
             , b.egd_enfr_dt
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 296 and 382)
       )
   and a.ptno = b.ptno
 group by a.ptno
     , A.ORDR_YMD
     , a.egd_enfr_dt, a.history_cancer, f.inpc_cd

-- 가족력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.egd_enfr_dt
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
  from (-- 가족력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               b.ptno
             , 펑션.등록번호변환펑션(b.ptno) cdw_id
             , b.ordr_ymd
             , b.egd_enfr_dt
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
          from (
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                union
                select a.ordr_ymd
                     , a.ptno
                     , to_char(b.enfr_dt,'yyyy-mm-dd hh24:mi:ss') egd_enfr_dt
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3C15332B3C20431528 b
                 where a.ptno in (
                                 )
                   and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20210531','yyyymmdd')
                   and a.cncl_dt is null
                   and b.ptno = a.ptno
                   and b.ordr_ymd = a.ordr_ymd
                   and b.ordr_cd = 'BS4100'
                   and b.codv_cd = 'G'
                   and nvl(b.dc_dvsn_cd,'N') = 'N'
                 order by 2,1
               ) b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 382 and 572)
               )
         group by b.PTNO
             , b.ordr_ymd
             , b.egd_enfr_dt
       ) a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 382 and 572)
       )
   and a.ptno = b.ptno
 group by a.ptno
     , A.ORDR_YMD
     , a.egd_enfr_dt, a.family, f.inpc_cd
