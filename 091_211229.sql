-- qkrckddlf
-- 초음파, 영상의학의 경우 복초/갑초를 같이 하는 경우도 있어서 처방코드 제외함.
select a.enfr_ymd
     , a.day
--     , a.ordr_cd
--     , (
--        select x.ordr_nm
--          from 스키마.3C1520431543473C28 x
--         where x.ordr_cd = a.ordr_cd
--       ) ordr_nm
     , indr_id1
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.indr_id1
       ) indr_id1_nm
     , (
        select y.detl_cd_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.4747473C4715153C28 y
         where x.user_id = a.indr_id1 
           and y.comn_grp_cd = 'MNI_009'
           and y.comn_dtls_cd = x.mdcr_dprt_cd
       ) indr_id1_dprt_cd
     , a.enfr_start
     , a.enfr_end
--     , a.cnt
  from (
        select /*+ INDEX(A 3C15332B3C20431528_I19) */ 
               to_char(a.enfr_dt,'yyyy-mm-dd') enfr_ymd
             , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN') "DAY"
--             , a.ordr_cd
             , a.indr_id1
             , to_char(min(a.enfr_dt),'yyyy-mm-dd hh24:mi:ss') enfr_start
             , to_char(max(a.enfr_dt),'yyyy-mm-dd hh24:mi:ss') enfr_end
--             , count(a.ptno) cnt
          from 스키마.3C15332B3C20431528 a
         where a.enfr_dt between to_date('20210101','yyyymmdd') and to_date('20211130','yyyymmdd')+0.99999
           and a.codv_cd = 'G'
           and (a.ordr_cd like 'RS%'
               and 
                a.ordr_cd != 'RS2010' -- 경동맥초음파 제외
               or
                a.ordr_cd = 'BS2231'
               )
           and nvl(a.dc_dvsn_cd,'N') != 'X'
         group by 
               to_char(a.enfr_dt,'yyyy-mm-dd')
             , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN')
             , a.indr_id1
--             , a.ordr_cd
         order by 1, 3
       ) a

-- 내시경
select a.enfr_ymd
     , a.day
     , indr_id1
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.indr_id1
       ) indr_id1_nm
     , (
        select y.detl_cd_nm
          from 스키마.47472E3E43155B2928 x
             , 스키마.4747473C4715153C28 y
         where x.user_id = a.indr_id1 
           and y.comn_grp_cd = 'MNI_009'
           and y.comn_dtls_cd = x.mdcr_dprt_cd
       ) indr_id1_dprt_cd
     , a.enfr_start
     , a.enfr_end
  from (
        select /*+ INDEX(A 3C15332B3C20431528_I19) */ 
               to_char(a.enfr_dt,'yyyy-mm-dd') enfr_ymd
             , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN') "DAY"
             , a.indr_id1
             , to_char(min(a.enfr_dt),'yyyy-mm-dd hh24:mi:ss') enfr_start
             , to_char(max(a.enfr_dt),'yyyy-mm-dd hh24:mi:ss') enfr_end
          from 스키마.3C15332B3C20431528 a
         where a.enfr_dt between to_date('20210101','yyyymmdd') and to_date('20211130','yyyymmdd')+0.99999
           and a.codv_cd = 'G'
           and a.ordr_cd like 'BS41%'
           and nvl(a.dc_dvsn_cd,'N') != 'X'
         group by 
               to_char(a.enfr_dt,'yyyy-mm-dd')
             , DECODE(TO_CHAR(a.enfr_dt,'D'),'2','MON','3','TUE','4','WED','5','THU','6','FRI','7','SAT','1','SUN')
             , a.indr_id1
         order by 1, 3
       ) a
