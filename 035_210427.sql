-- tlsakfldk
-- 년도별 로직데이터 추출
-- 최종
select 펑션.등록번호변환펑션(b.ptno) cdw
     , b.ptno
     , to_char(b.ordr_ymd,'yyyy-mm-dd') sm_date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , decode(b.exmn_cd,'RC1184',to_char(b.exrs_ctn),'') result
     , decode(b.exmn_cd,'RC1184',to_char(b.cnls_dx_ctn),'') conclusion
     , decode(b.exmn_cd,'RC1184',to_char(b.hlsc_korn_exrs_ctn),'') hlsc_korn_exrs_ctn
--     , decode(b.exmn_cd,'RC1184',instr(to_char(b.hlsc_korn_exrs_ctn),'(',instr(to_char(b.hlsc_korn_exrs_ctn), '수치는',1,1),1) +1) TT
--     , decode(b.exmn_cd,'RC1184',instr(to_char(b.hlsc_korn_exrs_ctn),')', instr(to_char(b.hlsc_korn_exrs_ctn), '수치는',1,1) ,1 )) TT2
     , -- max(
           decode(
                  b.exmn_cd
                 ,'RC1184'
                 ,trim(substr(
                              to_char(b.hlsc_korn_exrs_ctn)
                             ,instr(to_char(b.hlsc_korn_exrs_ctn),'(',instr(to_char(b.hlsc_korn_exrs_ctn), '수치는',1,1),1) +1
                             ,instr(to_char(b.hlsc_korn_exrs_ctn),')', instr(to_char(b.hlsc_korn_exrs_ctn), '수치는',1,1) ,1 )-instr(to_char(b.hlsc_korn_exrs_ctn),'(',instr(to_char(b.hlsc_korn_exrs_ctn), '수치는',1,1),1)-1
                             )
                      )
                 )
          --) 
          CA_score
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3243333E2E143C28 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20180101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.ptno = a.ptno
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
                  and nvl(x.dc_dvsn_cd,'N') != 'X' 
              )
   and exists (-- 칼슘스코어 점수를 입력하는 결과코드 입력자만 고려
               select 'Y'
                 from 스키마.3E3C15433E14332B28 x
                where x.ptno = a.ptno
                  and x.ordr_ymd = a.ordr_ymd
                  and x.exmn_cd= 'RC1184'
                  and x.hlsc_rslt_cd in ('1001','1002','1003','1004')
              )
   and c.ptno = a.ptno
 order by 3,2
