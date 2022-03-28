-- rkdalfk
select /*+ ordered use_nl(a b) index(a 3E3C0E433E3C0E3E28_i13) index(b 3E3C3C5B0C233C3E28_pk) */
       a.ptno
     , 펑션.등록번호변환펑션(a.ptno) CDW
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
 where a.ordr_prrn_ymd between to_date('20010101','yyyymmdd') and to_date('20210831','yyyymmdd')
   and a.ordr_ymd is not null
   and a.cncl_dt is null
   and a.ptno not in (
                      &not_in_ptno
                     )
   and b.pckg_cd = a.pckg_cd
   and b.pckg_type_cd != '7'
 group by a.ptno
