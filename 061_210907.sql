select a.ptno
     , a.frst_rgst_ip
     , max(decode(a.exmn_cd,'SM0101',a.exrs_ncvl_vl,'')) SM0101
     , max(decode(a.exmn_cd,'SM0102',a.exrs_ncvl_vl,'')) SM0102
     , max(decode(a.exmn_cd,'SM0104',a.exrs_ncvl_vl,'')) SM0104
     , max(decode(a.exmn_cd,'SM0106',a.exrs_ncvl_vl,'')) SM0106
     , max(decode(a.exmn_cd,'SM0111',a.exrs_ncvl_vl,'')) SM0111
     , max(decode(a.exmn_cd,'SM0112',a.exrs_ncvl_vl,'')) SM0112
     , max(decode(a.exmn_cd,'SM3140',a.exrs_ncvl_vl,'')) SM3140
     , max(decode(a.exmn_cd,'SM3150',a.exrs_ncvl_vl,'')) SM3150
     , max(decode(a.exmn_cd,'SM316001',a.exrs_ncvl_vl,'')) SM316001
     , max(decode(a.exmn_cd,'SM3170',a.exrs_ncvl_vl,'')) SM3170
     , max(decode(a.exmn_cd,'SM3180',a.exrs_ncvl_vl,'')) SM3180
     , max(decode(a.exmn_cd,'SM0131',a.exrs_ncvl_vl,'')) SM0131
     , max(decode(a.exmn_cd,'SM0132',a.exrs_ncvl_vl,'')) SM0132
     , max(decode(a.exmn_cd,'SM013201',a.exrs_ncvl_vl,'')) SM013201
     , max(decode(a.exmn_cd,'SM0133',a.exrs_ncvl_vl,'')) SM0133
     , max(decode(a.exmn_cd,'SM013301',a.exrs_ncvl_vl,'')) SM013301
     , max(decode(a.exmn_cd,'SM0134',a.exrs_ncvl_vl,'')) SM0134
     , max(decode(a.exmn_cd,'SM013401',a.exrs_ncvl_vl,'')) SM013401
     , max(decode(a.exmn_cd,'SM0126',a.exrs_ncvl_vl,'')) SM0126
     , max(decode(a.exmn_cd,'SM0151',a.exrs_ncvl_vl,'')) SM0151
     , max(decode(a.exmn_cd,'SM015101',a.exrs_ncvl_vl,'')) SM015101
     , max(decode(a.exmn_cd,'SM0152',a.exrs_ncvl_vl,'')) SM0152
     , max(decode(a.exmn_cd,'SM015201',a.exrs_ncvl_vl,'')) SM015201
     , max(decode(a.exmn_cd,'SM0153',a.exrs_ncvl_vl,'')) SM0153
     , max(decode(a.exmn_cd,'SM015301',a.exrs_ncvl_vl,'')) SM015301
     , max(decode(a.exmn_cd,'SM0154',a.exrs_ncvl_vl,'')) SM0154
     , max(decode(a.exmn_cd,'SM015401',a.exrs_ncvl_vl,'')) SM015401
     , max(decode(a.exmn_cd,'SM0155',a.exrs_ncvl_vl,'')) SM0155
     , max(decode(a.exmn_cd,'SM015501',a.exrs_ncvl_vl,'')) SM015501
     , max(decode(a.exmn_cd,'SM0161',a.exrs_ncvl_vl,'')) SM0161
     , max(decode(a.exmn_cd,'SM0162',a.exrs_ncvl_vl,'')) SM0162
     , max(decode(a.exmn_cd,'SM0163',a.exrs_ncvl_vl,'')) SM0163
     , max(decode(a.exmn_cd,'SM0164',a.exrs_ncvl_vl,'')) SM0164
     , max(decode(a.exmn_cd,'SM0169',to_char(a.exrs_ctn),'')) SM0169 
  from 스키마.3E3243333E2E143C28 a 
 where ptno in ('')
   and ordr_ymd = trunc(sysdate) - 1
 group by a.ptno, a.frst_rgst_ip
 order by 1,2
