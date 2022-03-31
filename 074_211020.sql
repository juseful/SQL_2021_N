-- rkdalfk
SELECT b.*
  FROM 스키마.CUNOTIDMT A
     , 스키마.CUNOTIMMT b
 WHERE A.RGST_YMD between to_date('20210825','yyyymmdd') and to_date('20211021','yyyymmdd')
   AND A.RCVR_ID = '208138'
   AND a.frst_rgsr_id like '5%'
   and B.RGST_YMD = a.rgst_ymd
   and b.rgst_sno = a.rgst_sno
 order by 1

select *
  from 스키마.3E3C472843143C3C28
 where hlsc_ctrl_cd like '%SMM73%'
   and hlsc_dtls_ctrl_cd like 'BP1A152%'
   
select *
  from 스키마.3E3C472843143C3C28
 where hlsc_ctrl_cd like '%SMM73%'
--   and hlsc_dtls_ctrl_cd like 'BP1A152%'
