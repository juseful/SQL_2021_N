-- whtnwls
select a.*
     , MAXYMD - MINYMD
  from (
        select a.ptno
             , min(a.ordr_ymd) minymd
             , max(a.ordr_ymd) maxymd
             , count(a.ptno) cnt
          from (                     
                select /*+ index(a 3C15332B3C20431528_i04) */
                       a.ptno
                     , a.ordr_ymd
                  from 스키마.3C15332B3C20431528 a
                 where 
--                       a.ptno = 
--                   and 
                       a.ordr_ymd between to_date('20080101','yyyymmdd') and to_date('20201231','yyyymmdd')
                   and a.ordr_cd = 'BS2111'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SS'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
               ) a
         group by a.ptno
       ) a
 where a.cnt > 1
