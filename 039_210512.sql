-- vywjddml
-- 문진 응답내역 전체항목, 최종(가족력 기타암 통합만 있는 것)
-- 문진 응답내역 중 건진동기, 생활습관, 알러지, 약물이상반응, 수술력
-- SMISR 서버의 메모리 리소스를 매우 잡아 먹는 관계로 카테고리 분할함.
select /*+ ordered use_nl(A F) index(a 3E3C0E433E3C0E3E28_i13) index(f 3E3C23302E333E0E28_pk) */
       'C01' grp
     , F.PTNO
     , 펑션.등록번호변환펑션(f.ptno) cdw_no
     , to_char(f.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , f.inpc_cd
     , b.gend_cd
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM2Y'  ,'1'
                                                  ,'AM3Y'  ,'0'
                                                  ,'AM2'   ,'1'
                                                  ,'AM3'   ,'0'
                                                  ,'MA12Y' ,'1'
                                                  ,'MA13Y' ,'0'
                                                  ,'RR2Y'  ,'1'
                                                  ,'RR3Y'  ,'0','')) exam_motive
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM6Y'  ,'1'
                                                  ,'AM10Y' ,'0'
                                                  ,'AM6'   ,'1'
                                                  ,'AM10'  ,'0'
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) exam
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM7'  ,f.inqy_rspn_ctn1
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) exam_first_age
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM8'  ,f.inqy_rspn_ctn1
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) exam_most_recent_yy
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM8'  ,f.inqy_rspn_ctn2
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) exam_most_recent_mm
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM9'  ,f.inqy_rspn_ctn2
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) exam_freq_yr
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR5Y' ,'1'
                                                  ,'RR6Y' ,'0'
                                                  ,'RR5'  ,'1'
                                                  ,'RR6'  ,'0'
                                                  ,decode(f.inpc_cd,'AM' ,'9999'
                                                                   ,'MA1','9999','')
                 )
          ) exam_place
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM12Y' ,'0'
                                                  ,'AM13Y' ,'1'
                                                  ,'AM14Y' ,'2'
                                                  ,'AM15Y' ,'3'
                                                  ,'AM16Y' ,'4'
                                                  ,'RR8Y' ,'0'
                                                  ,'RR9Y' ,'1'
                                                  ,'RR10Y','2'
                                                  ,'RR11Y','3'
                                                  ,'RR12Y','4'
                                                  ,'AM12'  ,'0'
                                                  ,'AM13'  ,'1'
                                                  ,'AM14'  ,'2'
                                                  ,'AM15'  ,'3'
                                                  ,'AM16'  ,'4'
                                                  ,'RR8'  ,'0'
                                                  ,'RR9'  ,'1'
                                                  ,'RR10' ,'2'
                                                  ,'RR11' ,'3'
                                                  ,'RR12' ,'4'
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )
          ) marital_status
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM18Y' ,'0'
                                                  ,'AM19Y' ,'1'
                                                  ,'AM20Y' ,'2'
                                                  ,'AM21Y' ,'3'
                                                  ,'AM22Y' ,'4'
                                                  ,'AM23Y' ,'5'
                                                  ,'AM18'  ,'0'
                                                  ,'AM19'  ,'1'
                                                  ,'AM20'  ,'2'
                                                  ,'AM21'  ,'3'
                                                  ,'AM22'  ,'4'
                                                  ,'AM23'  ,'5'
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) education
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM25Y' ,'0'
                                                  ,'AM26Y' ,'1'
                                                  ,'AM27Y' ,'2'
                                                  ,'AM28Y' ,'3'
                                                  ,'AM29Y' ,'4'
                                                  ,'AM25'  ,'0'
                                                  ,'AM26'  ,'1'
                                                  ,'AM27'  ,'2'
                                                  ,'AM28'  ,'3'
                                                  ,'AM29'  ,'4'
                 ,decode(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )
          ) income
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
     /* Alcohol */
     , case
            when /* 음주 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA123Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end alc_ys
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
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM65Y'  ,'0'--,'1'
                                                  ,'AM66Y'  ,'1'--,'2'
                                                  ,'AM67Y'  ,'2'--,'3'
                                                  ,'AM68Y'  ,'3'--,'4'
                                                  ,'AM69Y'  ,'4'--,'5'
                                                  ,'AM70Y'  ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53Y'  ,'0'--,'1'
                                                  ,'RR54Y'  ,'1'--,'2'
                                                  ,'RR55Y'  ,'2'--,'3'
                                                  ,'RR56Y'  ,'3'--,'4'
                                                  ,'RR57Y'  ,'4'--,'5'
                                                  ,'RR58Y'  ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'AM65'   ,'0'--,'1'
                                                  ,'AM66'   ,'1'--,'2'
                                                  ,'AM67'   ,'2'--,'3'
                                                  ,'AM68'   ,'3'--,'4'
                                                  ,'AM69'   ,'4'--,'5'
                                                  ,'AM70'   ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53'   ,'0'--,'1'
                                                  ,'RR54'   ,'1'--,'2'
                                                  ,'RR55'   ,'2'--,'3'
                                                  ,'RR56'   ,'3'--,'4'
                                                  ,'RR57'   ,'4'--,'5'
                                                  ,'RR58'   ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'MA127Y' ,'0'--,'1'
                                                  ,'MA128Y' ,'1'--,'2'
                                                  ,'MA129Y' ,'2'--,'3'
                                                  ,'MA130Y' ,'3'--,'4'
                                                  ,'MA131Y' ,'4'--,'5'
                                                  ,'MA132Y' ,'5'--,'6'--,''))                                                 MA1Q0302
                 ,'')) alc_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM72Y'  ,'0'--,'1'
                                                  ,'AM73Y'  ,'1'--,'2'
                                                  ,'AM74Y'  ,'2'--,'3'
                                                  ,'AM75Y'  ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60Y'  ,'0'--,'1'
                                                  ,'RR61Y'  ,'1'--,'2'
                                                  ,'RR62Y'  ,'2'--,'3'
                                                  ,'RR63Y'  ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'AM72'   ,'0'--,'1'
                                                  ,'AM73'   ,'1'--,'2'
                                                  ,'AM74'   ,'2'--,'3'
                                                  ,'AM75'   ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60'   ,'0'--,'1'
                                                  ,'RR61'   ,'1'--,'2'
                                                  ,'RR62'   ,'2'--,'3'
                                                  ,'RR63'   ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'MA134Y' ,'0'--,'1'
                                                  ,'MA135Y' ,'1'--,'2'
                                                  ,'MA136Y' ,'2'--,'3'
                                                  ,'MA137Y' ,'3'--,'4'--,''))                                                 MA1Q0303
                 ,'')) alc_amount_drinks
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM62'   ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                                                  ,'AM62Y'  ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                 ,'MA1','9999','')
                 )) alc_start_age
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM63'   ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'AM63Y'  ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'MA125'  ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                                                  ,'MA125Y' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                 ,DECODE(f.inpc_cd,'RR' ,'9999','')
                 )) alc_duration
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM78'   ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                                                  ,'AM78Y'  ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )) alc_endyr
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
     /* Physical activity */
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 운동 관련 응답 내역이 없고, 운동을 하지 않으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM50' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR44' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA149Y','1'                                                                       
                                                  ,'MA150Y','2'                                                                       
                                                  ,'MA151Y','3'                                                                       
                                                  ,'MA152Y','0'--,''))                                                                  MA1Q05
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'AM' ,'9999','')
                 )) overall_physical_activity
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM43Y'  ,'0'
                                                  ,'AM44Y'  ,'1'
                                                  ,'AM45Y'  ,'2'
                                                  ,'AM46Y'  ,'3'
                                                  ,'AM47Y'  ,'4'--,''))                                AMQ0062
                                                  ,'AM43'   ,'0'
                                                  ,'AM44'   ,'1'
                                                  ,'AM45'   ,'2'
                                                  ,'AM46'   ,'3'
                                                  ,'AM47'   ,'4'--,''))                                AMQ0062
                                                  ,'RR26Y'  ,'0'
                                                  ,'RR27Y'  ,'1'
                                                  ,'RR28Y'  ,'2'
                                                  ,'RR29Y'  ,'3'
                                                  ,'RR30Y'  ,'4'--,''))                                         RRQ0402
                                                  ,'RR26'   ,'0'
                                                  ,'RR27'   ,'1'
                                                  ,'RR28'   ,'2'
                                                  ,'RR29'   ,'3'
                                                  ,'RR30'   ,'4'--,''))                                         RRQ0402
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_freq_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM48'   ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'AM48Y'  ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'RR32Y'  ,'0'
                                                  ,'RR33Y'  ,'1'
                                                  ,'RR34Y'  ,'2'
                                                  ,'RR35Y'  ,'3'
                                                  ,'RR36Y'  ,'4'--,''))                                         RRQ0403
                                                  ,'RR32'   ,'0'
                                                  ,'RR33'   ,'1'
                                                  ,'RR34'   ,'2'
                                                  ,'RR35'   ,'3'
                                                  ,'RR36'   ,'4'--,''))                                         RRQ0403
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_duration_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA154Y' ,'0'                                                                       
                                                  ,'MA155Y' ,'1'                                                                       
                                                  ,'MA156Y' ,'2'                                                                       
                                                  ,'MA157Y' ,'3'--,''))                                                                  MA1Q0501
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA159Y' ,'0'
                                                  ,'MA160Y' ,'1'
                                                  ,'MA161Y' ,'2'
                                                  ,'MA162Y' ,'3'
                                                  ,'MA163Y' ,'4'--,''))                                                                  MA1Q0502
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_duration
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM49'   ,f.inqy_rspn_ctn1||' 년전'--,''))                        AMQ0064
                                                  ,'AM49Y'  ,f.inqy_rspn_ctn1||' 년전'--,''))                        AMQ0064
                                                  ,'RR38Y'  ,'0'
                                                  ,'RR39Y'  ,'1'
                                                  ,'RR40Y'  ,'2'
                                                  ,'RR41Y'  ,'3'
                                                  ,'RR42Y'  ,'4'
                                                  ,'RR43Y'  ,'5'--,''))                                         RRQ0404
                                                  ,'RR38'   ,'0'
                                                  ,'RR39'   ,'1'
                                                  ,'RR40'   ,'2'
                                                  ,'RR41'   ,'3'
                                                  ,'RR42'   ,'4'
                                                  ,'RR43'   ,'5'--,''))                                         RRQ0404
                 ,DECODE(f.inpc_cd,'MA1' ,'9999','')
                 )) phy_startyr
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM33Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM33'  ,'1'--,''))                                AMQ00611
                                                            ,'RR16Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR16'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_walking
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM34Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM34'  ,'1'--,''))                                AMQ00611
                                                            ,'RR17Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR17'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_jogging
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM35Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM35'  ,'1'--,''))                                AMQ00611
                                                            ,'RR18Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR18'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_TENNIS
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM36Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM36'  ,'1'--,''))                                AMQ00611
                                                            ,'RR19Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR19'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_GOLF
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM37Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM37'  ,'1'--,''))                                AMQ00611
                                                            ,'RR20Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR20'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_SWIMMING
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM38Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM38'  ,'1'--,''))                                AMQ00611
                                                            ,'RR21Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR21'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_CLIMBING
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM39Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM39'  ,'1'--,''))                                AMQ00611
                                                            ,'RR22Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR22'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_AEROBIC
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM40Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM40'  ,'1'--,''))                                AMQ00611
                                                            ,'RR23Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR23'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_FITNESS
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM41Y' ,'1'--,''))                                AMQ00611
                                                            ,'AM41'  ,'1'--,''))                                AMQ00611
                                                            ,'RR24Y' ,'1'--,''))                                         RRQ040101
                                                            ,'RR24'  ,'1'--,''))                                         RRQ040101
                           ,''
                           )) is not null
            then '1'
            when /* 타 운동 종류 관련 응답이 있으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 33 and 41) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 16 and 24) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy_OTHER
     , case
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
                 or
                 MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM81Y','1'
                                                            ,'RR67Y','1'
                                                            ,'AM81' ,'1'
                                                            ,'RR67' ,'1','')) = '1'
            then '1'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                          ,'AM90Y' ,'0'
                                                          ,'AM91Y' ,'2'
                                                  ,'RR75Y','0'
                                                  ,'RR76Y','2'
                                                          ,'AM90'  ,'0'
                                                          ,'AM91'  ,'2'
                                                  ,'RR75' ,'0'
                                                  ,'RR76' ,'2'
                                                          ,decode(f.inpc_cd,'MA1','9999','')))
       end  allergy
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM83Y' ,'1'
                                                  ,'RR69Y' ,'1'
                                                  ,'AM83'  ,'1'
                                                  ,'RR69'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_penicillin
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM84Y' ,'1'
                                                  ,'RR70Y' ,'1'
                                                  ,'AM84'  ,'1'
                                                  ,'RR70'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_sulfa
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM85Y' ,'1'
                                                  ,'RR71Y' ,'1'
                                                  ,'AM85'  ,'1'
                                                  ,'RR71'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_contrast_agent
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM86Y' ,'1'
                                                  ,'RR72Y' ,'1'
                                                  ,'AM86'  ,'1'
                                                  ,'RR72'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_local_anesthetic
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM87Y' ,'1'
                                                  ,'RR73Y' ,'1'
                                                  ,'AM87'  ,'1'
                                                  ,'RR73'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_aspirin
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM88Y' ,'1'
                                                  ,'RR74Y' ,'1'
                                                  ,'AM88'  ,'1'
                                                  ,'RR74'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_other
     , case
            when 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM89Y' ,'1'
                                                  ,'AM89'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 81 and 89) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 67 and 74) then f.inqy_rspn_cd
                            else ''
                            end
                      ) > 0
            then '0'
            else max(decode(f.inpc_cd,'MA1','9999','')) 
       end allergy_unknown
     , case
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '1' 
       else 
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA140Y','0'
                                                  ,'MA141Y','2'
                                                  ,decode(f.inpc_cd,'RR' ,'9999'
                                                                   ,'AM' ,'9999',''))) 
       end adverse_med
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA144Y','1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '0' 
       else max(decode(f.inpc_cd,'AM','9999'
                                ,'RR','9999',''))
       end adverse_med_antibiotics
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA145Y','1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '0' 
       else max(decode(f.inpc_cd,'AM','9999'
                                ,'RR','9999',''))
       end adverse_med_contrast_agent
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA146Y','1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '0' 
       else max(decode(f.inpc_cd,'AM','9999'
                                ,'RR','9999',''))
       end adverse_med_local_anesthetic
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA143Y','1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '0' 
       else max(decode(f.inpc_cd,'AM','9999'
                                ,'RR','9999',''))
       end adverse_med_aspirin_painkiller
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA147Y','1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'MA1' and (f.item_sno between 43 and 47) then f.ceck_yn
                            else ''
                            end
                      ) > 0
                 or
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA139Y','1','')) = '1'
       then '0' 
       else max(decode(f.inpc_cd,'AM','9999'
                                ,'RR','9999',''))
       end adverse_med_other
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
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM94Y' ,'1'
                                                            ,'AM94'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_gallbladder
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM95Y' ,'1'
                                                            ,'AM95'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_colon
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM96Y' ,'1'
                                                            ,'AM96'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_appendix
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM97Y' ,'1'
                                                            ,'AM97'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_thyroid
     , case
            when f.inpc_cd in ('RR','MA1') then '9999'
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM98Y' ,'1'
                                                            ,'AM98'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else ''
       end surgery_uterus
     , case
            when f.inpc_cd in ('RR','MA1') then '9999'
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM99Y' ,'1'
                                                            ,'AM99'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else ''
       end surgery_ovary
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM100Y' ,'1'
                                                            ,'AM100'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_breast
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM101Y' ,'1'
                                                            ,'AM101'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_kidney
     , case
            when MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM102Y' ,'1'
                                                            ,'AM102'  ,'1','')) = '1' then '1'
            when count(
                       case
                            when f.inpc_cd = 'AM' and (f.item_sno between 93 and 102) then f.inqy_rspn_cd
                            else ''
                       end     
                      ) > 0 then '0'
            else max(decode(f.inpc_cd,'MA1','9999'
                                     ,'RR' ,'9999',''))
       end surgery_other
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.0E5B5B285B28402857 b
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where 
       a.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
   and a.ordr_ymd is not null
   and a.cncl_dt is null
   and b.ptno = a.ptno
   and f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
               or (f.inpc_cd = 'RR'  and f.item_sno between 1 and  300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 1 and  64)
       )
   and f.rprs_apnt_no = a.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by f.ptno, f.ordr_prrn_ymd, f.inpc_cd, b.gend_cd--, f.rprs_apnt_no

-- 질병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
     , a.history_comorbidity
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
/* 고혈압 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y' ,'1'
                                                            ,'AM106'  ,'1'
                                                            ,'RR80Y'  ,'1'
                                                            ,'RR80'   ,'1'
                                                            ,'MA167Y' ,'1'
                                                            ,'MA168Y' ,'1'
                                                            ,'MA169Y' ,'1'
                                                            ,'MA170'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM106YY','1','AM106YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hypertension
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y',f.inqy_rspn_ctn2 
                                                                         ,'AM106' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA170' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hypertension_age_diag
/* 고지혈증 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y' ,'1'
                                                            ,'AM107'  ,'1'
                                                            ,'RR81Y'  ,'1'
                                                            ,'RR81'   ,'1'
                                                            ,'MA177Y' ,'1'
                                                            ,'MA178Y' ,'1'
                                                            ,'MA179Y' ,'1'
                                                            ,'MA180'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM107YY','1','AM107YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y',f.inqy_rspn_ctn2 
                                                                         ,'AM107' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA180' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hyperlipidemia_age_diag
/* 뇌졸중/중풍 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM108Y' ,'1'
                                                            ,'AM108'  ,'1'
                                                            ,'RR82Y'  ,'1'
                                                            ,'RR82'   ,'1'
                                                            ,'MA196Y' ,'1'
                                                            ,'MA197Y' ,'1'
                                                            ,'MA198Y' ,'1'
                                                            ,'MA199Y' ,'1'
                                                            ,'MA1100Y','1'
                                                            ,'MA1101' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_stroke
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM108YY','1','AM108YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'1','')) --,'3' 현재치료중.
             ,''
             ) trt_stroke
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'1'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'2','')) --,'3' 현재치료중.
             ,''
             ) status_stroke
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA199Y' ,'1'      --,'1' 수술/시술: 예
                                                                         ,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'0'      --,'3' 현재치료중.
                                                                         ,'MA1101' ,DECODE(f.inqy_rspn_ctn1,'','','0')
                                                                         ,''))
             ,''
             ) trt_stroke_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM108Y',f.inqy_rspn_ctn2 
                                                                         ,'AM108' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1101',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) stroke_age_diag
/* 당뇨병 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y' ,'1'
                                                            ,'AM109'  ,'1'
                                                            ,'RR83Y'  ,'1'
                                                            ,'RR83'   ,'1'
                                                            ,'MA172Y' ,'1'
                                                            ,'MA173Y' ,'1'
                                                            ,'MA174Y' ,'1'
                                                            ,'MA175'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM109YY','1','AM109YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'1','')) --,'3' 현재치료중.
             ,''
             ) trt_diabetes
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'1'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'2','')) --,'3' 현재치료중.
             ,''
             ) status_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y',f.inqy_rspn_ctn2 
                                                                         ,'AM109' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA175' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) diabetes_age_diag
/* 위/십이지장 궤양 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM111Y' ,'1'
                                                            ,'AM111'  ,'1'
                                                            ,'RR85Y'  ,'1'
                                                            ,'RR85'   ,'1'
                                                            ,'MA1123Y','1'
                                                            ,'MA1124Y','1'
                                                            ,'MA1125Y','1'
                                                            ,'MA1126Y','1'
                                                            ,'MA1127Y','1'
                                                            ,'MA1128' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_ga_duodenal_ulcer
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM111YY','1','AM111YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1123Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1124Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1125Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_ga_duodenal_ulcer
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1123Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1124Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1125Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_ga_duodenal_ulcer
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1126Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1123Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1124Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1125Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1128' ,DECODE(f.inqy_rspn_ctn1,'','','0'),'')) 
             ,''
             ) trt_ga_duodenal_ulcer_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM111Y',f.inqy_rspn_ctn2 
                                                                         ,'AM111' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1128',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) ga_duodenal_ulcer_age_diag
/* 대장용종(폴립) */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM114Y' ,'1'
                                                            ,'AM114'  ,'1'
                                                            ,'RR88Y'  ,'1'
                                                            ,'RR88'   ,'1'
                                                            ,'MA1135Y','1'
                                                            ,'MA1136Y','1'
                                                            ,'MA1137Y','1'
                                                            ,'MA1138Y','1'
                                                            ,'MA1139Y','1'
                                                            ,'MA1140' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_colon_polyp
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM114YY','1','AM114YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1135Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1136Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1137Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_colon_polyp
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1135Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1136Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1137Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_colon_polyp
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1138Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1135Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1136Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1137Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1140' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_colon_polyp_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM114Y',f.inqy_rspn_ctn2 
                                                                         ,'AM114' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1140',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) colon_polyp_age_diag
/* 지방간 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM118Y' ,'1'
                                                            ,'AM118'  ,'1'
                                                            ,'RR92Y'  ,'1'
                                                            ,'RR92'   ,'1'
                                                            ,'MA1118Y','1'
                                                            ,'MA1119Y','1'
                                                            ,'MA1120Y','1'
                                                            ,'MA1121' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_fatty_liver
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM118YY','1','AM118YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1118Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1119Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1120Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_fatty_liver
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1118Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1119Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1120Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_fatty_liver
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM118Y',f.inqy_rspn_ctn2 
                                                                         ,'AM118' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1121',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) fatty_liver_age_diag
/* 갑상선 결절 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','1'
                                                                                                          ,'MA1174Y','1'
                                                                                                          ,'MA1175Y','1'
                                                                                                          ,'MA1176Y','1'
                                                                                                          ,'MA1177Y','1'
                                                                                                          ,'MA1178' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_thyroid_nodules
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1176Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1173Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1174Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1175Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1178' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_thyroid_nodules_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1178' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) thyroid_nodules_age_diag
/* 유방양성종양 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM123Y' ,'1'
                                                            ,'AM123'  ,'1'
                                                            ,'RR97Y'  ,'1'
                                                            ,'RR97'   ,'1'
                                                            ,'MA1159Y','1'
                                                            ,'MA1160Y','1'
                                                            ,'MA1161Y','1'
                                                            ,'MA1162Y','1'
                                                            ,'MA1163Y','1'
                                                            ,'MA1164' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_bbt
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1159Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1160Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1161Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_bbt
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1159Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1160Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1161Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_bbt
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1162Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1159Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1160Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1161Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1164' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_bbt_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM123Y',f.inqy_rspn_ctn2 
                                                                         ,'AM123' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1164',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) bbt_age_diag
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM123YY','1','AM123YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_bbt_biopsy
/* 디스크 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM126Y' ,'1'
                                                            ,'AM126'  ,'1'
                                                            ,'RR100Y' ,'1'
                                                            ,'RR100'  ,'1'
                                                            ,'MA1215Y','1'
                                                            ,'MA1216Y','1'
                                                            ,'MA1217Y','1'
                                                            ,'MA1218Y','1'
                                                            ,'MA1219Y','1'
                                                            ,'MA1220' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_disc
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM126YY','1','AM126YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1215Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1216Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1217Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_disc
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1215Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1216Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1217Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_disc
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1218Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1215Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1216Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1217Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1220' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_disc_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM126Y',f.inqy_rspn_ctn2 
                                                                         ,'AM126' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1220',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) disc_age_diag
/* 위염 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM112Y' ,'1'
                                                                                   ,'AM112'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR86Y'  ,'1'
                                                                                   ,'RR86'   ,'1','0')),'')
             ,''
             ) history_gastritis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM112YY','1','AM112YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_gastritis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM112Y',f.inqy_rspn_ctn2 
                                                                         ,'AM112' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) gastritis_age_diag
/* 장염 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM113Y' ,'1'
                                                                                   ,'AM113'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR87Y'  ,'1'
                                                                                   ,'RR87'   ,'1','0')),'')
             ,''
             ) history_enteritis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM113YY','1','AM113YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_enteritis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM113Y',f.inqy_rspn_ctn2 
                                                                         ,'AM113' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) enteritis_age_diag
/* 치질 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM115Y' ,'1'
                                                                                   ,'AM115'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR89Y'  ,'1'
                                                                                   ,'RR89'   ,'1','0')),'')
             ,''
             ) history_hemorrhoid
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM115YY','1','AM115YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_hemorrhoid
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM115Y',f.inqy_rspn_ctn2 
                                                                         ,'AM115' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) hemorrhoid_age_diag
/* 급성간염 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM116Y' ,'1'
                                                                                   ,'AM116'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR90Y'  ,'1'
                                                                                   ,'RR90'   ,'1','0')),'')
             ,''
             ) history_acute_hep
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM116YY','1','AM116YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_acute_hep
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM116Y',f.inqy_rspn_ctn2 
                                                                         ,'AM116' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) acute_hep_age_diag
/* 만성간염/ 간경화 진단 여부 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM117Y' ,'1'
                                                                                   ,'AM117'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR91Y'  ,'1'
                                                                                   ,'RR91'   ,'1','0')),'')
             ,''
             ) history_hep_cirrhosis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM117YY','1','AM117YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_hep_cirrhosis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM117Y',f.inqy_rspn_ctn2 
                                                                         ,'AM117' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) hep_cirrhosis_age_diag
/* 담석/담낭염 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM119Y' ,'1'
                                                                                   ,'AM119'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR93Y'  ,'1'
                                                                                   ,'RR93'   ,'1','0')),'')
             ,''
             ) history_gallbladder_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM119YY','1','AM119YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_gallbladder_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM119Y',f.inqy_rspn_ctn2 
                                                                         ,'AM119' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) gallbladder_dis_age_diag
/* 자궁근종 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM124Y' ,'1'
                                                                                   ,'AM124'  ,'1'
                                                                                   ,'RR98Y'  ,'1'
                                                                                   ,'RR98'   ,'1','0'))
                               ,''
                               )
             ) history_myoma_uteri
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM124YY','1','AM124YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_myoma_uteri_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM124Y',f.inqy_rspn_ctn2 
                                                                         ,'AM124' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) myoma_uteri_age_diag
/* 자궁경부염증 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM125Y' ,'1'
                                                                                   ,'AM125'  ,'1'
                                                                                   ,'RR99Y'  ,'1'
                                                                                   ,'RR99'   ,'1','0'))
                               ,''
                               )
             ) history_cervicitis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM125YY','1','AM125YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_cervicitis_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM125Y',f.inqy_rspn_ctn2 
                                                                         ,'AM125' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) cervicitis_age_diag
/* 외상사고 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'RR' ,'9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM128Y' ,'1'
                                                                                   ,'AM128'  ,'1','0')),'')
                       ,''
             ) history_trauma
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM128YY','1','AM128YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_trauma
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM128Y',f.inqy_rspn_ctn2 
                                                                         ,'AM128' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trauma_age_diag
/* B형 간염 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','1'
                                                                                   ,'MA1104Y','1'
                                                                                   ,'MA1105Y','1'
                                                                                   ,'MA1106' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1104Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1105Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1104Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1105Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1106' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hbv_age_diag
/* C형 간염 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','1'
                                                                                   ,'MA1109Y','1'
                                                                                   ,'MA1110Y','1'
                                                                                   ,'MA1111' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1109Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1110Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1109Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1110Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1111' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hcv_age_diag
/* 간경변 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','1'
                                                                                   ,'MA1114Y','1'
                                                                                   ,'MA1115Y','1'
                                                                                   ,'MA1116' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1114Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1115Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1114Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1115Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1116' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cirrhosis_age_diag
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
/* 만성폐쇄성 폐질환 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1142Y','1'
                                                                                   ,'MA1143Y','1'
                                                                                   ,'MA1144Y','1'
                                                                                   ,'MA1145' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_copd
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1142Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1143Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1144Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_history_copd
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1142Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1143Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1144Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_history_copd
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1145' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) copd_age_diag
/* 관절염 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-28-1Y','1'
                                                                        ,'6-1-28-2Y','1'
                                                                        ,'6-1-28-3Y','1'
                                                                        ,'6-1-28-4Y','1'
                                                                        ,'6-1-28-5Y','1'
                                                                        ,'6-1-28-6' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_arthritis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-28-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-28-2Y','0'      --,'2' 과거치료했음.
                                                              ,'6-1-28-3Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_arthritis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-28-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-28-2Y','1'      --,'2' 과거치료했음.
                                                              ,'6-1-28-3Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_arthritis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-28-4Y','1'      --,'1' 수술/시술: 예
                                                              ,'6-1-28-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-28-2Y','0'      --,'2' 과거치료했음.
                                                              ,'6-1-28-3Y','0'      --,'3' 현재치료중.
                                                              ,'6-1-28-6' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_arthritis_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-28-6' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) arthritis_age_diag
/* 백내장 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1201Y','1'
                                                                                   ,'MA1202Y','1'
                                                                                   ,'MA1203Y','1'
                                                                                   ,'MA1204Y','1'
                                                                                   ,'MA1205Y','1'
                                                                                   ,'MA1206' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cataract
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1201Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1202Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1203Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_cataract
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1201Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1202Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1203Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_cataract
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1204Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1201Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1202Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1203Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1206' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_cataract_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1206' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cataract_age_diag
/* 녹내장 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1208Y','1'
                                                                                   ,'MA1209Y','1'
                                                                                   ,'MA1210Y','1'
                                                                                   ,'MA1211Y','1'
                                                                                   ,'MA1212Y','1'
                                                                                   ,'MA1213' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_glaucoma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1208Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1209Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1210Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_glaucoma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1208Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1209Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1210Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_glaucoma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1211Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1208Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1209Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1210Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1213' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_glaucoma_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1213' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) glaucoma_age_diag
/* 천식/알러지 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM105Y' ,'1'
                                                                                   ,'AM105'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR79Y'  ,'1'
                                                                                   ,'RR79'   ,'1','0')),'')
             ,''
             ) history_asthma_allergy
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM105YY','1','AM105YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_asthma_allergy
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM105Y',f.inqy_rspn_ctn2 
                                                                         ,'AM105' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) asthma_allergy_age_diag
/* 천식 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1147Y','1'
                                                                                   ,'MA1148Y','1'
                                                                                   ,'MA1149Y','1'
                                                                                   ,'MA1150' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_asthma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1147Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1148Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1149Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_asthma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1147Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1148Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1149Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_asthma
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1150' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) asthma_age_diag
/* 협심증/심근경색 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM110Y' ,'1'
                                                                                   ,'AM110'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR84Y'  ,'1'
                                                                                   ,'RR84'   ,'1','0')),'')
             ,''
             ) history_coronary_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM110YY','1','AM110YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_coronary_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM110Y',f.inqy_rspn_ctn2 
                                                                         ,'AM110' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) coronary_dis_age_diag
/* 협심증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','1'
                                                                                   ,'MA183Y','1'
                                                                                   ,'MA184Y','1'
                                                                                   ,'MA185Y','1'
                                                                                   ,'MA186Y','1'
                                                                                   ,'MA187' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA185Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','0'      --,'3' 현재치료중.
                                                                         ,'MA187' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_angina_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA187' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) angina_age_diag
/* 심근경색 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','1'
                                                                                   ,'MA190Y','1'
                                                                                   ,'MA191Y','1'
                                                                                   ,'MA192Y','1'
                                                                                   ,'MA193Y','1'
                                                                                   ,'MA194' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA192Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','0'      --,'3' 현재치료중.
                                                                         ,'MA194' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_mi_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA194' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) mi_age_diag
/* 신장 및 방광질환 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','1'
                                                                                   ,'MA1181Y','1'
                                                                                   ,'MA1182Y','1'
                                                                                   ,'MA1183Y','1'
                                                                                   ,'MA1184Y','1'
                                                                                   ,'MA1185' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1183Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1185' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_kidney_urinary_dis_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1185' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) kidney_urinary_dis_age_diag
/* 신장질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM120Y' ,'1'
                                                                                   ,'AM120'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR94Y'  ,'1'
                                                                                   ,'RR94'   ,'1','0')),'')
             ,''
             ) history_kidney_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM120YY','1','AM120YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_kidney_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM120Y',f.inqy_rspn_ctn2 
                                                                         ,'AM120' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) kidney_dis_age_diag
/* 방광질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM121Y' ,'1'
                                                                                   ,'AM121'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR95Y'  ,'1'
                                                                                   ,'RR95'   ,'1','0')),'')
             ,''
             ) history_urinary_tract_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM121YY','1','AM121YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_urinary_tract_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM121Y',f.inqy_rspn_ctn2 
                                                                         ,'AM121' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) urinary_tract_dis_age_diag
/* 갑상선 질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y' ,'1'
                                                                                   ,'AM122'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR96Y'  ,'1'
                                                                                   ,'RR96'   ,'1','0')),'')
             ,''
             ) history_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM122YY','1','AM122YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y',f.inqy_rspn_ctn2 
                                                                         ,'AM122' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) thyroid_dis1_age_diag
/* 전립선 비대증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-27-1Y','1'
                                                                        ,'6-1-27-2Y','1'
                                                                        ,'6-1-27-3Y','1'
                                                                        ,'6-1-27-4Y','1'
                                                                        ,'6-1-27-5Y','1'
                                                                        ,'6-1-27-6' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_bph
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-27-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-27-2Y','0'      --,'2' 과거치료했음.
                                                              ,'6-1-27-3Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_bph
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-27-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-27-2Y','1'      --,'2' 과거치료했음.
                                                              ,'6-1-27-3Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_bph
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-27-4Y','1'      --,'1' 수술/시술: 예
                                                              ,'6-1-27-1Y','0'      --,'1' 치료받은적 없음.
                                                              ,'6-1-27-2Y','0'      --,'2' 과거치료했음.
                                                              ,'6-1-27-3Y','0'      --,'3' 현재치료중.
                                                              ,'6-1-27-6' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_bph_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',max(DECODE(f.qstn_cd1||f.ceck_yn,'6-1-27-6' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) bph_age_diag
/* 갑상선 기능 저하증 및 항진증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','1'
                                                                                   ,'MA1167Y','1'
                                                                                   ,'MA1168Y','1'
                                                                                   ,'MA1169Y','1'
                                                                                   ,'MA1170Y','1'
                                                                                   ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1169Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_thyroid_dis2_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1171' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) thyroid_dis2_age_diag
/* 기타질환 */
     , decode(f.inpc_cd,'RR' ,'9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM129Y' ,'1'
                                                                                   ,'AM129'  ,'1','0')),'')
                       ,'MA1' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1222Y','1'
                                                                                   ,'MA1223Y','1'
                                                                                   ,'MA1224Y','1'
                                                                                   ,'MA1225Y','1'
                                                                                   ,'MA1226Y','1'
                                                                                   ,'MA1227' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0')),'')
             ,''
             ) history_other
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM129YY','1','AM129YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1222Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1223Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1224Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_other
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1222Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1223Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1224Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_other
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1225Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1222Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1223Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1224Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1227' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_other_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM129Y' ,f.inqy_rspn_ctn2 
                                                                         ,'AM129'  ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1227' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) other_age_diag
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C23302E333E0E28 a
         where 
--               b.ptno IN ( -- AM문진  응답자
--                         , -- RR문진  응답자
--                         , -- MA1문진 응답자
--                         )
--           and 
               b.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
           and b.ordr_ymd is not null
           and b.cncl_dt is null
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500 and a.item_sno != 127)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 64  and 227 and a.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
               )
           and b.ptno not in (
                              &not_in_ptno
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

-- 암병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
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
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1303' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cancer_stomach_age_diag
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','1'
                                                                                   ,'MA1300Y','1'
                                                                                   ,'MA1301Y','1'
                                                                                   ,'MA1302Y','1'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
                       ,''
                       ) trt_cancer_stomach
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','1'     -- 수술
                                                                                   ,'MA1300Y','0'     -- 약물치료
                                                                                   ,'MA1301Y','0'     -- 방사선치료
                                                                                   ,'MA1302Y','0'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_stomach_op
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','0'     -- 수술
                                                                                   ,'MA1300Y','1'     -- 약물치료
                                                                                   ,'MA1301Y','0'     -- 방사선치료
                                                                                   ,'MA1302Y','0'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_stomach_ch
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','0'     -- 수술
                                                                                   ,'MA1300Y','0'     -- 약물치료
                                                                                   ,'MA1301Y','1'     -- 방사선치료
                                                                                   ,'MA1302Y','0'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_stomach_ra
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1299Y','0'     -- 수술
                                                                                   ,'MA1300Y','0'     -- 약물치료
                                                                                   ,'MA1301Y','0'     -- 방사선치료
                                                                                   ,'MA1302Y','1'
                                                                                   ,'MA1303' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_stomach_ot
  from (-- 암병력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C04' grp
             , a.PTNO
             , a.ordr_prrn_ymd
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C23302E333E0E28 a
         where 
--               b.ptno IN ( -- AM문진  응답자
--                         , -- RR문진  응답자
--                         , -- MA1문진 응답자
--                         )
--           and 
               b.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
           and b.ordr_ymd is not null
           and b.cncl_dt is null
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 296 and 382)
               )
           and b.ptno not in (
                              &not_in_ptno
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
               OR (f.inpc_cd = 'MA1' and f.item_sno between 296 and 382)
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_cancer
     , b.gend_cd
 order by 5,7,4,2

-- 가족력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
     , a.family
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C23302E333E0E28 a
         where 
--               b.ptno IN ( -- AM문진  응답자
--                         , -- RR문진  응답자
--                         , -- MA1문진 응답자
--                         )
--           and 
               b.ordr_prrn_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
           and b.ordr_ymd is not null
           and b.cncl_dt is null
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
           and a.inpc_cd in ('AM','RR','MA1')
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 382 and 572)
               )
           and b.ptno not in (
                              &not_in_ptno
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
