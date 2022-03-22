-- dlgywls
with t as (
           select a.ptno
             from 스키마.3E3C0E433E3C0E3E28 a
            where a.ordr_ymd between to_date('20170101','yyyymmdd') and to_date('20191231','yyyymmdd')
              and a.cncl_dt is null
            group by a.ptno
          )
select t.ptno
     , b.frrn||'-'||b.brrn resno
     , b.ntnl_cd
     , case
            when (  substr(b.brrn,1,1) = '5'
                 or substr(b.brrn,1,1) = '6'
                 or substr(b.brrn,1,1) = '7'
                 or substr(b.brrn,1,1) = '8'
                 )
                 and nvl(b.ntnl_cd,'XX') != 'KR'
            then 'Y'
            else 'N'
       end foreignyn
  from t
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = t.ptno
