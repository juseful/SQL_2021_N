-- qkrckddlf
-- 병원 직원 및 배우자 건진내역
select a.ptno
     , to_char(a.ordr_ymd,'yyyy') yyyy
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.pckg_cd
     , decode(c.hlsc_cnpl_cd,'100136','1.직원'
                            ,'100139','1.직원'
                            ,'100137','2.배우자'
                            ,'112010','2.배우자'
             ) GRP
     , 'A.병원' TYP
     , a.ocps_nm
     , c.hlsc_cnpl_cd
     , c.cnpl_nm
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.3E3C194720473C5B28 c
 where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and c.hlsc_cnpl_cd = substr(a.ctrc_no,1,6)
   and c.hlsc_cnpl_cd in (
                          '100136' --   2138205096    삼성의료원(staff)
                         ,'100137' --   2138205096    삼성의료원(staff배우자)
                         ,'100139' --   2138205096    삼성의료원(직원)
                         ,'112010' --   2138205096    삼성의료원(직원배우자)
                         )

-- 그룹임원 및 배우자 건진내역
select a.ptno
     , to_char(a.ordr_ymd,'yyyy') yyyy
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.pckg_cd
     , decode(b.pckg_type_cd,'3A','1.임원','2.배우자') GRP
     , 'B.임원' TYP
     , a.ocps_nm
     , c.hlsc_cnpl_cd
     , c.cnpl_nm
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.3E3C194720473C5B28 c
 where a.ordr_ymd between to_date('20190101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and b.pckg_type_cd in ('1','3A','3B') -- 임원 배우자의 경우 W3 혹은 MG15 PKG만 진행함.
   and c.hlsc_cnpl_cd = substr(a.ctrc_no,1,6)
   and c.hlsc_cnpl_cd in (
                          '100004','100006','100008','100009','100010','100011','100012','100013','100014','100015','100017','100020','100023','100024','100025'
                         ,'100026','100027','100028','100030','100032','100036','100037','111139','111145','111230','111319','111481','111603','111607','111611'
                         ,'111616','111618','111627','111648','111662','111663','111673','111701','111703','111707','111715','111728','111786','111796','111799'
                         ,'111814','111844','111867','111875','111890','111915','111930','111945','111947','112009','112050','112095','112107','112114','200000'
                         ,'200002','400004','400008','B00004','G00002','HK0014','I00002','J00022','N00002','S00014','T00014'
                         )

