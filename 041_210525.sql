-- rkdalfk
-- cleaned_data
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계, 2016년 7월 1일까지만
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(d.exmn_cd,'BL211103',d.cleaned_ncvl_vl,'')) BL211103
     , max(decode(d.exmn_cd,'BL3111',d.cleaned_ncvl_vl,'')) BL3111
     , max(decode(d.exmn_cd,'BL3112',d.cleaned_ncvl_vl,'')) BL3112
     , max(decode(d.exmn_cd,'BL3113',d.cleaned_ncvl_vl,'')) BL3113
     , max(decode(d.exmn_cd,'BL3114',d.cleaned_ncvl_vl,'')) BL3114
     , max(decode(d.exmn_cd,'BL3115',d.cleaned_ncvl_vl,'')) BL3115
     , max(decode(d.exmn_cd,'BL3116',d.cleaned_ncvl_vl,'')) BL3116
     , max(decode(d.exmn_cd,'BL3117',d.cleaned_ncvl_vl,'')) BL3117
     , max(decode(d.exmn_cd,'BL3118',d.cleaned_ncvl_vl,'')) BL3118
     , max(decode(d.exmn_cd,'BL3119',d.cleaned_ncvl_vl,'')) BL3119
     , max(decode(d.exmn_cd,'BL3120',d.cleaned_ncvl_vl,'')) BL3120
     , max(decode(d.exmn_cd,'BL312001',d.cleaned_ncvl_vl,'')) BL312001
     , max(decode(d.exmn_cd,'BL312002',d.cleaned_ncvl_vl,'')) BL312002
     , max(decode(d.exmn_cd,'BL3121',d.cleaned_ncvl_vl,'')) BL3121
     , max(decode(d.exmn_cd,'BL3125',d.cleaned_ncvl_vl,'')) BL3125
     , max(decode(d.exmn_cd,'BL3140',d.cleaned_ncvl_vl,'')) BL3140
     , max(decode(d.exmn_cd,'BL3141',d.cleaned_ncvl_vl,'')) BL3141
     , max(decode(d.exmn_cd,'BL3142',d.cleaned_ncvl_vl,'')) BL3142
     , max(decode(d.exmn_cd,'BL314201',d.cleaned_ncvl_vl,'')) BL314201
     , max(decode(d.exmn_cd,'BL3164',d.cleaned_ncvl_vl,'')) BL3164
     , max(decode(d.exmn_cd,'BL3901',d.cleaned_ncvl_vl,'')) BL3901
     , max(decode(d.exmn_cd,'BL3982',d.cleaned_ncvl_vl,'')) BL3982
     , max(decode(d.exmn_cd,'BL5111',d.cleaned_ncvl_vl,'')) BL5111
     , max(decode(d.exmn_cd,'BL5112',d.cleaned_ncvl_vl,'')) BL5112
     , max(decode(d.exmn_cd,'BL5113',d.cleaned_ncvl_vl,'')) BL5113
     , max(decode(d.exmn_cd,'BL5115',d.cleaned_ncvl_vl,'')) BL5115
     , max(decode(d.exmn_cd,'BL5116',d.cleaned_ncvl_vl,'')) BL5116
     , max(decode(d.exmn_cd,'BL5117',d.cleaned_ncvl_vl,'')) BL5117
     , max(decode(d.exmn_cd,'BL3249',d.cleaned_ncvl_vl,'')) BL3249
     , max(decode(d.exmn_cd,'BL3252',d.cleaned_ncvl_vl,'')) BL3252
     , max(decode(d.exmn_cd,'BL326501',d.cleaned_ncvl_vl,'')) BL326501
     , max(decode(d.exmn_cd,'BL6111',d.cleaned_ncvl_vl,'')) BL6111
     , max(decode(d.exmn_cd,'BL6112',d.cleaned_ncvl_vl,'')) BL6112
     , max(decode(d.exmn_cd,'BL6113',d.cleaned_ncvl_vl,'')) BL6113
     , max(decode(d.exmn_cd,'BL6114',d.cleaned_ncvl_vl,'')) BL6114
     , max(decode(d.exmn_cd,'BL6115',d.cleaned_ncvl_vl,'')) BL6115
     , max(decode(d.exmn_cd,'BL6116',d.cleaned_ncvl_vl,'')) BL6116
     , max(decode(d.exmn_cd,'BL6117',d.cleaned_ncvl_vl,'')) BL6117
     , max(decode(d.exmn_cd,'BL6118',d.cleaned_ncvl_vl,'')) BL6118
     , max(decode(d.exmn_cd,'BL6119',d.cleaned_ncvl_vl,'')) BL6119
     , max(decode(d.exmn_cd,'BL6120',d.cleaned_ncvl_vl,'')) BL6120
     , max(decode(d.exmn_cd,'BL6121',d.cleaned_ncvl_vl,'')) BL6121
     , max(decode(d.exmn_cd,'BL6122',d.cleaned_ncvl_vl,'')) BL6122
     , max(decode(d.exmn_cd,'NR0101',d.cleaned_ncvl_vl,'')) NR0101
     , max(decode(d.exmn_cd,'NR0102',d.cleaned_ncvl_vl,'')) NR0102
     , max(decode(d.exmn_cd,'NR0103',d.cleaned_ncvl_vl,'')) NR0103
     , max(decode(d.exmn_cd,'NR0201',d.cleaned_ncvl_vl,'')) NR0201
     , max(decode(d.exmn_cd,'NR0202',d.cleaned_ncvl_vl,'')) NR0202
     , max(decode(d.exmn_cd,'NR2401',d.cleaned_ncvl_vl,'')) NR2401
     , max(decode(d.exmn_cd,'NR7104',d.cleaned_ncvl_vl,'')) NR7104
     , max(decode(d.exmn_cd,'NR7105',d.cleaned_ncvl_vl,'')) NR7105
     , max(decode(d.exmn_cd,'RC118401',d.cleaned_ncvl_vl,'')) RC118401
     , max(decode(d.exmn_cd,'RC118402',d.cleaned_ncvl_vl,'')) RC118402
     , max(decode(d.exmn_cd,'SM0600SBP',d.cleaned_ncvl_vl,'')) SM0600SBP
     , max(decode(d.exmn_cd,'SM0600DBP',d.cleaned_ncvl_vl,'')) SM0600DBP
     , max(decode(d.exmn_cd,'SM0101',d.cleaned_ncvl_vl,'')) SM0101
     , max(decode(d.exmn_cd,'SM0102',d.cleaned_ncvl_vl,'')) SM0102
     , max(decode(d.exmn_cd,'SM316001',d.cleaned_ncvl_vl,'')) SM316001
     , nvl(round(max(decode(d.exmn_cd,'SM0102',d.cleaned_ncvl_vl,''))/((max(decode(d.exmn_cd,'SM0101',d.cleaned_ncvl_vl,''))/100)*(max(decode(d.exmn_cd,'SM0101',d.cleaned_ncvl_vl,''))/100)),1),0) SM316001
  from temp a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.1543294D47144D43333E2E1428 d
     , 스키마.0E5B5B285B28402857 e
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and d.ptno = b.ptno
   and d.sm_date = b.ordr_ymd
   and d.exmn_cd in (
                     'BL6120'   ,'BL326501'   ,'BL3901'   ,'BL211103'   ,'BL3120'    
                    ,'BL6121'   ,'BL6111'   ,'BL3982'   ,'BL3111'  ,'BL312001'   
                    ,'BL6122'   ,'BL6112'   ,'BL5111'   ,'BL3112'  ,'BL312002'   
                    ,'NR0101'   ,'BL6113'   ,'BL5112'   ,'BL3113'  ,'BL3121'   
                    ,'NR0102'   ,'BL6114'   ,'BL5113'   ,'BL3114'  ,'BL3125'   
                    ,'NR0103'   ,'BL6115'   ,'BL5115'   ,'BL3115'  ,'BL3140'   
                    ,'NR0201'   ,'BL6116'   ,'BL5116'   ,'BL3116'  ,'BL3141'   
                    ,'NR0202'   ,'BL6117'   ,'BL5117'   ,'BL3117'  ,'BL3142'   
                    ,'NR2401'   ,'BL6118'   ,'BL3249'   ,'BL3118'  ,'BL314201'   
                    ,'NR7104'   ,'BL6119'   ,'BL3252'   ,'BL3119'  ,'BL3164'   
                    ,'NR7105' ,'RC118401' ,'RC118402' ,'SM0600SBP' ,'SM0600DBP' ,'SM0101' ,'SM0102' ,'SM316001'
                    )
   and e.ptno = a.ptno
 group by b.ptno
     , b.ordr_ymd
     , e.gend_cd
     , a.fst_abd_us_ymd

-- uncleaned_data
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(d.exmn_cd,'BL211103',d.exrs_ncvl_vl,'')) BL211103
     , max(decode(d.exmn_cd,'BL3111',d.exrs_ncvl_vl,'')) BL3111
     , max(decode(d.exmn_cd,'BL3112',d.exrs_ncvl_vl,'')) BL3112
     , max(decode(d.exmn_cd,'BL3113',d.exrs_ncvl_vl,'')) BL3113
     , max(decode(d.exmn_cd,'BL3114',d.exrs_ncvl_vl,'')) BL3114
     , max(decode(d.exmn_cd,'BL3115',d.exrs_ncvl_vl,'')) BL3115
     , max(decode(d.exmn_cd,'BL3116',d.exrs_ncvl_vl,'')) BL3116
     , max(decode(d.exmn_cd,'BL3117',d.exrs_ncvl_vl,'')) BL3117
     , max(decode(d.exmn_cd,'BL3118',d.exrs_ncvl_vl,'')) BL3118
     , max(decode(d.exmn_cd,'BL3119',d.exrs_ncvl_vl,'')) BL3119
     , max(decode(d.exmn_cd,'BL3120',d.exrs_ncvl_vl,'')) BL3120
     , max(decode(d.exmn_cd,'BL312001',d.exrs_ncvl_vl,'')) BL312001
     , max(decode(d.exmn_cd,'BL312002',d.exrs_ncvl_vl,'')) BL312002
     , max(decode(d.exmn_cd,'BL3121',d.exrs_ncvl_vl,'')) BL3121
     , max(decode(d.exmn_cd,'BL3125',d.exrs_ncvl_vl,'')) BL3125
     , max(decode(d.exmn_cd,'BL3140',d.exrs_ncvl_vl,'')) BL3140
     , max(decode(d.exmn_cd,'BL3141',d.exrs_ncvl_vl,'')) BL3141
     , max(decode(d.exmn_cd,'BL3142',d.exrs_ncvl_vl,'')) BL3142
     , max(decode(d.exmn_cd,'BL314201',d.exrs_ncvl_vl,'')) BL314201
     , max(decode(d.exmn_cd,'BL3164',d.exrs_ncvl_vl,'')) BL3164
     , max(decode(d.exmn_cd,'BL3901',d.exrs_ncvl_vl,'')) BL3901
     , max(decode(d.exmn_cd,'BL3982',d.exrs_ncvl_vl,'')) BL3982
     , case
            when (max(decode(d.exmn_cd,'BL5111',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5111',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5111',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5111',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5111
     , case
            when (max(decode(d.exmn_cd,'BL5112',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5112',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5112',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5112',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5112
     , case
            when (max(decode(d.exmn_cd,'BL5113',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5113',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5113',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5113',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5113
     , case
            when (max(decode(d.exmn_cd,'BL5115',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5115',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5115',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5115',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5115
     , case
            when (max(decode(d.exmn_cd,'BL5116',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5116',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5116',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5116',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5116
     , case
            when (max(decode(d.exmn_cd,'BL5117',lower(d.exrs_ncvl_vl),'')) like '%e%g%'
                 or
                  max(decode(d.exmn_cd,'BL5117',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 )                                    then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL5117',lower(d.exrs_ncvl_vl),'')) like 'w%'     then '0.5'
            when max(decode(d.exmn_cd,'BL5117',lower(d.exrs_ncvl_vl),'')) like 'p%'     then '1'
       else ''
       end BL5117
     , max(decode(d.exmn_cd,'BL3249',d.exrs_ncvl_vl,'')) BL3249
     , max(decode(d.exmn_cd,'BL3252',d.exrs_ncvl_vl,'')) BL3252
     , max(decode(d.exmn_cd,'BL326501',d.exrs_ncvl_vl,'')) BL326501
     , case
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'am%'    then '1'
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'br%'    then '2'
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'gr%'    then '3'
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'or%'    then '4'
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 're%'    then '5'
            when (max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like '%st%'
                 or
                  max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like '%sr%'
                 )                                   then '6' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'ye%'    then '7'
            when (max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'milky%'
                 or
                  max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'color%'
                 or
                  max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'whi%'
                 or
                  max(decode(d.exmn_cd,'BL6111',lower(d.exrs_ncvl_vl),'')) like 'other%'
                 )                                   then '8'
       else ''
       end BL6111
     , case
            when (max(decode(d.exmn_cd,'BL6112',lower(d.exrs_ncvl_vl),'')) like '%ea%'
                 or
                  max(decode(d.exmn_cd,'BL6112',lower(d.exrs_ncvl_vl),'')) like '%ae%'
                 )                                    then '1'
            when max(decode(d.exmn_cd,'BL6112',lower(d.exrs_ncvl_vl),'')) like '%ou%'    then '2'
            else '3'
       end BL6112
     , max(decode(d.exmn_cd,'BL6113',d.exrs_ncvl_vl,'')) BL6113
     , max(decode(d.exmn_cd,'BL6114',d.exrs_ncvl_vl,'')) BL6114
     , case
            when max(decode(d.exmn_cd,'BL6115',lower(d.exrs_ncvl_vl),'')) like 'ne%'     then '0' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6115',lower(d.exrs_ncvl_vl),'')) like '%25%tr%' then '0.5'
            when max(decode(d.exmn_cd,'BL6115',lower(d.exrs_ncvl_vl),'')) like '75%'   then '1'
            when max(decode(d.exmn_cd,'BL6115',lower(d.exrs_ncvl_vl),'')) like '150%'    then '2'
            when max(decode(d.exmn_cd,'BL6115',lower(d.exrs_ncvl_vl),'')) like '500%'    then '3'
       else ''
       end BL6115
     , case
            when max(decode(d.exmn_cd,'BL6116',lower(d.exrs_ncvl_vl),'')) like 'n%'      then '0'
            when max(decode(d.exmn_cd,'BL6116',lower(d.exrs_ncvl_vl),'')) like '%50%tr%' then '0.5'
            when max(decode(d.exmn_cd,'BL6116',lower(d.exrs_ncvl_vl),'')) like '1000%'   then '3'
            when max(decode(d.exmn_cd,'BL6116',lower(d.exrs_ncvl_vl),'')) like '100%'    then '1'
            when max(decode(d.exmn_cd,'BL6116',lower(d.exrs_ncvl_vl),'')) like '300%'    then '2'
       else ''
       end BL6116
     , case
            when max(decode(d.exmn_cd,'BL6117',lower(d.exrs_ncvl_vl),'')) like 'n%'     then '0'
            when max(decode(d.exmn_cd,'BL6117',lower(d.exrs_ncvl_vl),'')) like '%5%tr%' then '0.5'
            when max(decode(d.exmn_cd,'BL6117',lower(d.exrs_ncvl_vl),'')) like '150%'   then '3'
            when max(decode(d.exmn_cd,'BL6117',lower(d.exrs_ncvl_vl),'')) like '15%'    then '1'
            when max(decode(d.exmn_cd,'BL6117',lower(d.exrs_ncvl_vl),'')) like '50%'    then '2'
       else ''
       end BL6117
     , case
            when max(decode(d.exmn_cd,'BL6118',lower(d.exrs_ncvl_vl),'')) like 'n%'    then '0'
            when max(decode(d.exmn_cd,'BL6118',lower(d.exrs_ncvl_vl),'')) like '10%'    then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6118',lower(d.exrs_ncvl_vl),'')) like '1%'    then '1'
            when max(decode(d.exmn_cd,'BL6118',lower(d.exrs_ncvl_vl),'')) like '3%'    then '2'
            when max(decode(d.exmn_cd,'BL6118',lower(d.exrs_ncvl_vl),'')) like '6%'    then '3'
       else ''
       end BL6118
     , case
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like 'n%'        then '0'
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '%10%tr%'   then '0.5'
            when replace(max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')),' ','') = '50+'      then '' -- 검증 후 수정
            when replace(max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')),' ','') like '500%'      then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '50%'       then '2'
            when replace(max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')),' ','') = '150++'    then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '150%'      then '3'
            when (replace(max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')),' ','')  like '250+++++'
                 or
                  replace(max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')),' ','')  like '250+++'
                 )                                      then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '%250%'      then '4' -- 검증 후 수정
            when (max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '25%++'
                 or
                  max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '25%tr'
                 or
                  max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '25%-'
                 )                                      then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6119',lower(d.exrs_ncvl_vl),'')) like '%25%'       then '1' -- 검증 후 수정
       else ''
       end BL6119
     , case
            when (max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 or
                  max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like '%rm%'
                 )                                    then '0'
            when max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like '1%tr%'   then '0.5'
            when max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like '4%'      then '1'
            when max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like '8%'      then '2'
            when max(decode(d.exmn_cd,'BL6120',lower(d.exrs_ncvl_vl),'')) like '12%'     then '3'
       else ''
       end BL6120
     , case
            when (max(decode(d.exmn_cd,'BL6121',lower(d.exrs_ncvl_vl),'')) like '%ne%'
                 or
                  max(decode(d.exmn_cd,'BL6121',lower(d.exrs_ncvl_vl),'')) like '%rg%'
                 )                                   then '0'
            when max(decode(d.exmn_cd,'BL6121',lower(d.exrs_ncvl_vl),'')) like 'p%-%'   then '' -- 검증 후 수정
            when max(decode(d.exmn_cd,'BL6121',lower(d.exrs_ncvl_vl),'')) like '%p%'     then '1' -- 검증 후 수정
       else ''
       end BL6121
     , case
            when (max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like 'n%'
                 or
                  max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like '%g%'
                 or
                  max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like '%wbc%'
                 )                                     then '0'
            when (replace(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ','') like '25++'
                 or
                  replace(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ','') like '25tr'
                 or
                  substr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),1,instr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ')-1) = '250'
                 or
                  max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) = '25'
                 )                                     then ''
            when max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like '%2%'       then '1'
            when substr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),1,instr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ')-1) = '10'      then ''
            when (replace(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ','') = '100+'
                 or
                  replace(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ','') = '100+++'
                 )                                      then ''
            when max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like '100%'      then '2'
            when substr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),1,instr(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ')-1) = '50'      then ''
            when replace(max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')),' ','') = '500++'      then ''
            when max(decode(d.exmn_cd,'BL6122',lower(d.exrs_ncvl_vl),'')) like '500%'      then '3'
       else ''
       end BL6122
     , max(decode(d.exmn_cd,'NR0101',d.exrs_ncvl_vl,'')) NR0101
     , max(decode(d.exmn_cd,'NR0102',d.exrs_ncvl_vl,'')) NR0102
     , max(decode(d.exmn_cd,'NR0103',d.exrs_ncvl_vl,'')) NR0103
     , max(decode(d.exmn_cd,'NR0201',d.exrs_ncvl_vl,'')) NR0201
     , max(decode(d.exmn_cd,'NR0202',d.exrs_ncvl_vl,'')) NR0202
     , max(decode(d.exmn_cd,'NR2401',d.exrs_ncvl_vl,'')) NR2401
     , max(decode(d.exmn_cd,'NR7104',d.exrs_ncvl_vl,'')) NR7104
     , max(decode(d.exmn_cd,'NR7105',d.exrs_ncvl_vl,'')) NR7105
     , max(decode(d.exmn_cd,'RC118401',d.exrs_ncvl_vl,'')) RC118401
     , max(decode(d.exmn_cd,'RC118402',d.exrs_ncvl_vl,'')) RC118402
     , max(decode(d.exmn_cd,'SM0600',substr(d.exrs_ncvl_vl,1,instr(d.exrs_ncvl_vl,'/')-1),'')) SM0600SBP
     , max(decode(d.exmn_cd,'SM0600',substr(d.exrs_ncvl_vl  ,instr(d.exrs_ncvl_vl,'/')+1),'')) SM0600DBP
     , max(decode(d.exmn_cd,'SM0101',d.exrs_ncvl_vl,'')) SM0101
     , max(decode(d.exmn_cd,'SM0102',d.exrs_ncvl_vl,'')) SM0102
     , max(decode(d.exmn_cd,'SM316001',d.exrs_ncvl_vl,'')) SM316001
     , nvl(round(max(decode(d.exmn_cd,'SM0102',d.exrs_ncvl_vl,''))/((max(decode(d.exmn_cd,'SM0101',d.exrs_ncvl_vl,''))/100)*(max(decode(d.exmn_cd,'SM0101',d.exrs_ncvl_vl,''))/100)),1),0) SM316001
  from temp a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.3E3243333E2E143C28 d
     , 스키마.0E5B5B285B28402857 e
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and d.ptno = b.ptno
   and d.ordr_ymd = b.ordr_ymd
   and d.exmn_cd in (
                     'BL6120'   ,'BL326501'   ,'BL3901'   ,'BL211103'   ,'BL3120'    
                    ,'BL6121'   ,'BL6111'   ,'BL3982'   ,'BL3111'  ,'BL312001'   
                    ,'BL6122'   ,'BL6112'   ,'BL5111'   ,'BL3112'  ,'BL312002'   
                    ,'NR0101'   ,'BL6113'   ,'BL5112'   ,'BL3113'  ,'BL3121'   
                    ,'NR0102'   ,'BL6114'   ,'BL5113'   ,'BL3114'  ,'BL3125'   
                    ,'NR0103'   ,'BL6115'   ,'BL5115'   ,'BL3115'  ,'BL3140'   
                    ,'NR0201'   ,'BL6116'   ,'BL5116'   ,'BL3116'  ,'BL3141'   
                    ,'NR0202'   ,'BL6117'   ,'BL5117'   ,'BL3117'  ,'BL3142'   
                    ,'NR2401'   ,'BL6118'   ,'BL3249'   ,'BL3118'  ,'BL314201'   
                    ,'NR7104'   ,'BL6119'   ,'BL3252'   ,'BL3119'  ,'BL3164'   
                    ,'NR7105' ,'RC118401' ,'RC118402' ,'SM0600' ,'SM0101' ,'SM0102' ,'SM316001'
                    )
   and nvl(d.exrs_updt_yn,'N') != 'Y'
   and exists (
               select /*+ INDEX(X 3C15332B3C20431528_PK) */
                      'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = d.ptno
                  and x.ordr_ymd = d.ordr_ymd
                  and x.ordr_sno = d.ordr_sno
                  and x.codv_cd = 'G'
              )
   and e.ptno = a.ptno
 group by b.ptno
     , b.ordr_ymd
     , e.gend_cd
     , a.fst_abd_us_ymd

-- uncleaned_data, INBODY
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , max(decode(d.exmn_cd,'SM0104',d.exrs_ncvl_vl,'')) SM0104
     , max(decode(d.exmn_cd,'SM0106',d.exrs_ncvl_vl,'')) SM0106
     , max(decode(d.exmn_cd,'SM0111',d.exrs_ncvl_vl,'')) SM0111
     , max(decode(d.exmn_cd,'SM0112',d.exrs_ncvl_vl,'')) SM0112
     , max(decode(d.exmn_cd,'SM013201',d.exrs_ncvl_vl,'')) SM013201
     , max(decode(d.exmn_cd,'SM013301',d.exrs_ncvl_vl,'')) SM013301
     , max(decode(d.exmn_cd,'SM013401',d.exrs_ncvl_vl,'')) SM013401
     , max(decode(d.exmn_cd,'SM0151',d.exrs_ncvl_vl,'')) SM0151
     , max(decode(d.exmn_cd,'SM015101',d.exrs_ncvl_vl,'')) SM015101
     , max(decode(d.exmn_cd,'SM0152',d.exrs_ncvl_vl,'')) SM0152
     , max(decode(d.exmn_cd,'SM015201',d.exrs_ncvl_vl,'')) SM015201
     , max(decode(d.exmn_cd,'SM0153',d.exrs_ncvl_vl,'')) SM0153
     , max(decode(d.exmn_cd,'SM015301',d.exrs_ncvl_vl,'')) SM015301
     , max(decode(d.exmn_cd,'SM0154',d.exrs_ncvl_vl,'')) SM0154
     , max(decode(d.exmn_cd,'SM015401',d.exrs_ncvl_vl,'')) SM015401
     , max(decode(d.exmn_cd,'SM0155',d.exrs_ncvl_vl,'')) SM0155
     , max(decode(d.exmn_cd,'SM015501',d.exrs_ncvl_vl,'')) SM015501
     , max(decode(d.exmn_cd,'SM3140',d.exrs_ncvl_vl,'')) SM3140
     , max(decode(d.exmn_cd,'SM3150',d.exrs_ncvl_vl,'')) SM3150
     , max(decode(d.exmn_cd,'SM3170',d.exrs_ncvl_vl,'')) SM3170
  from temp a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.3E3243333E2E143C28 d
     , 스키마.0E5B5B285B28402857 e
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and d.ptno = b.ptno
   and d.ordr_ymd = b.ordr_ymd
   and d.exmn_cd in (
                     'SM0104','SM0106','SM0111','SM0112','SM013201','SM013301','SM013401'
                    ,'SM0151','SM015101','SM0152','SM015201','SM0153','SM015301','SM0154','SM015401'
                    ,'SM0155','SM015501','SM3140','SM3150','SM3170'
                    )
   and nvl(d.exrs_updt_yn,'N') != 'Y'
   and exists (
               select /*+ INDEX(X 3C15332B3C20431528_PK) */
                      'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = d.ptno
                  and x.ordr_ymd = d.ordr_ymd
                  and x.ordr_sno = d.ordr_sno
                  and x.codv_cd = 'G'
              )
   and e.ptno = a.ptno
 group by b.ptno
     , b.ordr_ymd
     , e.gend_cd
     , a.fst_abd_us_ymd

-- cleaned_data, 문진결과
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계, 2016년 7월 1일까지만
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       b.ptno
     , 펑션.등록번호변환펑션(b.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
     , d.smk_ys
     , d.smk
     , d.smk_duration
     , d.smk_current_amount
     , d.smk_start_age
     , d.smk_packyrs
     , d.alc_ys
     , d.alc
     , d.alc_freq
     , d.alc_amount_drinks
     , d.alc_start_age
     , d.alc_duration
     , d.alc_endyr
     , d.alc_amount_grams
     , d.phy
     , d.phy_freq_2009
     , d.phy_duration_2009
     , d.phy_freq
     , d.phy_duration
     , d.history_hypertension
     , d.trt_hypertension
     , d.status_hypertension
     , d.hypertension_age_diag
     , d.history_hyperlipidemia
     , d.trt_hyperlipidemia
     , d.status_hyperlipidemia
     , d.hyperlipidemia_age_diag
     , d.history_diabetes
     , d.trt_diabetes
     , d.status_diabetes
     , d.diabetes_age_diag
     , d.history_fatty_liver
     , d.trt_fatty_liver
     , d.status_fatty_liver
     , d.fatty_liver_age_diag
     , d.history_acute_hep
     , d.trt_acute_hep
     , d.acute_hep_age_diag
     , d.history_hep_cirrhosis
     , d.trt_hep_cirrhosis
     , d.hep_cirrhosis_age_diag
     , d.history_hbv
     , d.trt_hbv
     , d.status_hbv
     , d.hbv_age_diag
     , d.history_hcv
     , d.trt_hcv
     , d.status_hcv
     , d.hcv_age_diag
     , d.history_cirrhosis
     , d.trt_cirrhosis
     , d.status_cirrhosis
     , d.cirrhosis_age_diag
     , d.history_coronary_dis
     , d.trt_coronary_dis
     , d.coronary_dis_age_diag
     , d.history_angina
     , d.trt_angina
     , d.status_angina
     , d.trt_angina_op
     , d.angina_age_diag
     , d.history_mi
     , d.trt_mi
     , d.status_mi
     , d.trt_mi_op
     , d.mi_age_diag
     , d.history_kidney_urinary_dis
     , d.trt_kidney_urinary_dis
     , d.status_kidney_urinary_dis
     , d.trt_kidney_urinary_dis_op
     , d.kidney_urinary_dis_age_diag
     , d.history_kidney_dis
     , d.trt_kidney_dis
     , d.kidney_dis_age_diag
     , d.history_cancer
     , d.history_cancer_liver
     , d.cancer_liver_age_diag
     , d.trt_cancer_liver
     , d.trt_cancer_liver_op
     , d.trt_cancer_liver_ch
     , d.trt_cancer_liver_ra
     , d.trt_cancer_liver_ot
     , d.med_hypertension
     , d.trt_med_hypertension
     , d.med_hypertension_duration
     , d.med_diabetes
     , d.trt_med_diabetes
     , d.med_diabetes_duration
     , d.med_aspirin
     , d.trt_med_aspirin
     , d.med_aspirin_duration
     , d.med_hyperlipidemia
     , d.trt_med_hyperlipidemia
     , d.med_warfarin
     , d.trt_med_warfarin
     , d.med_anticoagulant
     , d.trt_med_anticoagulant
     , d.med_arrhythmia
     , d.trt_med_arrhythmia
     , d.med_liver
     , d.trt_med_liver
  from temp a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.1543294D47144D302E333E0E28 d
     , 스키마.0E5B5B285B28402857 e
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and d.ptno = b.ptno
   and d.ordr_prrn_ymd = b.ordr_ymd
   and e.ptno = a.ptno

-- uncleaned_data, 문진결과
-- 문진 응답내역 중 건진동기, 생활습관, 알러지, 약물이상반응, 수술력
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ ordered use_nl(A F) index(a 3E3C0E433E3C0E3E28_i13) index(f 3E3C23302E333E0E28_pk) */
       'C01' grp
     , F.PTNO
     , 펑션.등록번호변환펑션(f.ptno) cdw_no
     , to_char(f.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
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
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C3C5B0C233C3E28 c
     , 스키마.3E3C23302E333E0E28 f
     , 스키마.3E3C23302E333E3C28 g
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and b.ordr_ymd is not null
   and b.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
   and b.cncl_dt is null
   and c.pckg_cd = b.pckg_cd
   and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and f.ptno = b.ptno
   and f.ordr_prrn_ymd = b.ordr_prrn_ymd
   and f.inpc_cd in ('AM','RR','MA1')
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
                  (f.inpc_cd = 'AM'  and f.item_sno between 1 and 500)
               or (f.inpc_cd = 'RR'  and f.item_sno between 1 and 300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 1 and  64)
       )
   and f.rprs_apnt_no = b.rprs_apnt_no
   and f.qstn_cd1 = g.inqy_cd(+)
 group by f.ptno, f.ordr_prrn_ymd, f.inpc_cd

-- uncleaned_data, 문진결과
-- 질병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
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
/* 지방간 */
     , decode(a.history_comorbidity,'0','0'
                                   ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM118Y' ,'1'
                                                            ,'AM118'  ,'1'
                                                            ,'RR92Y'  ,'1'
                                                            ,'RR92'   ,'1'
                                                            ,'MA1118Y','1'
                                                            ,'MA1119Y','1'
                                                            ,'MA1120Y','1'
                                                            ,'MA1121' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                   ,''
             ) history_fatty_liver
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM118YY','1','AM118YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1118Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1119Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1120Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_fatty_liver
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1118Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1119Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1120Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_fatty_liver
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM118Y',f.inqy_rspn_ctn2 
                                                                         ,'AM118' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1121',decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) fatty_liver_age_diag
/* 급성간염 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM116Y' ,'1'
                                                                                   ,'AM116'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR90Y'  ,'1'
                                                                                   ,'RR90'   ,'1','0')),'')
             ,''
             ) history_acute_hep
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM116YY','1','AM116YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_acute_hep
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM116Y',f.inqy_rspn_ctn2 
                                                                         ,'AM116' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) acute_hep_age_diag
/* 만성간염/ 간경화 진단 여부 */
     , decode(f.inpc_cd,'MA1','9999'
                       ,'AM' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM117Y' ,'1'
                                                                                   ,'AM117'  ,'1','0')),'')
                       ,'RR' ,decode(a.history_comorbidity,'0','0'
                                                    ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'RR91Y'  ,'1'
                                                                                   ,'RR91'   ,'1','0')),'')
             ,''
             ) history_hep_cirrhosis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn||f.inqy_rspn_ctn1,'AM117YY','1','AM117YN','0',''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) trt_hep_cirrhosis
     , decode(f.inpc_cd,'AM' ,MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'AM117Y',f.inqy_rspn_ctn2 
                                                                         ,'AM117' ,f.inqy_rspn_ctn2,''))
                       ,'RR' ,'9999'
                       ,'MA1','9999'
             ,''
             ) hep_cirrhosis_age_diag
/* B형 간염 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','1'
                                                                                   ,'MA1104Y','1'
                                                                                   ,'MA1105Y','1'
                                                                                   ,'MA1106' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1104Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1105Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1103Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1104Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1105Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_hbv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1106' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hbv_age_diag
/* C형 간염 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','1'
                                                                                   ,'MA1109Y','1'
                                                                                   ,'MA1110Y','1'
                                                                                   ,'MA1111' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1109Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1110Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1108Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1109Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1110Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_hcv
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1111' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) hcv_age_diag
/* 간경변 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_comorbidity,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','1'
                                                                                   ,'MA1114Y','1'
                                                                                   ,'MA1115Y','1'
                                                                                   ,'MA1116' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1114Y','0'      --,'2' 과거치료했음.
                                                                         ,'MA1115Y','1','')) --,'3' 현재치료중.
             ,''
             ) trt_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1113Y','0'      --,'1' 치료받은적 없음.
                                                                         ,'MA1114Y','1'      --,'2' 과거치료했음.
                                                                         ,'MA1115Y','2','')) --,'3' 현재치료중.
             ,''
             ) status_cirrhosis
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1116' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cirrhosis_age_diag
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
  from 
       (-- 질병력 전체값 고려, MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
        with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
                      select a.ptno
                           , a.ordr_ymd fst_abd_us_ymd
                           , a.cnt
                        from (-- 복부초음파 검사이력
                              select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                                     a.ptno
                                   , a.ordr_ymd
                                   , (-- 건진회차 집계
                                      select count(ordr_ymd)
                                        from 스키마.3E3C0E433E3C0E3E28 x
                                           , 스키마.3E3C3C5B0C233C3E28 y
                                       where x.ptno = a.ptno
                                         and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                         and x.cncl_dt is null
                                         and y.pckg_cd = x.pckg_cd
                                         and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                     ) cnt
                                   , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                                from 스키마.3E3C0E433E3C0E3E28 a
                                   , 스키마.3E3C3C5B0C233C3E28 b
                                   , 스키마.3C15332B3C20431528 c
                               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and a.cncl_dt is null
                                 and b.pckg_cd = a.pckg_cd
                                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                 and c.ptno = a.ptno
                                 and c.ordr_ymd = a.ordr_ymd
                                 and c.codv_cd = 'G'
                                 and c.excf_cd = 'SR'
                                 and c.exor_prss_cd > 'C'
                                 and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                                 and a.ptno not in (
                                                    &not_in_ptno
                                                   )
                             ) a
                       where a.rn = 1
                         and a.cnt > 1
                     )
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C3C5B0C233C3E28 c
             , 스키마.3E3C23302E333E0E28 a
             , temp
         where b.ptno = temp.ptno
           and b.ordr_prrn_ymd >= temp.fst_abd_us_ymd
           and b.ordr_ymd is not null
           and b.ordr_ymd between to_date('20160801','yyyymmdd') and to_date('20160801','yyyymmdd')
           and b.cncl_dt is null
           and c.pckg_cd = b.pckg_cd
           and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
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
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500 and f.item_sno != 127)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 64  and 227 and f.item_sno not in (86,93,100,127,139,156,163,170,177,184,191,198,205,212,219,226)) -- MA1 문진의 '수술/시술여부: 아니오'는 고려대상에서 제외.
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_comorbidity
     , b.gend_cd
 order by 5,7,6,4,2

-- uncleaned_data, 문진결과
-- 암병력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
     , a.history_cancer
/* 간암 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.history_cancer     ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','1'
                                                                                   ,'MA1312Y','1'
                                                                                   ,'MA1313Y','1'
                                                                                   ,'MA1314Y','1'
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','1'),'0'))
                                    ,''
                                    )
                       ,''
             ) history_cancer_liver
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1315' ,decode(substr(f.inqy_rspn_ctn1,1,1),'0',substr(f.inqy_rspn_ctn1,2),f.inqy_rspn_ctn1),''))
             ,''
             ) cancer_liver_age_diag
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','1'
                                                                                   ,'MA1312Y','1'
                                                                                   ,'MA1313Y','1'
                                                                                   ,'MA1314Y','1'     -- 기타
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))
                       ,''
                       ) trt_cancer_liver
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','1'     -- 수술
                                                                                   ,'MA1312Y','0'     -- 약물치료
                                                                                   ,'MA1313Y','0'     -- 방사선치료
                                                                                   ,'MA1314Y','0'     -- 기타
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_liver_op
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','0'     -- 수술
                                                                                   ,'MA1312Y','1'     -- 약물치료
                                                                                   ,'MA1313Y','0'     -- 방사선치료
                                                                                   ,'MA1314Y','0'     -- 기타
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_liver_ch
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','0'     -- 수술
                                                                                   ,'MA1312Y','0'     -- 약물치료
                                                                                   ,'MA1313Y','1'     -- 방사선치료
                                                                                   ,'MA1314Y','0'     -- 기타
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_liver_ra
     , decode(f.inpc_cd,'AM' ,'9999'
                                 ,'RR' ,'9999'
                                 ,'MA1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1311Y','0'     -- 수술
                                                                                   ,'MA1312Y','0'     -- 약물치료
                                                                                   ,'MA1313Y','0'     -- 방사선치료
                                                                                   ,'MA1314Y','1'     -- 기타
                                                                                   ,'MA1315' ,DECODE(f.inqy_rspn_ctn1,'','','0'),''))-- 기타
                       ,''
                       ) trt_cancer_liver_ot
  from (-- 암병력 전체값 고려
        with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
                      select a.ptno
                           , a.ordr_ymd fst_abd_us_ymd
                           , a.cnt
                        from (-- 복부초음파 검사이력
                              select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                                     a.ptno
                                   , a.ordr_ymd
                                   , (-- 건진회차 집계
                                      select count(ordr_ymd)
                                        from 스키마.3E3C0E433E3C0E3E28 x
                                           , 스키마.3E3C3C5B0C233C3E28 y
                                       where x.ptno = a.ptno
                                         and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                         and x.cncl_dt is null
                                         and y.pckg_cd = x.pckg_cd
                                         and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                     ) cnt
                                   , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                                from 스키마.3E3C0E433E3C0E3E28 a
                                   , 스키마.3E3C3C5B0C233C3E28 b
                                   , 스키마.3C15332B3C20431528 c
                               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and a.cncl_dt is null
                                 and b.pckg_cd = a.pckg_cd
                                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                 and c.ptno = a.ptno
                                 and c.ordr_ymd = a.ordr_ymd
                                 and c.codv_cd = 'G'
                                 and c.excf_cd = 'SR'
                                 and c.exor_prss_cd > 'C'
                                 and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                                 and a.ptno not in (
                                                    &not_in_ptno
                                                   )
                             ) a
                       where a.rn = 1
                         and a.cnt > 1
                     )
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C3C5B0C233C3E28 c
             , 스키마.3E3C23302E333E0E28 a
             , temp
         where b.ptno = temp.ptno
           and b.ordr_prrn_ymd >= temp.fst_abd_us_ymd
           and b.ordr_ymd is not null
           and b.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
           and b.cncl_dt is null
           and c.pckg_cd = b.pckg_cd
           and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
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
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
               OR (f.inpc_cd = 'MA1' and f.item_sno between 296 and 382)
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.history_cancer
     , b.gend_cd
 order by 5,7,4,2

-- uncleaned_data, 문진결과
-- 약복용력
select /*+ index(f 3E3C23302E333E0E28_pk) */
       a.grp
     , a.PTNO
     , 펑션.등록번호변환펑션(a.ptno) cdw_no
     , to_char(a.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , a.inpc_cd
     , b.gend_cd
     , a.med
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
/* 고지혈증약 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1237Y','1'
                                                                                   ,'MA1238Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_hyperlipidemia
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1237Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1238Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_hyperlipidemia
/* 와파린 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1243Y','1'
                                                                                   ,'MA1244Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_warfarin
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1243Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1244Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_warfarin
/* 기타혈전방지제 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1246Y','1'
                                                                                   ,'MA1247Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_anticoagulant
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1246Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1247Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_anticoagulant
/* 부정맥약 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1249Y','1'
                                                                                   ,'MA1250Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_arrhythmia
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1249Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1250Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_arrhythmia
/* 간장약 */
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',decode(a.med                ,'0','0'
                                                          ,'1',max(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1255Y','1'
                                                                                   ,'MA1256Y','1','0'))
                                    ,''
                                    )
                       ,''
             ) med_liver
     , decode(f.inpc_cd,'AM' ,'9999'
                       ,'RR' ,'9999'
                       ,'MA1',MAX(DECODE(f.inpc_cd||f.item_sno||f.ceck_yn,'MA1255Y','1'      --,'1' 현재 치료중.
                                                                         ,'MA1256Y','0','')) --,'2' 과거 치료
             ,''
             ) trt_med_liver
  from (-- 약복용력 전체값 고려
        with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
                      select a.ptno
                           , a.ordr_ymd fst_abd_us_ymd
                           , a.cnt
                        from (-- 복부초음파 검사이력
                              select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                                     a.ptno
                                   , a.ordr_ymd
                                   , (-- 건진회차 집계
                                      select count(ordr_ymd)
                                        from 스키마.3E3C0E433E3C0E3E28 x
                                           , 스키마.3E3C3C5B0C233C3E28 y
                                       where x.ptno = a.ptno
                                         and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                         and x.cncl_dt is null
                                         and y.pckg_cd = x.pckg_cd
                                         and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                     ) cnt
                                   , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                                from 스키마.3E3C0E433E3C0E3E28 a
                                   , 스키마.3E3C3C5B0C233C3E28 b
                                   , 스키마.3C15332B3C20431528 c
                               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and a.cncl_dt is null
                                 and b.pckg_cd = a.pckg_cd
                                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                                 and c.ptno = a.ptno
                                 and c.ordr_ymd = a.ordr_ymd
                                 and c.codv_cd = 'G'
                                 and c.excf_cd = 'SR'
                                 and c.exor_prss_cd > 'C'
                                 and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                                 and a.ptno not in (
                                                    &not_in_ptno
                                                   )
                             ) a
                       where a.rn = 1
                         and a.cnt > 1
                     )
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
          from 스키마.3E3C0E433E3C0E3E28 b
             , 스키마.3E3C3C5B0C233C3E28 c
             , 스키마.3E3C23302E333E0E28 a
             , temp
         where b.ptno = temp.ptno
           and b.ordr_prrn_ymd >= temp.fst_abd_us_ymd
           and b.ordr_ymd is not null
           and b.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20201231','yyyymmdd')
           and b.cncl_dt is null
           and c.pckg_cd = b.pckg_cd
           and substr(c.pckg_type_cd,1,1) in ('0''1','2','3','4')
           and a.ptno = b.ptno
           and a.ordr_prrn_ymd = b.ordr_prrn_ymd
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
     , 스키마.0E5B5B285B28402857 b
 where f.ptno = a.ptno
   and f.ordr_prrn_ymd = a.ordr_prrn_ymd
   and f.inpc_cd = a.inpc_cd
   AND (-- AM, RR의 경우는 응답한 것만 저장되었으므로, 모두 범위에 포함
          (f.inpc_cd = 'AM'  and f.item_sno between 1   and 500)
       OR (f.inpc_cd = 'RR'  and f.item_sno between 1   and 300)
       OR (f.inpc_cd = 'MA1' and f.item_sno between 228 and 295)
       )
   and a.ptno = b.ptno
 group by a.grp
     , a.PTNO
     , a.ordr_prrn_ymd
     , a.inpc_cd
     , f.inpc_cd
     , a.med
     , b.gend_Cd
 order by 5,7,4,2

-- uncleaned_data, CACT Score
with temp as (-- 건진 2회 이상한 사람의 복부초음파 검사이력 중 첫번째 건진일자
              select a.ptno
                   , a.ordr_ymd fst_abd_us_ymd
                   , a.cnt
                from (-- 복부초음파 검사이력
                      select /*+ index(a 3E3C0E433E3C0E3E28_i02) index(c 3C15332B3C20431528_i01) */
                             a.ptno
                           , a.ordr_ymd
                           , (-- 건진회차 집계
                              select count(ordr_ymd)
                                from 스키마.3E3C0E433E3C0E3E28 x
                                   , 스키마.3E3C3C5B0C233C3E28 y
                               where x.ptno = a.ptno
                                 and x.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                                 and x.cncl_dt is null
                                 and y.pckg_cd = x.pckg_cd
                                 and substr(y.pckg_type_cd,1,1) in ('0','1','2','3','4')
                             ) cnt
                           , row_number () over (partition by a.ptno order by a.ordr_ymd) rn
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                           , 스키마.3C15332B3C20431528 c
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and c.ptno = a.ptno
                         and c.ordr_ymd = a.ordr_ymd
                         and c.codv_cd = 'G'
                         and c.excf_cd = 'SR'
                         and c.exor_prss_cd > 'C'
                         and c.ordr_cd in ('RS1010','RS1031','RS1010SM')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                     ) a
               where a.rn = 1
                 and a.cnt > 1
             )
select /*+ index(b 3E3C0E433E3C0E3E28_i12) */
       c.ptno
     , 펑션.등록번호변환펑션(c.ptno) cdw
     , to_char(a.fst_abd_us_ymd,'yyyy-mm-dd') fst_abd_us_ymd
     , to_char(c.ordr_ymd,'yyyy-mm-dd') sm_date
     , e.gend_cd
     , 펑션.나이계산펑션(c.ptno,c.ordr_ymd) age
     , decode(b.exmn_cd,'RC1184',to_char(b.exrs_ctn),'') result
     , decode(b.exmn_cd,'RC1184',to_char(b.cnls_dx_ctn),'') conclusion
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
     , 스키마.3E3C0E433E3C0E3E28 c
     , 스키마.3E3C3C5B0C233C3E28 d
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 e
 where c.ptno = a.ptno
   and c.ordr_prrn_ymd >= a.fst_abd_us_ymd
   and c.ordr_ymd is not null
   and c.ordr_ymd between to_date('20160702','yyyymmdd') and to_date('20161231','yyyymmdd')
   and c.cncl_dt is null
   and d.pckg_cd = c.pckg_cd
   and substr(d.pckg_type_cd,1,1) in ('0''1','2','3','4')
   and b.ptno = c.ptno
   and b.ordr_ymd = c.ordr_ymd
   and b.exmn_cd in (
                     'RC1184'
                    )
   and nvl(b.exrs_updt_yn,'N') != 'Y'
   and exists (
               select /*+ INDEX(X 3C15332B3C20431528_PK) */
                      'Y'
                 from 스키마.3C15332B3C20431528 x
                where x.ptno = b.ptno
                  and x.ordr_ymd = b.ordr_ymd
                  and x.ordr_sno = b.ordr_sno
                  and x.codv_cd = 'G'
              )
   and e.ptno = a.ptno

