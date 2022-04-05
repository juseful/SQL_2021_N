-- qkrckddlf
-- 시간대별 체류인원
select a.yyyy
     , a.hlsc_prgr_ymd
     , a.ptno
     , b.gend_cd
     , a.pckg_cd
     , (
        select x.pckg_type_cd
          from 스키마.3E3C3C5B0C233C3E28 x
         where x.pckg_cd = a.pckg_cd
       ) pckg_type_cd
     , to_char(a.strt_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
     , '1.시작' grp
             , case 
                    when to_char(a.strt_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.strt_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.strt_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.strt_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.strt_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.strt_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.strt_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.strt_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.strt_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.strt_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.strt_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.strt_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.strt_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.strt_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.strt_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.strt_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , min(a.exmn_strt_dt) strt_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = a.ptno
union all
select a.yyyy
     , a.hlsc_prgr_ymd
     , a.ptno
     , b.gend_cd
     , a.pckg_cd
     , (
        select x.pckg_type_cd
          from 스키마.3E3C3C5B0C233C3E28 x
         where x.pckg_cd = a.pckg_cd
       ) pckg_type_cd
     , to_char(a.fnsh_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
     , '2.종료' grp
             , case 
                    when to_char(a.fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , max(a.exmn_fnsh_dt) fnsh_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = a.ptno

-- 내시경실 대기지정관련
select a.*, b.grp st_grp, b.timegrp stdt_grp, b.exmn_dt exmn_stdt 
  from (-- 내시경실 대기인원
        select a.yyyy
             , a.hlsc_prgr_ymd
             , a.ptno
             , b.gend_cd
             , a.pckg_cd
             , (
                select x.pckg_type_cd
                  from 스키마.3E3C3C5B0C233C3E28 x
                 where x.pckg_cd = a.pckg_cd
               ) pckg_type_cd
             , to_char(a.ex_fnsh_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
             , '1.대기시작' grp
                     , case 
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                            else '17.15:01~'
                       end timegrp
          from (
                select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
                     , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
                     , (-- 2018년 12월부터 매니저 지정한 경우는 검사예약시간을 이전 검사실 종료시간으로 update 안함. 최믿음 책임님 확인
                        -- 검사 시작시간보다 종료시간이 가장 마지막인 시간을 예약시간으로 간주
                        select max(x.exmn_fnsh_dt)
                          from 스키마.3E3C473C33153E2828 x
                         where a.hlsc_prgr_ymd = x.hlsc_prgr_ymd
                           and a.rprs_apnt_no = x.rprs_apnt_no
                           and a.exmn_strt_dt > x.exmn_fnsh_dt
                           and x.exmn_fnsh_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                           and nvl(X.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                       ) ex_fnsh_dt
                  from (
                        select a.hlsc_prgr_ymd
                             , a.ptno
                             , a.rprs_apnt_no
                             , a.pckg_cd
                             , min(a.exmn_strt_dt) exmn_strt_dt
                          from 스키마.3E3C473C33153E2828 a
                         where 
                               (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
                               or
                                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
                               )
                           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
                           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                           and exists (
                                       select 'Y'
                                         from 스키마.3E3C3C3C33153E2B28 x
                                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                                          AND (-- 내시경 검사실 좌표
                                               X.X_CRDN_NCVL_VL = 840
                                              AND 
                                               X.Y_CRDN_NCVL_VL = 660
                                              AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                                              )
                                      )
                         group by a.hlsc_prgr_ymd
                             , a.ptno
                             , a.rprs_apnt_no
                             , a.pckg_cd
                       ) a
               ) a
             , 스키마.0E5B5B285B28402857 b
         where b.ptno = a.ptno
       ) a
     , (-- 내시경 검사시작시간
        select a.yyyy
             , a.hlsc_prgr_ymd
             , a.ptno
             , b.gend_cd
             , a.pckg_cd
             , (
                select x.pckg_type_cd
                  from 스키마.3E3C3C5B0C233C3E28 x
                 where x.pckg_cd = a.pckg_cd
               ) pckg_type_cd
             , to_char(a.strt_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
             , '2.검사시작' grp
                     , case 
                            when to_char(a.strt_dt,'hh24miss') < '073100' then '01.~07:31'
                            when to_char(a.strt_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                            when to_char(a.strt_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                            when to_char(a.strt_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                            when to_char(a.strt_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                            when to_char(a.strt_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                            when to_char(a.strt_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                            when to_char(a.strt_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                            when to_char(a.strt_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                            when to_char(a.strt_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                            when to_char(a.strt_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                            when to_char(a.strt_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                            when to_char(a.strt_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                            when to_char(a.strt_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                            when to_char(a.strt_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                            when to_char(a.strt_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                            else '17.15:01~'
                       end timegrp
          from (
                select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
                     , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
                     , min(a.exmn_strt_dt) strt_dt
                  from 스키마.3E3C473C33153E2828 a
                 where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
                       or
                        a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
                       )
                   and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
                   and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                   and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                   and exists (
                               select 'Y'
                                 from 스키마.3E3C3C3C33153E2B28 x
                                WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                                  AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                                  AND (-- 내시경 검사실 좌표
                                       X.X_CRDN_NCVL_VL = 840
                                      AND 
                                       X.Y_CRDN_NCVL_VL = 660
                                      AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                                      )
                              )
                 group by a.hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
               ) a
             , 스키마.0E5B5B285B28402857 b
         where b.ptno = a.ptno
       ) b
 where a.ptno = b.ptno
   and a.hlsc_prgr_ymd = b.hlsc_prgr_ymd

-- 내시경실 대기 체류인원
-- 내시경실 대기인원
        select a.yyyy
             , a.hlsc_prgr_ymd
             , a.ptno
             , b.gend_cd
             , a.pckg_cd
             , (
                select x.pckg_type_cd
                  from 스키마.3E3C3C5B0C233C3E28 x
                 where x.pckg_cd = a.pckg_cd
               ) pckg_type_cd
             , to_char(a.ex_fnsh_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
             , '1.대기시작' grp
                     , case 
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                            when to_char(a.ex_fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                            else '17.15:01~'
                       end timegrp
          from (
                select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
                     , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
                     , (-- 2018년 12월부터 매니저 지정한 경우는 검사예약시간을 이전 검사실 종료시간으로 update 안함. 최믿음 책임님 확인
                        -- 검사 시작시간보다 종료시간이 가장 마지막인 시간을 예약시간으로 간주
                        select max(x.exmn_fnsh_dt)
                          from 스키마.3E3C473C33153E2828 x
                         where a.hlsc_prgr_ymd = x.hlsc_prgr_ymd
                           and a.rprs_apnt_no = x.rprs_apnt_no
                           and a.exmn_strt_dt > x.exmn_fnsh_dt
                           and x.exmn_fnsh_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                           and nvl(X.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                       ) ex_fnsh_dt
                  from (
                        select a.hlsc_prgr_ymd
                             , a.ptno
                             , a.rprs_apnt_no
                             , a.pckg_cd
                             , min(a.exmn_strt_dt) exmn_strt_dt
                          from 스키마.3E3C473C33153E2828 a
                         where 
                               (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
                               or
                                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
                               )
                           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
                           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                           and exists (
                                       select 'Y'
                                         from 스키마.3E3C3C3C33153E2B28 x
                                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                                          AND (-- 내시경 검사실 좌표
                                               X.X_CRDN_NCVL_VL = 840
                                              AND 
                                               X.Y_CRDN_NCVL_VL = 660
                                              AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                                              )
                                      )
                         group by a.hlsc_prgr_ymd
                             , a.ptno
                             , a.rprs_apnt_no
                             , a.pckg_cd
                       ) a
               ) a
             , 스키마.0E5B5B285B28402857 b
         where b.ptno = a.ptno
UNION ALL
-- 내시경 검사시작시간
        select a.yyyy
             , a.hlsc_prgr_ymd
             , a.ptno
             , b.gend_cd
             , a.pckg_cd
             , (
                select x.pckg_type_cd
                  from 스키마.3E3C3C5B0C233C3E28 x
                 where x.pckg_cd = a.pckg_cd
               ) pckg_type_cd
             , to_char(a.strt_dt,'yyyy-mm-dd hh24:mi:ss') exmn_dt
             , '2.검사시작' grp
                     , case 
                            when to_char(a.strt_dt,'hh24miss') < '073100' then '01.~07:31'
                            when to_char(a.strt_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                            when to_char(a.strt_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                            when to_char(a.strt_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                            when to_char(a.strt_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                            when to_char(a.strt_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                            when to_char(a.strt_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                            when to_char(a.strt_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                            when to_char(a.strt_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                            when to_char(a.strt_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                            when to_char(a.strt_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                            when to_char(a.strt_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                            when to_char(a.strt_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                            when to_char(a.strt_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                            when to_char(a.strt_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                            when to_char(a.strt_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                            else '17.15:01~'
                       end timegrp
          from (
                select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
                     , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
                     , min(a.exmn_strt_dt) strt_dt
                  from 스키마.3E3C473C33153E2828 a
                 where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
                       or
                        a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
                       )
                   and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
                   and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                   and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                   and exists (
                               select 'Y'
                                 from 스키마.3E3C3C3C33153E2B28 x
                                WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                                  AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                                  AND (-- 내시경 검사실 좌표
                                       X.X_CRDN_NCVL_VL = 840
                                      AND 
                                       X.Y_CRDN_NCVL_VL = 660
                                      AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                                      )
                              )
                 group by a.hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
               ) a
             , 스키마.0E5B5B285B28402857 b
         where b.ptno = a.ptno

-- 내시경실 대기인원
select a.yyyy
     , a.hlsc_prgr_ymd
     , a.ptno
     , b.gend_cd
     , a.pckg_cd
     , (
        select x.pckg_type_cd
          from 스키마.3E3C3C5B0C233C3E28 x
         where x.pckg_cd = a.pckg_cd
       ) pckg_type_cd
     , to_char(a.ex_fnsh_dt,'yyyy-mm-dd hh24:mi:ss') ex_fnsh_dt
     , '1.대기' grp
             , case 
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.ex_fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , (-- 2018년 12월부터 매니저 지정한 경우는 검사예약시간을 이전 검사실 종료시간으로 update 안함. 최믿음 책임님 확인
                -- 검사 시작시간보다 종료시간이 가장 마지막인 시간을 예약시간으로 간주
                select max(x.exmn_fnsh_dt)
                  from 스키마.3E3C473C33153E2828 x
                 where a.hlsc_prgr_ymd = x.hlsc_prgr_ymd
                   and a.rprs_apnt_no = x.rprs_apnt_no
                   and a.exmn_strt_dt > x.exmn_fnsh_dt
                   and x.exmn_fnsh_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                   and nvl(X.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
               ) ex_fnsh_dt
          from (
                select a.hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
                     , min(a.exmn_strt_dt) exmn_strt_dt
                  from 스키마.3E3C473C33153E2828 a
                 where 
                       (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
                       or
                        a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
                       )
                   and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
                   and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                   and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                   and exists (
                               select 'Y'
                                 from 스키마.3E3C3C3C33153E2B28 x
                                WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                                  AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                                  AND (-- 내시경 검사실 좌표
                                       X.X_CRDN_NCVL_VL = 840
                                      AND 
                                       X.Y_CRDN_NCVL_VL = 660
                                      AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                                      )
                              )
                 group by a.hlsc_prgr_ymd
                     , a.ptno
                     , a.rprs_apnt_no
                     , a.pckg_cd
               ) a
       ) a
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = a.ptno

-- 내시경 검사실만 대상
select a.*
     , '1.시작' grp
             , case 
                    when to_char(a.strt_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.strt_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.strt_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.strt_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.strt_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.strt_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.strt_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.strt_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.strt_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.strt_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.strt_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.strt_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.strt_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.strt_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.strt_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.strt_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , min(a.exmn_strt_dt) strt_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                          AND (-- 내시경 검사실 좌표
                               X.X_CRDN_NCVL_VL = 840
                              AND 
                               X.Y_CRDN_NCVL_VL = 660
                              )
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a
union all
select a.*
     , '2.종료' grp
             , case 
                    when to_char(a.fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , max(a.exmn_fnsh_dt) fnsh_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                          AND (-- 내시경 검사실 좌표
                               X.X_CRDN_NCVL_VL = 840
                              AND 
                               X.Y_CRDN_NCVL_VL = 660
                              )
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a

-- 내시경 회복실만
select a.*
     , '1.시작' grp
             , case 
                    when to_char(a.strt_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.strt_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.strt_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.strt_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.strt_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.strt_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.strt_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.strt_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.strt_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.strt_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.strt_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.strt_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.strt_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.strt_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.strt_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.strt_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , min(a.exmn_strt_dt) strt_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                          AND (-- 내시경 검사실 좌표
                               X.X_CRDN_NCVL_VL = 840
                              AND 
                               X.Y_CRDN_NCVL_VL = 660
                              --AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                              and x.exrm_nm in ('회복실(암센타)')
                              )
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a
union all
select a.*
     , '2.종료' grp
             , case 
                    when to_char(a.fnsh_dt,'hh24miss') < '073100' then '01.~07:31'
                    when to_char(a.fnsh_dt,'hh24miss') < '080100' then '02.07:31~08:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '083100' then '03.08:01~08:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '090100' then '04.08:31~09:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '093100' then '05.09:01~09:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '100100' then '06.09:31~10:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '103100' then '07.10:01~10:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '110100' then '08.10:31~11:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '113100' then '09.11:01~11:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '120100' then '10.11:31~12:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '123100' then '11.12:01~12:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '130100' then '12.12:31~13:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '133100' then '13.13:01~13:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '140100' then '14.13:31~14:00'
                    when to_char(a.fnsh_dt,'hh24miss') < '143100' then '15.14:01~14:30'
                    when to_char(a.fnsh_dt,'hh24miss') < '150100' then '16.14:31~15:00'
                    else '17.15:01~'
               end timegrp
  from (
        select to_char(a.hlsc_prgr_ymd,'yyyy-mm') yyyy
             , to_char(a.hlsc_prgr_ymd,'yyyy-mm-dd') hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
             , max(a.exmn_fnsh_dt) fnsh_dt
          from 스키마.3E3C473C33153E2828 a
         where (a.hlsc_prgr_ymd between to_date('20191001','yyyymmdd') and to_date('20191031','yyyymmdd')
               or
                a.hlsc_prgr_ymd between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd')
               )
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and exists (
                       select 'Y'
                         from 스키마.3E3C3C3C33153E2B28 x
                        WHERE X.HLSC_EXRM_CD = A.HLSC_EXRM_CD
                          AND X.HSLC_DVSN_CD = 'C' /* 암병원 검사실만 대상 */
                          AND (-- 내시경 검사실 좌표
                               X.X_CRDN_NCVL_VL = 840
                              AND 
                               X.Y_CRDN_NCVL_VL = 660
                              --AND X.EXRM_NM NOT IN ('동의서','요소호기검사','내시경설명','[회복]재입실')
                              and x.exrm_nm in ('회복실(암센타)')
                              )
                      )
         group by a.hlsc_prgr_ymd
             , a.ptno
             , a.rprs_apnt_no
             , a.pckg_cd
       ) a
