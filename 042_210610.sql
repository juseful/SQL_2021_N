-- whehdrkq
select *
  from 스키마.3E3C194720473C5B28 a
  
select (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.exmn_cd
       ) ordr_nm
     , a.*
  from 스키마.3E3C15433E14283C28 a
 where jdgn_ctn like '%4~5%'
 order by 2,3,4,5,6
