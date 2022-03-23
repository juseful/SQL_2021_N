-- rkddmstnr
select (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.exmn_cd
       ) ordr_nm
     , (
        select x.rslt_cd_nm
          from 스키마.3E3C4743282B284728 x
         where x.exmn_cd = a.exmn_cd
           and x.hlsc_rslt_cd = a.hlsc_rslt_cd
       ) rslt_cd_nm
     , a.* 
  from 스키마.3E3C15433E14283C28 a
 order by 3,4,5,6,7
