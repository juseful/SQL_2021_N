-- wjsdbwls
-- 검사건수
select /*+ index(c 3C15332B3C20431528_i19) */
       to_char(c.enfr_dt,'yyyy-mm') "MONTH", c.hslc_dvsn_cd, c.ordr_cd, e.ordr_nm, count(c.ptno) cnt
  from 
       스키마.3C15332B3C20431528 c
     , 스키마.293215335B283C3C28 d
     , 스키마.3C1520431543473C28 e  
 where 
       c.enfr_dt between to_date('20210401','yyyymmdd') and to_date('20210630','yyyymmdd')+0.99999
   and c.ordr_cd in ('BS4100','BS4141','BS4152','BS4417','BS4416GSM','BS4148','BS4480','BS4480GSM')
   and c.mcdp_cd = d.dprt_cd
   and d.abrv_dprt_cd like 'SM%'
   and d.hraf_rprs_dprt_cd = '113000'
   and nvl(c.dc_dvsn_cd,'N') = 'N'
   and nvl(c.exor_prss_cd,'A') > 'C'
   and c.ordr_cd = e.ordr_cd
 group by to_char(c.enfr_dt,'yyyy-mm'), C.hslc_dvsn_cd, c.ordr_cd, e.ordr_nm
 order by 1, 2, 3
