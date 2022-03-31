-- tlsakfldk
select to_char(b.ordr_prrn_ymd,'yyyy-mm-dd') ordr_prrn_ymd
     , b.ptno--, b.apnt_no
     , b.pckg_cd
     , b.CSTZ_HLSC_CRDT_ID
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = b.CSTZ_HLSC_CRDT_ID
       ) CSTZ_HLSC_CRDT_nm
     , (
        select distinct 'Y'
          from 스키마.3E3C15433E47403C28 x
         where x.apnt_no = b.apnt_no
           and x.cnsl_kind_cd in ('M','T')
       ) cnsl_prrn_yn
     , (
        select distinct 'Y'
          from 스키마.smerexamt x
         where x.apnt_no = b.apnt_no
           and x.rern_dvsn_cd = '3' -- 추후 재검 대상자만
           and x.exim_dt is null -- 재검 실시일자가 null
       ) rern_prrn_yn
  from 스키마.3E3C0E433E3C0E3E28 b
     , 스키마.3E3C0E433E20431528 a
 where (b.ordr_prrn_ymd = to_date('20211006','yyyymmdd')
       or
        b.ordr_prrn_ymd = to_date('20211007','yyyymmdd')
       or
        b.ordr_prrn_ymd = to_date('20211014','yyyymmdd')
       or
        b.ordr_prrn_ymd = to_date('20211015','yyyymmdd')
       )
   and b.cncl_dt is null
   and a.apnt_no = b.apnt_no
--   and a.exim_prrn_ymd = to_date('20211006','yyyymmdd')
   and a.ordr_cd like 'RS119%'
   and a.ordr_ymd is null -- 추후제외
   and a.prvl_ordr_stts_cd = 'A' -- 검사상태 = 예약인 사람만
   and a.rsrv_yn = 'N' -- 보류여부
