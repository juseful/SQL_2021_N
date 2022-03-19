-- qkrckddlf
-- 최종
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
     , a.hslc_dvsn_cd
     , count(a.csdr_id) room_cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        select a.rslt_cnsl_apnt_ymd
             , a.ampm
        --     , a.cnsl_room_no
        --     , a.cnsl_room_nm
             , a.hslc_dvsn_cd
             , a.csdr_id
          from (
                -- 일반 의학 우편의 경우는 각자 
                -- 특화 우편의 경우는 상담실 차지 
                select (
                        select x.hlsc_ctrl_chrc_vl1
                          from 스키마.3E3C472843143C3C28 x
                         where x.hlsc_ctrl_cd = 'SMM28'
                           and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
                       ) cnsl_room_nm
                     , case
                            when strt_prrn_hm < '1330' then 'AM'
                            else 'PM'
                       end ampm
                     , a.*
                  from 스키마.3E3C15433E47403C28 a
                 where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
                   AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
                --   and rptn_dt is not null
                --   and arvl_dt is not null
                --   and gthn_dt is not null
                   and (
                        a.strt_hm is not null
                        or 
                        a.fnsh_hm is not null
                       )
                   and a.cnsl_room_no not in ('M25' -- 의학우편                                             
                                             ,'T03' -- 유방(의학)
                                             ,'T33' -- 유방(우편)
                                             ,'T43' -- 유방암(특화의학)
                                             )
                   and substr(a.cnsl_room_no,1,1) in ('M','T')
                 order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                        , a.strt_prrn_hm
               ) a
         group by a.rslt_cnsl_apnt_ymd
             , a.ampm
        --     , a.cnsl_room_no
        --     , a.cnsl_room_nm
             , a.hslc_dvsn_cd
             , a.csdr_id
        -- order by 1, 6, 2, 4
         order by 1, 3, 2, 4
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
     , a.hslc_dvsn_cd
 order by 1, 3, 2

-- 영양상담 건수
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
     , count(a.apnt_no) cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        -- 일반 의학 우편의 경우는 각자 
        -- 특화 우편의 경우는 상담실 차지 
        select (
                select x.hlsc_ctrl_chrc_vl1
                  from 스키마.3E3C472843143C3C28 x
                 where x.hlsc_ctrl_cd = 'SMM28'
                   and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
               ) cnsl_room_nm
             , case
                    when strt_prrn_hm < '1330' then 'AM'
                    else 'PM'
               end ampm
             , a.*
          from 스키마.3E3C15433E47403C28 a
         where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
        --   and rptn_dt is not null
        --   and arvl_dt is not null
        --   and gthn_dt is not null
           and (
                a.strt_hm is not null
                or 
                a.fnsh_hm is not null
               )
           and a.cnsl_room_no not in (
                                      'N25' -- 'M25' -- 의학우편                                             
--                                     ,
--                                      'Y03' -- 'T03' -- 유방(의학)
--                                     ,'Y33' -- 'T33' -- 유방(우편)
--                                     ,'Y43' -- 'T43' -- 유방암(특화의학)
                                     )
           and substr(a.cnsl_room_no,1,1) in ('N','Y')
         order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                , a.strt_prrn_hm
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
-- order by 1, 6, 2, 4
 order by 1, 3, 2, 4

-- 의학상담 건수
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
     , count(a.apnt_no) cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        -- 일반 의학 우편의 경우는 각자 
        -- 특화 우편의 경우는 상담실 차지 
        select (
                select x.hlsc_ctrl_chrc_vl1
                  from 스키마.3E3C472843143C3C28 x
                 where x.hlsc_ctrl_cd = 'SMM28'
                   and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
               ) cnsl_room_nm
             , case
                    when strt_prrn_hm < '1330' then 'AM'
                    else 'PM'
               end ampm
             , a.*
          from 스키마.3E3C15433E47403C28 a
         where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
        --   and rptn_dt is not null
        --   and arvl_dt is not null
        --   and gthn_dt is not null
           and (
                a.strt_hm is not null
                or 
                a.fnsh_hm is not null
               )
           and a.cnsl_room_no not in (
                                      'M25' -- 의학우편                                             
                                     ,'T03' -- 유방(의학)
                                     ,'T33' -- 유방(우편)
                                     ,'T43' -- 유방암(특화의학)
                                     )
           and substr(a.cnsl_room_no,1,1) in ('M','T')
         order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                , a.strt_prrn_hm
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
-- order by 1, 6, 2, 4
 order by 1, 3, 2, 4

-- 우편의학상담 건수
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
     , count(a.apnt_no) cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        -- 일반 의학 우편의 경우는 각자 
        -- 특화 우편의 경우는 상담실 차지 
        select (
                select x.hlsc_ctrl_chrc_vl1
                  from 스키마.3E3C472843143C3C28 x
                 where x.hlsc_ctrl_cd = 'SMM28'
                   and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
               ) cnsl_room_nm
             , case
                    when strt_prrn_hm < '1330' then 'AM'
                    else 'PM'
               end ampm
             , a.*
          from 스키마.3E3C15433E47403C28 a
         where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
        --   and rptn_dt is not null
        --   and arvl_dt is not null
        --   and gthn_dt is not null
           and (
                a.strt_hm is not null
                or 
                a.fnsh_hm is not null
               )
           and a.cnsl_room_no = 'M25'
--           and a.cnsl_room_no not in (
--                                      'M25' -- 의학우편                                             
--                                     ,'T03' -- 유방(의학)
--                                     ,'T33' -- 유방(우편)
--                                     ,'T43' -- 유방암(특화의학)
--                                     )
--           and substr(a.cnsl_room_no,1,1) in ('M','T')
         order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                , a.strt_prrn_hm
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
-- order by 1, 6, 2, 4
 order by 1, 3, 2, 4

-- 우편영양상담 건수
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
     , count(a.apnt_no) cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        -- 일반 의학 우편의 경우는 각자 
        -- 특화 우편의 경우는 상담실 차지 
        select (
                select x.hlsc_ctrl_chrc_vl1
                  from 스키마.3E3C472843143C3C28 x
                 where x.hlsc_ctrl_cd = 'SMM28'
                   and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
               ) cnsl_room_nm
             , case
                    when strt_prrn_hm < '1330' then 'AM'
                    else 'PM'
               end ampm
             , a.*
          from 스키마.3E3C15433E47403C28 a
         where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
           AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
        --   and rptn_dt is not null
        --   and arvl_dt is not null
        --   and gthn_dt is not null
           and (
                a.strt_hm is not null
                or 
                a.fnsh_hm is not null
               )
           and a.cnsl_room_no = 'N25'
--           and a.cnsl_room_no not in (
--                                      'M25' -- 의학우편                                             
--                                     ,'T03' -- 유방(의학)
--                                     ,'T33' -- 유방(우편)
--                                     ,'T43' -- 유방암(특화의학)
--                                     )
--           and substr(a.cnsl_room_no,1,1) in ('M','T')
         order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                , a.strt_prrn_hm
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
--     , a.cnsl_room_no
--     , a.cnsl_room_nm
     , a.hslc_dvsn_cd
-- order by 1, 6, 2, 4
 order by 1, 3, 2, 4

-- 유방특화 미제외. 유방특화는 검사하면서 상담 후 종료함.
select TO_CHAR(a.rslt_cnsl_apnt_ymd,'yyyy-mm-dd') rslt_cnsl_apnt_ymd
     , a.ampm
     , a.hslc_dvsn_cd
     , count(a.csdr_id) room_cnt
     , TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') WEEKDAY
  from (
        select a.rslt_cnsl_apnt_ymd
             , a.ampm
        --     , a.cnsl_room_no
        --     , a.cnsl_room_nm
             , a.hslc_dvsn_cd
             , a.csdr_id
          from (
                -- 일반 의학 우편의 경우는 각자 
                -- 특화 우편의 경우는 상담실 차지 
                select (
                        select x.hlsc_ctrl_chrc_vl1
                          from 스키마.3E3C472843143C3C28 x
                         where x.hlsc_ctrl_cd = 'SMM28'
                           and x.hlsc_dtls_ctrl_cd = a.cnsl_room_no
                       ) cnsl_room_nm
                     , case
                            when strt_prrn_hm < '1330' then 'AM'
                            else 'PM'
                       end ampm
                     , a.*
                  from 스키마.3E3C15433E47403C28 a
                 where a.rslt_cnsl_apnt_ymd between to_date('20190101','yyyymmdd') and to_date('20191231','yyyymmdd')
                   AND TO_CHAR(a.rslt_cnsl_apnt_ymd,'D') not in ('1','7')
                --   and rptn_dt is not null
                --   and arvl_dt is not null
                --   and gthn_dt is not null
                   and (
                        a.strt_hm is not null
                        or 
                        a.fnsh_hm is not null
                       )
                   and a.cnsl_room_no != 'M25'
                   and substr(a.cnsl_room_no,1,1) in ('M','T')
                 order by a.rslt_cnsl_apnt_ymd, a.hslc_dvsn_cd, a.cnsl_room_no, a.csdr_id
                        , a.strt_prrn_hm
               ) a
         group by a.rslt_cnsl_apnt_ymd
             , a.ampm
        --     , a.cnsl_room_no
        --     , a.cnsl_room_nm
             , a.hslc_dvsn_cd
             , a.csdr_id
        -- order by 1, 6, 2, 4
         order by 1, 3, 2, 4
       ) a
 group by a.rslt_cnsl_apnt_ymd
     , a.ampm
     , a.hslc_dvsn_cd
 order by 1, 3, 2

-- 직급정보
select *
  from 스키마.29322E3E33433C3C28
 where emno in ('221016','208138','215226')

-- 일반 의학 우편의 경우는 각자 
-- 특화의 경우는 상담실 차지
-- 특화는 한 방에서 우편, 방문, 전화 상담이 이루어짐
-- 상담 종류가 다르더라도 진료과가 같으면 1방(뇌졸중, 치매)
-- 유방 특화의 경우는 상담실 사용 안함
