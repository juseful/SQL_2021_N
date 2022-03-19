-- whtnwls
select a.*
     , MAXYMD - MINYMD
     , F.SMK_YS
     , f.SMK
     , f.SMK_DURATION
     , f.SMK_CURRENT_AMOUNT
     , f.SMK_START_AGE
     , f.SMK_ENDYR
     , f.SMK_PACKYRS
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
                       a.ordr_ymd between to_date('20080101','yyyymmdd') and to_date('20160701','yyyymmdd')
                   and a.ordr_cd = 'RC1241'
                   and a.codv_cd = 'G'
                   and a.excf_cd = 'SR'
                   and nvl(a.dc_dvsn_cd,'N') = 'N'
               ) a
         group by a.ptno
       ) a
     , 스키마.1543294D47144D302E333E0E28 f
 where a.cnt > 3
   and f.ptno = a.ptno
   and F.ORDR_PRRN_YMD = a.minymd
--   and trunc((a.MAXYMD - a.MINYMD)/365) > 2
   and f.smk_ys = '1'
--   and f.smk in ('1','2')
   and nvl(f.smk,'N') != '0'
--   and f.smk_endyr not in ('4','9999')
   and nvl(f.smk_endyr,'N') not in ('4','9999')
   and to_number(f.smk_packyrs) >= 20
   and f.smk_packyrs not in ('9999')