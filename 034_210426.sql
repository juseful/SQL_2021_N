-- whtnwls
-- 년도별 로직데이터 추출
-- 최종
select 펑션.등록번호변환펑션(b.ptno) cdw
     , b.ptno
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , decode(b.exmn_cd,'RC1184',to_char(b.exrs_ctn),'') result
     , decode(b.exmn_cd,'RC1184',to_char(b.cnls_dx_ctn),'') conclusion
     , decode(
              b.exmn_cd
             ,'RC1184'
             ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                    ,0
                    ,''
                    ,trim(
                          substr(
                                 to_char(b.cnls_dx_ctn)
                                ,1
                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                 +                                     -- 3. 더한다.
                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                )
                         )
                    )
             ,''
             ) cac_text
     , case
            when instr(lower(
                             decode(
                                    b.exmn_cd
                                   ,'RC1184'
                                   , trim(
                                          substr(
                                                 to_char(b.cnls_dx_ctn)
                                                ,-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 -
                                                 (-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                        b.exmn_cd
                       ,'RC1184'
                       ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                              ,0
                              ,''
                              ,trim(
                                    substr(
                                           to_char(b.cnls_dx_ctn)
                                          ,-- 두번째 구분값의 시작위치 이후
                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                           -
                                           (-- 두번째 구분값의 시작위치 이후
                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                           )
                                          ) 
                                   )
                              )
                       ,''
                       )
            else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                 decode(
                        b.exmn_cd
                       ,'RC1184'
                       , trim(
                              substr(
                                     to_char(b.cnls_dx_ctn)
                                    ,-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                    ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     -
                                     (-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     )
                                    ) 
                             )
                       ,''
                       )
            end volume_score_text
     , case
            when instr(lower(
                             decode(
                                    b.exmn_cd
                                   ,'RC1184'
                                   , trim(
                                          substr(
                                                 to_char(b.cnls_dx_ctn)
                                                ,-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 -
                                                 (-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                        b.exmn_cd
                       ,'RC1184'
                       , trim(
                              substr(
                                     to_char(b.cnls_dx_ctn)
                                    ,-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                    ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     -
                                     (-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     )
                                    ) 
                             )
                       ,''
                       )
            else 
                 case
                      when instr(
                                 lower(-- 세번째 결과 문구를 가져와라
                                       decode(
                                              b.exmn_cd
                                             ,'RC1184'
                                             ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                    ,0
                                                    ,''
                                                    ,trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                      then -- 세번째 결과 문구를 가져와라
                           decode(
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                        ,0
                                        ,''
                                        ,trim(
                                              substr(
                                                     to_char(b.cnls_dx_ctn)
                                                    ,-- 두번째 구분값의 시작위치 이후
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                    ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                     -
                                                     (-- 두번째 구분값의 시작위치 이후
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                     )
                                                    ) 
                                             )
                                        )
                                 ,''
                                 ) 
                      else ''
                      end
            end mass_score_text
     , case
            when
                 substr(
                        decode(b.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(b.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(b.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
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
                                decode(b.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(b.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
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
                        decode(b.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(b.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(b.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
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
                                decode(b.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(b.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
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
                 decode(b.exmn_cd
                       ,'RC1184'
                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                             ,0
                                             ,'0'
                                             ,trim(
                                                   substr(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,1
                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                )
                                                         ,instr(
                                                                substr(
                                                                       to_char(b.cnls_dx_ctn)
                                                                      ,1
                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
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
            end aj_130
     , case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(b.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(b.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(b.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(b.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                              b.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                        ,0
                                        ,''
                                        ,trim(
                                              substr(
                                                     trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                    ,instr(
                                                           trim(
                                                                substr(
                                                                       to_char(b.cnls_dx_ctn)
                                                                      ,-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                      ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       -
                                                                       (-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
            end volume_130
     , case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                               b.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                   b.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(b.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                                       b.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                           b.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(b.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                               b.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                   b.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(b.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                                       b.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                           b.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(b.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                              b.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                                        b.exmn_cd
                                                       ,'RC1184'
                                                       ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                              ,0
                                                              ,''
                                                              ,trim(
                                                                    substr(
                                                                           to_char(b.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
                                            b.exmn_cd
                                           ,'RC1184'
                                           ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                  ,0
                                                  ,''
                                                  ,trim(
                                                        substr(
                                                               trim(
                                                                    substr(
                                                                           to_char(b.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           )
                                                                          ) 
                                                                   )
                                                              ,instr(
                                                                     trim(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 -
                                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
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
            end mass_score
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
--   and a.ptno in ('')
   and a.cncl_dt is null
   and b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd = 'RC1184'
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') != 'X' 
              )
   and c.ptno = a.ptno
 order by 3,2
