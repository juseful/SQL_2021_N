-- ckwngml
select (
        select x.hlsc_dtls_ctrl_nm
          from 스키마.3E3C472843143C3C28 x
         where x.hlsc_ctrl_cd = 'SMM02'
           and x.hlsc_dtls_ctrl_cd = a.pckg_type_cd
       ) pckg_type_nm
     , a.*
  from 스키마.3E3C3C5B0C233C3E28 a
 where pckg_use_yn = 'Y'
