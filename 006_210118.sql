-- wjdgodbs
-- 판정문구
select (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where a.exmn_cd = x.ordr_cd
       ) exmn_nm
     , (
        select x.rslt_cd_nm
          from 스키마.3E3C4743282B284728 x
         where a.exmn_cd = x.exmn_cd
           and a.hlsc_rslt_cd = x.hlsc_rslt_cd
       ) rslt_nm
     , a.*
  from 스키마.3E3C15433E14283C28 a
 where a.exmn_cd = 'SM1801'
 order by 3,4,5,6,7

-- 결과코드내용
select *
  from 스키마.3E3C4743282B284728
 where exmn_cd = 'SM1801'
