-- whtnwls
select 펑션.등록번호변환펑션(a.ptno) id
     , c.gend_Cd
     , 펑션.나이계산펑션(a.ptno, a.ordr_ymd) age
     , case
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 20 then '01.~19'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 25 then '02.20~24'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 30 then '03.25~29'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 35 then '04.30~34'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 40 then '05.35~39'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 45 then '06.40~44'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 50 then '07.45~49'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 55 then '08.50~54'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 60 then '09.55~59'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 65 then '10.60~64'
            when 펑션.나이계산펑션(a.ptno, a.ordr_ymd) < 70 then '11.65~69'
            else '12.70~'
       end agegrp
     , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , case 
            when substr(b.pckg_type_cd,1,1) > '4' then '2.특화'
            else '1.정규'
       end pckg_type
     , (
        select count(x.ordr_ymd)
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno
           and x.ordr_ymd <= a.ordr_ymd
           and x.cncl_dt is null
           and x.pckg_cd = y.pckg_cd
           and y.pckg_type_cd not in ('5W','5Z','7')
       ) t_cnt
     , (
        select count(x.ordr_ymd)
          from 스키마.3E3C0E433E3C0E3E28 x
             , 스키마.3E3C3C5B0C233C3E28 y
         where x.ptno = a.ptno
           and x.ordr_ymd <= a.ordr_ymd
           and x.cncl_dt is null
           and x.pckg_cd = y.pckg_cd
           and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
       ) pkg_cnt
--     , a.ptno
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.0E5B5B285B28402857 c
 where 
--       a.ptno = 
--   and 
       a.ordr_ymd between to_date('19940101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and a.pckg_cd = b.pckg_cd
   and b.pckg_type_cd not in ('5W','5Z','7')
   and c.ptno = a.ptno
 order by 1, 5
