-- whtnwls
select 펑션.등록번호변환펑션(a.ptno) CDW_ID
--     , a.ptno
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , b.pckg_cd
     , b.pckg_nm
     , b.pckg_type_cd
     , (
        select x.hlsc_dtls_ctrl_nm
          from 스키마.3E3C472843143C3C28 x
         where x.hlsc_ctrl_cd = 'SMM02'
           and x.hlsc_dtls_ctrl_cd = b.pckg_type_cd
       ) pckg_type_nm
     , max(decode(d.exmn_cd,'SM0600',substr(d.exrs_ncvl_vl,1,instr(d.exrs_ncvl_vl,'/')-1),'')) SM0600SBP
     , max(decode(d.exmn_cd,'SM0600',substr(d.exrs_ncvl_vl  ,instr(d.exrs_ncvl_vl,'/')+1),'')) SM0600DBP
     , max(decode(d.exmn_cd,'BL3118',d.exrs_ncvl_vl,'')) BL3118
     , max(decode(d.exmn_cd,'BL3164',d.exrs_ncvl_vl,'')) BL3164
     , max(decode(d.exmn_cd,'BL3113',d.exrs_ncvl_vl,'')) BL3113
     , max(decode(d.exmn_cd,'BL3141',d.exrs_ncvl_vl,'')) BL3141
     , max(decode(d.exmn_cd,'BL3142',d.exrs_ncvl_vl,'')) BL3142
     , max(decode(d.exmn_cd,'BL314201',d.exrs_ncvl_vl,'')) BL314201
     , max(decode(d.exmn_cd,'BL314202',d.exrs_ncvl_vl,'')) BL314202
     , max(decode(d.exmn_cd,'SM0550',d.exrs_ncvl_vl,'')) SM0550
     , max(decode(d.exmn_cd,'SM055011',d.exrs_ncvl_vl,'')) SM055011
     , max(decode(d.exmn_cd,'SM055013',d.exrs_ncvl_vl,'')) SM055013
     , max(decode(d.exmn_cd,'SM055014',d.exrs_ncvl_vl,'')) SM055014
     , max(decode(d.exmn_cd,'SM055015',d.exrs_ncvl_vl,'')) SM055015
     , max(decode(d.exmn_cd,'SM055021',d.exrs_ncvl_vl,'')) SM055021
     , max(decode(d.exmn_cd,'SM055023',d.exrs_ncvl_vl,'')) SM055023
     , max(decode(d.exmn_cd,'SM055025',d.exrs_ncvl_vl,'')) SM055025
     , max(decode(d.exmn_cd,'SM055031',d.exrs_ncvl_vl,'')) SM055031
     , max(decode(d.exmn_cd,'SM055033',d.exrs_ncvl_vl,'')) SM055033
     , max(decode(d.exmn_cd,'SM055035',d.exrs_ncvl_vl,'')) SM055035
     , max(decode(d.exmn_cd,'SM055041',d.exrs_ncvl_vl,'')) SM055041
     , max(decode(d.exmn_cd,'SM055043',d.exrs_ncvl_vl,'')) SM055043
     , max(decode(d.exmn_cd,'SM055045',d.exrs_ncvl_vl,'')) SM055045
     , max(decode(d.exmn_cd,'SM055051',d.exrs_ncvl_vl,'')) SM055051
     , max(decode(d.exmn_cd,'SM055053',d.exrs_ncvl_vl,'')) SM055053
     , max(decode(d.exmn_cd,'SM055055',d.exrs_ncvl_vl,'')) SM055055
     , max(decode(d.exmn_cd,'SM055061',d.exrs_ncvl_vl,'')) SM055061
     , max(decode(d.exmn_cd,'SM055063',d.exrs_ncvl_vl,'')) SM055063
     , max(decode(d.exmn_cd,'SM055065',d.exrs_ncvl_vl,'')) SM055065
     , max(decode(d.exmn_cd,'SM055071',d.exrs_ncvl_vl,'')) SM055071
     , max(decode(d.exmn_cd,'SM055073',d.exrs_ncvl_vl,'')) SM055073
     , max(decode(d.exmn_cd,'SM055075',d.exrs_ncvl_vl,'')) SM055075
     , max(decode(d.exmn_cd,'SM055081',d.exrs_ncvl_vl,'')) SM055081
     , max(decode(d.exmn_cd,'SM055083',d.exrs_ncvl_vl,'')) SM055083
     , max(decode(d.exmn_cd,'SM055085',d.exrs_ncvl_vl,'')) SM055085
     , max(decode(d.exmn_cd,'SM055111',d.exrs_ncvl_vl,'')) SM055111
     , max(decode(d.exmn_cd,'SM055113',d.exrs_ncvl_vl,'')) SM055113
     , max(decode(d.exmn_cd,'SM055114',d.exrs_ncvl_vl,'')) SM055114
     , max(decode(d.exmn_cd,'SM055115',d.exrs_ncvl_vl,'')) SM055115
     , max(decode(d.exmn_cd,'SM055121',d.exrs_ncvl_vl,'')) SM055121
     , max(decode(d.exmn_cd,'SM055123',d.exrs_ncvl_vl,'')) SM055123
     , max(decode(d.exmn_cd,'SM055125',d.exrs_ncvl_vl,'')) SM055125
     , max(decode(d.exmn_cd,'SM055131',d.exrs_ncvl_vl,'')) SM055131
     , max(decode(d.exmn_cd,'SM055133',d.exrs_ncvl_vl,'')) SM055133
     , max(decode(d.exmn_cd,'SM055135',d.exrs_ncvl_vl,'')) SM055135
     , max(decode(d.exmn_cd,'SM055141',d.exrs_ncvl_vl,'')) SM055141
     , max(decode(d.exmn_cd,'SM055143',d.exrs_ncvl_vl,'')) SM055143
     , max(decode(d.exmn_cd,'SM055145',d.exrs_ncvl_vl,'')) SM055145
     , max(decode(d.exmn_cd,'SM055151',d.exrs_ncvl_vl,'')) SM055151
     , max(decode(d.exmn_cd,'SM055153',d.exrs_ncvl_vl,'')) SM055153
     , max(decode(d.exmn_cd,'SM055155',d.exrs_ncvl_vl,'')) SM055155
     , max(decode(d.exmn_cd,'SM055161',d.exrs_ncvl_vl,'')) SM055161
     , max(decode(d.exmn_cd,'SM055163',d.exrs_ncvl_vl,'')) SM055163
     , max(decode(d.exmn_cd,'SM055165',d.exrs_ncvl_vl,'')) SM055165
     , max(decode(d.exmn_cd,'SM055171',d.exrs_ncvl_vl,'')) SM055171
     , max(decode(d.exmn_cd,'SM055173',d.exrs_ncvl_vl,'')) SM055173
     , max(decode(d.exmn_cd,'SM055175',d.exrs_ncvl_vl,'')) SM055175
     , max(decode(d.exmn_cd,'SM055181',d.exrs_ncvl_vl,'')) SM055181
     , max(decode(d.exmn_cd,'SM055182',d.exrs_ncvl_vl,'')) SM055182
     , max(decode(d.exmn_cd,'SM055183',d.exrs_ncvl_vl,'')) SM055183
     , max(decode(d.exmn_cd,'RS2010',to_char(d.exrs_ctn),'')) RS2010
     , max(decode(d.exmn_cd,'RC1184',to_char(d.exrs_ctn),'')) RC1184
     , max(
       case
            when
                 substr(
                        decode(d.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(d.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(d.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(d.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                              )
                                                                       ,'='
                                                                       ,1
                                                                       ,1
                                                                       ) + 1
                                                                 )
                                                          )
                                                     )
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ,''
                               )
                        ,length(
                                decode(d.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(d.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(d.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(d.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                      )
                                                                               ,'='
                                                                               ,1
                                                                               ,1
                                                                               ) + 1
                                                                         )
                                                                  )
                                                             )
                                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                                      ,''
                                                      )
                                       ,''
                                       )
                               )
                        ) = '.'
            then                 substr(
                        decode(d.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(d.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(d.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(d.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                              )
                                                                       ,'='
                                                                       ,1
                                                                       ,1
                                                                       ) + 1
                                                                 )
                                                          )
                                                     )
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ,''
                               )
                        ,1
                        ,length(
                                decode(d.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(d.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(d.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(d.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                      )
                                                                               ,'='
                                                                               ,1
                                                                               ,1
                                                                               ) + 1
                                                                         )
                                                                  )
                                                             )
                                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                                      ,''
                                                      )
                                       ,''
                                       )
                               ) - 1
                        )
            else 
                 decode(d.exmn_cd
                       ,'RC1184'
                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                       decode(instr(to_char(d.cnls_dx_ctn),'=',1,2)
                                             ,0
                                             ,'0'
                                             ,trim(
                                                   substr(
                                                          substr(
                                                                 to_char(d.cnls_dx_ctn)
                                                                ,1
                                                                ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                )
                                                         ,instr(
                                                                substr(
                                                                       to_char(d.cnls_dx_ctn)
                                                                      ,1
                                                                      ,instr(to_char(d.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                      )
                                                               ,'='
                                                               ,1
                                                               ,1
                                                               ) + 1
                                                         )
                                                  )
                                             )
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                       ,''
                       )
            end 
       ) aj_130
     , max(
       case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     d.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 세번째 결과 문구를 가져와라
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(d.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              )
                                                                             ) 
                                                                      )                                                 
                                                                 ,'='
                                                                 ,1
                                                                 ,1
                                                                 ) + 1
                                                           )
                                                    )
                                               )
                                        ,''
                                        )
                             else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             end 
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             d.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 세번째 결과 문구를 가져와라
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(d.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      )
                                                                                     ) 
                                                                              )                                                 
                                                                         ,'='
                                                                         ,1
                                                                         ,1
                                                                         ) + 1
                                                                   )
                                                            )
                                                       )
                                                ,''
                                                )
                                     else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     end 
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               )
                        ) = '.'
            then substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     d.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 세번째 결과 문구를 가져와라
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(d.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              )
                                                                             ) 
                                                                      )                                                 
                                                                 ,'='
                                                                 ,1
                                                                 ,1
                                                                 ) + 1
                                                           )
                                                    )
                                               )
                                        ,''
                                        )
                             else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             end 
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                        ,1
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             d.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 세번째 결과 문구를 가져와라
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(d.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      )
                                                                                     ) 
                                                                              )                                                 
                                                                         ,'='
                                                                         ,1
                                                                         ,1
                                                                         ) + 1
                                                                   )
                                                            )
                                                       )
                                                ,''
                                                )
                                     else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     end 
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ) - 1
                        )
            else 
                 regexp_replace(
                 case
                      when instr(lower(
                                       decode(
                                              d.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(d.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,''
                                             )
                                      )
                                ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                ,1
                                ,1                      
                                ) != 0
                      then -- 세번째 결과 문구를 가져와라
                           decode(
                                  d.exmn_cd
                                 ,'RC1184'
                                 ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                        ,0
                                        ,''
                                        ,trim(
                                              substr(
                                                     trim(
                                                          substr(
                                                                 to_char(d.cnls_dx_ctn)
                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                    ,instr(
                                                           trim(
                                                                substr(
                                                                       to_char(d.cnls_dx_ctn)
                                                                      ,-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                      ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                       instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       -
                                                                       (-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       )
                                                                      ) 
                                                               )                                                 
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        )
                                 ,''
                                 )
                      else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                           decode(
                                  d.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(d.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(d.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                   ,'='
                                                   ,1
                                                   ,1
                                                   ) + 1
                                             )
                                      )
                                 ,''
                                 )
                      end 
                               ,'[^0-9.]' -- 숫자와 소수점 외에
                               ,''
                               )
            end 
       ) volume_130
     , max(
       case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     d.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             else 
                                  case
                                       when instr(
                                                  lower(-- 세번째 결과 문구를 가져와라
                                                        decode(
                                                               d.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(d.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     )
                                                              ,''
                                                              ) 
                                                       )
                                                 ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                 ,1
                                                 ,1
                                                 ) != 0
                                       then -- 세번째 문구에서 결과를 가져와라
                                            decode(
                                                   d.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(d.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(d.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        )
                                                                                       ) 
                                                                                )                                                 
                                                                           ,'='
                                                                           ,1
                                                                           ,1
                                                                           ) + 1
                                                                     )
                                                              )
                                                         )
                                                  ,''
                                                  )
                                       else ''
                                       end
                             end 
                                      ,'[^0-9.]'
                                      ,''
                                      )
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             d.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     else 
                                          case
                                               when instr(
                                                          lower(-- 세번째 결과 문구를 가져와라
                                                                decode(
                                                                       d.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(d.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             )
                                                                      ,''
                                                                      ) 
                                                               )
                                                         ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                         ,1
                                                         ,1
                                                         ) != 0
                                               then -- 세번째 문구에서 결과를 가져와라
                                                    decode(
                                                           d.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(d.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(d.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                )
                                                                                               ) 
                                                                                        )                                                 
                                                                                   ,'='
                                                                                   ,1
                                                                                   ,1
                                                                                   ) + 1
                                                                             )
                                                                      )
                                                                 )
                                                          ,''
                                                          )
                                               else ''
                                               end
                                     end 
                                              ,'[^0-9.]'
                                              ,''
                                              )
                               )
                        ) = '.'
            then substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     d.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         d.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(d.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(d.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             else 
                                  case
                                       when instr(
                                                  lower(-- 세번째 결과 문구를 가져와라
                                                        decode(
                                                               d.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(d.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     )
                                                              ,''
                                                              ) 
                                                       )
                                                 ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                 ,1
                                                 ,1
                                                 ) != 0
                                       then -- 세번째 문구에서 결과를 가져와라
                                            decode(
                                                   d.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(d.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(d.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        )
                                                                                       ) 
                                                                                )                                                 
                                                                           ,'='
                                                                           ,1
                                                                           ,1
                                                                           ) + 1
                                                                     )
                                                              )
                                                         )
                                                  ,''
                                                  )
                                       else ''
                                       end
                             end 
                                      ,'[^0-9.]'
                                      ,''
                                      )
                        ,1
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             d.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 d.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(d.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(d.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     else 
                                          case
                                               when instr(
                                                          lower(-- 세번째 결과 문구를 가져와라
                                                                decode(
                                                                       d.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(d.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             )
                                                                      ,''
                                                                      ) 
                                                               )
                                                         ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                         ,1
                                                         ,1
                                                         ) != 0
                                               then -- 세번째 문구에서 결과를 가져와라
                                                    decode(
                                                           d.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(d.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(d.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                )
                                                                                               ) 
                                                                                        )                                                 
                                                                                   ,'='
                                                                                   ,1
                                                                                   ,1
                                                                                   ) + 1
                                                                             )
                                                                      )
                                                                 )
                                                          ,''
                                                          )
                                               else ''
                                               end
                                     end 
                                              ,'[^0-9.]'
                                              ,''
                                              )
                               ) - 1
                        )
            else
                 regexp_replace(
                 case
                      when instr(lower(
                                       decode(
                                              d.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(d.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,''
                                             )
                                      )
                                ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                ,1
                                ,1                      
                                ) != 0
                      then -- 두번째 문구를 그대로 사용해 된다.
                           decode(
                                  d.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(d.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(d.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                   ,'='
                                                   ,1
                                                   ,1
                                                   ) + 1
                                             )
                                      )
                                 ,''
                                 )
                      else 
                           case
                                when instr(
                                           lower(-- 세번째 결과 문구를 가져와라
                                                 decode(
                                                        d.exmn_cd
                                                       ,'RC1184'
                                                       ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                              ,0
                                                              ,''
                                                              ,trim(
                                                                    substr(
                                                                           to_char(d.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           )
                                                                          ) 
                                                                   )
                                                              )
                                                       ,''
                                                       ) 
                                                )
                                          ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                          ,1
                                          ,1
                                          ) != 0
                                then -- 세번째 문구에서 결과를 가져와라
                                     decode(
                                            d.exmn_cd
                                           ,'RC1184'
                                           ,decode(instr(to_char(d.cnls_dx_ctn),'=',1,3)
                                                  ,0
                                                  ,''
                                                  ,trim(
                                                        substr(
                                                               trim(
                                                                    substr(
                                                                           to_char(d.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           )
                                                                          ) 
                                                                   )
                                                              ,instr(
                                                                     trim(
                                                                          substr(
                                                                                 to_char(d.cnls_dx_ctn)
                                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 -
                                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(d.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(d.cnls_dx_ctn),instr(to_char(d.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 )
                                                                                ) 
                                                                         )                                                 
                                                                    ,'='
                                                                    ,1
                                                                    ,1
                                                                    ) + 1
                                                              )
                                                       )
                                                  )
                                           ,''
                                           )
                                else ''
                                end
                      end 
                               ,'[^0-9.]'
                               ,''
                               )
            end 
       ) mass_score
/* 혈압약 */
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM134Y' ,'1'
                                                            ,'AM134'  ,'1'
                                                            ,'RR105Y' ,'1'
                                                            ,'RR105'  ,'1'
                                                            ,'MA1231Y','1'
                                                            ,'MA1232Y','1','0')) med_hypertension
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1231Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1232Y','0','')) --,'2' 과거 치료
             trt_med_hypertension
/* 당뇨약 */
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM135Y' ,'1'
                                                            ,'AM135'  ,'1'
                                                            ,'RR106Y' ,'1'
                                                            ,'RR106'  ,'1'
                                                            ,'MA1234Y','1'
                                                            ,'MA1235Y','1','0')) med_diabetes
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1234Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1235Y','0','')) --,'2' 과거 치료
             trt_med_diabetes
/* 고지혈증약 */
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1237Y','1'
                                                                                   ,'MA1238Y','1','0')) med_hyperlipidemia
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1237Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1238Y','0','')) --,'2' 과거 치료
          trt_med_hyperlipidemia
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
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.0E5B5B285B28402857 c
     , 스키마.3E3243333E2E143C28 d
     , 스키마.3E3C23302E333E0E28 f
 where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and c.ptno = a.ptno
   and d.ptno = a.ptno
   and d.ordr_ymd = a.ordr_ymd
   and d.exmn_cd in (
                     'SM0600'
                    ,'BL3118'
                    ,'BL3164'
                    ,'BL3113'
                    ,'BL3141'
                    ,'BL3142'
                    ,'BL314201'
                    ,'BL314202'
                    ,'RC1184'
                    ,'SM0550' ,'SM055023' ,'SM055043' ,'SM055063','SM055083','SM055121','SM055141','SM055161','SM055181'
                    ,'SM055011' ,'SM055025' ,'SM055045' ,'SM055065','SM055085','SM055123','SM055143','SM055163','SM055182'
                    ,'SM055013' ,'SM055031' ,'SM055051' ,'SM055071','SM055111','SM055125','SM055145','SM055165','SM055183'
                    ,'SM055014' ,'SM055033' ,'SM055053' ,'SM055073','SM055113','SM055131','SM055151','SM055171'
                    ,'SM055015' ,'SM055035' ,'SM055055' ,'SM055075','SM055114','SM055133','SM055153','SM055173'
                    ,'SM055021' ,'SM055041' ,'SM055061' ,'SM055081','SM055115','SM055135','SM055155','SM055175'                    
                    )
   and nvl(d.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = d.ptno
                  and x.ordr_ymd = d.ordr_ymd
                  and x.ordr_sno = d.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
   and f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = 'MA1'
   and (
        f.item_sno between   7 and  21
       or 
        f.item_sno between 230 and 240
       )
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd
     , b.pckg_cd
     , b.pckg_nm
     , b.pckg_type_cd
