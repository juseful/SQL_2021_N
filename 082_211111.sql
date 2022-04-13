-- tlsakfldk
select '' "구분"
--     , '' "계약처"
     , '' "그룹군" 
     , '' "안내문 발송"
     , '' "건수"
  from dual  
union all
select '단체제외'
     , PCKG_TYPE_CD     
     , '(자택,직장)'
     , to_char(sum(count_h))     
  from (select PCKG_TYPE_CD
             , count(HLSC_SNDG_TYPE_CD) count_h
          from (select c.PCKG_TYPE_CD, to_char(a.ordr_prrn_ymd, 'mm') ORDR_PRRN_YMD, b.HLSC_SNDG_TYPE_CD
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3E3C0E3E40153F2F28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                 where a.ORDR_YMD between to_date('20210101','yyyymmdd') and to_date('20211118','yyyymmdd')
                   and a.CNCL_DT is null
                   and a.PCKG_CD = c.PCKG_CD
                   and a.APNT_NO = b.APNT_NO
                   and a.CTRC_NO is null
                   and b.HLSC_SNDG_KIND_CD = 'G'
                   and c.PCKG_TYPE_CD in ('0','1','1P','2A')
                   and b.HLSC_SNDG_TYPE_CD in ('0','1'))   
         group by PCKG_TYPE_CD, ORDR_PRRN_YMD)
 group by pckg_tYpe_cd
union all
select '단체제외'
     , PCKG_TYPE_CD
     , '(이메일, 팩스, 기타)'   
     , to_char(sum(count_h))      
  from (select PCKG_TYPE_CD             
             , count(HLSC_SNDG_TYPE_CD) count_h
          from (select c.PCKG_TYPE_CD, to_char(a.ORDR_PRRN_YMD, 'mm') ordr_prrn_ymd, b.HLSC_SNDG_TYPE_CD
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3E3C0E3E40153F2F28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                 where a.ORDR_YMD between to_date('20210101','yyyymmdd') and to_date('20211118','yyyymmdd')
                   and a.CNCL_DT is null
                   and a.PCKG_CD = c.PCKG_CD
                   and a.APNT_NO = b.APNT_NO
                   and a.CTRC_NO is null
                   and b.HLSC_SNDG_KIND_CD = 'G'
                   and c.PCKG_TYPE_CD in ('0','1','1P','2A')
                   and b.HLSC_SNDG_TYPE_CD in ('4','5','9'))   
         group by PCKG_TYPE_CD, ORDR_PRRN_YMD)
 group by PCKG_TYPE_CD
union all 
select '계약처'
     , CTRC_NO     
     , '(자택,직장)'
     , to_char(sum(count_h))     
  from (select CTRC_NO
             , PCKG_TYPE_CD
             , count(HLSC_SNDG_TYPE_CD) count_h
          from (select substr(a.CTRC_NO, 1,6) CTRC_NO, c.PCKG_TYPE_CD, to_char(a.ordr_prrn_ymd, 'mm') ORDR_PRRN_YMD, b.HLSC_SNDG_TYPE_CD
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3E3C0E3E40153F2F28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                 where a.ORDR_YMD between to_date('20210101','yyyymmdd') and to_date('20211118','yyyymmdd')
                   and a.CNCL_DT is null
                   and a.PCKG_CD = c.PCKG_CD
                   and a.APNT_NO = b.APNT_NO
                   and ((a.CTRC_NO like '111551%')
                    or  (a.CTRC_NO like '111365%')
                    or  (a.CTRC_NO like '111910%'))
                   and b.HLSC_SNDG_KIND_CD = 'G'
                   and b.HLSC_SNDG_TYPE_CD in ('0','1'))   
         group by CTRC_NO, PCKG_TYPE_CD, ORDR_PRRN_YMD)
 group by CTRC_NO--, PCKG_TYPE_CD
union all
select '계약처'
     , CTRC_NO
     , '(이메일, 팩스, 기타)'   
     , to_char(sum(count_h))      
  from (select CTRC_NO
             , PCKG_TYPE_CD             
             , count(HLSC_SNDG_TYPE_CD) count_h
          from (select substr(a.CTRC_NO, 1,6) CTRC_NO, c.PCKG_TYPE_CD, to_char(a.ORDR_PRRN_YMD, 'mm') ordr_prrn_ymd, b.HLSC_SNDG_TYPE_CD
                  from 스키마.3E3C0E433E3C0E3E28 a
                     , 스키마.3E3C0E3E40153F2F28 b
                     , 스키마.3E3C3C5B0C233C3E28 c
                 where a.ORDR_YMD between to_date('20210101','yyyymmdd') and to_date('20211118','yyyymmdd')
                   and a.CNCL_DT is null
                   and a.PCKG_CD = c.PCKG_CD
                   and a.APNT_NO = b.APNT_NO
                   and ((a.CTRC_NO like '111551%')
                    or  (a.CTRC_NO like '111365%')
                    or  (a.CTRC_NO like '111910%'))
                   and b.HLSC_SNDG_KIND_CD = 'G'
                   and b.HLSC_SNDG_TYPE_CD in ('4','5','9'))   
         group by CTRC_NO, PCKG_TYPE_CD, ORDR_PRRN_YMD)
 group by CTRC_NO--, PCKG_TYPE_CD
 order by 1, 2, 3 desc

