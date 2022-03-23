-- dlaudgk
-- READ_N, 2017년 11월부터 판독도 실시일자 기준으로 조회하기로 함.
-- 의사별 판독건수(판독일 기준) : 영상  ..2009.02.04..CT의 SWWORKMT EXAMTYP을 SR -> SM 변경
SELECT /*+ index(a 3E4F4F20430C3C3C28_i02) */
       a.codv_cd
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , a.exmn_cd "EXAM"
     , c.ordr_nm
     , a.hslc_dvsn_cd
     , TO_CHAR(a.enfr_dt,'YYYY-MM-DD') EXEC_DAY
     , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN') "DAY"
     , DECODE(TO_CHAR(a.enfr_dt,'D'),'1','주말','7','주말','주중') DAY_GUBUN
     , a.indr_id1||'-'||b.user_nm DR
     , COUNT(a.ptno) CNT
  FROM 스키마.3E4F4F20430C3C3C28 A
     , 스키마.47472E3E43155B2928 B
     , 스키마.3C1520431543473C28 C
 WHERE a.enfr_dt between to_date('20190101','yyyymmdd') and to_date('20210531','yyyymmdd')+0.99999
   AND (a.excf_cd = 'SR' OR substr(a.exmn_cd,1,2) ='RC')
   AND A.CODV_CD = 'G' -- 2013년 부터 입원, 외래 처방의 경우도 포함하기로 함.
   AND a.exmn_cd = 'RM2041C'
   AND a.indr_id1 = b.user_id
--   and b.mdcr_dprt_cd = '113000'
   and a.exmn_cd = c.ordr_cd
 GROUP BY a.codv_cd
     , to_char(a.ordr_ymd,'yyyy-mm-dd')
     , a.exmn_cd
     , c.ordr_nm
     , a.hslc_dvsn_cd
     , TO_CHAR(a.enfr_dt,'YYYY-MM-DD')
     , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN')
     , DECODE(TO_CHAR(a.enfr_dt,'D'),'1','주말','7','주말','주중')
     , a.indr_id1||'-'||b.user_nm
