-- rkdalfk
-- cleaned 문진데이터
with temp as (
              select b.ptno
                   , 펑션.등록번호변환펑션(b.ptno) id
                   , b.ordr_ymd
                   , d.gend_cd
                   , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
                from (-- 기본대상자
                      select a.ptno
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                         /* 동의여부자만 대상 */
                         and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                       group by a.ptno
                       having count(a.ordr_ymd) > 1
                     ) a
                   , 스키마.3E3C0E433E3C0E3E28 b
                   , 스키마.3E3C3C5B0C233C3E28 c
                   , 스키마.0E5B5B285B28402857 d
               where b.ptno = a.ptno
                 and b.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and b.cncl_dt is null
                 and c.pckg_cd = b.pckg_cd
                 and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and d.ptno = a.ptno
                 /* 외국인 제외 */
                 and substr(d.brrn,1,1) not in ('5','6','7','8')
             )
select a.ptno, a.id, to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date, a.gend_cd, a.age
     , b.surgery_thyroid
     , b.history_fatty_liver
     , b.fatty_liver_age_diag
     , b.history_thyroid_nodules
     , b.trt_thyroid_nodules
     , b.thyroid_nodules_age_diag
     , b.history_hbv
     , b.trt_hbv
     , b.status_hbv
     , b.hbv_age_diag
     , b.history_hcv
     , b.trt_hcv
     , b.status_hcv
     , b.hcv_age_diag
     , b.history_cirrhosis
     , b.trt_cirrhosis
     , b.status_cirrhosis
     , b.cirrhosis_age_diag
     , b.history_helico_pylori
     , b.trt_helico_pylori
     , b.status_helico_pylori
     , b.helico_pylori_age_diag
     , b.history_angina
     , b.trt_angina
     , b.status_angina
     , b.trt_angina_op
     , b.angina_age_diag
     , b.history_mi
     , b.trt_mi
     , b.status_mi
     , b.trt_mi_op
     , b.mi_age_diag
     , b.history_thyroid_dis2
     , b.trt_thyroid_dis2
     , b.status_thyroid_dis2
     , b.trt_thyroid_dis2_op
     , b.thyroid_dis2_age_diag
     , b.history_other
     , b.trt_other
     , b.status_other
     , b.trt_other_op
     , b.other_age_diag
     , b.history_cancer
     , b.med_nsaids
     , b.trt_med_nsaids
     , b.med_calcium
     , b.med_arrhythmia
     , b.trt_med_arrhythmia
     , b.med_thyroid_dis
     , b.trt_med_thyroid_dis
     , b.med_other
     , b.trt_med_other
     , b.med_other_duration
  from temp a
     , 스키마.1543294D47144D302E333E0E28 b
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_ymd

-- 질병력 기타응답, AM, MA1 응답내역 모두 포함됨. 년도별로 작업
with temp as (
              select b.ptno
                   , 펑션.등록번호변환펑션(b.ptno) id
                   , b.ordr_ymd
                   , d.gend_cd
                   , 펑션.나이계산펑션(b.ptno,b.ordr_ymd) age
                from (-- 기본대상자
                      select a.ptno
                        from 스키마.3E3C0E433E3C0E3E28 a
                           , 스키마.3E3C3C5B0C233C3E28 b
                       where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20160701','yyyymmdd')
                         and a.cncl_dt is null
                         and b.pckg_cd = a.pckg_cd
                         and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
                         and a.ptno not in (
                                            &not_in_ptno
                                           )
                         /* 동의여부자만 대상 */
                         and 펑션.정보제공동의여부펑션(3,a.ptno) = 'Y'
                       group by a.ptno
                       having count(a.ordr_ymd) > 1
                     ) a
                   , 스키마.3E3C0E433E3C0E3E28 b
                   , 스키마.3E3C3C5B0C233C3E28 c
                   , 스키마.0E5B5B285B28402857 d
               where b.ptno = a.ptno
                 and b.ordr_ymd between to_date('20160101','yyyymmdd') and to_date('20160701','yyyymmdd')
                 and b.cncl_dt is null
                 and c.pckg_cd = b.pckg_cd
                 and substr(c.pckg_type_cd,1,1) in ('0','1','2','3','4')
                 and d.ptno = a.ptno
                 /* 외국인 제외 */
                 and substr(d.brrn,1,1) not in ('5','6','7','8')
             )
select a.ptno, a.id, to_char(a.ordr_ymd,'yyyy-mm-dd') sm_date, a.gend_cd, a.age
     , B.QSTN_CD1
     , decode(b.inpc_cd,'AM' ,b.inqy_rspn_ctn3
                       ,'MA1',b.inqy_rspn_ctn1
             ) inqy_rspn_ctn
  from temp a
     , 스키마.3E3C23302E333E0E28 b
 where b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_ymd
   and ((b.inpc_cd = 'MA1' and b.qstn_cd1 = '6-1-26')
       or
        (b.inpc_cd = 'AM' and b.qstn_cd1 = '9001')            
       )
   and b.inqy_rspn_ctn1 is not null
