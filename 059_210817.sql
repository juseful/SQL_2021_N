select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BP1A152%'
   AND UPPER(HLSC_RSLT_CD) LIKE 'ZZZ%'
   and jdgn_cd = '010002'
   
select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BP1A153%'
   AND UPPER(HLSC_RSLT_CD) LIKE 'ZZZ%'
   and jdgn_cd = '060002'

select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BS4141%'
   AND HLSC_RSLT_CD IN ('C001','C104','C200','C201','C202','cppBx','CS10')
   and jdgn_cd = '070002'
   
select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BS4148%'
   AND HLSC_RSLT_CD IN ('C001','C104','C200','C201','C202','cppBx','CS10')
   and jdgn_cd = '070002'
   
select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BS4411%'
   AND HLSC_RSLT_CD IN ('C001','C104','C200','C201','C202','cppBx','CS10')
   and jdgn_cd = '060002'
   
select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BS4417%'
   AND HLSC_RSLT_CD IN ('C001','C104','C200','C201','C202','cppBx','CS10')
   and jdgn_cd = '070002'
   
select *
  from 스키마.3E3C15433E14283C28
 WHERE EXMN_CD LIKE 'BS4417%'
   AND HLSC_RSLT_CD IN ('C001','C104','C200','C201','C202','cppBx','CS10')
   and jdgn_cd = '070002'
   
select *
  from 스키마.3E3C15433E14283C28
 where exmn_cd = 'NR2301'
