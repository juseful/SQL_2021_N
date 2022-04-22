-- rkddmstnr
select 
       (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.exmn_cd
       ) exmn_nm
     , a.*
  from 스키마.3E3C4743282B284728 a
 order by 2,3
