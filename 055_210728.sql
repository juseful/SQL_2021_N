-- chldbsgh
-- 유방초음파 판정 결과에서 외래권유 받고, 해당과 진료를 본 가장 빠른 날짜 정보
with temp as (
              select a.ptno
                   , a.ordr_ymd
                   , b.jdgn_ymd
                   , b.jdgn_dr_id
                   , b.mcdp_cd
                   , c.pckg_type_cd
                from 스키마.3E3C0E433E3C0E3E28 a
                   , 스키마.3E3C15433E14281528 b
                   , 스키마.3E3C3C5B0C233C3E28 c
               where a.ordr_ymd between to_date('20180101','yyyymmdd') and to_date('20210630','yyyymmdd')
                 and a.cncl_dt is null
                 and b.apnt_no = a.apnt_no
                 and b.jdgn_dfnt_yn = 'Y'
                 and b.exmn_cd = 'RS1190'
                 and b.mcdp_cd in ('112315' -- 유방암센터
                                  ,'11121G' -- 유방외과분과
                                  ,'111213' -- 유방·내분비외과분과
                                  ,'111210' -- GS, 외과
                                  )
                 and c.pckg_cd = a.pckg_cd 
             )
select 펑션.등록번호변환펑션(a.ptno) id
     , a.ptno
     , b.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date
     , a.pckg_type_cd
     , (
        select x.hlsc_dtls_ctrl_nm
          from 스키마.3E3C472843143C3C28 x
         where x.hlsc_ctrl_cd = 'SMM02'
           and x.hlsc_dtls_ctrl_cd = a.pckg_type_cd
       ) pckg_type_nm
     , to_char(a.jdgn_ymd,'yyyy-mm-dd') jdgn_ymd
     , a.jdgn_dr_id
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where x.user_id = a.jdgn_dr_id
       ) jdgn_dr_nm
     , a.mcdp_cd
     , (-- 진료과 코드정보
        select x.detl_cd_dscr_ctn
          from 스키마.4747473C4715153C28 x
         where x.comn_grp_cd = 'MNI_009'
           and x.comn_dtls_cd = a.mcdp_cd
       ) mcdp_nm
     , (-- 유방암 관련 진료권유 판정 후 가장 빠른 해당 진료과 진료일
        select min(to_char(x.mdcr_ymd,'yyyy-mm-dd'))
          from 스키마.0E5B4347435B284028 x
         where x.ptno = a.ptno
           and x.mdcr_ymd >= a.jdgn_ymd
           and x.codv_cd = 'O'
           and x.mcdp_cd = a.mcdp_cd
           and (-- 부도 내역 제외 조건
                 (-- 선택 조건1
                  x.mdcr_ymd <  trunc(sysdate)
                  and x.mdcr_yn = 'Y'
                 )
                 or
                 (-- 선택 조건2
                  x.mdcr_ymd >= trunc(sysdate)
                 )
                 and x.cncl_dt is null -- 필수조건
               )
       ) post_mdcr_ymd
  from temp a
     , 스키마.0E5B5B285B28402857 b
 where b.ptno = a.ptno
