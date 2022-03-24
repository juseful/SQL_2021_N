-- whtnwls
with temp as (
              select --dbms_random.random as number
                     c.ptno--, c.ordr_ymd, c.ordr_sno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and A.CNCL_DT is null
                 and B.PCKG_CD = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and C.ORDR_CD = 'BS2111'
                 and c.codv_cd = 'G'
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (
              select temp.ptno
                   , min(a.ordr_ymd) sm_date
                from temp
                   , 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
              --     , 스키마.3C15332B3C20431528 c
               where temp.ptno not in (''
                        )
                 and temp.ptno not in (
                                       &not_in_ptno
                                      )
                 and a.ptno = temp.ptno
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and A.CNCL_DT is null
                 and B.PCKG_CD = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4') 
               group by temp.ptno
               order by dbms_random.value
               )
select a.PTNO
     , to_char(a.sm_date,'yyyy-mm-dd') sm_date
     , b.apnt_no
     , d.gend_cd||
       펑션.나이계산펑션(a.ptno,a.sm_date)
     , c.ordr_cd
     , c.ordr_sno
     , c.ordr_cd
     , to_char(c.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , to_char(c.enfr_dt,'yyyy-mm-dd hh24:mi:ss') enfr_dt 
  from target a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3C15332B3C20431528 c
     , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.sm_date
   and b.cncl_dt is null
   and c.ptno = a.ptno
   and c.ordr_ymd = a.sm_date
   and C.ORDR_CD = 'BS2111'
   and c.codv_cd = 'G'
   and d.ptno = a.ptno
   and substr(d.brrn,1,1) not in ('5','6','7','8')
   and d.btdt < to_date('19930101','yyyymmdd')
   and rownum < 5000

-- 성별, 연령별 조건 선택기능
with temp as (
              select --dbms_random.random as number
                     c.ptno--, c.ordr_ymd, c.ordr_sno
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.3C15332B3C20431528 c
               where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and A.CNCL_DT is null
                 and B.PCKG_CD = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and c.ordr_ymd = a.ordr_ymd
                 and C.ORDR_CD = 'BS2111'
                 and c.codv_cd = 'G'
               group by c.ptno--, c.ordr_ymd, c.ordr_sno
               having count(c.ordr_ymd)  > 1
             )
    ,target as (
              select temp.ptno
                   , min(a.ordr_ymd) sm_date
                from temp
                   , 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C3C5B0C233C3E28 b
                   , 스키마.0E5B5B285B28402857 c
               where temp.ptno not in (''
                        )
                 and temp.ptno not in (
                                       &not_in_ptno
                                      )
                 and a.ptno = temp.ptno
                 and a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
                 and A.CNCL_DT is null
                 and B.PCKG_CD = a.pckg_cd
                 and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and c.ptno = a.ptno
                 and substr(c.brrn,1,1) not in ('5','6','7','8')
                 and c.gend_cd = 'M'
                 and c.btdt between to_date('19410101','yyyymmdd') and to_date('19550101','yyyymmdd')
               group by temp.ptno
               order by dbms_random.value
               )
select a.PTNO
     , to_char(a.sm_date,'yyyy-mm-dd') sm_date
     , b.apnt_no
     , d.gend_cd||
       펑션.나이계산펑션(a.ptno,a.sm_date) exmtyp
     , c.ordr_cd
     , c.ordr_sno
     , c.ordr_cd
     , to_char(c.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , to_char(c.enfr_dt,'yyyy-mm-dd hh24:mi:ss') enfr_dt
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.sm_date) age
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
  from target a
     , 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3C15332B3C20431528 c
     , 스키마.0E5B5B285B28402857 d
 where b.ptno = a.ptno
   and b.ordr_ymd = a.sm_date
   and b.cncl_dt is null
   and c.ptno = a.ptno
   and c.ordr_ymd = a.sm_date
   and C.ORDR_CD = 'BS2111'
   and c.codv_cd = 'G'
   and d.ptno = a.ptno
   and rownum < 2500
