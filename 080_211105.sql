-- gksdlsdud
select a.*
     , case 
            when a.right_colon < 2 or a.trans_colon < 2 or a.left_colon < 2 then 'Y'
            else 'N'
       end err_yn
  from (
        select a.ptno
             , to_char(a.enfr_dt,'yyyy-mm-dd hh24:mi:ss') enfr_dt
             , a.ordr_cd
             , max(decode(c.form_itm_id,'0102030012',c.vale_ctn)) BOSTON_TOTAL
             , max(decode(c.form_itm_id||c.vale_ctn,'0102030013Y',0
                                                   ,'0102030014Y',1
                                                   ,'0102030015Y',2
                                                   ,'0102030016Y',3
                         )
                  ) RIGHT_COLON
             , max(decode(c.form_itm_id||c.vale_ctn,'0102030017Y',0
                                                   ,'0102030018Y',1
                                                   ,'0102030019Y',2
                                                   ,'0102030020Y',3
                         )
                  ) TRANS_COLON
             , max(decode(c.form_itm_id||c.vale_ctn,'0102030021Y',0
                                                   ,'0102030022Y',1
                                                   ,'0102030023Y',2
                                                   ,'0102030024Y',3
                         )
                  ) LEFT_COLON
          from 스키마.3C15332B3C20431528 a
             , 스키마.3E4F2F3C433E143C28 b
             , 스키마.3E4F2F3C433E141528 c
         where 
               a.enfr_dt between to_date('20211001','yyyymmdd') and to_date('20211031','yyyymmdd') + 0.99999
           and a.codv_cd ='G'
           and a.ordr_cd = 'BS4148'
           and nvl(a.dc_dvsn_cd,'N') != 'X'
           and b.ptno = a.ptno
           and a.enfr_dt between b.enfr_dt and b.enfr_dt + 0.99999
           and b.form_no = 'F0SOR12001'
           and c.rcrd_no = b.rcrd_no
           and c.form_no = b.form_no
           and c.form_itm_id between '0102030012' and '0102030024'
         group by a.ptno
             , a.enfr_dt
             , a.ordr_cd
       ) a
