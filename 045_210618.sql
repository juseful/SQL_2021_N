-- whehdrkq
select to_char(a.HLSC_PRGR_YMD,'yyyy-mm-dd') hlsc_prgr_ymd
     , "DAY"
     , a.PTNO
     , a.pckg_cd
     , a.HLSC_EXRM_CD
     , A.exrm_nm
     , a.RPRS_APNT_NO
     , to_char(a.EXMN_APNT_DT,'yyyy-mm-dd hh24:mi:ss') EXMN_APNT_DT
     , to_char(a.EXMN_STRT_DT,'yyyy-mm-dd hh24:mi:ss') EXMN_STRT_DT
     , to_char(a.EXMN_FNSH_DT,'yyyy-mm-dd hh24:mi:ss') EXMN_FNSH_DT
     , to_char(a.ex_fnsh_dt  ,'yyyy-mm-dd hh24:mi:ss') ex_fnsh_dt
     , to_char(a.wait_rgst_dt,'yyyy-mm-dd hh24:mi:ss') wait_rgst_dt
--     , to_char(a.wait_rgst_dt2,'yyyy-mm-dd hh24:mi:ss') wait_rgst_dt2
  from (-- 정보조회
        select a.HLSC_PRGR_YMD
             , a.PTNO
             , a.pckg_cd
             , a.HLSC_EXRM_CD
             , d.exrm_nm
             , a.RPRS_APNT_NO
             , a.EXMN_APNT_DT
             , a.EXMN_STRT_DT
             , a.EXMN_FNSH_DT
--                   , a.EXMN_ANDV_CD
--                   , a.HSLC_DVSN_CD
             , DECODE(TO_CHAR(a.hlsc_prgr_ymd,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN') "DAY"
             , (-- 2018년 12월부터 매니저 지정한 경우는 검사예약시간을 이전 검사실 종료시간으로 update 안함. 최믿음 책임님 확인
                -- 검사 시작시간보다 종료시간이 가장 마지막인 시간을 예약시간으로 간주
                select max(x.exmn_fnsh_dt)
                  from 스키마.3E3C473C33153E2828 x
                 where a.hlsc_prgr_ymd = x.hlsc_prgr_ymd
                   and a.rprs_apnt_no = x.rprs_apnt_no
                   and a.exmn_strt_dt > x.exmn_fnsh_dt
                   and x.exmn_fnsh_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
                   and x.pckg_cd != 'RR' -- 숙박 등 추후 검사자 제외
                   and nvl(X.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
                --   and x.hlsc_exrm_cd not in ('CM00','CF00','CU99') -- 이전 검사방 종료시간 고려시에는 제외
               ) ex_fnsh_dt
             , (-- 검사시작시간 정보가 있고, 최초로 인식한 시간을 기준.데이터 조회해 보니, 시작 이후에도 LF에 인식되어 접수될 가능성
                select max(x.wait_rgst_dt)
                  from 스키마.3E3C23432F302E3328 x
                 where x.ptno = a.ptno
                   and x.exmn_ymd = a.hlsc_prgr_ymd
                   and x.hlsc_exrm_cd = a.hlsc_exrm_cd
                   and x.wait_rgst_dt < a.exmn_strt_dt
                   and x.exmn_strt_dt is not null
               ) wait_rgst_dt
--             , (
--                select max(x.wait_rgst_dt)
--                  from 스키마.3E3C23432F302E3328 x
--                 where x.ptno = a.ptno
--                   and x.exmn_ymd = a.hlsc_prgr_ymd
--                   and x.hlsc_exrm_cd = a.hlsc_exrm_cd
--                   and x.exmn_strt_dt is not null
--               ) wait_rgst_dt2
          from 스키마.3E3C473C33153E2828 a
             , 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C3C5B0C233C3E28 c
             , 스키마.3E3C3C3C33153E2B28 d
         where a.hlsc_prgr_ymd between to_date('20210419','yyyymmdd') and to_date('20210618','yyyymmdd')
           and to_char(a.hlsc_prgr_ymd,'D') not in ('7','1')
--                 and a.ptno in ()
           and a.pckg_cd != 'RR' -- 숙박 등 추후 검사자 제외
           and nvl(a.exmn_andv_cd,'F') not in ('N','S') -- NEXT, SKIP 제외
           and a.hlsc_exrm_cd not in ('CM00','CF00','CU99') -- 검사진행, 귀가안내 방 제외
           and a.hlsc_exrm_cd in ('U454','U455','U451','U453','F32','F271','M09')
           and a.hslc_dvsn_cd = 'C'
           and A.EXMN_STRT_DT is not null
           and a.exmn_strt_dt between a.hlsc_prgr_ymd and a.hlsc_prgr_ymd+0.99999 -- 같은 날짜에 처리한 기준만 조회
           and a.rprs_apnt_no = b.rprs_apnt_no
           and b.cncl_dt is null
           and b.ordr_ymd is not null
           and b.hslc_dvsn_cd = 'C'
           and b.pckg_cd = c.pckg_cd
           and substr(c.pckg_type_cd,1,1) in ('0','1','2','3') -- 정규건진 중 숙박자 제외
           and c.pckg_cd not in ('SCEM','SCEF')
           and a.HLSC_EXRM_CD = d.HLSC_EXRM_CD
       ) a
