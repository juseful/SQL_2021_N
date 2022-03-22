-- qkrckddlf
select to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
     , decode(to_char(a.ordr_ymd,'d'),'1','일'
                                     ,'2','월'
                                     ,'3','화'
                                     ,'4','수'
                                     ,'5','목'
                                     ,'6','금'
                                     ,'7','토'
             ) day
     , 펑션.등록번호변환펑션(a.ptno) id
     , a.ptno
     , a.pckg_cd
     , b.pckg_type_cd
     , a.ordr_prrn_hm -- 예정시분
     , to_char(a.ordr_ymd,'yyyy-mm-dd')||' '||substr(a.ordr_prrn_hm,1,2)||':'||substr(a.ordr_prrn_hm,3)||':'||'00' ordr_prrn_dt
     , to_char(a.arvl_dt,'yyyy-mm-dd hh24:mi:ss') arvl_dt -- 도착일시
     , to_char(a.arvl_CECK_dt,'yyyy-mm-dd hh24:mi:ss') arvl__CECK_dt -- 도착체크일시
     , to_char(a.clot_dt,'yyyy-mm-dd hh24:mi:ss') clot_dt -- 호출일시
     , (
        select to_char(x.exmn_strt_dt,'yyyy-mm-dd hh24:mi:ss')
          from 스키마.3E3C473C33153E2828 x
         where x.ptno = a.ptno
           and x.hlsc_prgr_ymd = a.ordr_ymd
           and x.hlsc_exrm_cd like '%00'
       ) exmn_strt_dt
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
 where a.ordr_ymd between to_date('20210412','yyyymmdd') and to_date('20210512','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
