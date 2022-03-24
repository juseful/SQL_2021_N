-- dlaguswjd
select a.*
     , (
        select x.user_nm
          from 스키마.47472E3E43155B2928 x
         where a.cfpr_id = x.user_id
       ) user_nm
  from (
        SELECT A.hslc_dvsn_cd, to_char(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
             , b.ptno
             , A.cnsl_room_no
             , (
                SELECT X.hlsc_ctrl_chrc_vl1
                  FROM 스키마.3E3C472843143C3C28 X
                 WHERE X.hlsc_ctrl_cd = 'SMM28'
                   AND A.cnsl_room_no = X.hlsc_dtls_ctrl_cd
               ) cnsl_room_nm
             , DECODE(A.apnt_hm,'','',TO_CHAR(A.rslt_cnsl_apnt_ymd,'YYYY-MM-DD')||' '||SUBSTR(A.apnt_hm,1,2)||':'||SUBSTR(A.apnt_hm,3)||':'||'00') apnt_hm
             , DECODE(A.strt_hm,'','',TO_CHAR(A.rslt_cnsl_apnt_ymd,'YYYY-MM-DD')||' '||SUBSTR(A.strt_hm,1,2)||':'||SUBSTR(A.strt_hm,3)||':'||'00') strt_hm
             , DECODE(A.fnsh_hm,'','',TO_CHAR(A.rslt_cnsl_apnt_ymd,'YYYY-MM-DD')||' '||SUBSTR(A.fnsh_hm,1,2)||':'||SUBSTR(A.fnsh_hm,3)||':'||'00') fnsh_hm
             , (
                select min(x.cfpr_id)
                  from 스키마.3E3C472F2020154728 x
                 where a.apnt_no = x.apnt_no
               ) cfpr_id
          FROM 스키마.3E3C15433E47403C28 A, 스키마.3E3C0E433E3C0E3E28 b
         WHERE A.rslt_cnsl_apnt_ymd BETWEEN TO_DATE('20200901','YYYYMMDD') AND TO_DATE('20201231','YYYYMMDD')
           AND A.cnsl_room_no LIKE 'N%'
           --AND A.apnt_no != ' '
           AND A.cnsl_room_no != 'N25'
           and a.apnt_no = b.apnt_no
           and b.cncl_dt is null
         ORDER BY 1, 2, 4, 7
       ) a
