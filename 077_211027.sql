-- rngPwjd
select to_char(a.ordr_ymd,'yyyy-mm') months
     , A.EXMN_IMPT_ID
     , A.USER_NM
     , A.EXrm_NM
     , A.DAY_GUBUN
     , COUNT(A.PTNO) CNT
  from (
        select a.ordr_ymd
             , DECODE(TO_CHAR(a.ordr_ymd,'D'),'1','주말','7','주말','주중') DAY_GUBUN
             , a.hlsc_exrm_cd
             , (-- 검사실정보
                select x.exrm_nm
                  from 스키마.3E3C3C3C33153E2B28 x
                 where x.hlsc_exrm_cd = a.hlsc_exrm_cd
               ) exrm_nm
             , a.exmn_impt_id
             , (-- 사용자 정보
                select x.user_nm
                  from 스키마.47472E3E43155B2928 x
                 where x.user_id = a.exmn_impt_id
               ) user_nm
             , a.ptno
             , (-- 검사 진행상태
                select x.exmn_andv_cd
                  from 스키마.3E3C473C33153E2828 x
                 where x.ptno = a.ptno
                   and x.hlsc_prgr_ymd = a.ordr_ymd
                   and x.hlsc_exrm_cd = a.hlsc_exrm_cd
               ) exmn_andv_cd
          from 스키마.3E3C23432F332B3328 a
         where ordr_ymd between to_date('20201101','yyyymmdd') and to_date('20211031','yyyymmdd')
           and exists (
                       select x.*
                         from 스키마.29322E3E33433C3C28 x
                        where x.orgl_blng_dprt_cd = '11212H'
                          and x.dprt_cd = '113000'
                          and x.ctrc_expt_ymd is null
                          and X.EMNO = a.exmn_impt_id
                      )
       ) a
 where a.exmn_andv_cd not in ('N','S')
 group by to_char(a.ordr_ymd,'yyyy-mm'), A.EXMN_IMPT_ID
     , A.USER_NM
     , A.EXrm_nm
     , A.DAY_GUBUN
 order by 1,2,4
