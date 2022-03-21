-- RHWLDNJS
select to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.ptno
     , b.ptnt_nm
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,sysdate) age
     , to_char(b.btdt,'yyyy-mm-dd') btdt
     , a.pckg_cd
     , a.ctrc_no
     , a.wrpl_nm
     , a.ocps_nm
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'1' ,a.pckg_exmn_cd,''),'')) add_01
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'2' ,a.pckg_exmn_cd,''),'')) add_02
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'3' ,a.pckg_exmn_cd,''),'')) add_03
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'4' ,a.pckg_exmn_cd,''),'')) add_04
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'5' ,a.pckg_exmn_cd,''),'')) add_05
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'6' ,a.pckg_exmn_cd,''),'')) add_06
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'7' ,a.pckg_exmn_cd,''),'')) add_07
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'8' ,a.pckg_exmn_cd,''),'')) add_08
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'9' ,a.pckg_exmn_cd,''),'')) add_09
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'10',a.pckg_exmn_cd,''),'')) add_10
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'11',a.pckg_exmn_cd,''),'')) add_11
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'12',a.pckg_exmn_cd,''),'')) add_12
     , max(decode(a.exmn_dvsn_cd,'1',decode(a.rn,'13',a.pckg_exmn_cd,''),'')) add_13
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'1' ,a.pckg_exmn_cd,''),'')) sel_01
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'2' ,a.pckg_exmn_cd,''),'')) sel_02
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'3' ,a.pckg_exmn_cd,''),'')) sel_03
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'4' ,a.pckg_exmn_cd,''),'')) sel_04
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'5' ,a.pckg_exmn_cd,''),'')) sel_05
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'6' ,a.pckg_exmn_cd,''),'')) sel_06
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'7' ,a.pckg_exmn_cd,''),'')) sel_07
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'8' ,a.pckg_exmn_cd,''),'')) sel_08
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'9' ,a.pckg_exmn_cd,''),'')) sel_09
     , max(decode(a.exmn_dvsn_cd,'2',decode(a.rn,'10',a.pckg_exmn_cd,''),'')) sel_10
  from (
        select row_number () over (partition by b.apnt_no, b.exmn_dvsn_cd order by b.pckg_exmn_cd) rn
             , a.ordr_prrn_ymd, a.wrpl_nm, a.ocps_nm, b.*
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C0E5B0C233C1528 b
         where a.ordr_prrn_ymd > trunc(sysdate)
           and a.cncl_dt is null
           and a.ctrc_no like '111436%29'
           and b.apnt_no = a.apnt_no
--           and b.exmn_dvsn_cd in ('1','2')
           and b.cncl_dt is null
       ) a
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = a.ptno
 group by a.ptno
     , a.ordr_prrn_ymd
     , a.pckg_cd
     , a.ctrc_no
     , b.gend_cd
     , b.btdt
     , b.ptnt_nm
     , a.wrpl_nm
     , a.ocps_nm
 order by 1, 2
