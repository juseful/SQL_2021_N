-- whtnwls
-- DRH CLEANED RESULT
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.exmn_cd,'BL2011',b.cleaned_ncvl_vl,'')) BL2011
     , max(decode(b.exmn_cd,'BL2012',b.cleaned_ncvl_vl,'')) BL2012
     , max(decode(b.exmn_cd,'BL2013',b.cleaned_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2014',b.cleaned_ncvl_vl,'')) BL2014
     , max(decode(b.exmn_cd,'BL201401',b.cleaned_ncvl_vl,'')) BL201401
     , max(decode(b.exmn_cd,'BL201402',b.cleaned_ncvl_vl,'')) BL201402
     , max(decode(b.exmn_cd,'BL201403',b.cleaned_ncvl_vl,'')) BL201403
     , max(decode(b.exmn_cd,'BL2016',b.cleaned_ncvl_vl,'')) BL2016
     , max(decode(b.exmn_cd,'BL201806',b.cleaned_ncvl_vl,'')) BL201806
     , max(decode(b.exmn_cd,'BL201807',b.cleaned_ncvl_vl,'')) BL201807
     , max(decode(b.exmn_cd,'BL201808',b.cleaned_ncvl_vl,'')) BL201808
     , max(decode(b.exmn_cd,'BL201809',b.cleaned_ncvl_vl,'')) BL201809
     , max(decode(b.exmn_cd,'BL201810',b.cleaned_ncvl_vl,'')) BL201810
     , max(decode(b.exmn_cd,'BL201815',b.cleaned_ncvl_vl,'')) BL201815
     , max(decode(b.exmn_cd,'BL201816',b.cleaned_ncvl_vl,'')) BL201816
     , max(decode(b.exmn_cd,'BL2021',b.cleaned_ncvl_vl,'')) BL2021
     , max(decode(b.exmn_cd,'BL2113',b.cleaned_ncvl_vl,'')) BL2113
     , max(decode(b.exmn_cd,'BL2136',b.cleaned_ncvl_vl,'')) BL2136
     , max(decode(b.exmn_cd,'BL2141',b.cleaned_ncvl_vl,'')) BL2141
     , max(decode(b.exmn_cd,'BL3111',b.cleaned_ncvl_vl,'')) BL3111
     , max(decode(b.exmn_cd,'BL3112',b.cleaned_ncvl_vl,'')) BL3112
     , max(decode(b.exmn_cd,'BL311201',b.cleaned_ncvl_vl,'')) BL311201
     , max(decode(b.exmn_cd,'BL311202',b.cleaned_ncvl_vl,'')) BL311202
     , max(decode(b.exmn_cd,'BL3113',b.cleaned_ncvl_vl,'')) BL3113
     , max(decode(b.exmn_cd,'BL3114',b.cleaned_ncvl_vl,'')) BL3114
     , max(decode(b.exmn_cd,'BL3115',b.cleaned_ncvl_vl,'')) BL3115
     , max(decode(b.exmn_cd,'BL3116',b.cleaned_ncvl_vl,'')) BL3116
     , max(decode(b.exmn_cd,'BL3117',b.cleaned_ncvl_vl,'')) BL3117
     , max(decode(b.exmn_cd,'BL3118',b.cleaned_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3119',b.cleaned_ncvl_vl,'')) BL3119
     , max(decode(b.exmn_cd,'BL3120',b.cleaned_ncvl_vl,'')) BL3120
     , max(decode(b.exmn_cd,'BL312001',b.cleaned_ncvl_vl,'')) BL312001
     , max(decode(b.exmn_cd,'BL312002',b.cleaned_ncvl_vl,'')) BL312002
     , max(decode(b.exmn_cd,'BL3121',b.cleaned_ncvl_vl,'')) BL3121
     , max(decode(b.exmn_cd,'BL3122',b.cleaned_ncvl_vl,'')) BL3122
     , max(decode(b.exmn_cd,'BL3123',b.cleaned_ncvl_vl,'')) BL3123
     , max(decode(b.exmn_cd,'BL3125',b.cleaned_ncvl_vl,'')) BL3125
     , max(decode(b.exmn_cd,'BL3131',b.cleaned_ncvl_vl,'')) BL3131
     , max(decode(b.exmn_cd,'BL3132',b.cleaned_ncvl_vl,'')) BL3132
     , max(decode(b.exmn_cd,'BL3133',b.cleaned_ncvl_vl,'')) BL3133
     , max(decode(b.exmn_cd,'BL3134',b.cleaned_ncvl_vl,'')) BL3134
     , max(decode(b.exmn_cd,'BL3135',b.cleaned_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3136',b.cleaned_ncvl_vl,'')) BL3136
     , max(decode(b.exmn_cd,'BL3137',b.cleaned_ncvl_vl,'')) BL3137
     , max(decode(b.exmn_cd,'BL3140',b.cleaned_ncvl_vl,'')) BL3140
     , max(decode(b.exmn_cd,'BL3141',b.cleaned_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.cleaned_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.cleaned_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL3164',b.cleaned_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL316401',b.cleaned_ncvl_vl,'')) BL316401
     , max(decode(b.exmn_cd,'BL316402',b.cleaned_ncvl_vl,'')) BL316402
     , max(decode(b.exmn_cd,'BL3303',b.cleaned_ncvl_vl,'')) BL3303
     , max(decode(b.exmn_cd,'BL3304',b.cleaned_ncvl_vl,'')) BL3304
     , max(decode(b.exmn_cd,'BL3305',b.cleaned_ncvl_vl,'')) BL3305
     , max(decode(b.exmn_cd,'BL3307',b.cleaned_ncvl_vl,'')) BL3307
     , max(decode(b.exmn_cd,'BL3653',b.cleaned_ncvl_vl,'')) BL3653
     , max(decode(b.exmn_cd,'BL3665',b.cleaned_ncvl_vl,'')) BL3665
     , max(decode(b.exmn_cd,'BL3711',b.cleaned_ncvl_vl,'')) BL3711
     , max(decode(b.exmn_cd,'BL3712',b.cleaned_ncvl_vl,'')) BL3712
     , max(decode(b.exmn_cd,'BL3713',b.cleaned_ncvl_vl,'')) BL3713
     , max(decode(b.exmn_cd,'BL3717',b.cleaned_ncvl_vl,'')) BL3717
     , max(decode(b.exmn_cd,'BL3901',b.cleaned_ncvl_vl,'')) BL3901
     , max(decode(b.exmn_cd,'BL3982',b.cleaned_ncvl_vl,'')) BL3982
     , max(decode(b.exmn_cd,'BL399201',b.cleaned_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.cleaned_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.cleaned_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL3A2502',b.cleaned_ncvl_vl,'')) BL3A2502
     , max(decode(b.exmn_cd,'BL5111',b.cleaned_ncvl_vl,'')) BL5111
     , max(decode(b.exmn_cd,'BL5112',b.cleaned_ncvl_vl,'')) BL5112
     , max(decode(b.exmn_cd,'BL5113',b.cleaned_ncvl_vl,'')) BL5113
     , max(decode(b.exmn_cd,'BL5115',b.cleaned_ncvl_vl,'')) BL5115
     , max(decode(b.exmn_cd,'BL5116',b.cleaned_ncvl_vl,'')) BL5116
     , max(decode(b.exmn_cd,'BL5117',b.cleaned_ncvl_vl,'')) BL5117
     , max(decode(b.exmn_cd,'BL512001',b.cleaned_ncvl_vl,'')) BL512001
     , max(decode(b.exmn_cd,'BL3249',b.cleaned_ncvl_vl,'')) BL3249
     , max(decode(b.exmn_cd,'BL3252',b.cleaned_ncvl_vl,'')) BL3252
     , max(decode(b.exmn_cd,'BL326501',b.cleaned_ncvl_vl,'')) BL326501
     , max(decode(b.exmn_cd,'BL6111',b.cleaned_ncvl_vl,'')) BL6111
     , max(decode(b.exmn_cd,'BL6112',b.cleaned_ncvl_vl,'')) BL6112
     , max(decode(b.exmn_cd,'BL6113',b.cleaned_ncvl_vl,'')) BL6113
     , max(decode(b.exmn_cd,'BL6114',b.cleaned_ncvl_vl,'')) BL6114
     , max(decode(b.exmn_cd,'BL6115',b.cleaned_ncvl_vl,'')) BL6115
     , max(decode(b.exmn_cd,'BL6116',b.cleaned_ncvl_vl,'')) BL6116
     , max(decode(b.exmn_cd,'BL6117',b.cleaned_ncvl_vl,'')) BL6117
     , max(decode(b.exmn_cd,'BL6118',b.cleaned_ncvl_vl,'')) BL6118
     , max(decode(b.exmn_cd,'BL6119',b.cleaned_ncvl_vl,'')) BL6119
     , max(decode(b.exmn_cd,'BL6120',b.cleaned_ncvl_vl,'')) BL6120
     , max(decode(b.exmn_cd,'BL6121',b.cleaned_ncvl_vl,'')) BL6121
     , max(decode(b.exmn_cd,'BL6122',b.cleaned_ncvl_vl,'')) BL6122
     , max(decode(b.exmn_cd,'NR0101',b.cleaned_ncvl_vl,'')) NR0101
     , max(decode(b.exmn_cd,'NR0102',b.cleaned_ncvl_vl,'')) NR0102
     , max(decode(b.exmn_cd,'NR0103',b.cleaned_ncvl_vl,'')) NR0103
     , max(decode(b.exmn_cd,'NR0201',b.cleaned_ncvl_vl,'')) NR0201
     , max(decode(b.exmn_cd,'NR0202',b.cleaned_ncvl_vl,'')) NR0202
     , max(decode(b.exmn_cd,'NR0305',b.cleaned_ncvl_vl,'')) NR0305
     , max(decode(b.exmn_cd,'NR1101',b.cleaned_ncvl_vl,'')) NR1101
     , max(decode(b.exmn_cd,'NR1102',b.cleaned_ncvl_vl,'')) NR1102
     , max(decode(b.exmn_cd,'NR1103',b.cleaned_ncvl_vl,'')) NR1103
     , max(decode(b.exmn_cd,'NR1104',b.cleaned_ncvl_vl,'')) NR1104
     , max(decode(b.exmn_cd,'NR1107',b.cleaned_ncvl_vl,'')) NR1107
     , max(decode(b.exmn_cd,'NR2301',b.cleaned_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.cleaned_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR2401',b.cleaned_ncvl_vl,'')) NR2401
     , max(decode(b.exmn_cd,'NR4101',b.cleaned_ncvl_vl,'')) NR4101
     , max(decode(b.exmn_cd,'NR4102',b.cleaned_ncvl_vl,'')) NR4102
     , max(decode(b.exmn_cd,'NR4103',b.cleaned_ncvl_vl,'')) NR4103
     , max(decode(b.exmn_cd,'NR4202',b.cleaned_ncvl_vl,'')) NR4202
     , max(decode(b.exmn_cd,'NR4303',b.cleaned_ncvl_vl,'')) NR4303
     , max(decode(b.exmn_cd,'NR6106',b.cleaned_ncvl_vl,'')) NR6106
     , max(decode(b.exmn_cd,'NR7104',b.cleaned_ncvl_vl,'')) NR7104
     , max(decode(b.exmn_cd,'NR7105',b.cleaned_ncvl_vl,'')) NR7105
     , max(decode(b.exmn_cd,'RC118401',b.cleaned_ncvl_vl,'')) RC118401
     , max(decode(b.exmn_cd,'RC118402',b.cleaned_ncvl_vl,'')) RC118402
     , max(decode(b.exmn_cd,'SM053101',b.cleaned_ncvl_vl,'')) SM053101
     , max(decode(b.exmn_cd,'SM053111',b.cleaned_ncvl_vl,'')) SM053111
     , max(decode(b.exmn_cd,'SM0600SBP',b.cleaned_ncvl_vl,'')) SM0600SBP
     , max(decode(b.exmn_cd,'SM0600DBP',b.cleaned_ncvl_vl,'')) SM0600DBP 
     , max(decode(b.exmn_cd,'SM0101',b.cleaned_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.cleaned_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM3160',b.cleaned_ncvl_vl 
                           ,'SM316001',b.cleaned_ncvl_vl,'')) SM316001 
  from temp a
     , 스키마.1543294D47144D43333E2E1428 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.sm_date = a.ordr_ymd
   and b.exmn_cd in (
                     'BL2011','BL2012','BL2013','BL2014','BL201401','BL201402','BL201403','BL2016','BL201806','BL201807','BL201808','BL201809','BL201810','BL201815','BL201816'
                    ,'BL2021','BL2113','BL2136','BL2141','BL3111','BL3112','BL311201','BL311202','BL3113','BL3114','BL3115','BL3116','BL3117','BL3118','BL3119'
                    ,'BL3120','BL312001','BL312002','BL3121','BL3122','BL3123','BL3125','BL3131','BL3132','BL3133','BL3134','BL3135','BL3136','BL3137','BL3140'
                    ,'BL3141','BL3142','BL314201','BL3164','BL316401','BL316402','BL3303','BL3304','BL3305','BL3307','BL3653','BL3665','BL3711','BL3712','BL3713'
                    ,'BL3717','BL3901','BL3982','BL399201','BL399202','BL399203','BL3A2502','BL5111','BL5112','BL5113','BL5115','BL5116','BL5117','BL512001','BL3249'
                    ,'BL3252','BL326501','BL6111','BL6112','BL6113','BL6114','BL6115','BL6116','BL6117','BL6118','BL6119','BL6120','BL6121','BL6122','NR0101'
                    ,'NR0102','NR0103','NR0201','NR0202','NR0305','NR1101','NR1102','NR1103','NR1104','NR1107','NR2301','NR2302','NR2401','NR4101','NR4102'
                    ,'NR4103','NR4202','NR4303','NR6106','NR7104','NR7105','RC118401','RC118402','SM053101','SM053111','SM0600SBP','SM0600DBP','SM0101','SM0102','SM316001','SM3160'
                    )
   and c.ptno = a.ptno
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- DRH UNCLEANED RESULT
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.exmn_cd,'BL2011',b.exrs_ncvl_vl,'')) BL2011
     , max(decode(b.exmn_cd,'BL2012',b.exrs_ncvl_vl,'')) BL2012
     , max(decode(b.exmn_cd,'BL2013',b.exrs_ncvl_vl,'')) BL2013
     , max(decode(b.exmn_cd,'BL2014',b.exrs_ncvl_vl,'')) BL2014
     , max(decode(b.exmn_cd,'BL201401',b.exrs_ncvl_vl,'')) BL201401
     , max(decode(b.exmn_cd,'BL201402',b.exrs_ncvl_vl,'')) BL201402
     , max(decode(b.exmn_cd,'BL201403',b.exrs_ncvl_vl,'')) BL201403
     , max(decode(b.exmn_cd,'BL2016',b.exrs_ncvl_vl,'')) BL2016
     , max(decode(b.exmn_cd,'BL201806',b.exrs_ncvl_vl,'')) BL201806
     , max(decode(b.exmn_cd,'BL201807',b.exrs_ncvl_vl,'')) BL201807
     , max(decode(b.exmn_cd,'BL201808',b.exrs_ncvl_vl,'')) BL201808
     , max(decode(b.exmn_cd,'BL201809',b.exrs_ncvl_vl,'')) BL201809
     , max(decode(b.exmn_cd,'BL201810',b.exrs_ncvl_vl,'')) BL201810
     , max(decode(b.exmn_cd,'BL201815',b.exrs_ncvl_vl,'')) BL201815
     , max(decode(b.exmn_cd,'BL201816',b.exrs_ncvl_vl,'')) BL201816
     , max(decode(b.exmn_cd,'BL2021',b.exrs_ncvl_vl,'')) BL2021
     , max(decode(b.exmn_cd,'BL2113',b.exrs_ncvl_vl,'')) BL2113
     , max(decode(b.exmn_cd,'BL2136',b.exrs_ncvl_vl,'')) BL2136
     , max(decode(b.exmn_cd,'BL2141',b.exrs_ncvl_vl,'')) BL2141
     , max(decode(b.exmn_cd,'BL3111',b.exrs_ncvl_vl,'')) BL3111
     , max(decode(b.exmn_cd,'BL3112',b.exrs_ncvl_vl,'')) BL3112
     , max(decode(b.exmn_cd,'BL311201',b.exrs_ncvl_vl,'')) BL311201
     , max(decode(b.exmn_cd,'BL311202',b.exrs_ncvl_vl,'')) BL311202
     , max(decode(b.exmn_cd,'BL3113',b.exrs_ncvl_vl,'')) BL3113
     , max(decode(b.exmn_cd,'BL3114',b.exrs_ncvl_vl,'')) BL3114
     , max(decode(b.exmn_cd,'BL3115',b.exrs_ncvl_vl,'')) BL3115
     , max(decode(b.exmn_cd,'BL3116',b.exrs_ncvl_vl,'')) BL3116
     , max(decode(b.exmn_cd,'BL3117',b.exrs_ncvl_vl,'')) BL3117
     , max(decode(b.exmn_cd,'BL3118',b.exrs_ncvl_vl,'')) BL3118
     , max(decode(b.exmn_cd,'BL3119',b.exrs_ncvl_vl,'')) BL3119
     , max(decode(b.exmn_cd,'BL3120',b.exrs_ncvl_vl,'')) BL3120
     , max(decode(b.exmn_cd,'BL312001',b.exrs_ncvl_vl,'')) BL312001
     , max(decode(b.exmn_cd,'BL312002',b.exrs_ncvl_vl,'')) BL312002
     , max(decode(b.exmn_cd,'BL3121',b.exrs_ncvl_vl,'')) BL3121
     , max(decode(b.exmn_cd,'BL3122',b.exrs_ncvl_vl,'')) BL3122
     , max(decode(b.exmn_cd,'BL3123',b.exrs_ncvl_vl,'')) BL3123
     , max(decode(b.exmn_cd,'BL3125',b.exrs_ncvl_vl,'')) BL3125
     , max(decode(b.exmn_cd,'BL3131',b.exrs_ncvl_vl,'')) BL3131
     , max(decode(b.exmn_cd,'BL3132',b.exrs_ncvl_vl,'')) BL3132
     , max(decode(b.exmn_cd,'BL3133',b.exrs_ncvl_vl,'')) BL3133
     , max(decode(b.exmn_cd,'BL3134',b.exrs_ncvl_vl,'')) BL3134
     , max(decode(b.exmn_cd,'BL3135',b.exrs_ncvl_vl,'')) BL3135
     , max(decode(b.exmn_cd,'BL3136',b.exrs_ncvl_vl,'')) BL3136
     , max(decode(b.exmn_cd,'BL3137',b.exrs_ncvl_vl,'')) BL3137
     , max(decode(b.exmn_cd,'BL3140',b.exrs_ncvl_vl,'')) BL3140
     , max(decode(b.exmn_cd,'BL3141',b.exrs_ncvl_vl,'')) BL3141
     , max(decode(b.exmn_cd,'BL3142',b.exrs_ncvl_vl,'')) BL3142
     , max(decode(b.exmn_cd,'BL314201',b.exrs_ncvl_vl,'')) BL314201
     , max(decode(b.exmn_cd,'BL3164',b.exrs_ncvl_vl,'')) BL3164
     , max(decode(b.exmn_cd,'BL316401',b.exrs_ncvl_vl,'')) BL316401
     , max(decode(b.exmn_cd,'BL316402',b.exrs_ncvl_vl,'')) BL316402
     , max(decode(b.exmn_cd,'BL3303',b.exrs_ncvl_vl,'')) BL3303
     , max(decode(b.exmn_cd,'BL3304',b.exrs_ncvl_vl,'')) BL3304
     , max(decode(b.exmn_cd,'BL3305',b.exrs_ncvl_vl,'')) BL3305
     , max(decode(b.exmn_cd,'BL3307',b.exrs_ncvl_vl,'')) BL3307
     , max(decode(b.exmn_cd,'BL3653',b.exrs_ncvl_vl,'')) BL3653
     , max(decode(b.exmn_cd,'BL3665',b.exrs_ncvl_vl,'')) BL3665
     , max(decode(b.exmn_cd,'BL3711',b.exrs_ncvl_vl,'')) BL3711
     , max(decode(b.exmn_cd,'BL3712',b.exrs_ncvl_vl,'')) BL3712
     , max(decode(b.exmn_cd,'BL3713',b.exrs_ncvl_vl,'')) BL3713
     , max(decode(b.exmn_cd,'BL3717',b.exrs_ncvl_vl,'')) BL3717
     , max(decode(b.exmn_cd,'BL3901',b.exrs_ncvl_vl,'')) BL3901
     , max(decode(b.exmn_cd,'BL3982',b.exrs_ncvl_vl,'')) BL3982
     , max(decode(b.exmn_cd,'BL399201',b.exrs_ncvl_vl,'')) BL399201
     , max(decode(b.exmn_cd,'BL399202',b.exrs_ncvl_vl,'')) BL399202
     , max(decode(b.exmn_cd,'BL399203',b.exrs_ncvl_vl,'')) BL399203
     , max(decode(b.exmn_cd,'BL3A2502',b.exrs_ncvl_vl,'')) BL3A2502
     , case
            when (max(decode(b.exmn_cd,'BL5111',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5111',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5111',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5111',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5111
     , case
            when (max(decode(b.exmn_cd,'BL5112',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5112',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5112',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5112',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5112
     , case
            when (max(decode(b.exmn_cd,'BL5113',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5113',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5113',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5113',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5113
     , case
            when (max(decode(b.exmn_cd,'BL5115',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5115',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5115',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5115',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5115
     , case
            when (max(decode(b.exmn_cd,'BL5116',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5116',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5116',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5116',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5116
     , case
            when (max(decode(b.exmn_cd,'BL5117',lower(b.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(b.exmn_cd,'BL5117',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL5117',lower(b.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(b.exmn_cd,'BL5117',lower(b.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5117
     , max(decode(b.exmn_cd,'BL512001',b.exrs_ncvl_vl,'')) BL512001
     , max(decode(b.exmn_cd,'BL3249',b.exrs_ncvl_vl,'')) BL3249
     , max(decode(b.exmn_cd,'BL3252',b.exrs_ncvl_vl,'')) BL3252
     , max(decode(b.exmn_cd,'BL326501',b.exrs_ncvl_vl,'')) BL326501
     , case
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'am%'    then '1'
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'br%'    then '2'
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'gr%'    then '3'
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'or%'    then '4'
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 're%'    then '5'
            when (max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like '%st%'
                 or
                  max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like '%sr%'
                 )                                   then '6' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'ye%'    then '7'
            when (max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'milky%'
                 or
                  max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'color%'
                 or
                  max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'whi%'
                 or
                  max(decode(b.exmn_cd,'BL6111',lower(b.exrs_ncvl_vl),'')) like 'other%'
                 )                                   then '8'
       else ''
       end BL6111
     , case
            when (max(decode(b.exmn_cd,'BL6112',lower(b.exrs_ncvl_vl),'')) like '%ea%'
                 or
                  max(decode(b.exmn_cd,'BL6112',lower(b.exrs_ncvl_vl),'')) like '%ae%'
                 )                                    then '1'
            when max(decode(b.exmn_cd,'BL6112',lower(b.exrs_ncvl_vl),'')) like '%ou%'    then '2'
            else '3'
       end BL6112
     , max(decode(b.exmn_cd,'BL6113',b.exrs_ncvl_vl,'')) BL6113
     , max(decode(b.exmn_cd,'BL6114',b.exrs_ncvl_vl,'')) BL6114
     , case
            when max(decode(b.exmn_cd,'BL6115',lower(b.exrs_ncvl_vl),'')) like 'ne%'     then '0' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6115',lower(b.exrs_ncvl_vl),'')) like '%25%tr%' then '0.5'
            when max(decode(b.exmn_cd,'BL6115',lower(b.exrs_ncvl_vl),'')) like '75%'   then '1'
            when max(decode(b.exmn_cd,'BL6115',lower(b.exrs_ncvl_vl),'')) like '150%'    then '2'
            when max(decode(b.exmn_cd,'BL6115',lower(b.exrs_ncvl_vl),'')) like '500%'    then '3'
       else ''
       end BL6115
     , case
            when max(decode(b.exmn_cd,'BL6116',lower(b.exrs_ncvl_vl),'')) like 'n%'      then '0'
            when max(decode(b.exmn_cd,'BL6116',lower(b.exrs_ncvl_vl),'')) like '%50%tr%' then '0.5'
            when max(decode(b.exmn_cd,'BL6116',lower(b.exrs_ncvl_vl),'')) like '1000%'   then '3'
            when max(decode(b.exmn_cd,'BL6116',lower(b.exrs_ncvl_vl),'')) like '100%'    then '1'
            when max(decode(b.exmn_cd,'BL6116',lower(b.exrs_ncvl_vl),'')) like '300%'    then '2'
       else ''
       end BL6116
     , case
            when max(decode(b.exmn_cd,'BL6117',lower(b.exrs_ncvl_vl),'')) like 'n%'     then '0'
            when max(decode(b.exmn_cd,'BL6117',lower(b.exrs_ncvl_vl),'')) like '%5%tr%' then '0.5'
            when max(decode(b.exmn_cd,'BL6117',lower(b.exrs_ncvl_vl),'')) like '150%'   then '3'
            when max(decode(b.exmn_cd,'BL6117',lower(b.exrs_ncvl_vl),'')) like '15%'    then '1'
            when max(decode(b.exmn_cd,'BL6117',lower(b.exrs_ncvl_vl),'')) like '50%'    then '2'
       else ''
       end BL6117
     , case
            when max(decode(b.exmn_cd,'BL6118',lower(b.exrs_ncvl_vl),'')) like 'n%'    then '0'
            when max(decode(b.exmn_cd,'BL6118',lower(b.exrs_ncvl_vl),'')) like '10%'    then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6118',lower(b.exrs_ncvl_vl),'')) like '1%'    then '1'
            when max(decode(b.exmn_cd,'BL6118',lower(b.exrs_ncvl_vl),'')) like '3%'    then '2'
            when max(decode(b.exmn_cd,'BL6118',lower(b.exrs_ncvl_vl),'')) like '6%'    then '3'
       else ''
       end BL6118
     , case
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like 'n%'        then '0'
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '%10%tr%'   then '0.5'
            when replace(max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')),' ','') = '50+'      then '' -- 검증 후 수정
            when replace(max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')),' ','') like '500%'      then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '50%'       then '2'
            when replace(max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')),' ','') = '150++'    then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '150%'      then '3'
            when (replace(max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')),' ','')  like '250+++++'
                 or
                  replace(max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')),' ','')  like '250+++'
                 )                                      then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '%250%'      then '4' -- 검증 후 수정
            when (max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '25%++'
                 or
                  max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '25%tr'
                 or
                  max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '25%-'
                 )                                      then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6119',lower(b.exrs_ncvl_vl),'')) like '%25%'       then '1' -- 검증 후 수정
       else ''
       end BL6119
     , case
            when (max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 or
                  max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like '%rm%'
                 )                                    then '0'
            when max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like '1%tr%'   then '0.5'
            when max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like '4%'      then '1'
            when max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like '8%'      then '2'
            when max(decode(b.exmn_cd,'BL6120',lower(b.exrs_ncvl_vl),'')) like '12%'     then '3'
       else ''
       end BL6120
     , case
            when (max(decode(b.exmn_cd,'BL6121',lower(b.exrs_ncvl_vl),'')) like '%ne%'
                 or
                  max(decode(b.exmn_cd,'BL6121',lower(b.exrs_ncvl_vl),'')) like '%rg%'
                 )                                   then '0'
            when max(decode(b.exmn_cd,'BL6121',lower(b.exrs_ncvl_vl),'')) like 'p%-%'   then '' -- 검증 후 수정
            when max(decode(b.exmn_cd,'BL6121',lower(b.exrs_ncvl_vl),'')) like '%p%'     then '1' -- 검증 후 수정
       else ''
       end BL6121
     , case
            when (max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like 'n%'
                 or
                  max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like '%g%'
                 or
                  max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like '%wbc%'
                 )                                     then '0'
            when (replace(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ','') like '25++'
                 or
                  replace(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ','') like '25tr'
                 or
                  substr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),1,instr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ')-1) = '250'
                 or
                  max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) = '25'
                 )                                     then ''
            when max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like '%2%'       then '1'
            when substr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),1,instr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ')-1) = '10'      then ''
            when (replace(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ','') = '100+'
                 or
                  replace(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ','') = '100+++'
                 )                                      then ''
            when max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like '100%'      then '2'
            when substr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),1,instr(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ')-1) = '50'      then ''
            when replace(max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')),' ','') = '500++'      then ''
            when max(decode(b.exmn_cd,'BL6122',lower(b.exrs_ncvl_vl),'')) like '500%'      then '3'
       else ''
       end BL6122
     , max(decode(b.exmn_cd,'NR0101',b.exrs_ncvl_vl,'')) NR0101
     , max(decode(b.exmn_cd,'NR0102',b.exrs_ncvl_vl,'')) NR0102
     , max(decode(b.exmn_cd,'NR0103',b.exrs_ncvl_vl,'')) NR0103
     , max(decode(b.exmn_cd,'NR0201',b.exrs_ncvl_vl,'')) NR0201
     , max(decode(b.exmn_cd,'NR0202',b.exrs_ncvl_vl,'')) NR0202
     , max(decode(b.exmn_cd,'NR0305',b.exrs_ncvl_vl,'')) NR0305
     , max(decode(b.exmn_cd,'NR1101',b.exrs_ncvl_vl,'')) NR1101
     , max(decode(b.exmn_cd,'NR1102',b.exrs_ncvl_vl,'')) NR1102
     , max(decode(b.exmn_cd,'NR1103',b.exrs_ncvl_vl,'')) NR1103
     , max(decode(b.exmn_cd,'NR1104',b.exrs_ncvl_vl,'')) NR1104
     , max(decode(b.exmn_cd,'NR1107',b.exrs_ncvl_vl,'')) NR1107
     , max(decode(b.exmn_cd,'NR2301',b.exrs_ncvl_vl,'')) NR2301
     , max(decode(b.exmn_cd,'NR2302',b.exrs_ncvl_vl,'')) NR2302
     , max(decode(b.exmn_cd,'NR2401',b.exrs_ncvl_vl,'')) NR2401
     , max(decode(b.exmn_cd,'NR4101',b.exrs_ncvl_vl,'')) NR4101
     , max(decode(b.exmn_cd,'NR4102',b.exrs_ncvl_vl,'')) NR4102
     , max(decode(b.exmn_cd,'NR4103',b.exrs_ncvl_vl,'')) NR4103
     , max(decode(b.exmn_cd,'NR4202',b.exrs_ncvl_vl,'')) NR4202
     , max(decode(b.exmn_cd,'NR4303',b.exrs_ncvl_vl,'')) NR4303
     , max(decode(b.exmn_cd,'NR6106',b.exrs_ncvl_vl,'')) NR6106
     , max(decode(b.exmn_cd,'NR7104',b.exrs_ncvl_vl,'')) NR7104
     , max(decode(b.exmn_cd,'NR7105',b.exrs_ncvl_vl,'')) NR7105
     , max(decode(b.exmn_cd,'RC118401',b.exrs_ncvl_vl,'')) RC118401
     , max(decode(b.exmn_cd,'RC118402',b.exrs_ncvl_vl,'')) RC118402
     , max(decode(b.exmn_cd,'SM053101',b.exrs_ncvl_vl,'')) SM053101
     , max(decode(b.exmn_cd,'SM053111',b.exrs_ncvl_vl,'')) SM053111
     , max(decode(b.exmn_cd,'SM0600',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0600SBP
     , max(decode(b.exmn_cd,'SM0600',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0600DBP
     , max(decode(b.exmn_cd,'SM0101',b.exrs_ncvl_vl,'')) SM0101
     , max(decode(b.exmn_cd,'SM0102',b.exrs_ncvl_vl,'')) SM0102
     , max(decode(b.exmn_cd,'SM316001',b.exrs_ncvl_vl,'')) SM316001
  from temp a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 c
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in (
                     'BL2011','BL2012','BL2013','BL2014','BL201401','BL201402','BL201403','BL2016','BL201806','BL201807','BL201808','BL201809','BL201810','BL201815','BL201816'
                    ,'BL2021','BL2113','BL2136','BL2141','BL3111','BL3112','BL311201','BL311202','BL3113','BL3114','BL3115','BL3116','BL3117','BL3118','BL3119'
                    ,'BL3120','BL312001','BL312002','BL3121','BL3122','BL3123','BL3125','BL3131','BL3132','BL3133','BL3134','BL3135','BL3136','BL3137','BL3140'
                    ,'BL3141','BL3142','BL314201','BL3164','BL316401','BL316402','BL3303','BL3304','BL3305','BL3307','BL3653','BL3665','BL3711','BL3712','BL3713'
                    ,'BL3717','BL3901','BL3982','BL399201','BL399202','BL399203','BL3A2502','BL5111','BL5112','BL5113','BL5115','BL5116','BL5117','BL512001','BL3249'
                    ,'BL3252','BL326501','BL6111','BL6112','BL6113','BL6114','BL6115','BL6116','BL6117','BL6118','BL6119','BL6120','BL6121','BL6122','NR0101'
                    ,'NR0102','NR0103','NR0201','NR0202','NR0305','NR1101','NR1102','NR1103','NR1104','NR1107','NR2301','NR2302','NR2401','NR4101','NR4102'
                    ,'NR4103','NR4202','NR4303','NR6106','NR7104','NR7105','RC118401','RC118402','SM053101','SM053111','SM0600','SM0600','SM0101','SM0102','SM316001'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
   and c.ptno = a.ptno
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- DRH UNCLEANED RESULT, CACT SCORE
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , b.exrs_ctn rc1184
     , decode(
              b.exmn_cd
             ,'RC1184'
             ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                    ,0
                    ,''
                    ,trim(
                          substr(
                                 to_char(b.cnls_dx_ctn)
                                ,1
                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                 +                                     -- 3. 더한다.
                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                )
                         )
                    )
             ,''
             ) cac_text
     , case
            when instr(lower(
                             decode(
                                    b.exmn_cd
                                   ,'RC1184'
                                   , trim(
                                          substr(
                                                 to_char(b.cnls_dx_ctn)
                                                ,-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 -
                                                 (-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 )
                                                ) 
                                         )
                                   ,''
                                   )
                            )
                      ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                      ,1
                      ,1                      
                      ) != 0
            then -- 세번째 결과 문구를 가져와라
                 decode(
                        b.exmn_cd
                       ,'RC1184'
                       ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                              ,0
                              ,''
                              ,trim(
                                    substr(
                                           to_char(b.cnls_dx_ctn)
                                          ,-- 두번째 구분값의 시작위치 이후
                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                           -
                                           (-- 두번째 구분값의 시작위치 이후
                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                           +                                     -- 3. 더한다.
                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                           )
                                          ) 
                                   )
                              )
                       ,''
                       )
            else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                 decode(
                        b.exmn_cd
                       ,'RC1184'
                       , trim(
                              substr(
                                     to_char(b.cnls_dx_ctn)
                                    ,-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                    ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     -
                                     (-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     )
                                    ) 
                             )
                       ,''
                       )
            end volume_score_text
     , case
            when instr(lower(
                             decode(
                                    b.exmn_cd
                                   ,'RC1184'
                                   , trim(
                                          substr(
                                                 to_char(b.cnls_dx_ctn)
                                                ,-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 -
                                                 (-- 첫번째 구분값의 시작위치 이후
                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                 +                                     -- 3. 더한다.
                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                 )
                                                ) 
                                         )
                                   ,''
                                   )
                            )
                      ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                      ,1
                      ,1                      
                      ) != 0
            then -- 두번째 문구를 그대로 사용해 된다.
                 decode(
                        b.exmn_cd
                       ,'RC1184'
                       , trim(
                              substr(
                                     to_char(b.cnls_dx_ctn)
                                    ,-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                    ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     -
                                     (-- 첫번째 구분값의 시작위치 이후
                                     instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                     +                                     -- 3. 더한다.
                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                     )
                                    ) 
                             )
                       ,''
                       )
            else 
                 case
                      when instr(
                                 lower(-- 세번째 결과 문구를 가져와라
                                       decode(
                                              b.exmn_cd
                                             ,'RC1184'
                                             ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                    ,0
                                                    ,''
                                                    ,trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                    )
                                             ,''
                                             ) 
                                      )
                                ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                ,1
                                ,1
                                ) != 0
                      then -- 세번째 결과 문구를 가져와라
                           decode(
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                        ,0
                                        ,''
                                        ,trim(
                                              substr(
                                                     to_char(b.cnls_dx_ctn)
                                                    ,-- 두번째 구분값의 시작위치 이후
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                    ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                     -
                                                     (-- 두번째 구분값의 시작위치 이후
                                                     instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                     +                                     -- 3. 더한다.
                                                     regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                     )
                                                    ) 
                                             )
                                        )
                                 ,''
                                 ) 
                      else ''
                      end
            end mass_score_text
     , case
            when
                 substr(
                        decode(b.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(b.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(b.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                              )
                                                                       ,'='
                                                                       ,1
                                                                       ,1
                                                                       ) + 1
                                                                 )
                                                          )
                                                     )
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ,''
                               )
                        ,length(
                                decode(b.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(b.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                      )
                                                                               ,'='
                                                                               ,1
                                                                               ,1
                                                                               ) + 1
                                                                         )
                                                                  )
                                                             )
                                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                                      ,''
                                                      )
                                       ,''
                                       )
                               )
                        ) = '.'
            then                 substr(
                        decode(b.exmn_cd
                               ,'RC1184'
                               ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                               decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                     ,0
                                                     ,'0'
                                                     ,trim(
                                                           substr(
                                                                  substr(
                                                                         to_char(b.cnls_dx_ctn)
                                                                        ,1
                                                                        ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                        )
                                                                 ,instr(
                                                                        substr(
                                                                               to_char(b.cnls_dx_ctn)
                                                                              ,1
                                                                              ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                              )
                                                                       ,'='
                                                                       ,1
                                                                       ,1
                                                                       ) + 1
                                                                 )
                                                          )
                                                     )
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ,''
                               )
                        ,1
                        ,length(
                                decode(b.exmn_cd
                                       ,'RC1184'
                                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                                             ,0
                                                             ,'0'
                                                             ,trim(
                                                                   substr(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,1
                                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                )
                                                                         ,instr(
                                                                                substr(
                                                                                       to_char(b.cnls_dx_ctn)
                                                                                      ,1
                                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                                      )
                                                                               ,'='
                                                                               ,1
                                                                               ,1
                                                                               ) + 1
                                                                         )
                                                                  )
                                                             )
                                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                                      ,''
                                                      )
                                       ,''
                                       )
                               ) - 1
                        )
            else 
                 decode(b.exmn_cd
                       ,'RC1184'
                       ,regexp_replace(-- 숫자 뒤의 엔터값 삭제
                                       decode(instr(to_char(b.cnls_dx_ctn),'=',1,2)
                                             ,0
                                             ,'0'
                                             ,trim(
                                                   substr(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,1
                                                                ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                )
                                                         ,instr(
                                                                substr(
                                                                       to_char(b.cnls_dx_ctn)
                                                                      ,1
                                                                      ,instr(to_char(b.cnls_dx_ctn),'=',1,1) + regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]') - 1
                                                                      )
                                                               ,'='
                                                               ,1
                                                               ,1
                                                               ) + 1
                                                         )
                                                  )
                                             )
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                       ,''
                       )
            end aj_130
     , case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 세번째 결과 문구를 가져와라
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(b.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              )
                                                                             ) 
                                                                      )                                                 
                                                                 ,'='
                                                                 ,1
                                                                 ,1
                                                                 ) + 1
                                                           )
                                                    )
                                               )
                                        ,''
                                        )
                             else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             end 
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 세번째 결과 문구를 가져와라
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(b.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      )
                                                                                     ) 
                                                                              )                                                 
                                                                         ,'='
                                                                         ,1
                                                                         ,1
                                                                         ) + 1
                                                                   )
                                                            )
                                                       )
                                                ,''
                                                )
                                     else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     end 
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               )
                        ) = '.'
            then substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 세번째 결과 문구를 가져와라
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                               ,0
                                               ,''
                                               ,trim(
                                                     substr(
                                                            trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                           ,instr(
                                                                  trim(
                                                                       substr(
                                                                              to_char(b.cnls_dx_ctn)
                                                                             ,-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                             ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              -
                                                                              (-- 두번째 구분값의 시작위치 이후
                                                                              instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                              +                                     -- 3. 더한다.
                                                                              regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                              )
                                                                             ) 
                                                                      )                                                 
                                                                 ,'='
                                                                 ,1
                                                                 ,1
                                                                 ) + 1
                                                           )
                                                    )
                                               )
                                        ,''
                                        )
                             else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             end 
                                      ,'[^0-9.]' -- 숫자와 소수점 외에
                                      ,''
                                      )
                        ,1
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 세번째 결과 문구를 가져와라
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                       ,0
                                                       ,''
                                                       ,trim(
                                                             substr(
                                                                    trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                   ,instr(
                                                                          trim(
                                                                               substr(
                                                                                      to_char(b.cnls_dx_ctn)
                                                                                     ,-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                     ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      -
                                                                                      (-- 두번째 구분값의 시작위치 이후
                                                                                      instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                      +                                     -- 3. 더한다.
                                                                                      regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                      )
                                                                                     ) 
                                                                              )                                                 
                                                                         ,'='
                                                                         ,1
                                                                         ,1
                                                                         ) + 1
                                                                   )
                                                            )
                                                       )
                                                ,''
                                                )
                                     else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     end 
                                              ,'[^0-9.]' -- 숫자와 소수점 외에
                                              ,''
                                              )
                               ) - 1
                        )
            else 
                 regexp_replace(
                 case
                      when instr(lower(
                                       decode(
                                              b.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,''
                                             )
                                      )
                                ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                ,1
                                ,1                      
                                ) != 0
                      then -- 세번째 결과 문구를 가져와라
                           decode(
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                        ,0
                                        ,''
                                        ,trim(
                                              substr(
                                                     trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                    ,instr(
                                                           trim(
                                                                substr(
                                                                       to_char(b.cnls_dx_ctn)
                                                                      ,-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                      ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       -
                                                                       (-- 두번째 구분값의 시작위치 이후
                                                                       instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                       +                                     -- 3. 더한다.
                                                                       regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       )
                                                                      ) 
                                                               )                                                 
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        )
                                 ,''
                                 )
                      else -- 그렇지 않으면 두번째 문구를 그대로 사용해 된다.
                           decode(
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                   ,'='
                                                   ,1
                                                   ,1
                                                   ) + 1
                                             )
                                      )
                                 ,''
                                 )
                      end 
                               ,'[^0-9.]' -- 숫자와 소수점 외에
                               ,''
                               )
            end volume_130
     , case
            when
                 substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             else 
                                  case
                                       when instr(
                                                  lower(-- 세번째 결과 문구를 가져와라
                                                        decode(
                                                               b.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     )
                                                              ,''
                                                              ) 
                                                       )
                                                 ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                 ,1
                                                 ,1
                                                 ) != 0
                                       then -- 세번째 문구에서 결과를 가져와라
                                            decode(
                                                   b.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(b.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        )
                                                                                       ) 
                                                                                )                                                 
                                                                           ,'='
                                                                           ,1
                                                                           ,1
                                                                           ) + 1
                                                                     )
                                                              )
                                                         )
                                                  ,''
                                                  )
                                       else ''
                                       end
                             end 
                                      ,'[^0-9.]'
                                      ,''
                                      )
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     else 
                                          case
                                               when instr(
                                                          lower(-- 세번째 결과 문구를 가져와라
                                                                decode(
                                                                       b.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             )
                                                                      ,''
                                                                      ) 
                                                               )
                                                         ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                         ,1
                                                         ,1
                                                         ) != 0
                                               then -- 세번째 문구에서 결과를 가져와라
                                                    decode(
                                                           b.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(b.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                )
                                                                                               ) 
                                                                                        )                                                 
                                                                                   ,'='
                                                                                   ,1
                                                                                   ,1
                                                                                   ) + 1
                                                                             )
                                                                      )
                                                                 )
                                                          ,''
                                                          )
                                               else ''
                                               end
                                     end 
                                              ,'[^0-9.]'
                                              ,''
                                              )
                               )
                        ) = '.'
            then substr(
                        regexp_replace(
                        case
                             when instr(lower(
                                              decode(
                                                     b.exmn_cd
                                                    ,'RC1184'
                                                    , trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,''
                                                    )
                                             )
                                       ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                       ,1
                                       ,1                      
                                       ) != 0
                             then -- 두번째 문구를 그대로 사용해 된다.
                                  decode(
                                         b.exmn_cd
                                        ,'RC1184'
                                        ,trim(
                                              substr(
                                                     trim(
                                                           substr(
                                                                  to_char(b.cnls_dx_ctn)
                                                                 ,-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  -
                                                                  (-- 첫번째 구분값의 시작위치 이후
                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                  +                                     -- 3. 더한다.
                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                  )
                                                                 ) 
                                                          )
                                                    ,instr(
                                                           trim(
                                                                 substr(
                                                                        to_char(b.cnls_dx_ctn)
                                                                       ,-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                       ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        -
                                                                        (-- 첫번째 구분값의 시작위치 이후
                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                        +                                     -- 3. 더한다.
                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                        )
                                                                       ) 
                                                                )
                                                          ,'='
                                                          ,1
                                                          ,1
                                                          ) + 1
                                                    )
                                             )
                                        ,''
                                        )
                             else 
                                  case
                                       when instr(
                                                  lower(-- 세번째 결과 문구를 가져와라
                                                        decode(
                                                               b.exmn_cd
                                                              ,'RC1184'
                                                              ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                     ,0
                                                                     ,''
                                                                     ,trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     )
                                                              ,''
                                                              ) 
                                                       )
                                                 ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                 ,1
                                                 ,1
                                                 ) != 0
                                       then -- 세번째 문구에서 결과를 가져와라
                                            decode(
                                                   b.exmn_cd
                                                  ,'RC1184'
                                                  ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                         ,0
                                                         ,''
                                                         ,trim(
                                                               substr(
                                                                      trim(
                                                                           substr(
                                                                                  to_char(b.cnls_dx_ctn)
                                                                                 ,-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  -
                                                                                  (-- 두번째 구분값의 시작위치 이후
                                                                                  instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                  +                                     -- 3. 더한다.
                                                                                  regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                  )
                                                                                 ) 
                                                                          )
                                                                     ,instr(
                                                                            trim(
                                                                                 substr(
                                                                                        to_char(b.cnls_dx_ctn)
                                                                                       ,-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                       ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        -
                                                                                        (-- 두번째 구분값의 시작위치 이후
                                                                                        instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                        +                                     -- 3. 더한다.
                                                                                        regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                        )
                                                                                       ) 
                                                                                )                                                 
                                                                           ,'='
                                                                           ,1
                                                                           ,1
                                                                           ) + 1
                                                                     )
                                                              )
                                                         )
                                                  ,''
                                                  )
                                       else ''
                                       end
                             end 
                                      ,'[^0-9.]'
                                      ,''
                                      )
                        ,1
                        ,length(
                                regexp_replace(
                                case
                                     when instr(lower(
                                                      decode(
                                                             b.exmn_cd
                                                            ,'RC1184'
                                                            , trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,''
                                                            )
                                                     )
                                               ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                               ,1
                                               ,1                      
                                               ) != 0
                                     then -- 두번째 문구를 그대로 사용해 된다.
                                          decode(
                                                 b.exmn_cd
                                                ,'RC1184'
                                                ,trim(
                                                      substr(
                                                             trim(
                                                                   substr(
                                                                          to_char(b.cnls_dx_ctn)
                                                                         ,-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                         ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          -
                                                                          (-- 첫번째 구분값의 시작위치 이후
                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                          +                                     -- 3. 더한다.
                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          )
                                                                         ) 
                                                                  )
                                                            ,instr(
                                                                   trim(
                                                                         substr(
                                                                                to_char(b.cnls_dx_ctn)
                                                                               ,-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                               ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                -
                                                                                (-- 첫번째 구분값의 시작위치 이후
                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                                +                                     -- 3. 더한다.
                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                )
                                                                               ) 
                                                                        )
                                                                  ,'='
                                                                  ,1
                                                                  ,1
                                                                  ) + 1
                                                            )
                                                     )
                                                ,''
                                                )
                                     else 
                                          case
                                               when instr(
                                                          lower(-- 세번째 결과 문구를 가져와라
                                                                decode(
                                                                       b.exmn_cd
                                                                      ,'RC1184'
                                                                      ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                             ,0
                                                                             ,''
                                                                             ,trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             )
                                                                      ,''
                                                                      ) 
                                                               )
                                                         ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                                         ,1
                                                         ,1
                                                         ) != 0
                                               then -- 세번째 문구에서 결과를 가져와라
                                                    decode(
                                                           b.exmn_cd
                                                          ,'RC1184'
                                                          ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                                 ,0
                                                                 ,''
                                                                 ,trim(
                                                                       substr(
                                                                              trim(
                                                                                   substr(
                                                                                          to_char(b.cnls_dx_ctn)
                                                                                         ,-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                         ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          -
                                                                                          (-- 두번째 구분값의 시작위치 이후
                                                                                          instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                          +                                     -- 3. 더한다.
                                                                                          regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                          )
                                                                                         ) 
                                                                                  )
                                                                             ,instr(
                                                                                    trim(
                                                                                         substr(
                                                                                                to_char(b.cnls_dx_ctn)
                                                                                               ,-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                               ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                -
                                                                                                (-- 두번째 구분값의 시작위치 이후
                                                                                                instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                                +                                     -- 3. 더한다.
                                                                                                regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                                )
                                                                                               ) 
                                                                                        )                                                 
                                                                                   ,'='
                                                                                   ,1
                                                                                   ,1
                                                                                   ) + 1
                                                                             )
                                                                      )
                                                                 )
                                                          ,''
                                                          )
                                               else ''
                                               end
                                     end 
                                              ,'[^0-9.]'
                                              ,''
                                              )
                               ) - 1
                        )
            else
                 regexp_replace(
                 case
                      when instr(lower(
                                       decode(
                                              b.exmn_cd
                                             ,'RC1184'
                                             , trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,''
                                             )
                                      )
                                ,'mass' -- 두번째 결과 문구에서 mass가 포함되어 있다면
                                ,1
                                ,1                      
                                ) != 0
                      then -- 두번째 문구를 그대로 사용해 된다.
                           decode(
                                  b.exmn_cd
                                 ,'RC1184'
                                 ,trim(
                                       substr(
                                              trim(
                                                    substr(
                                                           to_char(b.cnls_dx_ctn)
                                                          ,-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                          ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           -
                                                           (-- 첫번째 구분값의 시작위치 이후
                                                           instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                           +                                     -- 3. 더한다.
                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                           )
                                                          ) 
                                                   )
                                             ,instr(
                                                    trim(
                                                          substr(
                                                                 to_char(b.cnls_dx_ctn)
                                                                ,-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                ,-- 세번째 구분 값의 위치 - 첫번째 구분 값의 위치 
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]') - 1 -- 2. 두번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 -
                                                                 (-- 첫번째 구분값의 시작위치 이후
                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,1) -- 1. '=' 구분자가 있는 위치에
                                                                 +                                     -- 3. 더한다.
                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,1) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                 )
                                                                ) 
                                                         )
                                                   ,'='
                                                   ,1
                                                   ,1
                                                   ) + 1
                                             )
                                      )
                                 ,''
                                 )
                      else 
                           case
                                when instr(
                                           lower(-- 세번째 결과 문구를 가져와라
                                                 decode(
                                                        b.exmn_cd
                                                       ,'RC1184'
                                                       ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                              ,0
                                                              ,''
                                                              ,trim(
                                                                    substr(
                                                                           to_char(b.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           )
                                                                          ) 
                                                                   )
                                                              )
                                                       ,''
                                                       ) 
                                                )
                                          ,'mass' -- 세번째 결과 문구에서 mass가 포함되어 있다면 
                                          ,1
                                          ,1
                                          ) != 0
                                then -- 세번째 문구에서 결과를 가져와라
                                     decode(
                                            b.exmn_cd
                                           ,'RC1184'
                                           ,decode(instr(to_char(b.cnls_dx_ctn),'=',1,3)
                                                  ,0
                                                  ,''
                                                  ,trim(
                                                        substr(
                                                               trim(
                                                                    substr(
                                                                           to_char(b.cnls_dx_ctn)
                                                                          ,-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                          ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           -
                                                                           (-- 두번째 구분값의 시작위치 이후
                                                                           instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                           +                                     -- 3. 더한다.
                                                                           regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                           )
                                                                          ) 
                                                                   )
                                                              ,instr(
                                                                     trim(
                                                                          substr(
                                                                                 to_char(b.cnls_dx_ctn)
                                                                                ,-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')-- + 1 -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                ,-- 세번째 구분 값 이후 첫 문자위치 - 두번째 구분 값의 위치 
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,3) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,3) + 1),'[가-힣A-Za-z]') - 1 -- 2. 세번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 -
                                                                                 (-- 두번째 구분값의 시작위치 이후
                                                                                 instr(to_char(b.cnls_dx_ctn),'=',1,2) -- 1. '=' 구분자가 있는 위치에
                                                                                 +                                     -- 3. 더한다.
                                                                                 regexp_instr(substr(to_char(b.cnls_dx_ctn),instr(to_char(b.cnls_dx_ctn),'=',1,2) + 1),'[가-힣A-Za-z]')    -- 2. 첫번째 '=' 이후로 나오는 첫 문자의 자리위치에서 1을 빼준 것을
                                                                                 )
                                                                                ) 
                                                                         )                                                 
                                                                    ,'='
                                                                    ,1
                                                                    ,1
                                                                    ) + 1
                                                              )
                                                       )
                                                  )
                                           ,''
                                           )
                                else ''
                                end
                      end 
                               ,'[^0-9.]'
                               ,''
                               )
            end mass_score
  from temp a
     , 스키마.3E3243333E2E143C28 b
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd = 'RC1184'
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )

-- UNCLEANED RESULT01, 일반
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , max(decode(b.exmn_cd,'SM0104',b.exrs_ncvl_vl,'')) SM0104
     , max(decode(b.exmn_cd,'SM0106',b.exrs_ncvl_vl,'')) SM0106
     , max(decode(b.exmn_cd,'SM0111',b.exrs_ncvl_vl,'')) SM0111
     , max(decode(b.exmn_cd,'SM0112',b.exrs_ncvl_vl,'')) SM0112
     , max(decode(b.exmn_cd,'SM0126',b.exrs_ncvl_vl,'')) SM0126
     , max(decode(b.exmn_cd,'SM0131',b.exrs_ncvl_vl,'')) SM0131
     , max(decode(b.exmn_cd,'SM0132',b.exrs_ncvl_vl,'')) SM0132
     , max(decode(b.exmn_cd,'SM013201',b.exrs_ncvl_vl,'')) SM013201
     , max(decode(b.exmn_cd,'SM0133',b.exrs_ncvl_vl,'')) SM0133
     , max(decode(b.exmn_cd,'SM013301',b.exrs_ncvl_vl,'')) SM013301
     , max(decode(b.exmn_cd,'SM0134',b.exrs_ncvl_vl,'')) SM0134
     , max(decode(b.exmn_cd,'SM013401',b.exrs_ncvl_vl,'')) SM013401
     , max(decode(b.exmn_cd,'SM0151',b.exrs_ncvl_vl,'')) SM0151
     , max(decode(b.exmn_cd,'SM015101',b.exrs_ncvl_vl,'')) SM015101
     , max(decode(b.exmn_cd,'SM0152',b.exrs_ncvl_vl,'')) SM0152
     , max(decode(b.exmn_cd,'SM015201',b.exrs_ncvl_vl,'')) SM015201
     , max(decode(b.exmn_cd,'SM0153',b.exrs_ncvl_vl,'')) SM0153
     , max(decode(b.exmn_cd,'SM015301',b.exrs_ncvl_vl,'')) SM015301
     , max(decode(b.exmn_cd,'SM0154',b.exrs_ncvl_vl,'')) SM0154
     , max(decode(b.exmn_cd,'SM015401',b.exrs_ncvl_vl,'')) SM015401
     , max(decode(b.exmn_cd,'SM0155',b.exrs_ncvl_vl,'')) SM0155
     , max(decode(b.exmn_cd,'SM015501',b.exrs_ncvl_vl,'')) SM015501
     , max(decode(b.exmn_cd,'SM0161',b.exrs_ncvl_vl,'')) SM0161
     , max(decode(b.exmn_cd,'SM0162',b.exrs_ncvl_vl,'')) SM0162
     , max(decode(b.exmn_cd,'SM0163',b.exrs_ncvl_vl,'')) SM0163
     , max(decode(b.exmn_cd,'SM0164',b.exrs_ncvl_vl,'')) SM0164
     , max(decode(b.exmn_cd,'SM3140',b.exrs_ncvl_vl,'')) SM3140
     , max(decode(b.exmn_cd,'SM3150',b.exrs_ncvl_vl,'')) SM3150
     , max(decode(b.exmn_cd,'SM3170',b.exrs_ncvl_vl,'')) SM3170
     , max(decode(b.exmn_cd,'SM3180',b.exrs_ncvl_vl,'')) SM3180
     , max(decode(b.exmn_cd,'BS2111',to_char(b.exrs_ctn),'')) BS2111
     , max(decode(b.exmn_cd,'BL7001',b.exrs_ncvl_vl,'')) BL7001
     , max(decode(b.exmn_cd,'BL7002',b.exrs_ncvl_vl,'')) BL7002
     , max(decode(b.exmn_cd,'RG010P',to_char(b.exrs_ctn),'')) RG010P
     , max(decode(b.exmn_cd,'BS2231',to_char(dbms_lob.substr(b.exrs_ctn,3000,   1)),'')) BS2231_01
     , max(decode(b.exmn_cd,'BS2231',to_char(dbms_lob.substr(b.exrs_ctn,3000,3001)),'')) BS2231_02
     , max(decode(b.exmn_cd,'BS2231',to_char(dbms_lob.substr(b.exrs_ctn,3000,6001)),'')) BS2231_03
     /* GXT */
     , max(decode(b.exmn_cd,'SM3611',b.exrs_ncvl_vl,'')) SM3611
     , max(decode(b.exmn_cd,'SM3612',b.exrs_ncvl_vl,'')) SM3612
     , max(decode(b.exmn_cd,'SM3613',b.exrs_ncvl_vl,'')) SM3613
     , max(decode(b.exmn_cd,'SM3614',b.exrs_ncvl_vl,'')) SM3614
     , max(decode(b.exmn_cd,'SM3615',b.exrs_ncvl_vl,'')) SM3615
     , max(decode(b.exmn_cd,'SM3616',b.exrs_ncvl_vl,'')) SM3616
     , max(decode(b.exmn_cd,'SM3617',b.exrs_ncvl_vl,'')) SM3617
     , max(decode(b.exmn_cd,'SM3621',b.exrs_ncvl_vl,'')) SM3621
     , max(decode(b.exmn_cd,'SM3622',b.exrs_ncvl_vl,'')) SM3622
     , max(decode(b.exmn_cd,'SM3623',b.exrs_ncvl_vl,'')) SM3623
     , max(decode(b.exmn_cd,'SM3624',b.exrs_ncvl_vl,'')) SM3624
     , max(decode(b.exmn_cd,'SM3625',b.exrs_ncvl_vl,'')) SM3625
     , max(decode(b.exmn_cd,'SM3626',b.exrs_ncvl_vl,'')) SM3626
     , max(decode(b.exmn_cd,'SM3627',b.exrs_ncvl_vl,'')) SM3627
     , max(decode(b.exmn_cd,'SM3631',b.exrs_ncvl_vl,'')) SM3631
     , max(decode(b.exmn_cd,'SM3632',b.exrs_ncvl_vl,'')) SM3632
     , max(decode(b.exmn_cd,'SM3633',b.exrs_ncvl_vl,'')) SM3633
     , max(decode(b.exmn_cd,'SM3634',b.exrs_ncvl_vl,'')) SM3634
     , max(decode(b.exmn_cd,'SM3635',b.exrs_ncvl_vl,'')) SM3635
     , max(decode(b.exmn_cd,'SM3636',b.exrs_ncvl_vl,'')) SM3636
     , max(decode(b.exmn_cd,'SM3637',b.exrs_ncvl_vl,'')) SM3637
     , max(decode(b.exmn_cd,'SM3638A',b.exrs_ncvl_vl,'')) SM3638A
     , max(decode(b.exmn_cd,'SM3638B',b.exrs_ncvl_vl,'')) SM3638B
     , max(decode(b.exmn_cd,'SM3638C',b.exrs_ncvl_vl,'')) SM3638C
     , max(decode(b.exmn_cd,'SM3638D',b.exrs_ncvl_vl,'')) SM3638D
     , max(decode(b.exmn_cd,'SM3638E',b.exrs_ncvl_vl,'')) SM3638E
     , max(decode(b.exmn_cd,'SM3641',b.exrs_ncvl_vl,'')) SM3641
     , max(decode(b.exmn_cd,'SM3642',b.exrs_ncvl_vl,'')) SM3642
     , max(decode(b.exmn_cd,'SM3643',b.exrs_ncvl_vl,'')) SM3643
     , max(decode(b.exmn_cd,'SM3644',b.exrs_ncvl_vl,'')) SM3644
     , max(decode(b.exmn_cd,'SM3645',b.exrs_ncvl_vl,'')) SM3645
     , max(decode(b.exmn_cd,'SM3646',b.exrs_ncvl_vl,'')) SM3646
     , max(decode(b.exmn_cd,'SM3647',b.exrs_ncvl_vl,'')) SM3647
     , max(decode(b.exmn_cd,'SM3648A',b.exrs_ncvl_vl,'')) SM3648A
     , max(decode(b.exmn_cd,'SM3648B',b.exrs_ncvl_vl,'')) SM3648B
     , max(decode(b.exmn_cd,'SM3648C',b.exrs_ncvl_vl,'')) SM3648C
     , max(decode(b.exmn_cd,'SM3648D',b.exrs_ncvl_vl,'')) SM3648D
     , max(decode(b.exmn_cd,'SM3648E',b.exrs_ncvl_vl,'')) SM3648E
     , max(decode(b.exmn_cd,'SM3651',b.exrs_ncvl_vl,'')) SM3651
     , max(decode(b.exmn_cd,'SM3652',b.exrs_ncvl_vl,'')) SM3652
     , max(decode(b.exmn_cd,'SM3653',b.exrs_ncvl_vl,'')) SM3653
     , max(decode(b.exmn_cd,'SM3654',b.exrs_ncvl_vl,'')) SM3654
     , max(decode(b.exmn_cd,'SM3655',b.exrs_ncvl_vl,'')) SM3655
     , max(decode(b.exmn_cd,'SM3656',b.exrs_ncvl_vl,'')) SM3656
     , max(decode(b.exmn_cd,'SM3657',b.exrs_ncvl_vl,'')) SM3657
     , max(decode(b.exmn_cd,'SM3658A',b.exrs_ncvl_vl,'')) SM3658A
     , max(decode(b.exmn_cd,'SM3658B',b.exrs_ncvl_vl,'')) SM3658B
     , max(decode(b.exmn_cd,'SM3658C',b.exrs_ncvl_vl,'')) SM3658C
     , max(decode(b.exmn_cd,'SM3658D',b.exrs_ncvl_vl,'')) SM3658D
     , max(decode(b.exmn_cd,'SM3658E',b.exrs_ncvl_vl,'')) SM3658E
     , max(decode(b.exmn_cd,'SM3661',b.exrs_ncvl_vl,'')) SM3661
     , max(decode(b.exmn_cd,'SM3662',b.exrs_ncvl_vl,'')) SM3662
     , max(decode(b.exmn_cd,'SM3663',b.exrs_ncvl_vl,'')) SM3663
     , max(decode(b.exmn_cd,'SM3664',b.exrs_ncvl_vl,'')) SM3664
     , max(decode(b.exmn_cd,'SM3665',b.exrs_ncvl_vl,'')) SM3665
     , max(decode(b.exmn_cd,'SM3666',b.exrs_ncvl_vl,'')) SM3666
     , max(decode(b.exmn_cd,'SM3667',b.exrs_ncvl_vl,'')) SM3667
     , max(decode(b.exmn_cd,'SM3668A',b.exrs_ncvl_vl,'')) SM3668A
     , max(decode(b.exmn_cd,'SM3668B',b.exrs_ncvl_vl,'')) SM3668B
     , max(decode(b.exmn_cd,'SM3668C',b.exrs_ncvl_vl,'')) SM3668C
     , max(decode(b.exmn_cd,'SM3671',b.exrs_ncvl_vl,'')) SM3671
     , max(decode(b.exmn_cd,'SM3672',b.exrs_ncvl_vl,'')) SM3672
     , max(decode(b.exmn_cd,'SM3673',b.exrs_ncvl_vl,'')) SM3673
     , max(decode(b.exmn_cd,'SM3674',b.exrs_ncvl_vl,'')) SM3674
     , max(decode(b.exmn_cd,'SM3675',b.exrs_ncvl_vl,'')) SM3675
     , max(decode(b.exmn_cd,'SM3676',b.exrs_ncvl_vl,'')) SM3676
     , max(decode(b.exmn_cd,'SM3677',b.exrs_ncvl_vl,'')) SM3677
     , max(decode(b.exmn_cd,'SM3678A',b.exrs_ncvl_vl,'')) SM3678A
     , max(decode(b.exmn_cd,'SM3678B',b.exrs_ncvl_vl,'')) SM3678B
     , max(decode(b.exmn_cd,'SM3678C',b.exrs_ncvl_vl,'')) SM3678C
     , max(decode(b.exmn_cd,'SM3678D',b.exrs_ncvl_vl,'')) SM3678D
     , max(decode(b.exmn_cd,'SM3678E',b.exrs_ncvl_vl,'')) SM3678E
     , max(decode(b.exmn_cd,'SM3681',b.exrs_ncvl_vl,'')) SM3681
     , max(decode(b.exmn_cd,'SM3682',b.exrs_ncvl_vl,'')) SM3682
     , max(decode(b.exmn_cd,'SM3683',b.exrs_ncvl_vl,'')) SM3683
     , max(decode(b.exmn_cd,'SM3684',b.exrs_ncvl_vl,'')) SM3684
     , max(decode(b.exmn_cd,'SM3685',b.exrs_ncvl_vl,'')) SM3685
     , max(decode(b.exmn_cd,'SM3686',b.exrs_ncvl_vl,'')) SM3686
     , max(decode(b.exmn_cd,'SM3687',b.exrs_ncvl_vl,'')) SM3687
     , max(decode(b.exmn_cd,'SM3688A',b.exrs_ncvl_vl,'')) SM3688A
     , max(decode(b.exmn_cd,'SM3688B',b.exrs_ncvl_vl,'')) SM3688B
     , max(decode(b.exmn_cd,'SM3688C',b.exrs_ncvl_vl,'')) SM3688C
     , max(decode(b.exmn_cd,'SM3691',b.exrs_ncvl_vl,'')) SM3691
     , max(decode(b.exmn_cd,'SM3692',b.exrs_ncvl_vl,'')) SM3692
     , max(decode(b.exmn_cd,'SM3693',b.exrs_ncvl_vl,'')) SM3693
     , max(decode(b.exmn_cd,'SM3694',b.exrs_ncvl_vl,'')) SM3694
     , max(decode(b.exmn_cd,'SM3695',b.exrs_ncvl_vl,'')) SM3695
     , max(decode(b.exmn_cd,'SM3696',b.exrs_ncvl_vl,'')) SM3696
     , max(decode(b.exmn_cd,'SM3697',b.exrs_ncvl_vl,'')) SM3697
     , max(decode(b.exmn_cd,'SM3698A',b.exrs_ncvl_vl,'')) SM3698A
     , max(decode(b.exmn_cd,'SM3698B',b.exrs_ncvl_vl,'')) SM3698B
     , max(decode(b.exmn_cd,'SM3698C',b.exrs_ncvl_vl,'')) SM3698C
     , max(decode(b.exmn_cd,'SM3701',b.exrs_ncvl_vl,'')) SM3701
     , max(decode(b.exmn_cd,'SM3702',b.exrs_ncvl_vl,'')) SM3702
     , max(decode(b.exmn_cd,'SM3710',b.exrs_ncvl_vl,'')) SM3710
     , max(decode(b.exmn_cd,'SM3720',b.exrs_ncvl_vl,'')) SM3720
     , max(decode(b.exmn_cd,'SM3730',to_char(b.exrs_ctn),'')) SM3730
     , max(decode(b.exmn_cd,'SM37301',b.exrs_ncvl_vl,'')) SM37301
     , max(decode(b.exmn_cd,'SM3740',to_char(b.exrs_ctn),'')) SM3740
     , max(decode(b.exmn_cd,'SM37401',b.exrs_ncvl_vl,'')) SM37401
     , max(decode(b.exmn_cd,'SM3750',to_char(b.exrs_ctn),'')) SM3750
     , max(decode(b.exmn_cd,'SM37501',b.exrs_ncvl_vl,'')) SM37501
     /* ABI, PWV */
     , max(decode(b.exmn_cd,'SM0661',b.exrs_ncvl_vl,'')) SM0661
     , max(decode(b.exmn_cd,'SM0661',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0661_R
     , max(decode(b.exmn_cd,'SM0661',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0661_L
     , max(decode(b.exmn_cd,'SM066101',to_char(b.exrs_ctn),'')) SM066101
     , max(decode(b.exmn_cd,'SM0662',b.exrs_ncvl_vl,'')) SM0662
     , max(decode(b.exmn_cd,'SM0662',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0662_R
     , max(decode(b.exmn_cd,'SM0662',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0662_L
     , max(decode(b.exmn_cd,'SM066201',to_char(b.exrs_ctn),'')) SM066201
     /* 복부내장지방 */
     , max(decode(b.exmn_cd,'SM067001',b.exrs_ncvl_vl,'')) SM067001
     , max(decode(b.exmn_cd,'SM067002',b.exrs_ncvl_vl,'')) SM067002
     , max(decode(b.exmn_cd,'SM067003',b.exrs_ncvl_vl,'')) SM067003
     , max(decode(b.exmn_cd,'SM067004',b.exrs_ncvl_vl,'')) SM067004
     , max(decode(b.exmn_cd,'SM067005',b.exrs_ncvl_vl,'')) SM067005
     , max(decode(b.exmn_cd,'SM067006',b.exrs_ncvl_vl,'')) SM067006
     , max(decode(b.exmn_cd,'SM067007',b.exrs_ncvl_vl,'')) SM067007
     , max(decode(b.exmn_cd,'SM067008',b.exrs_ncvl_vl,'')) SM067008
     , max(decode(b.exmn_cd,'SM067009',b.exrs_ncvl_vl,'')) SM067009
     , max(decode(b.exmn_cd,'SM067010',b.exrs_ncvl_vl,'')) SM067010
     , max(decode(b.exmn_cd,'SM067011',b.exrs_ncvl_vl,'')) SM067011
     , max(decode(b.exmn_cd,'SM067012',b.exrs_ncvl_vl,'')) SM067012
     , max(decode(b.exmn_cd,'SM067013',b.exrs_ncvl_vl,'')) SM067013
     , max(decode(b.exmn_cd,'SM067014',b.exrs_ncvl_vl,'')) SM067014
     , max(decode(b.exmn_cd,'SM067015',b.exrs_ncvl_vl,'')) SM067015
     , max(decode(b.exmn_cd,'SM067016',b.exrs_ncvl_vl,'')) SM067016
     , max(decode(b.exmn_cd,'SM0671',to_char(b.exrs_ctn),'')) SM0671
     /* PFT */
     , max(decode(b.exmn_cd,'SM0401',b.exrs_ncvl_vl,'')) SM0401
     , max(decode(b.exmn_cd,'SM040101',b.exrs_ncvl_vl,'')) SM040101
     , max(decode(b.exmn_cd,'SM0402',b.exrs_ncvl_vl,'')) SM0402
     , max(decode(b.exmn_cd,'SM040201',b.exrs_ncvl_vl,'')) SM040201
     , max(decode(b.exmn_cd,'SM0403',b.exrs_ncvl_vl,'')) SM0403
     , max(decode(b.exmn_cd,'SM0404',b.exrs_ncvl_vl,'')) SM0404
     , max(decode(b.exmn_cd,'SM040401',b.exrs_ncvl_vl,'')) SM040401
     , max(decode(b.exmn_cd,'SM0405',b.exrs_ncvl_vl,'')) SM0405
     , max(decode(b.exmn_cd,'SM040501',b.exrs_ncvl_vl,'')) SM040501
     , max(decode(b.exmn_cd,'SM0450',to_char(b.exrs_ctn),'')) SM0450
     , max(decode(b.exmn_cd,'RM3170HC',to_char(dbms_lob.substr(b.exrs_ctn,3000,   1)),'')) RM3170HC_01
     , max(decode(b.exmn_cd,'RM3170HC',to_char(dbms_lob.substr(b.exrs_ctn,3000,3001)),'')) RM3170HC_02
     , max(decode(b.exmn_cd,'RM3170HC',to_char(dbms_lob.substr(b.exrs_ctn,3000,6001)),'')) RM3170HC_03
     , max(decode(b.exmn_cd,'RM3170N',to_char(dbms_lob.substr(b.exrs_ctn,3000,   1)),'')) RM3170N_01
     , max(decode(b.exmn_cd,'RM3170N',to_char(dbms_lob.substr(b.exrs_ctn,3000,3001)),'')) RM3170N_02
     , max(decode(b.exmn_cd,'RM3170N',to_char(dbms_lob.substr(b.exrs_ctn,3000,6001)),'')) RM3170N_03
     , max(decode(b.exmn_cd,'RS1172',to_char(dbms_lob.substr(b.exrs_ctn,3000,   1)),'')) RS1172_01
     , max(decode(b.exmn_cd,'RS1172',to_char(dbms_lob.substr(b.exrs_ctn,3000,3001)),'')) RS1172_02
     , max(decode(b.exmn_cd,'RS1172',to_char(dbms_lob.substr(b.exrs_ctn,3000,6001)),'')) RS1172_03
     , max(decode(b.exmn_cd,'SM0210',to_char(b.exrs_ctn),'')) SM0210
     , max(decode(b.exmn_cd,'SM0201',b.exrs_ncvl_vl,'')) SM0201
     , max(decode(b.exmn_cd,'SM0201',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0201_R
     , max(decode(b.exmn_cd,'SM0201',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0201_L
     , max(decode(b.exmn_cd,'SM0203',b.exrs_ncvl_vl,'')) SM0203
     , max(decode(b.exmn_cd,'SM0203',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0203_R
     , max(decode(b.exmn_cd,'SM0203',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0203_L
     , max(decode(b.exmn_cd,'SM0205',b.exrs_ncvl_vl,'')) SM0205
     , max(decode(b.exmn_cd,'SM0205',substr(b.exrs_ncvl_vl,1,instr(b.exrs_ncvl_vl,'/')-1),'')) SM0205_R
     , max(decode(b.exmn_cd,'SM0205',substr(b.exrs_ncvl_vl,instr(b.exrs_ncvl_vl,'/')+1),'')) SM0205_L
     , max(decode(b.exmn_cd,'RG9214',to_char(b.exrs_ctn),'')) RG9214
  from temp a
     , 스키마.3E3243333E2E143C28 b
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in (
                     'BS2111', 'BL7001', 'BL7002', 'RG010P', 'BS2231', 'SM3611', 'SM3612', 'SM3613', 'SM3614', 'SM3615', 'SM3616', 'SM3617', 'SM3621', 'SM3622', 'SM3623'
                    ,'SM3624', 'SM3625', 'SM3626', 'SM3627', 'SM3631', 'SM3632', 'SM3633', 'SM3634', 'SM3635', 'SM3636', 'SM3637', 'SM3638A', 'SM3638B', 'SM3638C', 'SM3638D'
                    ,'SM3638E', 'SM3641', 'SM3642', 'SM3643', 'SM3644', 'SM3645', 'SM3646', 'SM3647', 'SM3648A', 'SM3648B', 'SM3648C', 'SM3648D', 'SM3648E', 'SM3651', 'SM3652'
                    ,'SM3653', 'SM3654', 'SM3655', 'SM3656', 'SM3657', 'SM3658A', 'SM3658B', 'SM3658C', 'SM3658D', 'SM3658E', 'SM3661', 'SM3662', 'SM3663', 'SM3664', 'SM3665'
                    ,'SM3666', 'SM3667', 'SM3668A', 'SM3668B', 'SM3668C', 'SM3671', 'SM3672', 'SM3673', 'SM3674', 'SM3675', 'SM3676', 'SM3677', 'SM3678A', 'SM3678B', 'SM3678C'
                    ,'SM3678D', 'SM3678E', 'SM3681', 'SM3682', 'SM3683', 'SM3684', 'SM3685', 'SM3686', 'SM3687', 'SM3688A', 'SM3688B', 'SM3688C', 'SM3691', 'SM3692', 'SM3693'
                    ,'SM3694', 'SM3695', 'SM3696', 'SM3697', 'SM3698A', 'SM3698B', 'SM3698C', 'SM3701', 'SM3702', 'SM3710', 'SM3720', 'SM3730', 'SM37301', 'SM3740', 'SM37401'
                    ,'SM3750', 'SM37501', 'SM0661', 'SM066101', 'SM0662', 'SM066201', 'SM067001', 'SM067002', 'SM067003', 'SM067004', 'SM067005', 'SM067006', 'SM067007', 'SM067008', 'SM067009'
                    ,'SM067010', 'SM067011', 'SM067012', 'SM067013', 'SM067014', 'SM067015', 'SM067016', 'SM0671', 'SM0401', 'SM040101', 'SM0402', 'SM040201', 'SM0403', 'SM0404', 'SM040401'
                    ,'SM0405', 'SM040501', 'SM0450', 'RM3170HC', 'RM3170N', 'RS1172', 'SM0210', 'SM0201', 'SM0203', 'SM0205', 'RG9214' 
                    ,'SM0104', 'SM0106', 'SM0111', 'SM0112', 'SM0126', 'SM0131', 'SM0132', 'SM013201', 'SM0133', 'SM013301', 'SM0134', 'SM013401', 'SM0151', 'SM015101', 'SM0152', 'SM015201', 'SM0153', 'SM015301', 'SM0154'
                    ,'SM015401', 'SM0155', 'SM015501', 'SM0161', 'SM0162', 'SM0163', 'SM0164', 'SM3140', 'SM3150', 'SM3170', 'SM3180'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
 group by a.ptno
     , a.ordr_ymd

-- UNCLEANED RESULT02, 경동맥초음파만
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     /* CAROTID US */
     , max(decode(b.exmn_cd,'SM053101',b.exrs_ncvl_vl,'')) SM053101
     , max(decode(b.exmn_cd,'SM053111',b.exrs_ncvl_vl,'')) SM053111
     , max(decode(b.exmn_cd,'SM053201',b.exrs_ncvl_vl,'')) SM053201
     , max(decode(b.exmn_cd,'SM053202',b.exrs_ncvl_vl,'')) SM053202
     , max(decode(b.exmn_cd,'SM053203',b.exrs_ncvl_vl,'')) SM053203
     , max(decode(b.exmn_cd,'SM053204',b.exrs_ncvl_vl,'')) SM053204
     , max(decode(b.exmn_cd,'SM053205',b.exrs_ncvl_vl,'')) SM053205
     , max(decode(b.exmn_cd,'SM053206',b.exrs_ncvl_vl,'')) SM053206
     , max(decode(b.exmn_cd,'SM053207',b.exrs_ncvl_vl,'')) SM053207
     , max(decode(b.exmn_cd,'SM053211',b.exrs_ncvl_vl,'')) SM053211
     , max(decode(b.exmn_cd,'SM053212',b.exrs_ncvl_vl,'')) SM053212
     , max(decode(b.exmn_cd,'SM053213',b.exrs_ncvl_vl,'')) SM053213
     , max(decode(b.exmn_cd,'SM053214',b.exrs_ncvl_vl,'')) SM053214
     , max(decode(b.exmn_cd,'SM053215',b.exrs_ncvl_vl,'')) SM053215
     , max(decode(b.exmn_cd,'SM053216',b.exrs_ncvl_vl,'')) SM053216
     , max(decode(b.exmn_cd,'SM053217',b.exrs_ncvl_vl,'')) SM053217
     , max(decode(b.exmn_cd,'SM0540',b.exrs_ncvl_vl,'')) SM0540
     , max(decode(b.exmn_cd,'SM054011',b.exrs_ncvl_vl,'')) SM054011
     , max(decode(b.exmn_cd,'SM054012',b.exrs_ncvl_vl,'')) SM054012
     , max(decode(b.exmn_cd,'SM054021',b.exrs_ncvl_vl,'')) SM054021
     , max(decode(b.exmn_cd,'SM054022',b.exrs_ncvl_vl,'')) SM054022
     , max(decode(b.exmn_cd,'SM054031',b.exrs_ncvl_vl,'')) SM054031
     , max(decode(b.exmn_cd,'SM054032',b.exrs_ncvl_vl,'')) SM054032
     , max(decode(b.exmn_cd,'SM054041',b.exrs_ncvl_vl,'')) SM054041
     , max(decode(b.exmn_cd,'SM054042',b.exrs_ncvl_vl,'')) SM054042
     , max(decode(b.exmn_cd,'SM054051',b.exrs_ncvl_vl,'')) SM054051
     , max(decode(b.exmn_cd,'SM054052',b.exrs_ncvl_vl,'')) SM054052
     , max(decode(b.exmn_cd,'SM054061',b.exrs_ncvl_vl,'')) SM054061
     , max(decode(b.exmn_cd,'SM054062',b.exrs_ncvl_vl,'')) SM054062
     , max(decode(b.exmn_cd,'SM054071',b.exrs_ncvl_vl,'')) SM054071
     , max(decode(b.exmn_cd,'SM054072',b.exrs_ncvl_vl,'')) SM054072
     , max(decode(b.exmn_cd,'SM054081',b.exrs_ncvl_vl,'')) SM054081
     , max(decode(b.exmn_cd,'SM054082',b.exrs_ncvl_vl,'')) SM054082
     , max(decode(b.exmn_cd,'SM054111',b.exrs_ncvl_vl,'')) SM054111
     , max(decode(b.exmn_cd,'SM054112',b.exrs_ncvl_vl,'')) SM054112
     , max(decode(b.exmn_cd,'SM054121',b.exrs_ncvl_vl,'')) SM054121
     , max(decode(b.exmn_cd,'SM054122',b.exrs_ncvl_vl,'')) SM054122
     , max(decode(b.exmn_cd,'SM054131',b.exrs_ncvl_vl,'')) SM054131
     , max(decode(b.exmn_cd,'SM054132',b.exrs_ncvl_vl,'')) SM054132
     , max(decode(b.exmn_cd,'SM054141',b.exrs_ncvl_vl,'')) SM054141
     , max(decode(b.exmn_cd,'SM054142',b.exrs_ncvl_vl,'')) SM054142
     , max(decode(b.exmn_cd,'SM054151',b.exrs_ncvl_vl,'')) SM054151
     , max(decode(b.exmn_cd,'SM054152',b.exrs_ncvl_vl,'')) SM054152
     , max(decode(b.exmn_cd,'SM054161',b.exrs_ncvl_vl,'')) SM054161
     , max(decode(b.exmn_cd,'SM054162',b.exrs_ncvl_vl,'')) SM054162
     , max(decode(b.exmn_cd,'SM054171',b.exrs_ncvl_vl,'')) SM054171
     , max(decode(b.exmn_cd,'SM054172',b.exrs_ncvl_vl,'')) SM054172
     , max(decode(b.exmn_cd,'SM054181',b.exrs_ncvl_vl,'')) SM054181
     , max(decode(b.exmn_cd,'SM054182',b.exrs_ncvl_vl,'')) SM054182
     , max(decode(b.exmn_cd,'SM054183',b.exrs_ncvl_vl,'')) SM054183
     , max(decode(b.exmn_cd,'SM0550',b.exrs_ncvl_vl,'')) SM0550
     , max(decode(b.exmn_cd,'SM055011',b.exrs_ncvl_vl,'')) SM055011
     , max(decode(b.exmn_cd,'SM055013',b.exrs_ncvl_vl,'')) SM055013
     , max(decode(b.exmn_cd,'SM055014',b.exrs_ncvl_vl,'')) SM055014
     , max(decode(b.exmn_cd,'SM055015',b.exrs_ncvl_vl,'')) SM055015
     , max(decode(b.exmn_cd,'SM055021',b.exrs_ncvl_vl,'')) SM055021
     , max(decode(b.exmn_cd,'SM055023',b.exrs_ncvl_vl,'')) SM055023
     , max(decode(b.exmn_cd,'SM055025',b.exrs_ncvl_vl,'')) SM055025
     , max(decode(b.exmn_cd,'SM055031',b.exrs_ncvl_vl,'')) SM055031
     , max(decode(b.exmn_cd,'SM055033',b.exrs_ncvl_vl,'')) SM055033
     , max(decode(b.exmn_cd,'SM055035',b.exrs_ncvl_vl,'')) SM055035
     , max(decode(b.exmn_cd,'SM055041',b.exrs_ncvl_vl,'')) SM055041
     , max(decode(b.exmn_cd,'SM055043',b.exrs_ncvl_vl,'')) SM055043
     , max(decode(b.exmn_cd,'SM055045',b.exrs_ncvl_vl,'')) SM055045
     , max(decode(b.exmn_cd,'SM055051',b.exrs_ncvl_vl,'')) SM055051
     , max(decode(b.exmn_cd,'SM055053',b.exrs_ncvl_vl,'')) SM055053
     , max(decode(b.exmn_cd,'SM055055',b.exrs_ncvl_vl,'')) SM055055
     , max(decode(b.exmn_cd,'SM055061',b.exrs_ncvl_vl,'')) SM055061
     , max(decode(b.exmn_cd,'SM055063',b.exrs_ncvl_vl,'')) SM055063
     , max(decode(b.exmn_cd,'SM055065',b.exrs_ncvl_vl,'')) SM055065
     , max(decode(b.exmn_cd,'SM055071',b.exrs_ncvl_vl,'')) SM055071
     , max(decode(b.exmn_cd,'SM055073',b.exrs_ncvl_vl,'')) SM055073
     , max(decode(b.exmn_cd,'SM055075',b.exrs_ncvl_vl,'')) SM055075
     , max(decode(b.exmn_cd,'SM055081',b.exrs_ncvl_vl,'')) SM055081
     , max(decode(b.exmn_cd,'SM055083',b.exrs_ncvl_vl,'')) SM055083
     , max(decode(b.exmn_cd,'SM055085',b.exrs_ncvl_vl,'')) SM055085
     , max(decode(b.exmn_cd,'SM055111',b.exrs_ncvl_vl,'')) SM055111
     , max(decode(b.exmn_cd,'SM055113',b.exrs_ncvl_vl,'')) SM055113
     , max(decode(b.exmn_cd,'SM055114',b.exrs_ncvl_vl,'')) SM055114
     , max(decode(b.exmn_cd,'SM055115',b.exrs_ncvl_vl,'')) SM055115
     , max(decode(b.exmn_cd,'SM055121',b.exrs_ncvl_vl,'')) SM055121
     , max(decode(b.exmn_cd,'SM055123',b.exrs_ncvl_vl,'')) SM055123
     , max(decode(b.exmn_cd,'SM055125',b.exrs_ncvl_vl,'')) SM055125
     , max(decode(b.exmn_cd,'SM055131',b.exrs_ncvl_vl,'')) SM055131
     , max(decode(b.exmn_cd,'SM055133',b.exrs_ncvl_vl,'')) SM055133
     , max(decode(b.exmn_cd,'SM055135',b.exrs_ncvl_vl,'')) SM055135
     , max(decode(b.exmn_cd,'SM055141',b.exrs_ncvl_vl,'')) SM055141
     , max(decode(b.exmn_cd,'SM055143',b.exrs_ncvl_vl,'')) SM055143
     , max(decode(b.exmn_cd,'SM055145',b.exrs_ncvl_vl,'')) SM055145
     , max(decode(b.exmn_cd,'SM055151',b.exrs_ncvl_vl,'')) SM055151
     , max(decode(b.exmn_cd,'SM055153',b.exrs_ncvl_vl,'')) SM055153
     , max(decode(b.exmn_cd,'SM055155',b.exrs_ncvl_vl,'')) SM055155
     , max(decode(b.exmn_cd,'SM055161',b.exrs_ncvl_vl,'')) SM055161
     , max(decode(b.exmn_cd,'SM055163',b.exrs_ncvl_vl,'')) SM055163
     , max(decode(b.exmn_cd,'SM055165',b.exrs_ncvl_vl,'')) SM055165
     , max(decode(b.exmn_cd,'SM055171',b.exrs_ncvl_vl,'')) SM055171
     , max(decode(b.exmn_cd,'SM055173',b.exrs_ncvl_vl,'')) SM055173
     , max(decode(b.exmn_cd,'SM055175',b.exrs_ncvl_vl,'')) SM055175
     , max(decode(b.exmn_cd,'SM055181',b.exrs_ncvl_vl,'')) SM055181
     , max(decode(b.exmn_cd,'SM055182',b.exrs_ncvl_vl,'')) SM055182
     , max(decode(b.exmn_cd,'SM055183',b.exrs_ncvl_vl,'')) SM055183
     , max(decode(b.exmn_cd,'SM0560',b.exrs_ncvl_vl,'')) SM0560
     , max(decode(b.exmn_cd,'RS2010',to_char(dbms_lob.substr(b.exrs_ctn,3000,   1)),'')) RS2010_01
     , max(decode(b.exmn_cd,'RS2010',to_char(dbms_lob.substr(b.exrs_ctn,3000,3001)),'')) RS2010_02
     , max(decode(b.exmn_cd,'RS2010',to_char(dbms_lob.substr(b.exrs_ctn,3000,6001)),'')) RS2010_03
  from temp a
     , 스키마.3E3243333E2E143C28 b
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in (
                     'SM053101', 'SM053111', 'SM053201', 'SM053202', 'SM053203', 'SM053204', 'SM053205', 'SM053206', 'SM053207', 'SM053211', 'SM053212', 'SM053213'
                    ,'SM053214', 'SM053215', 'SM053216', 'SM053217', 'SM0540', 'SM054011', 'SM054012', 'SM054021', 'SM054022', 'SM054031', 'SM054032', 'SM054041', 'SM054042', 'SM054051', 'SM054052'
                    ,'SM054061', 'SM054062', 'SM054071', 'SM054072', 'SM054081', 'SM054082', 'SM054111', 'SM054112', 'SM054121', 'SM054122', 'SM054131', 'SM054132', 'SM054141', 'SM054142', 'SM054151'
                    ,'SM054152', 'SM054161', 'SM054162', 'SM054171', 'SM054172', 'SM054181', 'SM054182', 'SM054183', 'SM0550', 'SM055011', 'SM055013', 'SM055014', 'SM055015', 'SM055021', 'SM055023'
                    ,'SM055025', 'SM055031', 'SM055033', 'SM055035', 'SM055041', 'SM055043', 'SM055045', 'SM055051', 'SM055053', 'SM055055', 'SM055061', 'SM055063', 'SM055065', 'SM055071', 'SM055073'
                    ,'SM055075', 'SM055081', 'SM055083', 'SM055085', 'SM055111', 'SM055113', 'SM055114', 'SM055115', 'SM055121', 'SM055123', 'SM055125', 'SM055131', 'SM055133', 'SM055135', 'SM055141'
                    ,'SM055143', 'SM055145', 'SM055151', 'SM055153', 'SM055155', 'SM055161', 'SM055163', 'SM055165', 'SM055171', 'SM055173', 'SM055175', 'SM055181', 'SM055182', 'SM055183', 'SM0560'
                    ,'RS2010'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select 'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
                  and nvl(x.dc_dvsn_cd,'N') = 'N'
              )
 group by a.ptno
     , a.ordr_ymd

-- 검사별 결과코드 값
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , b.exmn_cd
     , b.hlsc_rslt_cd
  from temp a
     , 스키마.3E3C15433E14332B28 b
 where b.ptno = a.ptno
   and b.ordr_ymd = a.ordr_ymd
   and b.exmn_cd in ('BS2231','RM3170HC','RM3170N','RS1172')

-- DRH CLEANED QUESAT
with temp as (
              select a.ptno, a.ordr_ymd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'YYYY-MM-DD') sm_date
     , b.SMK_YS
     , b.SMK
     , b.SMK_DURATION
     , b.SMK_CURRENT_AMOUNT
     , b.SMK_START_AGE
     , b.SMK_ENDYR
     , b.SMK_PACKYRS
     , b.ALC_YS
     , b.ALC
     , b.ALC_FREQ
     , b.ALC_AMOUNT_DRINKS
     , b.ALC_START_AGE
     , b.ALC_DURATION
     , b.ALC_ENDYR
     , b.ALC_AMOUNT_GRAMS
     , b.PHY
     , b.OVERALL_PHYSICAL_ACTIVITY
     , b.PHY_FREQ_2009
     , b.PHY_DURATION_2009
     , b.PHY_FREQ
     , b.PHY_DURATION
     , b.HISTORY_COMORBIDITY
     , b.HISTORY_HYPERTENSION
     , b.TRT_HYPERTENSION
     , b.STATUS_HYPERTENSION
     , b.HYPERTENSION_AGE_DIAG
     , b.HISTORY_HYPERLIPIDEMIA
     , b.TRT_HYPERLIPIDEMIA
     , b.STATUS_HYPERLIPIDEMIA
     , b.HYPERLIPIDEMIA_AGE_DIAG
     , b.HISTORY_STROKE
     , b.TRT_STROKE
     , b.STATUS_STROKE
     , b.TRT_STROKE_OP
     , b.STROKE_AGE_DIAG
     , b.HISTORY_DIABETES
     , b.TRT_DIABETES
     , b.STATUS_DIABETES
     , b.DIABETES_AGE_DIAG
     , b.HISTORY_CORONARY_DIS
     , b.TRT_CORONARY_DIS
     , b.CORONARY_DIS_AGE_DIAG
     , b.HISTORY_ANGINA
     , b.TRT_ANGINA
     , b.STATUS_ANGINA
     , b.TRT_ANGINA_OP
     , b.ANGINA_AGE_DIAG
     , b.HISTORY_MI
     , b.TRT_MI
     , b.STATUS_MI
     , b.TRT_MI_OP
     , b.MI_AGE_DIAG
     , b.HISTORY_KIDNEY_URINARY_DIS
     , b.TRT_KIDNEY_URINARY_DIS
     , b.STATUS_KIDNEY_URINARY_DIS
     , b.TRT_KIDNEY_URINARY_DIS_OP
     , b.KIDNEY_URINARY_DIS_AGE_DIAG
     , b.HISTORY_KIDNEY_DIS
     , b.TRT_KIDNEY_DIS
     , b.KIDNEY_DIS_AGE_DIAG
     , b.HISTORY_URINARY_TRACT_DIS
     , b.TRT_URINARY_TRACT_DIS
     , b.URINARY_TRACT_DIS_AGE_DIAG
     , b.HISTORY_THYROID_DIS1
     , b.TRT_THYROID_DIS1
     , b.THYROID_DIS1_AGE_DIAG
     , b.HISTORY_THYROID_DIS2
     , b.TRT_THYROID_DIS2
     , b.STATUS_THYROID_DIS2
     , b.TRT_THYROID_DIS2_OP
     , b.THYROID_DIS2_AGE_DIAG
     , b.HISTORY_CANCER_THYROID
     , b.CANCER_THYROID_AGE_DIAG
     , b.TRT_CANCER_THYROID
     , b.TRT_CANCER_THYROID_OP
     , b.TRT_CANCER_THYROID_CH
     , b.TRT_CANCER_THYROID_RA
     , b.TRT_CANCER_THYROID_OT
     , b.MED_HYPERTENSION
     , b.TRT_MED_HYPERTENSION
     , b.MED_HYPERTENSION_DURATION
     , b.MED_DIABETES
     , b.TRT_MED_DIABETES
     , b.MED_DIABETES_DURATION
     , b.MED_ASPIRIN
     , b.TRT_MED_ASPIRIN
     , b.MED_ASPIRIN_DURATION
     , b.MED_THYROID_DIS
     , b.TRT_MED_THYROID_DIS
     , b.STRESS_SCORE
     , b.SY4_1
     , b.SY4_2
     , b.SY4_3
     , b.SY4_4
     , b.SY4_5
  from temp a
     , 스키마.1543294D47144D302E333E0E28 b
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_ymd

-- DRH SAME VARIABLE QUESAT
-- part01 생활습관
with temp as (
              select a.ptno, a.ordr_ymd, a.rprs_apnt_no
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     /* Smoking */
     , case
            when /* 흡연력 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end smk_ys
     , case
            when /* 흡연력 관련 응답 내역이 없고, 원래 안 피우면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 52 and 58) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 46 and 48) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            when f.inpc_cd = 'MA1' and (f.item_sno between 7 and 21) then f.inqy_rspn_ctn1
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM59' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR49' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA16Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM57Y' ,'2'
                                                            ,'AM58Y' ,'1'--,''))  AMQ0074
                                                            ,'AM57'  ,'2'
                                                            ,'AM58'  ,'1'--,''))  AMQ0074
                                                            ,'RR46Y' ,'2'
                                                            ,'RR48Y' ,'1'--,''))                                         RRQ05
                                                            ,'RR46' ,'2'
                                                            ,'RR48' ,'1'--,''))                                         RRQ05
                                                            ,'MA17Y' ,'1'
                                                            ,'MA18Y' ,'2'--,''))             MA1Q02
                        ,''))
       end smk
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM54'  ,f.inqy_rspn_ctn1 
                                                  ,'AM54Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0072
                                                  ,'MA110' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) -- 데이터 첫 자리 값이 '0'으로 시작하면 빼기
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_duration
     , min(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM55'  ,f.inqy_rspn_ctn1 
                                                  ,'AM55Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0073
                                                  ,'RR47'  ,f.inqy_rspn_ctn1
                                                  ,'RR47Y' ,f.inqy_rspn_ctn1--,''))                                  RRQ0501
                                                  ,'MA112Y','0'
                                                  ,'MA113Y','1'
                                                  ,'MA114Y','2'
                                                  ,'MA115Y','3'--,''))                                               MA1Q0203
                 ,'')
          ) smk_current_amount
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM53'  ,f.inqy_rspn_ctn1 
                                                  ,'AM53Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0071
                                                  ,'MA19' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1)--,''))                                  MA1Q0201
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_start_age
     , max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM58'  ,f.inqy_rspn_ctn1 
                                                  ,'AM58Y' ,f.inqy_rspn_ctn1-- ,''))                                 AMQ0074
                                                  ,'MA117Y','0'
                                                  ,'MA118Y','1'
                                                  ,'MA119Y','2'
                                                  ,'MA120Y','3'
                                                  ,'MA121Y','4'--,''))                                               MA1Q0204
                 ,DECODE(f.inpc_cd,'RR','9999','')
                 )
          ) smk_endyr
     , min(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA112Y',5--'M0'
                                                  ,'MA113Y',15--'M1'
                                                  ,'MA114Y',25--'M2'
                                                  ,'MA115Y',35--'M3'--,''))                                               MA1Q0203
                 ,''
                 )
          ) 
       /20
       *
       case 
            when regexp_replace(max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA110' ,f.inqy_rspn_ctn1,'')),'^-?[0-9]+((\.[0-9]+)([Ee][+-][0-9]+)?)?','') is null 
            then max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA110' ,f.inqy_rspn_ctn1,''))
            else ''
       end smk_packyrs
     /* Alcohol */
     , case
            when /* 음주 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            when f.inpc_cd = 'MA1' and (f.item_sno between 24 and 37) then f.ceck_yn||f.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno||f.ceck_yn = 'MA123Y' then f.ceck_yn
                            else ''
                       end 
                      ) > 0
            then '0'
            else ''
       end alc_ys
     , case
            when /* 음주 관련 응답 내역이 없고, 원래 안 마시면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 61 and 78) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 51 and 64) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM79' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR65' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM77Y'  ,'2'
                                                            ,'AM78Y'  ,'1'--,''))  AMQ0085
                                                            ,'RR51Y'  ,'2'
                                                            ,'RR64Y'  ,'1'
                                                            ,'AM77'   ,'2'
                                                            ,'AM78'   ,'1'--,''))  AMQ0085
                                                            ,'RR51'   ,'2'
                                                            ,'RR64'   ,'1'
                           ,DECODE(f.inpc_cd,'MA1','9999',''))
                    )
       end alc
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM65Y'  ,'0'--,'1'
                                                  ,'AM66Y'  ,'1'--,'2'
                                                  ,'AM67Y'  ,'2'--,'3'
                                                  ,'AM68Y'  ,'3'--,'4'
                                                  ,'AM69Y'  ,'4'--,'5'
                                                  ,'AM70Y'  ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53Y'  ,'0'--,'1'
                                                  ,'RR54Y'  ,'1'--,'2'
                                                  ,'RR55Y'  ,'2'--,'3'
                                                  ,'RR56Y'  ,'3'--,'4'
                                                  ,'RR57Y'  ,'4'--,'5'
                                                  ,'RR58Y'  ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'AM65'   ,'0'--,'1'
                                                  ,'AM66'   ,'1'--,'2'
                                                  ,'AM67'   ,'2'--,'3'
                                                  ,'AM68'   ,'3'--,'4'
                                                  ,'AM69'   ,'4'--,'5'
                                                  ,'AM70'   ,'5'--,'6'--,''))                                                 AMQ0083
                                                  ,'RR53'   ,'0'--,'1'
                                                  ,'RR54'   ,'1'--,'2'
                                                  ,'RR55'   ,'2'--,'3'
                                                  ,'RR56'   ,'3'--,'4'
                                                  ,'RR57'   ,'4'--,'5'
                                                  ,'RR58'   ,'5'--,'6'--,''))                                                   RRQ0601
                                                  ,'MA127Y' ,'0'--,'1'
                                                  ,'MA128Y' ,'1'--,'2'
                                                  ,'MA129Y' ,'2'--,'3'
                                                  ,'MA130Y' ,'3'--,'4'
                                                  ,'MA131Y' ,'4'--,'5'
                                                  ,'MA132Y' ,'5'--,'6'--,''))                                                 MA1Q0302
                 ,'')) alc_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM72Y'  ,'0'--,'1'
                                                  ,'AM73Y'  ,'1'--,'2'
                                                  ,'AM74Y'  ,'2'--,'3'
                                                  ,'AM75Y'  ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60Y'  ,'0'--,'1'
                                                  ,'RR61Y'  ,'1'--,'2'
                                                  ,'RR62Y'  ,'2'--,'3'
                                                  ,'RR63Y'  ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'AM72'   ,'0'--,'1'
                                                  ,'AM73'   ,'1'--,'2'
                                                  ,'AM74'   ,'2'--,'3'
                                                  ,'AM75'   ,'3'--,'4'--,''))                                                 AMQ0084
                                                  ,'RR60'   ,'0'--,'1'
                                                  ,'RR61'   ,'1'--,'2'
                                                  ,'RR62'   ,'2'--,'3'
                                                  ,'RR63'   ,'3'--,'4'--,''))                                                 RRQ0602
                                                  ,'MA134Y' ,'0'--,'1'
                                                  ,'MA135Y' ,'1'--,'2'
                                                  ,'MA136Y' ,'2'--,'3'
                                                  ,'MA137Y' ,'3'--,'4'--,''))                                                 MA1Q0303
                 ,'')) alc_amount_drinks
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM62'   ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                                                  ,'AM62Y'  ,f.inqy_rspn_ctn1-- ,''))                                   AMQ0081
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                 ,'MA1','9999','')
                 )) alc_start_age
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM63'   ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'AM63Y'  ,f.inqy_rspn_ctn1 --,''))                                   AMQ0082
                                                  ,'MA125'  ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                                                  ,'MA125Y' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1) --,''))                                   MA1Q0301
                 ,DECODE(f.inpc_cd,'RR' ,'9999','')
                 )) alc_duration
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM78'   ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                                                  ,'AM78Y'  ,decode(f.inqy_rspn_ctn1,'','',f.inqy_rspn_ctn1) --,''))                                   AMQ0085
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'MA1','9999','')
                 )) alc_endyr
     , round(
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA134Y' ,14.4 --'0'--,'1'
                                                  ,'MA135Y' ,28.8 --'1'--,'2'
                                                  ,'MA136Y' ,57.6 --'2'--,'3'
                                                  ,'MA137Y' ,115.2--'3'--,'4'--,''))                                                 MA1Q0303
                 ,'')) -- alc_amount_drinks
       *
       MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA127Y' ,0.033333--'0'--,'1'
                                                  ,'MA128Y' ,0.083333--'1'--,'2'
                                                  ,'MA129Y' ,0.214286--'2'--,'3'
                                                  ,'MA130Y' ,0.5     --'3'--,'4'
                                                  ,'MA131Y' ,0.785714--'4'--,'5'
                                                  ,'MA132Y' ,1       --'5'--,'6'--,''))                                                 MA1Q0302
                 ,''))-- alc_freq
            ,2)
       alc_amount_grams
     /* Physical activity */
     , case
            when /* 운동 관련 응답 내역이 있으면 1 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '1'
            when /* 운동 관련 응답 내역이 없고, 운동을 하지 않으면 0 */
                 count(
                       case 
                            when f.inpc_cd = 'AM' and (f.item_sno between 31 and 49) then f.inqy_rspn_cd
                            when f.inpc_cd = 'RR' and (f.item_sno between 14 and 43) then f.inqy_rspn_cd
                            else ''
                       end 
                      ) = 0
                 and 
                 count(
                       case 
                            when f.inpc_cd||f.item_sno = 'AM50' then f.inqy_rspn_cd
                            when f.inpc_cd||f.item_sno = 'RR44' then f.inqy_rspn_cd
                            else ''
                       end 
                      ) > 0
            then '0'
            else MAX(DECODE(f.inpc_cd,'MA1','9999',''))
       end phy
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA149Y','1'                                                                       
                                                  ,'MA150Y','2'                                                                       
                                                  ,'MA151Y','3'                                                                       
                                                  ,'MA152Y','0'--,''))                                                                  MA1Q05
                 ,DECODE(f.inpc_cd,'RR' ,'9999'
                                  ,'AM' ,'9999','')
                 )) overall_physical_activity
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM43Y'  ,'0'
                                                  ,'AM44Y'  ,'1'
                                                  ,'AM45Y'  ,'2'
                                                  ,'AM46Y'  ,'3'
                                                  ,'AM47Y'  ,'4'--,''))                                AMQ0062
                                                  ,'AM43'   ,'0'
                                                  ,'AM44'   ,'1'
                                                  ,'AM45'   ,'2'
                                                  ,'AM46'   ,'3'
                                                  ,'AM47'   ,'4'--,''))                                AMQ0062
                                                  ,'RR26Y'  ,'0'
                                                  ,'RR27Y'  ,'1'
                                                  ,'RR28Y'  ,'2'
                                                  ,'RR29Y'  ,'3'
                                                  ,'RR30Y'  ,'4'--,''))                                         RRQ0402
                                                  ,'RR26'   ,'0'
                                                  ,'RR27'   ,'1'
                                                  ,'RR28'   ,'2'
                                                  ,'RR29'   ,'3'
                                                  ,'RR30'   ,'4'--,''))                                         RRQ0402
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_freq_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM48'   ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'AM48Y'  ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 분 또는 '||f.inqy_rspn_ctn2||' 시간')--,'')) AMQ0063
                                                  ,'RR32Y'  ,'0'
                                                  ,'RR33Y'  ,'1'
                                                  ,'RR34Y'  ,'2'
                                                  ,'RR35Y'  ,'3'
                                                  ,'RR36Y'  ,'4'--,''))                                         RRQ0403
                                                  ,'RR32'   ,'0'
                                                  ,'RR33'   ,'1'
                                                  ,'RR34'   ,'2'
                                                  ,'RR35'   ,'3'
                                                  ,'RR36'   ,'4'--,''))                                         RRQ0403
                 ,decode(f.inpc_cd,'MA1','9999','')
                 )) phy_duration_2009
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA154Y' ,'0'                                                                       
                                                  ,'MA155Y' ,'1'                                                                       
                                                  ,'MA156Y' ,'2'                                                                       
                                                  ,'MA157Y' ,'3'--,''))                                                                  MA1Q0501
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_freq
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA159Y' ,'0'
                                                  ,'MA160Y' ,'1'
                                                  ,'MA161Y' ,'2'
                                                  ,'MA162Y' ,'3'
                                                  ,'MA163Y' ,'4'--,''))                                                                  MA1Q0502
                 ,decode(f.inpc_cd,'AM','9999'
                                  ,'RR','9999','')
                 )) phy_duration
  from temp a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
               or (f.inpc_cd = 'RR'  and f.item_sno between 1 and  300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 1 and  64)
       )
   and f.rprs_apnt_no = a.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
 group by a.ptno, a.ordr_ymd, f.inpc_cd

-- DR.H SAME VARIABLE QUESAT
-- part02 질병력
with temp as (
              select a.ptno, a.ordr_ymd, a.rprs_apnt_no
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
-- 질병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , a.inpc_cd
     , a.history_comorbidity
/* 고혈압 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y' ,'1'
                                                            ,'AM106'  ,'1'
                                                            ,'RR80Y'  ,'1'
                                                            ,'RR80'   ,'1'
                                                            ,'MA167Y' ,'1'
                                                            ,'MA168Y' ,'1'
                                                            ,'MA169Y' ,'1'
                                                            ,'MA170'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM106YY','1','AM106YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hypertension
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA167Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA168Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA169Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM106Y',f.inqy_rspn_ctn2 
                                                                         ,'AM106' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA170' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hypertension_age_diag
/* 고지혈증 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y' ,'1'
                                                            ,'AM107'  ,'1'
                                                            ,'RR81Y'  ,'1'
                                                            ,'RR81'   ,'1'
                                                            ,'MA177Y' ,'1'
                                                            ,'MA178Y' ,'1'
                                                            ,'MA179Y' ,'1'
                                                            ,'MA180'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM107YY','1','AM107YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'0'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'1','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) trt_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA177Y' ,'0'      --,'MA1152Y','1' 치료받은적 없음.
                                                                         ,'MA178Y' ,'1'      --,'MA1153Y','2' 과거치료했음.
                                                                         ,'MA179Y' ,'2','')) --,'MA1154Y','3' 현재치료중.
             ,''
             ) status_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM107Y',f.inqy_rspn_ctn2 
                                                                         ,'AM107' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA180' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hyperlipidemia_age_diag
/* 뇌졸중/중풍 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM108Y' ,'1'
                                                            ,'AM108'  ,'1'
                                                            ,'RR82Y'  ,'1'
                                                            ,'RR82'   ,'1'
                                                            ,'MA196Y' ,'1'
                                                            ,'MA197Y' ,'1'
                                                            ,'MA198Y' ,'1'
                                                            ,'MA199Y' ,'1'
                                                            ,'MA1100Y','1'
                                                            ,'MA1101' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_stroke
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM108YY','1','AM108YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'1','')) --,'3' 현재치료중.
             ,''
             ) trt_stroke
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'1'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'2','')) --,'3' 현재치료중.
             ,''
             ) status_stroke
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA199Y' ,'1'      --,'1' 수술/시술: 예
                                                                         ,'MA196Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA197Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA198Y' ,'0'      --,'3' 현재치료중.
                                                                         ,'MA1101' ,DECODE(f.inqy_rspn_ctn1,'','','0')
                                                                         ,''))
             ,''
             ) trt_stroke_op
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM108Y',f.inqy_rspn_ctn2 
                                                                         ,'AM108' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1101',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) stroke_age_diag
/* 당뇨병 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y' ,'1'
                                                            ,'AM109'  ,'1'
                                                            ,'RR83Y'  ,'1'
                                                            ,'RR83'   ,'1'
                                                            ,'MA172Y' ,'1'
                                                            ,'MA173Y' ,'1'
                                                            ,'MA174Y' ,'1'
                                                            ,'MA175'  ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM109YY','1','AM109YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'0'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'1','')) --,'3' 현재치료중.
             ,''
             ) trt_diabetes
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA172Y' ,'0'      --,'1' 치료받은적 없음.
                                                                         ,'MA173Y' ,'1'      --,'2' 과거치료했음.
                                                                         ,'MA174Y' ,'2','')) --,'3' 현재치료중.
             ,''
             ) status_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM109Y',f.inqy_rspn_ctn2 
                                                                         ,'AM109' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA175' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) diabetes_age_diag
/* 협심증/심근경색 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM110Y' ,'1'
                                                                                   ,'AM110'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR84Y'  ,'1'
                                                                                   ,'RR84'   ,'1','0')),'')
             ,''
             ) history_coronary_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM110YY','1','AM110YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_coronary_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM110Y',f.inqy_rspn_ctn2 
                                                                         ,'AM110' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) coronary_dis_age_diag
/* 협심증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','1'
                                                                                   ,'MA183Y','1'
                                                                                   ,'MA184Y','1'
                                                                                   ,'MA185Y','1'
                                                                                   ,'MA186Y','1'
                                                                                   ,'MA187' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_angina
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA185Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA182Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA183Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA184Y','0'      --,'3' 현재치료중.
                                                                         ,'MA187' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_angina_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA187' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) angina_age_diag
/* 심근경색 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','1'
                                                                                   ,'MA190Y','1'
                                                                                   ,'MA191Y','1'
                                                                                   ,'MA192Y','1'
                                                                                   ,'MA193Y','1'
                                                                                   ,'MA194' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_mi
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA192Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA189Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA190Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA191Y','0'      --,'3' 현재치료중.
                                                                         ,'MA194' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_mi_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA194' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) mi_age_diag
/* 신장 및 방광질환 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','1'
                                                                                   ,'MA1181Y','1'
                                                                                   ,'MA1182Y','1'
                                                                                   ,'MA1183Y','1'
                                                                                   ,'MA1184Y','1'
                                                                                   ,'MA1185' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_kidney_urinary_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1183Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1180Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1181Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1182Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1185' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_kidney_urinary_dis_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1185' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) kidney_urinary_dis_age_diag
/* 신장질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM120Y' ,'1'
                                                                                   ,'AM120'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR94Y'  ,'1'
                                                                                   ,'RR94'   ,'1','0')),'')
             ,''
             ) history_kidney_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM120YY','1','AM120YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_kidney_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM120Y',f.inqy_rspn_ctn2 
                                                                         ,'AM120' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) kidney_dis_age_diag
/* 방광질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM121Y' ,'1'
                                                                                   ,'AM121'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR95Y'  ,'1'
                                                                                   ,'RR95'   ,'1','0')),'')
             ,''
             ) history_urinary_tract_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM121YY','1','AM121YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_urinary_tract_dis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM121Y',f.inqy_rspn_ctn2 
                                                                         ,'AM121' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) urinary_tract_dis_age_diag
/* 갑상선 질환 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y' ,'1'
                                                                                   ,'AM122'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR96Y'  ,'1'
                                                                                   ,'RR96'   ,'1','0')),'')
             ,''
             ) history_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM122YY','1','AM122YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_thyroid_dis1
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM122Y',f.inqy_rspn_ctn2 
                                                                         ,'AM122' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) thyroid_dis1_age_diag
/* 갑상선 기능 저하증 및 항진증 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','1'
                                                                                   ,'MA1167Y','1'
                                                                                   ,'MA1168Y','1'
                                                                                   ,'MA1169Y','1'
                                                                                   ,'MA1170Y','1'
                                                                                   ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_thyroid_dis2
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1169Y','1'      --,'1' 수술/시술: 예
                                                                         ,'MA1166Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1167Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1168Y','0'      --,'3' 현재치료중.
                                                                         ,'MA1171' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
             ,''
             ) trt_thyroid_dis2_op
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1171' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) thyroid_dis2_age_diag
  from (-- 질병력 전체값 고려, MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C02' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 질병력 */
             , case 
                    when /*case1. 질병응답내역이 아무것도 없고, 질병력없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM130' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno            = 'RR101' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA165Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 다른 질병응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM'  and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR'  and (a.item_sno between 77  and 100) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 66  and 227) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    else ''
               end history_comorbidity 
          from temp b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.rprs_apnt_no = b.rprs_apnt_no
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500 and a.item_sno != 127)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 64  and 227 and a.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
               )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 64  and 227 and f.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
       )
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_comorbidity

-- DR.H SAME VARIABLE QUESAT
-- part03 암병력
with temp as (
              select a.ptno, a.ordr_ymd, a.rprs_apnt_no
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
-- 암병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , a.inpc_cd
/* 갑상선암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','1'
                                                                                   ,'MA1336Y','1'
                                                                                   ,'MA1337Y','1'
                                                                                   ,'MA1338Y','1'
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_thyroid
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1339' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cancer_thyroid_age_diag
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','1'
                                                                                   ,'MA1336Y','1'
                                                                                   ,'MA1337Y','1'
                                                                                   ,'MA1338Y','1'     -- 기타
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
                       ,''
                       ) trt_cancer_thyroid
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','1'     -- 수술
                                                                                   ,'MA1336Y','0'     -- 약물치료
                                                                                   ,'MA1337Y','0'     -- 방사선치료
                                                                                   ,'MA1338Y','0'     -- 기타
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_thyroid_op
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','0'     -- 수술
                                                                                   ,'MA1336Y','1'     -- 약물치료
                                                                                   ,'MA1337Y','0'     -- 방사선치료
                                                                                   ,'MA1338Y','0'     -- 기타
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_thyroid_ch
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','0'     -- 수술
                                                                                   ,'MA1336Y','0'     -- 약물치료
                                                                                   ,'MA1337Y','1'     -- 방사선치료
                                                                                   ,'MA1338Y','0'     -- 기타
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_thyroid_ra
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1335Y','0'     -- 수술
                                                                                   ,'MA1336Y','0'     -- 약물치료
                                                                                   ,'MA1337Y','0'     -- 방사선치료
                                                                                   ,'MA1338Y','1'     -- 기타
                                                                                   ,'MA1339' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_thyroid_ot
  from (-- 암병력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C04' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 암병력 */
             , case 
                    when /*case3. 암관련 응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd||a.item_sno            = 'AM127' then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    when /*case1. 암병력 응답내역이 아무것도 없고, 암병력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.ceck_yn||a.inqy_rspn_ctn1 -- MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 299 and 381) then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case 
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA1297Y' then a.ceck_yn
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 타/질병력 내역이 있거나, 질병력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 103 and 126) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'AM' and (a.item_sno between 128 and 129) then a.inqy_rspn_cd
                                    else ''
                               end
                              ) != 0
                         or
                         count(
                               case 
                                    when a.inpc_cd||a.item_sno            = 'AM130' then a.inqy_rspn_cd
                                    else ''
                               end
                              ) = 1
                    then '0'
                    else max(decode(a.inpc_cd,'RR','9999',''))
               end history_cancer
          from temp b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.rprs_apnt_no = b.rprs_apnt_no
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 296 and 382)
               )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 296 and 382)
       )
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_cancer

-- DR.H SAME VARIABLE QUESAT
-- part04 약복용력
with temp as (
              select a.ptno, a.ordr_ymd, a.rprs_apnt_no
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
-- 약복용력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') sm_date
     , a.inpc_cd
/* 혈압약 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM134Y' ,'1'
                                                            ,'AM134'  ,'1'
                                                            ,'RR105Y' ,'1'
                                                            ,'RR105'  ,'1'
                                                            ,'MA1231Y','1'
                                                            ,'MA1232Y','1','0'))
                                   ,''
             ) med_hypertension
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1231Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1232Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_hypertension
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM134Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM134' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_hypertension_duration
/* 당뇨약 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM135Y' ,'1'
                                                            ,'AM135'  ,'1'
                                                            ,'RR106Y' ,'1'
                                                            ,'RR106'  ,'1'
                                                            ,'MA1234Y','1'
                                                            ,'MA1235Y','1','0'))
                                   ,''
             ) med_diabetes
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1234Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1235Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_diabetes
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM135Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM135' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_diabetes_duration
/* 아스피린 */
     , decode(a.med                ,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM132Y' ,'1'
                                                            ,'AM132'  ,'1'
                                                            ,'RR103Y' ,'1'
                                                            ,'RR103'  ,'1'
                                                            ,'MA1240Y','1'
                                                            ,'MA1241Y','1','0'))
                                   ,''
             ) med_aspirin
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1240Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1241Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_aspirin
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM132Y',decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년')
                                                                         ,'AM132' ,decode(f.inqy_rspn_ctn1||f.inqy_rspn_ctn2,'','',f.inqy_rspn_ctn1||' 개월 또는 '||f.inqy_rspn_ctn2||' 년'),''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) med_aspirin_duration
/* 갑상선 치료제 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1264Y','1'
                                                                                   ,'MA1265Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_thyroid_dis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1264Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1265Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_thyroid_dis
  from (-- 약복용력 전체값 고려
        select /*+ ordered use_nl(b a) index(b 3E3C0E433E3C0E3E28_i13) index(a 3E3C23302E333E0E28_pk) */
               'C03' grp
             , a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
        /* 약복용력 */
             , case 
                    when /*case1. 약물복용 응답내역이 아무것도 없고, 약물복용력 없다에 체크된 경우는 0 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 132 and 147) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR' and (a.item_sno between 103 and 118) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.ceck_yn||a.inqy_rspn_ctn1--  MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) = 0
                         and
                         count(case when a.inpc_cd||a.item_sno            = 'AM148' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno            = 'RR119' then a.inqy_rspn_cd
                                    when a.inpc_cd||a.item_sno||a.ceck_yn = 'MA1229Y' then a.ceck_yn 
                                    else '' 
                               end
                              ) = 1
                    then '0'
                    when /*case2. 다른 약물복용 응답내역이 있으면 1 */
                         count(
                               case 
                                    when a.inpc_cd = 'AM' and (a.item_sno between 132 and 147) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'RR' and (a.item_sno between 103 and 118) then a.inqy_rspn_cd
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.ceck_yn||a.inqy_rspn_ctn1--  MA1 문진의 경우 CTN은 응답이 있어도 ceck_yn이 null이므로 함께 고려
                                    when a.inpc_cd = 'MA1' and (a.item_sno between 231 and 295) and a.item_sno != 290 then a.inqy_rspn_ctn1
                                    else ''
                               end
                              ) > 0
                    then '1'
                    else ''
               end med
          from temp b
             , 스키마.3E3C23302E333E0E28 a
         where a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_ymd
           and a.rprs_apnt_no = b.rprs_apnt_no
           and a.inpc_cd in ('AM','RR','MA1')                               
           AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (a.inpc_cd = 'AM'  and a.item_sno between 1   and 500)
               OR (a.inpc_cd = 'RR'  and a.item_sno between 1   and 300)
               OR (a.inpc_cd = 'MA1' and a.item_sno between 228 and 295)
               )
         group by a.PTNO
             , a.ordr_prrn_ymd
             , a.inpc_cd
       ) a
     , 스키마.3E3C23302E333E0E28 f
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 228 and 295)
       )
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.med

-- DRH SAME VARIABLE QUESAT
-- part05 스트레스, 계통별설문
with temp as (
              select a.ptno, a.ordr_ymd, a.rprs_apnt_no
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
               where a.ptno in (-- A.fib, A.flutter 발생군
                               )
                 and a.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and a.cncl_dt is null
                 and b.pckg_cd = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
             )
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
/* 스트레스 */
     , case
            when f.inpc_cd = 'RR' then '9999' --> case문의 순서 때문에 먼저 고려해야 함.
            when (
                  case -- factor 1 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 342 and 345 then f.ceck_yn--               stress_q8
                                       when f.inpc_cd = 'AM'  and item_sno between 347 and 350 then f.ceck_yn--               stress_q9
                                       when f.inpc_cd = 'AM'  and item_sno between 352 and 355 then f.ceck_yn--               stress_q10
                                       when f.inpc_cd = 'AM'  and item_sno between 357 and 360 then f.ceck_yn--               stress_q11
                                       when f.inpc_cd = 'AM'  and item_sno between 362 and 365 then f.ceck_yn--               stress_q12
                                       when f.inpc_cd = 'AM'  and item_sno between 372 and 375 then f.ceck_yn--               stress_q14
                                       when f.inpc_cd = 'AM'  and item_sno between 387 and 390 then f.ceck_yn--               stress_q17
                                       when f.inpc_cd = 'AM'  and item_sno between 392 and 395 then f.ceck_yn--               stress_q18
                                       when f.inpc_cd = 'MA1' and item_sno between 848 and 851 then f.ceck_yn--               stress_q8
                                       when f.inpc_cd = 'MA1' and item_sno between 853 and 856 then f.ceck_yn--               stress_q9
                                       when f.inpc_cd = 'MA1' and item_sno between 858 and 861 then f.ceck_yn--               stress_q10
                                       when f.inpc_cd = 'MA1' and item_sno between 863 and 866 then f.ceck_yn--               stress_q11
                                       when f.inpc_cd = 'MA1' and item_sno between 868 and 871 then f.ceck_yn--               stress_q12
                                       when f.inpc_cd = 'MA1' and item_sno between 878 and 881 then f.ceck_yn--               stress_q14
                                       when f.inpc_cd = 'MA1' and item_sno between 893 and 896 then f.ceck_yn--               stress_q17
                                       when f.inpc_cd = 'MA1' and item_sno between 898 and 901 then f.ceck_yn--               stress_q18
                                       else ''
                                  end
                                 ) > 6 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 3 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 367 and 370 then f.ceck_yn--               stress_q13
                                       when f.inpc_cd = 'AM'  and item_sno between 377 and 380 then f.ceck_yn--               stress_q15
                                       when f.inpc_cd = 'AM'  and item_sno between 382 and 385 then f.ceck_yn--               stress_q16
                                       when f.inpc_cd = 'MA1' and item_sno between 873 and 876 then f.ceck_yn--               stress_q13
                                       when f.inpc_cd = 'MA1' and item_sno between 883 and 886 then f.ceck_yn--               stress_q15
                                       when f.inpc_cd = 'MA1' and item_sno between 888 and 891 then f.ceck_yn--               stress_q16
                                       else ''
                                  end
                                 ) > 1 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 2 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 307 and 310 then f.ceck_yn--               stress_q1
                                       when f.inpc_cd = 'AM'  and item_sno between 312 and 315 then f.ceck_yn--               stress_q2
                                       when f.inpc_cd = 'AM'  and item_sno between 317 and 320 then f.ceck_yn--               stress_q3
                                       when f.inpc_cd = 'AM'  and item_sno between 327 and 330 then f.ceck_yn--               stress_q5
                                       when f.inpc_cd = 'AM'  and item_sno between 332 and 335 then f.ceck_yn--               stress_q6
                                       when f.inpc_cd = 'MA1' and item_sno between 813 and 816 then f.ceck_yn--               stress_q1
                                       when f.inpc_cd = 'MA1' and item_sno between 818 and 821 then f.ceck_yn--               stress_q2
                                       when f.inpc_cd = 'MA1' and item_sno between 823 and 826 then f.ceck_yn--               stress_q3
                                       when f.inpc_cd = 'MA1' and item_sno between 833 and 836 then f.ceck_yn--               stress_q5
                                       when f.inpc_cd = 'MA1' and item_sno between 838 and 841 then f.ceck_yn--               stress_q6
                                       else ''
                                  end
                                 ) > 3 then 'Y'
                       else 'X'
                  end ||
                  case -- factor 4 area
                       when
                            count(
                                  case 
                                       when f.inpc_cd = 'AM'  and item_sno between 322 and 325 then f.ceck_yn--               stress_q4
                                       when f.inpc_cd = 'AM'  and item_sno between 337 and 340 then f.ceck_yn--               stress_q7
                                       when f.inpc_cd = 'MA1' and item_sno between 828 and 831 then f.ceck_yn--               stress_q4
                                       when f.inpc_cd = 'MA1' and item_sno between 843 and 846 then f.ceck_yn--               stress_q7
                                       else ''
                                  end
                                 ) > 0 then 'Y'
                       else 'X'
                  end
                 ) != 'YYYY'
            then ''
            else
                 decode(f.inpc_cd,'RR','9999'
                                 ,sum(
                                      DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM307Y' ,0
                                                                             ,'AM308Y' ,1
                                                                             ,'AM309Y' ,2
                                                                             ,'AM310Y' ,3
                                                                             ,'AM307' ,0
                                                                             ,'AM308' ,1
                                                                             ,'AM309' ,2
                                                                             ,'AM310' ,3
                                                                             ,'MA1813Y',to_number(g.fod_base_qty)
                                                                             ,'MA1814Y',to_number(g.fod_base_qty)
                                                                             ,'MA1815Y',to_number(g.fod_base_qty)
                                                                             ,'MA1816Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS01
                                                                             ,'AM312Y' ,3
                                                                             ,'AM313Y' ,2
                                                                             ,'AM314Y' ,1
                                                                             ,'AM315Y' ,0
                                                                             ,'AM312' ,3
                                                                             ,'AM313' ,2
                                                                             ,'AM314' ,1
                                                                             ,'AM315' ,0
                                                                             ,'MA1818Y',to_number(g.fod_base_qty)
                                                                             ,'MA1819Y',to_number(g.fod_base_qty)
                                                                             ,'MA1820Y',to_number(g.fod_base_qty)
                                                                             ,'MA1821Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS02
                                                                             ,'AM317Y' ,3
                                                                             ,'AM318Y' ,2
                                                                             ,'AM319Y' ,1
                                                                             ,'AM320Y' ,0
                                                                             ,'AM317' ,3
                                                                             ,'AM318' ,2
                                                                             ,'AM319' ,1
                                                                             ,'AM320' ,0
                                                                             ,'MA1823Y',to_number(g.fod_base_qty)
                                                                             ,'MA1824Y',to_number(g.fod_base_qty)
                                                                             ,'MA1825Y',to_number(g.fod_base_qty)
                                                                             ,'MA1826Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS03
                                                                             ,'AM322Y' ,3
                                                                             ,'AM323Y' ,2
                                                                             ,'AM324Y' ,1
                                                                             ,'AM325Y' ,0
                                                                             ,'AM322' ,3
                                                                             ,'AM323' ,2
                                                                             ,'AM324' ,1
                                                                             ,'AM325' ,0
                                                                             ,'MA1828Y',to_number(g.fod_base_qty)
                                                                             ,'MA1829Y',to_number(g.fod_base_qty)
                                                                             ,'MA1830Y',to_number(g.fod_base_qty)
                                                                             ,'MA1831Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS04
                                                                             ,'AM327Y' ,0
                                                                             ,'AM328Y' ,1
                                                                             ,'AM329Y' ,2
                                                                             ,'AM330Y' ,3
                                                                             ,'AM327' ,0
                                                                             ,'AM328' ,1
                                                                             ,'AM329' ,2
                                                                             ,'AM330' ,3
                                                                             ,'MA1833Y',to_number(g.fod_base_qty)
                                                                             ,'MA1834Y',to_number(g.fod_base_qty)
                                                                             ,'MA1835Y',to_number(g.fod_base_qty)
                                                                             ,'MA1836Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS05
                                                                             ,'AM332Y' ,0
                                                                             ,'AM333Y' ,1
                                                                             ,'AM334Y' ,2
                                                                             ,'AM335Y' ,3
                                                                             ,'AM332' ,0
                                                                             ,'AM333' ,1
                                                                             ,'AM334' ,2
                                                                             ,'AM335' ,3
                                                                             ,'MA1838Y',to_number(g.fod_base_qty)
                                                                             ,'MA1839Y',to_number(g.fod_base_qty)
                                                                             ,'MA1840Y',to_number(g.fod_base_qty)
                                                                             ,'MA1841Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS06
                                                                             ,'AM337Y' ,3
                                                                             ,'AM338Y' ,2
                                                                             ,'AM339Y' ,1
                                                                             ,'AM340Y' ,0
                                                                             ,'AM337' ,3
                                                                             ,'AM338' ,2
                                                                             ,'AM339' ,1
                                                                             ,'AM340' ,0
                                                                             ,'MA1843Y',to_number(g.fod_base_qty)
                                                                             ,'MA1844Y',to_number(g.fod_base_qty)
                                                                             ,'MA1845Y',to_number(g.fod_base_qty)
                                                                             ,'MA1846Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS07
                                                                             ,'AM342Y' ,0
                                                                             ,'AM343Y' ,1
                                                                             ,'AM344Y' ,2
                                                                             ,'AM345Y' ,3
                                                                             ,'AM342' ,0
                                                                             ,'AM343' ,1
                                                                             ,'AM344' ,2
                                                                             ,'AM345' ,3
                                                                             ,'MA1848Y',to_number(g.fod_base_qty)
                                                                             ,'MA1849Y',to_number(g.fod_base_qty)
                                                                             ,'MA1850Y',to_number(g.fod_base_qty)
                                                                             ,'MA1851Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS08
                                                                             ,'AM347Y' ,0
                                                                             ,'AM348Y' ,1
                                                                             ,'AM349Y' ,2
                                                                             ,'AM350Y' ,3
                                                                             ,'AM347' ,0
                                                                             ,'AM348' ,1
                                                                             ,'AM349' ,2
                                                                             ,'AM350' ,3
                                                                             ,'MA1853Y',to_number(g.fod_base_qty)
                                                                             ,'MA1854Y',to_number(g.fod_base_qty)
                                                                             ,'MA1855Y',to_number(g.fod_base_qty)
                                                                             ,'MA1856Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS09
                                                                             ,'AM352Y' ,0
                                                                             ,'AM353Y' ,1
                                                                             ,'AM354Y' ,2
                                                                             ,'AM355Y' ,3
                                                                             ,'AM352' ,0
                                                                             ,'AM353' ,1
                                                                             ,'AM354' ,2
                                                                             ,'AM355' ,3
                                                                             ,'MA1858Y',to_number(g.fod_base_qty)
                                                                             ,'MA1859Y',to_number(g.fod_base_qty)
                                                                             ,'MA1860Y',to_number(g.fod_base_qty)
                                                                             ,'MA1861Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS10
                                                                             ,'AM357Y' ,0
                                                                             ,'AM358Y' ,1
                                                                             ,'AM359Y' ,2
                                                                             ,'AM360Y' ,3
                                                                             ,'AM357' ,0
                                                                             ,'AM358' ,1
                                                                             ,'AM359' ,2
                                                                             ,'AM360' ,3
                                                                             ,'MA1863Y',to_number(g.fod_base_qty)
                                                                             ,'MA1864Y',to_number(g.fod_base_qty)
                                                                             ,'MA1865Y',to_number(g.fod_base_qty)
                                                                             ,'MA1866Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS11
                                                                             ,'AM362Y' ,0
                                                                             ,'AM363Y' ,1
                                                                             ,'AM364Y' ,2
                                                                             ,'AM365Y' ,3
                                                                             ,'AM362' ,0
                                                                             ,'AM363' ,1
                                                                             ,'AM364' ,2
                                                                             ,'AM365' ,3
                                                                             ,'MA1868Y',to_number(g.fod_base_qty)
                                                                             ,'MA1869Y',to_number(g.fod_base_qty)
                                                                             ,'MA1870Y',to_number(g.fod_base_qty)
                                                                             ,'MA1871Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS12
                                                                             ,'AM367Y' ,3
                                                                             ,'AM368Y' ,2
                                                                             ,'AM369Y' ,1
                                                                             ,'AM370Y' ,0
                                                                             ,'AM367' ,3
                                                                             ,'AM368' ,2
                                                                             ,'AM369' ,1
                                                                             ,'AM370' ,0
                                                                             ,'MA1873Y',to_number(g.fod_base_qty)
                                                                             ,'MA1874Y',to_number(g.fod_base_qty)
                                                                             ,'MA1875Y',to_number(g.fod_base_qty)
                                                                             ,'MA1876Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS13
                                                                             ,'AM372Y' ,0
                                                                             ,'AM373Y' ,1
                                                                             ,'AM374Y' ,2
                                                                             ,'AM375Y' ,3
                                                                             ,'AM372' ,0
                                                                             ,'AM373' ,1
                                                                             ,'AM374' ,2
                                                                             ,'AM375' ,3
                                                                             ,'MA1878Y',to_number(g.fod_base_qty)
                                                                             ,'MA1879Y',to_number(g.fod_base_qty)
                                                                             ,'MA1880Y',to_number(g.fod_base_qty)
                                                                             ,'MA1881Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS14
                                                                             ,'AM377Y' ,3
                                                                             ,'AM378Y' ,2
                                                                             ,'AM379Y' ,1
                                                                             ,'AM380Y' ,0
                                                                             ,'AM377' ,3
                                                                             ,'AM378' ,2
                                                                             ,'AM379' ,1
                                                                             ,'AM380' ,0
                                                                             ,'MA1883Y',to_number(g.fod_base_qty)
                                                                             ,'MA1884Y',to_number(g.fod_base_qty)
                                                                             ,'MA1885Y',to_number(g.fod_base_qty)
                                                                             ,'MA1886Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS15
                                                                             ,'AM382Y' ,3
                                                                             ,'AM383Y' ,2
                                                                             ,'AM384Y' ,1
                                                                             ,'AM385Y' ,0
                                                                             ,'AM382' ,3
                                                                             ,'AM383' ,2
                                                                             ,'AM384' ,1
                                                                             ,'AM385' ,0
                                                                             ,'MA1888Y',to_number(g.fod_base_qty)
                                                                             ,'MA1889Y',to_number(g.fod_base_qty)
                                                                             ,'MA1890Y',to_number(g.fod_base_qty)
                                                                             ,'MA1891Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS16
                                                                             ,'AM387Y' ,0
                                                                             ,'AM388Y' ,1
                                                                             ,'AM389Y' ,2
                                                                             ,'AM390Y' ,3
                                                                             ,'AM387' ,0
                                                                             ,'AM388' ,1
                                                                             ,'AM389' ,2
                                                                             ,'AM390' ,3
                                                                             ,'MA1893Y',to_number(g.fod_base_qty)
                                                                             ,'MA1894Y',to_number(g.fod_base_qty)
                                                                             ,'MA1895Y',to_number(g.fod_base_qty)
                                                                             ,'MA1896Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS17
                                                                             ,'AM392Y' ,0
                                                                             ,'AM393Y' ,1
                                                                             ,'AM394Y' ,2
                                                                             ,'AM395Y' ,3
                                                                             ,'AM392' ,0
                                                                             ,'AM393' ,1
                                                                             ,'AM394' ,2
                                                                             ,'AM395' ,3
                                                                             ,'MA1898Y',to_number(g.fod_base_qty)
                                                                             ,'MA1899Y',to_number(g.fod_base_qty)
                                                                             ,'MA1900Y',to_number(g.fod_base_qty)
                                                                             ,'MA1901Y',to_number(g.fod_base_qty)
                                                                             --,decode(f.inpc_cd,'RR','9999','')))                STRESS18
                                            )
                                     ) 
                       )
       end STRESS_score
/* 계통별 설문 - 심장,혈관 */
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                  ,'AM197Y' ,'1'--,''))             AMQ01601    □ 가슴이 조여들며 통증이 팔이나 등으로 뻗치는 일이 있다.              
                                                  ,'RR146Y' ,'1'--,''))             RRQ1201     □ 가슴이 조여들며 통증이 팔이나 등으로 뻗치는 일이 있다.         
                                                  ,'MA1604Y','1'--,''))             MA1Q1301     ①가슴이조여들며통증이팔이나등으로뻗치는 일이있다..                   
                                                  ,'')) sy4_1
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                  ,'AM198Y' ,'1'--,''))             AMQ01602    □ 운동할때 전과 달리 가슴이 답답해지거나 숨이 몹시 차다.              
                                                  ,'RR147Y' ,'1'--,''))             RRQ1202     □ 운동할때 전과 달리 가슴이 답답해지거나 숨이 몹시 차다.         
                                                  ,'MA1605Y','1'--,''))             MA1Q1302     ②운동할때전과달리가슴이답답해지거나숨이 몹시차다..                   
                                                  ,'')) sy4_2
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                  ,'AM199Y' ,'1'--,''))             AMQ01603    □ 갑자기 가슴이 두근거리거나 맥박이 불규칙해질 때가 있다.             
                                                  ,'RR148Y' ,'1'--,''))             RRQ1203     □ 갑자기 가슴이 두근거리거나 맥박이 불규칙해질 때가 있다.        
                                                  ,'MA1606Y','1'--,''))             MA1Q1303     ③갑자기가슴이두근거리거나맥박이불규칙해질 때가있다..                 
                                                  ,'')) sy4_3
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                  ,'AM200Y' ,'1'--,''))             AMQ01604    □ 얼굴이나 손발이 자주 붓는다.                                        
                                                  ,'RR149Y' ,'1'--,''))             RRQ1204     □ 얼굴이나 손발이 자주 붓는다.                                   
                                                  ,'MA1607Y','1'--,''))             MA1Q1304     ④얼굴이나손발이자주붓는다.                                           
                                                  ,'')) sy4_4
     , MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn
                                                  ,'AM201Y' ,'1'--,''))             AMQ01605    □ 잘때나 누울때 가슴이 답답하고 숨이 차며 앉으면 오히려 편해진다.     
                                                  ,'RR150Y' ,'1'--,''))             RRQ1205     □ 잘때나 누울때 가슴이 답답하고 숨이 차며 앉으면 오히려 편해진다.
                                                  ,'MA1608Y','1'--,''))             MA1Q1305     ⑤잘때나누울때가슴이답답하고숨이차며 앉으면오히려편해진다..           
                                                  ,'')) sy4_5
  from temp a
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
       or (f.inpc_cd = 'RR'  and f.item_sno between 1 and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 573 and 656) -- 계통별설문
       OR (f.inpc_cd = 'MA1' and f.item_sno between 657 and 917) -- 스트레스설문
       )
   and f.rprs_apnt_no = a.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
 group by a.ptno, a.ordr_ymd, f.inpc_cd
