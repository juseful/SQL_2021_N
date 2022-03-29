-- skaduddn
select *
  from 스키마.3E3C472843143C3C28
 where hlsc_ctrl_cd = 'SM306'
   and hlsc_ctrl_chrc_vl7 = 'C'
   and hlsc_ctrl_chrc_vl1 in ('BS4100','BP1A151A')
   and hlsc_ctrl_chrc_vl9 = '29991231'
 ORDER BY hlsc_ctrl_chrc_vl2
