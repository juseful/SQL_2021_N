-- whtnwls
select a.grp
     , a.grp_cd
     , a.grp_nm
     , a.sub_grp_nm
     , a.sub_grp_typ
     , a.exmn_cd
     , (
        select x.ordr_nm
          from 스키마.3C1520431543473C28 x
         where x.ordr_cd = a.exmn_cd
       ) exmn_nm
     , a.hlsc_rslt_cd
     , (
        select x.rslt_cd_nm
          from 스키마.3E3C4743282B284728 x
         where x.exmn_cd = a.exmn_cd
           and x.hlsc_rslt_cd = a.hlsc_rslt_cd
       ) rslt_cd_nm
  from (
select a.hlsc_lwrn_ctrl_cd grp
     , a.hlsc_dtls_ctrl_cd grp_cd
     , a.hlsc_dtls_ctrl_nm grp_nm
     , a.hlsc_ctrl_chrc_vl1 sub_grp_nm
     , a.hlsc_ctrl_chrc_vl2 sub_grp_typ
     , b.hlsc_ctrl_chrc_vl2 exmn_cd
     , b.hlsc_ctrl_chrc_vl3 hlsc_rslt_cd
  from 스키마.3E3C472843143C3C28 a
     , 스키마.3E3C472843143C3C28 b
 where a.hlsc_ctrl_cd = 'SMM73'
   and b.hlsc_ctrl_cd = 'SMM731'
   and a.hlsc_dtls_ctrl_cd = b.hlsc_ctrl_chrc_vl1
union
select a.hlsc_lwrn_ctrl_cd grp
     , a.hlsc_dtls_ctrl_cd grp_cd
     , a.hlsc_dtls_ctrl_nm grp_nm
     , a.hlsc_ctrl_chrc_vl1 sub_grp_nm
     , a.hlsc_ctrl_chrc_vl2 sub_grp_typ
     , ''
     , '' 
  from 스키마.3E3C472843143C3C28 a
 where a.hlsc_ctrl_cd = 'SMM73'
   and not exists (
                   select distinct x.hlsc_dtls_ctrl_cd grp_cd
                     from 스키마.3E3C472843143C3C28 x
                        , 스키마.3E3C472843143C3C28 y
                    where x.hlsc_ctrl_cd = 'SMM73'
                      and y.hlsc_ctrl_cd = 'SMM731'
                      and x.hlsc_dtls_ctrl_cd = y.hlsc_ctrl_chrc_vl1
                      and a.hlsc_dtls_ctrl_cd = x.hlsc_dtls_ctrl_cd 
                  )
 ) a
 order by 1, 2, 5 desc, 6, 8
