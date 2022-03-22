-- dlgywls
select a.ptno
     , a.ordr_ymd
     , a.pckg_cd
     , decode(b.exmn_dvsn_cd
             ,'0','1.기본'
             ,'1','2.추가'
             ,'2','3.선택'
             ,''
             ) exmn_dvsn_cd
     , b.ordr_cd
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_Cd = b.ordr_cd
       ) ordr_nm
     , (
        select x.hlsc_mdfe_amt
          from 스키마.3E3C3C3E2E230E2928 x
         where x.exmn_pckg_cd = b.ordr_cd
           and a.ordr_ymd > x.apst_ymd
           and a.ordr_ymd < x.apfn_ymd
       ) hlsc_mdfe_amt
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C0E433E20431528 b
 where a.ptno in (''
                 ,''
                 ,''
                 )
   and a.ordr_ymd between to_Date('20170101','yyyymmdd') and to_date('20171231','yyyymmdd')
   and b.apnt_no = a.apnt_no
   and b.prvl_ordr_stts_cd = 'B' /* 검사진행 상태 여부 A: 가처방, B: 처방, C: 처방전 취소, D: 처방후 취소 */
   and b.ordr_ymd is not null
   and b.rern_dvsn_cd is null
 order by b.apnt_no, b.exmn_dvsn_cd, b.ordr_cd

select a.exmn_pckg_cd
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.exmn_pckg_cd
       ) ordr_nm
     , max(
       case 
            when a.apfn_ymd > to_Date('20171231','yyyymmdd')
                 and
                 a.apst_ymd < to_Date('20180101','yyyymmdd')
            then hlsc_mdfe_amt
            else 0
       end
       ) "2017"
     , max(
       case 
            when a.apfn_ymd > to_Date('20181231','yyyymmdd')
                 and
                 a.apst_ymd < to_Date('20190101','yyyymmdd')
            then hlsc_mdfe_amt
            else 0
       end
       ) "2018"
     , max(
       case 
            when a.apfn_ymd > to_Date('20191231','yyyymmdd')
                 and
                 a.apst_ymd < to_Date('20200101','yyyymmdd')
            then hlsc_mdfe_amt
            else 0
       end
       ) "2019"
     , max(
       case 
            when a.apfn_ymd > to_Date('20201231','yyyymmdd')
                 and
                 a.apst_ymd < to_Date('20210101','yyyymmdd')
            then hlsc_mdfe_amt
            else 0
       end
       ) "2020"
     , max(
       case 
            when a.apfn_ymd > to_Date('20211231','yyyymmdd')
                 and
                 a.apst_ymd < to_Date('20220101','yyyymmdd')
            then hlsc_mdfe_amt
            else 0
       end
       ) "2021"
--     , a.*
  from 스키마.3E3C3C3E2E230E2928 a
 where a.exmn_pckg_cd in (
                          'RS1010SM','RS1031','SM0521','BS2231','RS1190','RG923C','RS1172'
                         ,'RS1140','SM1805','SM1800','BP8I12','BP8I14','BP8I15','SM7010'
                         ,'BS2401','SM0660','SM0672','BS4100','BS4141','XMIDA5','SM0250'
                         ,'SM2003','SM1811','BL8302','RM1010','RM3170N','RM3170HC','SM760307'
                         ,'SM760305','SM760304','SM760301','SM760306','RM2171N','RM2161N'
                         ,'RM2040','RM2040N','RM2020','RM11103C','RM2100','RM2100MN'
                         ,'NX1001','RC32542','RC1241','RC1184','RC2015','RC3500','SM0360'
                         ,'SM0440','SM2000','SM0230','SM4200','SM7503','SM760702','BS4680'
                         )
 group by a.exmn_pckg_cd
 order by 1
