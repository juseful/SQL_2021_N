-- whtnwls
select *
  from 스키마.3E4F4F20430C3C3C28
 where ptno = ''
   and exmn_cd = 'BS4100'
   
select *
  from all_tab_comments
 where comments like '%장비%'

select *
  from 스키마.SZEQIPCMT
 where eqpm_cd in ('2746160','2746160','2463544');
 
select *
  from 스키마.SZEQIPCMT
 where eqpm_nm like '%건의%위내시경%'
 order by frst_rgst_dt
