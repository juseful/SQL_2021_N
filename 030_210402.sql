-- rkdalfk
select *
  from 스키마.3E3C15433E14283C28
 where (
        exmn_cd like 'RM%'
       or
        exmn_cd like 'RC%'
       )
   and jdgn_ctn like '%간에 낭종%'
 order by 1,2,3
