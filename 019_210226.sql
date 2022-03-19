-- rkdalfk
select a.ptno
     , 펑션.등록번호변환펑션(a.ptno) cdw_id
     , to_char(a.ordr_ymd,'yyyy-mm-dd') sm_Date
     , c.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) age
     , max(decode(b.fod_cd,'3A70101',b.ncvl_vl1,'')) "3A70101"
     , max(decode(b.fod_cd,'3A70103',b.ncvl_vl1,'')) "3A70103"
     , max(decode(b.fod_cd,'3A70104',b.ncvl_vl1,'')) "3A70104"
     , max(decode(b.fod_cd,'3A70105',b.ncvl_vl1,'')) "3A70105"
     , max(decode(b.fod_cd,'3A70106',b.ncvl_vl1,'')) "3A70106"
     , max(decode(b.fod_cd,'3A70107',b.ncvl_vl1,'')) "3A70107"
     , max(decode(b.fod_cd,'3A70108',b.ncvl_vl1,'')) "3A70108"
     , max(decode(b.fod_cd,'3A70109',b.ncvl_vl1,'')) "3A70109"
     , max(decode(b.fod_cd,'3A70110',b.ncvl_vl1,'')) "3A70110"
     , max(decode(b.fod_cd,'3A70111',b.ncvl_vl1,'')) "3A70111"
     , max(decode(b.fod_cd,'3A70112',b.ncvl_vl1,'')) "3A70112"
     , max(decode(b.fod_cd,'3A70113',b.ncvl_vl1,'')) "3A70113"
     , max(decode(b.fod_cd,'3A70114',b.ncvl_vl1,'')) "3A70114"
     , max(decode(b.fod_cd,'3A70115',b.ncvl_vl1,'')) "3A70115"
     , max(decode(b.fod_cd,'3A70116',b.ncvl_vl1,'')) "3A70116"
     , max(decode(b.fod_cd,'3A70117',b.ncvl_vl1,'')) "3A70117"
     , max(decode(b.fod_cd,'3A70118',b.ncvl_vl1,'')) "3A70118"
     , max(decode(b.fod_cd,'3A70119',b.ncvl_vl1,'')) "3A70119"
     , max(decode(b.fod_cd,'3A70120',b.ncvl_vl1,'')) "3A70120"
     , max(decode(b.fod_cd,'3A70121',b.ncvl_vl1,'')) "3A70121"
     , max(decode(b.fod_cd,'3A70122',b.ncvl_vl1,'')) "3A70122"
     , max(decode(b.fod_cd,'3A70123',b.ncvl_vl1,'')) "3A70123"
     , max(decode(b.fod_cd,'3A70124',b.ncvl_vl1,'')) "3A70124"
     , max(decode(b.fod_cd,'3A70125',b.ncvl_vl1,'')) "3A70125"
     , max(decode(b.fod_cd,'3A70126',b.ncvl_vl1,'')) "3A70126"
     , max(decode(b.fod_cd,'3A70127',b.ncvl_vl1,'')) "3A70127"
     , max(decode(b.fod_cd,'3A70128',b.ncvl_vl1,'')) "3A70128"
     , max(decode(b.fod_cd,'3A70129',b.ncvl_vl1,'')) "3A70129"
     , max(decode(b.fod_cd,'3A70130',b.ncvl_vl1,'')) "3A70130"
     , max(decode(b.fod_cd,'3A70131',b.ncvl_vl1,'')) "3A70131"
     , max(decode(b.fod_cd,'3A70132',b.ncvl_vl1,'')) "3A70132"
     , max(decode(b.fod_cd,'3A70133',b.ncvl_vl1,'')) "3A70133"
     , max(decode(b.fod_cd,'3A70134',b.ncvl_vl1,'')) "3A70134"
     , max(decode(b.fod_cd,'3A70135',b.ncvl_vl1,'')) "3A70135"
     , max(decode(b.fod_cd,'3A70136',b.ncvl_vl1,'')) "3A70136"
     , max(decode(b.fod_cd,'3A70137',b.ncvl_vl1,'')) "3A70137"
     , max(decode(b.fod_cd,'3A70138',b.ncvl_vl1,'')) "3A70138"
     , max(decode(b.fod_cd,'3A70139',b.ncvl_vl1,'')) "3A70139"
  from 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C472F2020154328 b
     , 스키마.0E5B5B285B28402857 c
 where a.ordr_ymd between to_date('20010101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.ptno = a.ptno
   and b.ordr_prrn_ymd = a.ordr_prrn_ymd
   and b.rprs_apnt_no = a.rprs_apnt_no
   and c.ptno = a.ptno
   and a.ptno not in (
                      &not_in_ptno
                     )
 group by a.ptno
     , a.ordr_ymd
     , c.gend_cd

-- FFQ 분석결과중 알코올 칼로리
select a.cdw_id, a.ordr_ymd, ROUND(sum(a.al_cal),2) al_cal
  from (-- 주종별 칼로리 계산
        SELECT /*+ index(h 3E3C23302E333E0E28_pk) */
               펑션.등록번호변환펑션(a.ptno) cdw_id
             , to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd
             , f.qstn_cd1
             , max(c.calr_qty)*(max(b.fod_base_qty)/100)*nvl(max(d.fod_base_qty),1)*max(e.fod_base_qty) al_cal
          from 스키마.3E3C0E433E3C0E3E28 a
             , 스키마.3E3C23302E333E0E28 f
             , 스키마.3E3C23302E333E3C28 b
             , 스키마.3E2E3E3C472F154728 c
             , 스키마.3E3C23302E333E3C28 d
             , 스키마.3E3C23302E333E3C28 e
         where a.ordr_ymd between to_date(:YEAR||'0101','yyyymmdd') and to_date(:YEAR||'0131','yyyymmdd')
           and a.cncl_dt is null
           and a.ptno = f.ptno
           and a.ordr_ymd = f.ordr_prrn_ymd
           and f.inpc_cd in ('FOOD','FXXD')
           and f.qstn_cd1 between 'QH32' and 'QH36'
           and f.qstn_cd1 = b.inqy_cd(+)
           and c.ntrt_bsdv_cd = 'A'
           and F.ORDR_PRRN_YMD between trunc(c.CD_RGST_YMD) and trunc(c.CD_VALD_FNSH_YMD)
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') >= trunc(c.CD_RGST_YMD)    -- 180212 KHS
--           and to_date(:ordr_prrn_ymd, 'YYYYMMDD') <= trunc(c.CD_VALD_FNSH_YMD)
           and b.FOD_CD = c.HSPT_FOD_CD
           and f.INQY_RSPN_CTN2 = d.INQY_CD(+)
           and f.INQY_RSPN_CTN1 = e.INQY_CD(+)
         group 
            by a.ptno
             , a.ordr_ymd
             , f.qstn_cd1
         order by 2,3,4
     ) a
 group
    by a.cdw_id, a.ordr_ymd
 order 
    by 1,2

-- FFQ
SELECT /*+ index(a 3E3C0E433E3C0E3E28_i02) index(h 3E3C23302E333E0E28_pk) */
       h.rprs_apnt_no, H.ptno, H.ordr_prrn_ymd
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC01N001',I.inqy_cd_nm
                                              ,'QC01N002',I.inqy_cd_nm
                                              ,'QC01N003',I.inqy_cd_nm
                                              ,'QC01N004',I.inqy_cd_nm
                                              ,'QC01N005',I.inqy_cd_nm,'')) "아침_빈도"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC01N080',J.inqy_cd_nm
                                              ,'QC01N081',J.inqy_cd_nm
                                              ,'QC01N082',J.inqy_cd_nm
                                              ,'QC01N083',J.inqy_cd_nm
                                              ,'QC01N084',J.inqy_cd_nm
                                              ,'QC01N085',J.inqy_cd_nm
                                              ,'QC01N086',J.inqy_cd_nm,'')) "아침_량"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F001','Y','')) "아침_쌀밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F002','Y','')) "아침_콩밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F003','Y','')) "아침_잡곡밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F010','Y','')) "아침_국수(면류)"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F004','Y','')) "아침_빵"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F005','Y','')) "아침_미숫가루(선식)"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F006','Y','')) "아침_콘후레이크류"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F007','Y','')) "아침_떡"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F008','Y','')) "아침_감자"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC01F009','Y','')) "아침_고구마"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC02N001',I.inqy_cd_nm
                                              ,'QC02N002',I.inqy_cd_nm
                                              ,'QC02N003',I.inqy_cd_nm
                                              ,'QC02N004',I.inqy_cd_nm
                                              ,'QC02N005',I.inqy_cd_nm,'')) "점심_빈도"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC02N080',J.inqy_cd_nm
                                              ,'QC02N081',J.inqy_cd_nm
                                              ,'QC02N082',J.inqy_cd_nm
                                              ,'QC02N083',J.inqy_cd_nm
                                              ,'QC02N084',J.inqy_cd_nm
                                              ,'QC02N085',J.inqy_cd_nm
                                              ,'QC02N086',J.inqy_cd_nm,'')) "점심_량"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F001','Y','')) "점심_쌀밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F002','Y','')) "점심_콩밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F003','Y','')) "점심_잡곡밥"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F010','Y','')) "점심_국수(면류)"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F004','Y','')) "점심_빵"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F005','Y','')) "점심_미숫가루(선식)"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F006','Y','')) "점심_콘후레이크류"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F007','Y','')) "점심_떡"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F008','Y','')) "점심_감자"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC02F009','Y','')) "점심_고구마"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC03N001',I.inqy_cd_nm
                                              ,'QC03N002',I.inqy_cd_nm
                                              ,'QC03N003',I.inqy_cd_nm
                                              ,'QC03N004',I.inqy_cd_nm
                                              ,'QC03N005',I.inqy_cd_nm,'')) "저녁_빈도"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC03N080',J.inqy_cd_nm
                                              ,'QC03N081',J.inqy_cd_nm
                                              ,'QC03N082',J.inqy_cd_nm
                                              ,'QC03N083',J.inqy_cd_nm
                                              ,'QC03N084',J.inqy_cd_nm
                                              ,'QC03N085',J.inqy_cd_nm
                                              ,'QC03N086',J.inqy_cd_nm,'')) "저녁_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F001','Y','')) "저녁_쌀밥"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F002','Y','')) "저녁_콩밥"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F003','Y','')) "저녁_잡곡밥"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F010','Y','')) "저녁_국수(면류)"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F004','Y','')) "저녁_빵"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F005','Y','')) "저녁_미숫가루(선식)"                 
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F006','Y','')) "저녁_콘후레이크류"                   
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F007','Y','')) "저녁_떡"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F008','Y','')) "저녁_감자"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC03F009','Y','')) "저녁_고구마"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F013','Y','')) "국수_칼국수"               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F014','Y','')) "국수_라면"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F015','Y','')) "국수_자장면"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F016','Y','')) "국수_냉면"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F017','Y','')) "국수_우동"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F018','Y','')) "국수_수제비"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F019','Y','')) "국수_떡국"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F020','Y','')) "국수_만두국"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QN01F021','Y','')) "국수_스파게티"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC04N005',I.inqy_cd_nm
                                              ,'QC04N010',I.inqy_cd_nm
                                              ,'QC04N011',I.inqy_cd_nm
                                              ,'QC04N012',I.inqy_cd_nm
                                              ,'QC04N013',I.inqy_cd_nm
                                              ,'QC04N014',I.inqy_cd_nm
                                              ,'QC04N015',I.inqy_cd_nm
                                              ,'QC04N016',I.inqy_cd_nm,'')) "국_빈도"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC04N081',J.inqy_cd_nm
                                              ,'QC04N083',J.inqy_cd_nm
                                              ,'QC04N085',J.inqy_cd_nm
                                              ,'QC04N086',J.inqy_cd_nm
                                              ,'QC04N087',J.inqy_cd_nm
                                              ,'QC04N088',J.inqy_cd_nm,'')) "국_량"                               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC04F022','Y','')) "국_된장찌개"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC04F023','Y','')) "국_김치찌개"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC04F024','Y','')) "국_순두부"               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC04F025','Y','')) "국_맑은국"         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC04F026','Y','')) "국_된장국"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC05N005',I.inqy_cd_nm
                                              ,'QC05N010',I.inqy_cd_nm
                                              ,'QC05N011',I.inqy_cd_nm
                                              ,'QC05N012',I.inqy_cd_nm
                                              ,'QC05N013',I.inqy_cd_nm
                                              ,'QC05N014',I.inqy_cd_nm
                                              ,'QC05N015',I.inqy_cd_nm
                                              ,'QC05N016',I.inqy_cd_nm,'')) "김치_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC05N081',J.inqy_cd_nm
                                              ,'QC05N083',J.inqy_cd_nm
                                              ,'QC05N085',J.inqy_cd_nm
                                              ,'QC05N086',J.inqy_cd_nm
                                              ,'QC05N087',J.inqy_cd_nm
                                              ,'QC05N088',J.inqy_cd_nm,'')) "김치_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F030','Y','')) "김치_배추김치"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F031','Y','')) "김치_깍두기(무김치)"                 
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F032','Y','')) "김치_열무김치"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F033','Y','')) "김치_동치미"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F034','Y','')) "김치_오이소박이"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC05F035','Y','')) "김치_나박김치"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QD01N005',I.inqy_cd_nm
                                              ,'QD01N010',I.inqy_cd_nm
                                              ,'QD01N011',I.inqy_cd_nm
                                              ,'QD01N012',I.inqy_cd_nm
                                              ,'QD01N013',I.inqy_cd_nm
                                              ,'QD01N014',I.inqy_cd_nm
                                              ,'QD01N015',I.inqy_cd_nm
                                              ,'QD01N016',I.inqy_cd_nm,'')) "소고기_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QD01N081',J.inqy_cd_nm
                                              ,'QD01N083',J.inqy_cd_nm
                                              ,'QD01N085',J.inqy_cd_nm
                                              ,'QD01N086',J.inqy_cd_nm
                                              ,'QD01N087',J.inqy_cd_nm
                                              ,'QD01N088',J.inqy_cd_nm,'')) "소고기_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH01N005',I.inqy_cd_nm
                                              ,'QH01N013',I.inqy_cd_nm
                                              ,'QH01N014',I.inqy_cd_nm
                                              ,'QH01N015',I.inqy_cd_nm
                                              ,'QH01N016',I.inqy_cd_nm
                                              ,'QH01N017',I.inqy_cd_nm,'')) "소갈비_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH01N081',J.inqy_cd_nm
                                              ,'QH01N083',J.inqy_cd_nm
                                              ,'QH01N085',J.inqy_cd_nm
                                              ,'QH01N086',J.inqy_cd_nm
                                              ,'QH01N087',J.inqy_cd_nm
                                              ,'QH01N088',J.inqy_cd_nm,'')) "소갈비_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH04N005',I.inqy_cd_nm
                                              ,'QH04N010',I.inqy_cd_nm
                                              ,'QH04N011',I.inqy_cd_nm
                                              ,'QH04N012',I.inqy_cd_nm
                                              ,'QH04N013',I.inqy_cd_nm
                                              ,'QH04N014',I.inqy_cd_nm
                                              ,'QH04N015',I.inqy_cd_nm
                                              ,'QH04N016',I.inqy_cd_nm,'')) "소고기반찬_빈도"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH04N130',J.inqy_cd_nm
                                              ,'QH04N131',J.inqy_cd_nm
                                              ,'QH04N132',J.inqy_cd_nm
                                              ,'QH04N133',J.inqy_cd_nm
                                              ,'QH04N134',J.inqy_cd_nm
                                              ,'QH04N135',J.inqy_cd_nm,'')) "소고기반찬_량"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QD02N005',I.inqy_cd_nm
                                              ,'QD02N010',I.inqy_cd_nm
                                              ,'QD02N011',I.inqy_cd_nm
                                              ,'QD02N012',I.inqy_cd_nm
                                              ,'QD02N013',I.inqy_cd_nm
                                              ,'QD02N014',I.inqy_cd_nm
                                              ,'QD02N015',I.inqy_cd_nm
                                              ,'QD02N016',I.inqy_cd_nm,'')) "돼지고기_빈도"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QD02N081',J.inqy_cd_nm
                                              ,'QD02N083',J.inqy_cd_nm
                                              ,'QD02N085',J.inqy_cd_nm
                                              ,'QD02N086',J.inqy_cd_nm
                                              ,'QD02N087',J.inqy_cd_nm
                                              ,'QD02N088',J.inqy_cd_nm,'')) "돼지고기_량"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH02N005',I.inqy_cd_nm
                                              ,'QH02N013',I.inqy_cd_nm
                                              ,'QH02N014',I.inqy_cd_nm
                                              ,'QH02N015',I.inqy_cd_nm
                                              ,'QH02N016',I.inqy_cd_nm
                                              ,'QH02N017',I.inqy_cd_nm,'')) "돼지삼겹살_빈도"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH02N081',J.inqy_cd_nm
                                              ,'QH02N083',J.inqy_cd_nm
                                              ,'QH02N085',J.inqy_cd_nm
                                              ,'QH02N086',J.inqy_cd_nm
                                              ,'QH02N087',J.inqy_cd_nm
                                              ,'QH02N088',J.inqy_cd_nm,'')) "돼지삼겹살_량"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH38N005',I.inqy_cd_nm
                                              ,'QH38N010',I.inqy_cd_nm
                                              ,'QH38N011',I.inqy_cd_nm
                                              ,'QH38N012',I.inqy_cd_nm
                                              ,'QH38N013',I.inqy_cd_nm
                                              ,'QH38N014',I.inqy_cd_nm
                                              ,'QH38N015',I.inqy_cd_nm
                                              ,'QH38N016',I.inqy_cd_nm,'')) "돼지고기반찬_빈도"                   
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH38N081',J.inqy_cd_nm
                                              ,'QH38N083',J.inqy_cd_nm
                                              ,'QH38N085',J.inqy_cd_nm
                                              ,'QH38N086',J.inqy_cd_nm
                                              ,'QH38N087',J.inqy_cd_nm
                                              ,'QH38N088',J.inqy_cd_nm,'')) "돼지고기반찬_량"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH05N005',I.inqy_cd_nm
                                              ,'QH05N013',I.inqy_cd_nm
                                              ,'QH05N014',I.inqy_cd_nm
                                              ,'QH05N015',I.inqy_cd_nm
                                              ,'QH05N016',I.inqy_cd_nm
                                              ,'QH05N017',I.inqy_cd_nm,'')) "햄/소시지_빈도"                      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH05N081',J.inqy_cd_nm
                                              ,'QH05N083',J.inqy_cd_nm
                                              ,'QH05N085',J.inqy_cd_nm
                                              ,'QH05N086',J.inqy_cd_nm
                                              ,'QH05N087',J.inqy_cd_nm
                                              ,'QH05N088',J.inqy_cd_nm,'')) "햄/소시지_량"                        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH06N005',I.inqy_cd_nm
                                              ,'QH06N013',I.inqy_cd_nm
                                              ,'QH06N014',I.inqy_cd_nm
                                              ,'QH06N015',I.inqy_cd_nm
                                              ,'QH06N016',I.inqy_cd_nm
                                              ,'QH06N017',I.inqy_cd_nm,'')) "설렁탕_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH06N081',J.inqy_cd_nm
                                              ,'QH06N083',J.inqy_cd_nm
                                              ,'QH06N085',J.inqy_cd_nm
                                              ,'QH06N086',J.inqy_cd_nm
                                              ,'QH06N087',J.inqy_cd_nm
                                              ,'QH06N088',J.inqy_cd_nm,'')) "설렁탕_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH07N005',I.inqy_cd_nm
                                              ,'QH07N013',I.inqy_cd_nm
                                              ,'QH07N014',I.inqy_cd_nm
                                              ,'QH07N015',I.inqy_cd_nm
                                              ,'QH07N016',I.inqy_cd_nm
                                              ,'QH07N017',I.inqy_cd_nm,'')) "내장_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH07N081',J.inqy_cd_nm
                                              ,'QH07N083',J.inqy_cd_nm
                                              ,'QH07N085',J.inqy_cd_nm
                                              ,'QH07N086',J.inqy_cd_nm
                                              ,'QH07N087',J.inqy_cd_nm
                                              ,'QH07N088',J.inqy_cd_nm,'')) "내장_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC06N005',I.inqy_cd_nm
                                              ,'QC06N013',I.inqy_cd_nm
                                              ,'QC06N014',I.inqy_cd_nm
                                              ,'QC06N015',I.inqy_cd_nm
                                              ,'QC06N016',I.inqy_cd_nm
                                              ,'QC06N017',I.inqy_cd_nm,'')) "닭고기_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC06N081',J.inqy_cd_nm
                                              ,'QC06N083',J.inqy_cd_nm
                                              ,'QC06N085',J.inqy_cd_nm
                                              ,'QC06N086',J.inqy_cd_nm
                                              ,'QC06N087',J.inqy_cd_nm
                                              ,'QC06N088',J.inqy_cd_nm,'')) "닭고기_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC06F040','Y','')) "닭고기_닭튀김"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC06F041','Y','')) "닭고기_닭조림"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC06F042','Y','')) "닭고기_닭구이"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC06F043','Y','')) "닭고기_삼계탕"               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH08N005',I.inqy_cd_nm
                                              ,'QH08N013',I.inqy_cd_nm
                                              ,'QH08N014',I.inqy_cd_nm
                                              ,'QH08N015',I.inqy_cd_nm
                                              ,'QH08N016',I.inqy_cd_nm
                                              ,'QH08N017',I.inqy_cd_nm,'')) "오리고기_빈도"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH08N081',J.inqy_cd_nm
                                              ,'QH08N083',J.inqy_cd_nm
                                              ,'QH08N085',J.inqy_cd_nm
                                              ,'QH08N086',J.inqy_cd_nm
                                              ,'QH08N087',J.inqy_cd_nm
                                              ,'QH08N088',J.inqy_cd_nm,'')) "오리고기_량"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH09N005',I.inqy_cd_nm
                                              ,'QH09N013',I.inqy_cd_nm
                                              ,'QH09N014',I.inqy_cd_nm
                                              ,'QH09N015',I.inqy_cd_nm
                                              ,'QH09N016',I.inqy_cd_nm
                                              ,'QH09N017',I.inqy_cd_nm,'')) "생선회_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH09N081',J.inqy_cd_nm
                                              ,'QH09N083',J.inqy_cd_nm
                                              ,'QH09N085',J.inqy_cd_nm
                                              ,'QH09N086',J.inqy_cd_nm
                                              ,'QH09N087',J.inqy_cd_nm
                                              ,'QH09N088',J.inqy_cd_nm,'')) "생선회_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QD03N005',I.inqy_cd_nm
                                              ,'QD03N010',I.inqy_cd_nm
                                              ,'QD03N011',I.inqy_cd_nm
                                              ,'QD03N012',I.inqy_cd_nm
                                              ,'QD03N013',I.inqy_cd_nm
                                              ,'QD03N014',I.inqy_cd_nm
                                              ,'QD03N015',I.inqy_cd_nm
                                              ,'QD03N016',I.inqy_cd_nm,'')) "생선_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QD03N090',J.inqy_cd_nm
                                              ,'QD03N091',J.inqy_cd_nm
                                              ,'QD03N092',J.inqy_cd_nm
                                              ,'QD03N093',J.inqy_cd_nm
                                              ,'QD03N094',J.inqy_cd_nm
                                              ,'QD03N095',J.inqy_cd_nm,'')) "생선_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH03N005',I.inqy_cd_nm
                                              ,'QH03N010',I.inqy_cd_nm
                                              ,'QH03N011',I.inqy_cd_nm
                                              ,'QH03N012',I.inqy_cd_nm
                                              ,'QH03N013',I.inqy_cd_nm
                                              ,'QH03N014',I.inqy_cd_nm
                                              ,'QH03N015',I.inqy_cd_nm
                                              ,'QH03N016',I.inqy_cd_nm,'')) "등푸른생선_빈도"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH03N090',J.inqy_cd_nm
                                              ,'QH03N091',J.inqy_cd_nm
                                              ,'QH03N092',J.inqy_cd_nm
                                              ,'QH03N093',J.inqy_cd_nm
                                              ,'QH03N094',J.inqy_cd_nm
                                              ,'QH03N095',J.inqy_cd_nm,'')) "등푸른생선_량"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH10N005',I.inqy_cd_nm
                                              ,'QH10N013',I.inqy_cd_nm
                                              ,'QH10N014',I.inqy_cd_nm
                                              ,'QH10N015',I.inqy_cd_nm
                                              ,'QH10N016',I.inqy_cd_nm
                                              ,'QH10N017',I.inqy_cd_nm,'')) "장어_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH10N090',J.inqy_cd_nm
                                              ,'QH10N091',J.inqy_cd_nm
                                              ,'QH10N092',J.inqy_cd_nm
                                              ,'QH10N093',J.inqy_cd_nm
                                              ,'QH10N094',J.inqy_cd_nm
                                              ,'QH10N095',J.inqy_cd_nm,'')) "장어_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH11N005',I.inqy_cd_nm
                                              ,'QH11N013',I.inqy_cd_nm
                                              ,'QH11N014',I.inqy_cd_nm
                                              ,'QH11N015',I.inqy_cd_nm
                                              ,'QH11N016',I.inqy_cd_nm
                                              ,'QH11N017',I.inqy_cd_nm,'')) "추어탕_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH11N081',J.inqy_cd_nm
                                              ,'QH11N083',J.inqy_cd_nm
                                              ,'QH11N085',J.inqy_cd_nm
                                              ,'QH11N086',J.inqy_cd_nm
                                              ,'QH11N087',J.inqy_cd_nm
                                              ,'QH11N088',J.inqy_cd_nm,'')) "추어탕_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC07N005',I.inqy_cd_nm
                                              ,'QC07N013',I.inqy_cd_nm
                                              ,'QC07N014',I.inqy_cd_nm
                                              ,'QC07N015',I.inqy_cd_nm
                                              ,'QC07N016',I.inqy_cd_nm
                                              ,'QC07N017',I.inqy_cd_nm,'')) "해물_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC07N081',J.inqy_cd_nm
                                              ,'QC07N083',J.inqy_cd_nm
                                              ,'QC07N085',J.inqy_cd_nm
                                              ,'QC07N086',J.inqy_cd_nm
                                              ,'QC07N087',J.inqy_cd_nm
                                              ,'QC07N088',J.inqy_cd_nm,'')) "해물_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F050','Y','')) "해물_오징어"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F051','Y','')) "해물_낙지"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F052','Y','')) "해물_조개"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F053','Y','')) "해물_굴"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F054','Y','')) "해물_새우"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F055','Y','')) "해물_게"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F056','Y','')) "해물_해삼"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC07F057','Y','')) "해물_멍게"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH12N005',I.inqy_cd_nm
                                              ,'QH12N013',I.inqy_cd_nm
                                              ,'QH12N014',I.inqy_cd_nm
                                              ,'QH12N015',I.inqy_cd_nm
                                              ,'QH12N016',I.inqy_cd_nm
                                              ,'QH12N017',I.inqy_cd_nm,'')) "어묵/맛살_빈도"                      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH12N081',J.inqy_cd_nm
                                              ,'QH12N083',J.inqy_cd_nm
                                              ,'QH12N085',J.inqy_cd_nm
                                              ,'QH12N086',J.inqy_cd_nm
                                              ,'QH12N087',J.inqy_cd_nm
                                              ,'QH12N088',J.inqy_cd_nm,'')) "어묵/맛살_량"                        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH13N005',I.inqy_cd_nm
                                              ,'QH13N013',I.inqy_cd_nm
                                              ,'QH13N014',I.inqy_cd_nm
                                              ,'QH13N015',I.inqy_cd_nm
                                              ,'QH13N016',I.inqy_cd_nm
                                              ,'QH13N017',I.inqy_cd_nm,'')) "젓갈_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH13N100',J.inqy_cd_nm
                                              ,'QH13N101',J.inqy_cd_nm
                                              ,'QH13N102',J.inqy_cd_nm
                                              ,'QH13N103',J.inqy_cd_nm
                                              ,'QH13N104',J.inqy_cd_nm
                                              ,'QH13N105',J.inqy_cd_nm,'')) "젓갈_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH14N005',I.inqy_cd_nm
                                              ,'QH14N010',I.inqy_cd_nm
                                              ,'QH14N011',I.inqy_cd_nm
                                              ,'QH14N012',I.inqy_cd_nm
                                              ,'QH14N013',I.inqy_cd_nm
                                              ,'QH14N014',I.inqy_cd_nm
                                              ,'QH14N015',I.inqy_cd_nm
                                              ,'QH14N016',I.inqy_cd_nm,'')) "멸치_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH14N100',J.inqy_cd_nm
                                              ,'QH14N101',J.inqy_cd_nm
                                              ,'QH14N102',J.inqy_cd_nm
                                              ,'QH14N103',J.inqy_cd_nm
                                              ,'QH14N104',J.inqy_cd_nm
                                              ,'QH14N105',J.inqy_cd_nm,'')) "멸치_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH15N005',I.inqy_cd_nm
                                              ,'QH15N030',I.inqy_cd_nm
                                              ,'QH15N031',I.inqy_cd_nm
                                              ,'QH15N032',I.inqy_cd_nm
                                              ,'QH15N033',I.inqy_cd_nm
                                              ,'QH15N034',I.inqy_cd_nm
                                              ,'QH15N035',I.inqy_cd_nm
                                              ,'QH15N036',I.inqy_cd_nm,'')) "계란"                                
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH39N005',I.inqy_cd_nm
                                              ,'QH39N030',I.inqy_cd_nm
                                              ,'QH39N031',I.inqy_cd_nm
                                              ,'QH39N032',I.inqy_cd_nm
                                              ,'QH39N033',I.inqy_cd_nm
                                              ,'QH39N034',I.inqy_cd_nm
                                              ,'QH39N035',I.inqy_cd_nm
                                              ,'QH39N036',I.inqy_cd_nm,'')) "계란흰자"                            
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH16N005',I.inqy_cd_nm
                                              ,'QH16N010',I.inqy_cd_nm
                                              ,'QH16N011',I.inqy_cd_nm
                                              ,'QH16N012',I.inqy_cd_nm
                                              ,'QH16N013',I.inqy_cd_nm
                                              ,'QH16N014',I.inqy_cd_nm
                                              ,'QH16N015',I.inqy_cd_nm
                                              ,'QH16N016',I.inqy_cd_nm,'')) "두부반찬_빈도"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH16N081',J.inqy_cd_nm
                                              ,'QH16N083',J.inqy_cd_nm
                                              ,'QH16N085',J.inqy_cd_nm
                                              ,'QH16N086',J.inqy_cd_nm
                                              ,'QH16N087',J.inqy_cd_nm
                                              ,'QH16N088',J.inqy_cd_nm,'')) "두부반찬_량"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH17N005',I.inqy_cd_nm
                                              ,'QH17N010',I.inqy_cd_nm
                                              ,'QH17N011',I.inqy_cd_nm
                                              ,'QH17N012',I.inqy_cd_nm
                                              ,'QH17N013',I.inqy_cd_nm
                                              ,'QH17N014',I.inqy_cd_nm
                                              ,'QH17N015',I.inqy_cd_nm
                                              ,'QH17N016',I.inqy_cd_nm,'')) "콩_빈도"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH17N100',J.inqy_cd_nm
                                              ,'QH17N101',J.inqy_cd_nm
                                              ,'QH17N102',J.inqy_cd_nm
                                              ,'QH17N103',J.inqy_cd_nm
                                              ,'QH17N104',J.inqy_cd_nm
                                              ,'QH17N105',J.inqy_cd_nm,'')) "콩_량"                               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH18N005',I.inqy_cd_nm
                                              ,'QH18N010',I.inqy_cd_nm
                                              ,'QH18N011',I.inqy_cd_nm
                                              ,'QH18N012',I.inqy_cd_nm
                                              ,'QH18N013',I.inqy_cd_nm
                                              ,'QH18N014',I.inqy_cd_nm
                                              ,'QH18N015',I.inqy_cd_nm
                                              ,'QH18N016',I.inqy_cd_nm,'')) "상추_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH18N081',J.inqy_cd_nm
                                              ,'QH18N083',J.inqy_cd_nm
                                              ,'QH18N085',J.inqy_cd_nm
                                              ,'QH18N086',J.inqy_cd_nm
                                              ,'QH18N087',J.inqy_cd_nm
                                              ,'QH18N088',J.inqy_cd_nm,'')) "상추_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC08N005',I.inqy_cd_nm
                                              ,'QC08N010',I.inqy_cd_nm
                                              ,'QC08N011',I.inqy_cd_nm
                                              ,'QC08N012',I.inqy_cd_nm
                                              ,'QC08N013',I.inqy_cd_nm
                                              ,'QC08N014',I.inqy_cd_nm
                                              ,'QC08N015',I.inqy_cd_nm
                                              ,'QC08N016',I.inqy_cd_nm,'')) "생야채_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC08N081',J.inqy_cd_nm
                                              ,'QC08N083',J.inqy_cd_nm
                                              ,'QC08N085',J.inqy_cd_nm
                                              ,'QC08N086',J.inqy_cd_nm
                                              ,'QC08N087',J.inqy_cd_nm
                                              ,'QC08N088',J.inqy_cd_nm,'')) "생야채_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F060','Y','')) "생야채_풋고추"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F061','Y','')) "생야채_마늘"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F062','Y','')) "생야채_파"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F063','Y','')) "생야채_부추"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F064','Y','')) "생야채_양파"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F065','Y','')) "생야채_당근"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F066','Y','')) "생야채_깻잎"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F072','Y','')) "생야채_오이"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC08F081','Y','')) "생야채_미역"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH19N005',I.inqy_cd_nm
                                              ,'QH19N010',I.inqy_cd_nm
                                              ,'QH19N011',I.inqy_cd_nm
                                              ,'QH19N012',I.inqy_cd_nm
                                              ,'QH19N013',I.inqy_cd_nm
                                              ,'QH19N014',I.inqy_cd_nm
                                              ,'QH19N015',I.inqy_cd_nm
                                              ,'QH19N016',I.inqy_cd_nm,'')) "야채즙_빈도"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH19N110',J.inqy_cd_nm
                                              ,'QH19N111',J.inqy_cd_nm
                                              ,'QH19N112',J.inqy_cd_nm
                                              ,'QH19N113',J.inqy_cd_nm
                                              ,'QH19N114',J.inqy_cd_nm
                                              ,'QH19N115',J.inqy_cd_nm,'')) "야채즙_량"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QH19F133','Y','')) "야채즙_케일"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QH19F134','Y','')) "야채즙_신선초"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QH19F065','Y','')) "야채즙_당근"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QH19F094','Y','')) "야채즙_토마토"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QH19F135','Y','')) "야채즙_양배추"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC09N005',I.inqy_cd_nm
                                              ,'QC09N010',I.inqy_cd_nm
                                              ,'QC09N011',I.inqy_cd_nm
                                              ,'QC09N012',I.inqy_cd_nm
                                              ,'QC09N013',I.inqy_cd_nm
                                              ,'QC09N014',I.inqy_cd_nm
                                              ,'QC09N015',I.inqy_cd_nm
                                              ,'QC09N016',I.inqy_cd_nm,'')) "야채반찬_빈도"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC09N081',J.inqy_cd_nm
                                              ,'QC09N083',J.inqy_cd_nm
                                              ,'QC09N085',J.inqy_cd_nm
                                              ,'QC09N086',J.inqy_cd_nm
                                              ,'QC09N087',J.inqy_cd_nm
                                              ,'QC09N088',J.inqy_cd_nm,'')) "야채반찬_량"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F070','Y','')) "야채반찬_콩나물"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F071','Y','')) "야채반찬_호박"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F072','Y','')) "야채반찬_오이"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F082','Y','')) "야채반찬_오이생채"                   
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F073','Y','')) "야채반찬_무"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F074','Y','')) "야채반찬_시금치"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F075','Y','')) "야채반찬_취나물"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F076','Y','')) "야채반찬_버섯"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F077','Y','')) "야채반찬_도라지"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F078','Y','')) "야채반찬_고사리"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F079','Y','')) "야채반찬_가지"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F080','Y','')) "야채반찬_미나리"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F083','Y','')) "야채반찬_미역초무침"                 
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F084','Y','')) "야채반찬_깻잎조림"                   
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC09F136','Y','')) "야채반찬_브로콜리"                   
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH20N005',I.inqy_cd_nm
                                              ,'QH20N010',I.inqy_cd_nm
                                              ,'QH20N011',I.inqy_cd_nm
                                              ,'QH20N012',I.inqy_cd_nm
                                              ,'QH20N013',I.inqy_cd_nm
                                              ,'QH20N014',I.inqy_cd_nm
                                              ,'QH20N015',I.inqy_cd_nm
                                              ,'QH20N016',I.inqy_cd_nm,'')) "김_빈도"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH20N120',J.inqy_cd_nm
                                              ,'QH20N121',J.inqy_cd_nm
                                              ,'QH20N122',J.inqy_cd_nm
                                              ,'QH20N123',J.inqy_cd_nm
                                              ,'QH20N124',J.inqy_cd_nm
                                              ,'QH20N125',J.inqy_cd_nm,'')) "김_량"                               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC10N005',I.inqy_cd_nm
                                              ,'QC10N010',I.inqy_cd_nm
                                              ,'QC10N011',I.inqy_cd_nm
                                              ,'QC10N012',I.inqy_cd_nm
                                              ,'QC10N013',I.inqy_cd_nm
                                              ,'QC10N014',I.inqy_cd_nm
                                              ,'QC10N015',I.inqy_cd_nm
                                              ,'QC10N016',I.inqy_cd_nm,'')) "과일_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC10N130',J.inqy_cd_nm
                                              ,'QC10N131',J.inqy_cd_nm
                                              ,'QC10N132',J.inqy_cd_nm
                                              ,'QC10N133',J.inqy_cd_nm
                                              ,'QC10N134',J.inqy_cd_nm
                                              ,'QC10N135',J.inqy_cd_nm,'')) "과일_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F090','Y','')) "과일_사과"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F091','Y','')) "과일_배"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F092','Y','')) "과일_감"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F093','Y','')) "과일_귤"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F094','Y','')) "과일_토마토"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F095','Y','')) "과일_딸기"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F096','Y','')) "과일_복숭아"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F097','Y','')) "과일_수박"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F098','Y','')) "과일_참외"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F100','Y','')) "과일_포도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F101','Y','')) "과일_자두"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F102','Y','')) "과일_살구"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F103','Y','')) "과일_바나나"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F104','Y','')) "과일_오렌지"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F105','Y','')) "과일_멜론"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F106','Y','')) "과일_키위"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC10F107','Y','')) "과일_파인애플"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH21N005',I.inqy_cd_nm
                                              ,'QH21N020',I.inqy_cd_nm
                                              ,'QH21N021',I.inqy_cd_nm
                                              ,'QH21N022',I.inqy_cd_nm
                                              ,'QH21N023',I.inqy_cd_nm
                                              ,'QH21N024',I.inqy_cd_nm
                                              ,'QH21N025',I.inqy_cd_nm
                                              ,'QH21N026',I.inqy_cd_nm,'')) "과일주스_빈도"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC11N005',I.inqy_cd_nm
                                              ,'QC11N020',I.inqy_cd_nm
                                              ,'QC11N021',I.inqy_cd_nm
                                              ,'QC11N022',I.inqy_cd_nm
                                              ,'QC11N023',I.inqy_cd_nm
                                              ,'QC11N024',I.inqy_cd_nm
                                              ,'QC11N025',I.inqy_cd_nm
                                              ,'QC11N026',I.inqy_cd_nm,'')) "우유_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC11F108','Y','')) "우유_보통우유"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC11F109','Y','')) "우유_저지방우유"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC11F137','Y','')) "우유_무지방(탈지)우유"               
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC11F110','Y','')) "우유_딸기우유등"    
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH22N005',I.inqy_cd_nm
                                              ,'QH22N030',I.inqy_cd_nm
                                              ,'QH22N031',I.inqy_cd_nm
                                              ,'QH22N032',I.inqy_cd_nm
                                              ,'QH22N033',I.inqy_cd_nm
                                              ,'QH22N034',I.inqy_cd_nm
                                              ,'QH22N035',I.inqy_cd_nm
                                              ,'QH22N036',I.inqy_cd_nm,'')) "요구르트"                            
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH23N005',I.inqy_cd_nm
                                              ,'QH23N040',I.inqy_cd_nm
                                              ,'QH23N041',I.inqy_cd_nm
                                              ,'QH23N042',I.inqy_cd_nm
                                              ,'QH23N043',I.inqy_cd_nm
                                              ,'QH23N044',I.inqy_cd_nm
                                              ,'QH23N045',I.inqy_cd_nm
                                              ,'QH23N046',I.inqy_cd_nm,'')) "치즈"                                
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH24N005',I.inqy_cd_nm
                                              ,'QH24N020',I.inqy_cd_nm
                                              ,'QH24N021',I.inqy_cd_nm
                                              ,'QH24N022',I.inqy_cd_nm
                                              ,'QH24N023',I.inqy_cd_nm
                                              ,'QH24N024',I.inqy_cd_nm
                                              ,'QH24N025',I.inqy_cd_nm
                                              ,'QH24N026',I.inqy_cd_nm,'')) "두유"                                
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QS01N005',I.inqy_cd_nm
                                              ,'QS01N050',I.inqy_cd_nm
                                              ,'QS01N051',I.inqy_cd_nm
                                              ,'QS01N052',I.inqy_cd_nm
                                              ,'QS01N053',I.inqy_cd_nm
                                              ,'QS01N054',I.inqy_cd_nm
                                              ,'QS01N055',I.inqy_cd_nm
                                              ,'QS01N056',I.inqy_cd_nm
                                              ,'QS01N057',I.inqy_cd_nm,'')) "커피"                                
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QN02N058',I.inqy_cd_nm
                                              ,'QN02N060',I.inqy_cd_nm
                                              ,'QN02N061',I.inqy_cd_nm
                                              ,'QN02N062',I.inqy_cd_nm
                                              ,'QN02N063',I.inqy_cd_nm,'')) "커피설탕"                            
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QN03N058',I.inqy_cd_nm
                                              ,'QN03N060',I.inqy_cd_nm
                                              ,'QN03N061',I.inqy_cd_nm
                                              ,'QN03N062',I.inqy_cd_nm
                                              ,'QN03N063',I.inqy_cd_nm,'')) "커피프림"                            
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH25N005',I.inqy_cd_nm
                                              ,'QH25N030',I.inqy_cd_nm
                                              ,'QH25N031',I.inqy_cd_nm
                                              ,'QH25N032',I.inqy_cd_nm
                                              ,'QH25N033',I.inqy_cd_nm
                                              ,'QH25N034',I.inqy_cd_nm
                                              ,'QH25N035',I.inqy_cd_nm
                                              ,'QH25N036',I.inqy_cd_nm,'')) "사탕"                                
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH26N005',I.inqy_cd_nm
                                              ,'QH26N020',I.inqy_cd_nm
                                              ,'QH26N021',I.inqy_cd_nm
                                              ,'QH26N022',I.inqy_cd_nm
                                              ,'QH26N023',I.inqy_cd_nm
                                              ,'QH26N024',I.inqy_cd_nm
                                              ,'QH26N025',I.inqy_cd_nm
                                              ,'QH26N026',I.inqy_cd_nm,'')) "탄산음료(캔)"                        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QC12N005',I.inqy_cd_nm
                                              ,'QC12N010',I.inqy_cd_nm
                                              ,'QC12N011',I.inqy_cd_nm
                                              ,'QC12N012',I.inqy_cd_nm
                                              ,'QC12N013',I.inqy_cd_nm
                                              ,'QC12N014',I.inqy_cd_nm
                                              ,'QC12N015',I.inqy_cd_nm
                                              ,'QC12N016',I.inqy_cd_nm,'')) "간식_빈도"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QC12N081',J.inqy_cd_nm
                                              ,'QC12N083',J.inqy_cd_nm
                                              ,'QC12N085',J.inqy_cd_nm
                                              ,'QC12N086',J.inqy_cd_nm
                                              ,'QC12N087',J.inqy_cd_nm
                                              ,'QC12N088',J.inqy_cd_nm,'')) "간식_량"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F111','Y','')) "간식_빵"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F112','Y','')) "간식_과자"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F113','Y','')) "간식_아이스크림"                     
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F114','Y','')) "간식_라면"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F115','Y','')) "간식_김밥"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F116','Y','')) "간식_만두"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F117','Y','')) "간식_피자"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F007','Y','')) "간식_떡"                             
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F009','Y','')) "간식_고구마"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F008','Y','')) "간식_감자"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F138','Y','')) "간식_옥수수"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F119','Y','')) "간식_케익"                           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F012','Y','')) "간식_햄버거"                         
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F120','Y','')) "간식_감자튀김"                       
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn3,'QC12F118','Y','')) "간식_찐감자P"           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH27N005',I.inqy_cd_nm
                                              ,'QH27N010',I.inqy_cd_nm
                                              ,'QH27N011',I.inqy_cd_nm
                                              ,'QH27N012',I.inqy_cd_nm
                                              ,'QH27N013',I.inqy_cd_nm
                                              ,'QH27N014',I.inqy_cd_nm
                                              ,'QH27N015',I.inqy_cd_nm
                                              ,'QH27N016',I.inqy_cd_nm,'')) "식물성기름_빈도"
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH27N130',J.inqy_cd_nm
                                              ,'QH27N131',J.inqy_cd_nm
                                              ,'QH27N132',J.inqy_cd_nm
                                              ,'QH27N133',J.inqy_cd_nm
                                              ,'QH27N134',J.inqy_cd_nm
                                              ,'QH27N135',J.inqy_cd_nm,'')) "식물성기름_량"  
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH28N005',I.inqy_cd_nm
                                              ,'QH28N010',I.inqy_cd_nm
                                              ,'QH28N011',I.inqy_cd_nm
                                              ,'QH28N012',I.inqy_cd_nm
                                              ,'QH28N013',I.inqy_cd_nm
                                              ,'QH28N014',I.inqy_cd_nm
                                              ,'QH28N015',I.inqy_cd_nm
                                              ,'QH28N016',I.inqy_cd_nm,'')) "넛츠_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH28N100',J.inqy_cd_nm
                                              ,'QH28N101',J.inqy_cd_nm
                                              ,'QH28N102',J.inqy_cd_nm
                                              ,'QH28N103',J.inqy_cd_nm
                                              ,'QH28N104',J.inqy_cd_nm
                                              ,'QH28N105',J.inqy_cd_nm,'')) "넛츠_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH29N005',I.inqy_cd_nm
                                              ,'QH29N070',I.inqy_cd_nm
                                              ,'QH29N071',I.inqy_cd_nm
                                              ,'QH29N072',I.inqy_cd_nm
                                              ,'QH29N073',I.inqy_cd_nm
                                              ,'QH29N074',I.inqy_cd_nm
                                              ,'QH29N075',I.inqy_cd_nm
                                              ,'QH29N076',I.inqy_cd_nm,'')) "꿀/잼"          
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH30N005',I.inqy_cd_nm
                                              ,'QH30N010',I.inqy_cd_nm
                                              ,'QH30N011',I.inqy_cd_nm
                                              ,'QH30N012',I.inqy_cd_nm
                                              ,'QH30N013',I.inqy_cd_nm
                                              ,'QH30N014',I.inqy_cd_nm
                                              ,'QH30N015',I.inqy_cd_nm
                                              ,'QH30N016',I.inqy_cd_nm,'')) "버터_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH30N100',J.inqy_cd_nm
                                              ,'QH30N101',J.inqy_cd_nm
                                              ,'QH30N102',J.inqy_cd_nm
                                              ,'QH30N103',J.inqy_cd_nm
                                              ,'QH30N104',J.inqy_cd_nm
                                              ,'QH30N105',J.inqy_cd_nm,'')) "버터_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH31N005',I.inqy_cd_nm
                                              ,'QH31N010',I.inqy_cd_nm
                                              ,'QH31N011',I.inqy_cd_nm
                                              ,'QH31N012',I.inqy_cd_nm
                                              ,'QH31N013',I.inqy_cd_nm
                                              ,'QH31N014',I.inqy_cd_nm
                                              ,'QH31N015',I.inqy_cd_nm
                                              ,'QH31N016',I.inqy_cd_nm,'')) "마가린_빈도"    
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH31N100',J.inqy_cd_nm
                                              ,'QH31N101',J.inqy_cd_nm
                                              ,'QH31N102',J.inqy_cd_nm
                                              ,'QH31N103',J.inqy_cd_nm
                                              ,'QH31N104',J.inqy_cd_nm
                                              ,'QH31N105',J.inqy_cd_nm,'')) "마가린_량"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH32N005',I.inqy_cd_nm
                                              ,'QH32N010',I.inqy_cd_nm
                                              ,'QH32N011',I.inqy_cd_nm
                                              ,'QH32N012',I.inqy_cd_nm
                                              ,'QH32N013',I.inqy_cd_nm
                                              ,'QH32N014',I.inqy_cd_nm
                                              ,'QH32N015',I.inqy_cd_nm
                                              ,'QH32N016',I.inqy_cd_nm,'')) "소주_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH32N149',J.inqy_cd_nm
                                              ,'QH32N144',J.inqy_cd_nm
                                              ,'QH32N145',J.inqy_cd_nm
                                              ,'QH32N146',J.inqy_cd_nm
                                              ,'QH32N147',J.inqy_cd_nm
                                              ,'QH32N148',J.inqy_cd_nm,'')) "소주_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH33N005',I.inqy_cd_nm
                                              ,'QH33N010',I.inqy_cd_nm
                                              ,'QH33N011',I.inqy_cd_nm
                                              ,'QH33N012',I.inqy_cd_nm
                                              ,'QH33N013',I.inqy_cd_nm
                                              ,'QH33N014',I.inqy_cd_nm
                                              ,'QH33N015',I.inqy_cd_nm
                                              ,'QH33N016',I.inqy_cd_nm,'')) "맥주_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH33N143',J.inqy_cd_nm
                                              ,'QH33N144',J.inqy_cd_nm
                                              ,'QH33N145',J.inqy_cd_nm
                                              ,'QH33N146',J.inqy_cd_nm
                                              ,'QH33N147',J.inqy_cd_nm
                                              ,'QH33N148',J.inqy_cd_nm,'')) "맥주_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH34N005',I.inqy_cd_nm
                                              ,'QH34N010',I.inqy_cd_nm
                                              ,'QH34N011',I.inqy_cd_nm
                                              ,'QH34N012',I.inqy_cd_nm
                                              ,'QH34N013',I.inqy_cd_nm
                                              ,'QH34N014',I.inqy_cd_nm
                                              ,'QH34N015',I.inqy_cd_nm
                                              ,'QH34N016',I.inqy_cd_nm,'')) "양주_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH34N150',J.inqy_cd_nm
                                              ,'QH34N144',J.inqy_cd_nm
                                              ,'QH34N145',J.inqy_cd_nm
                                              ,'QH34N146',J.inqy_cd_nm
                                              ,'QH34N147',J.inqy_cd_nm
                                              ,'QH34N148',J.inqy_cd_nm,'')) "양주_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH35N005',I.inqy_cd_nm
                                              ,'QH35N010',I.inqy_cd_nm
                                              ,'QH35N011',I.inqy_cd_nm
                                              ,'QH35N012',I.inqy_cd_nm
                                              ,'QH35N013',I.inqy_cd_nm
                                              ,'QH35N014',I.inqy_cd_nm
                                              ,'QH35N015',I.inqy_cd_nm
                                              ,'QH35N016',I.inqy_cd_nm,'')) "청주_빈도"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH35N151',J.inqy_cd_nm
                                              ,'QH35N144',J.inqy_cd_nm
                                              ,'QH35N145',J.inqy_cd_nm
                                              ,'QH35N146',J.inqy_cd_nm
                                              ,'QH35N147',J.inqy_cd_nm
                                              ,'QH35N148',J.inqy_cd_nm,'')) "청주_량"        
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH36N005',I.inqy_cd_nm
                                              ,'QH36N010',I.inqy_cd_nm
                                              ,'QH36N011',I.inqy_cd_nm
                                              ,'QH36N012',I.inqy_cd_nm
                                              ,'QH36N013',I.inqy_cd_nm
                                              ,'QH36N014',I.inqy_cd_nm
                                              ,'QH36N015',I.inqy_cd_nm
                                              ,'QH36N016',I.inqy_cd_nm,'')) "포도주_빈도"    
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn2,'QH36N152',J.inqy_cd_nm
                                              ,'QH36N144',J.inqy_cd_nm
                                              ,'QH36N145',J.inqy_cd_nm
                                              ,'QH36N146',J.inqy_cd_nm
                                              ,'QH36N147',J.inqy_cd_nm
                                              ,'QH36N153',J.inqy_cd_nm,'')) "포도주_량"      
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH37N005',I.inqy_cd_nm
                                              ,'QH37N050',I.inqy_cd_nm
                                              ,'QH37N051',I.inqy_cd_nm
                                              ,'QH37N052',I.inqy_cd_nm
                                              ,'QH37N053',I.inqy_cd_nm
                                              ,'QH37N054',I.inqy_cd_nm
                                              ,'QH37N059',I.inqy_cd_nm,'')) "녹차"           
     , MAX(DECODE(H.qstn_cd1||H.inqy_rspn_ctn1,'QH40N005',I.inqy_cd_nm
                                              ,'QH40N154',I.inqy_cd_nm
                                              ,'QH40N155',I.inqy_cd_nm
                                              ,'QH40N156',I.inqy_cd_nm
                                              ,'QH40N157',I.inqy_cd_nm
                                              ,'QH40N158',I.inqy_cd_nm
                                              ,'QH40N159',I.inqy_cd_nm,'')) "물"
  FROM 스키마.3E3C0E433E3C0E3E28 a
     , 스키마.3E3C3C5B0C233C3E28 b
     , 스키마.3E3C23302E333E0E28 H, 스키마.3E3C23302E333E3C28 I, 스키마.3E3C23302E333E3C28 J, 스키마.3E3C23302E333E3C28 K
 WHERE a.ordr_ymd between to_date('20200101','yyyymmdd') and to_date('20201231','yyyymmdd')
   and a.cncl_dt is null
   and b.pckg_cd = a.pckg_cd
   and substr(b.pckg_type_cd,1,1) in ('0','1','2','3','4')
   and h.ptno = a.ptno
   and h.ordr_prrn_ymd = a.ordr_prrn_ymd
   and h.inpc_cd IN ('FXXD','FOOD')
   AND SUBSTR(H.qstn_cd1||H.inqy_rspn_ctn1,-4) = I.inqy_cd
   AND SUBSTR(H.qstn_cd1||H.inqy_rspn_ctn2,-4) = J.inqy_cd
   AND SUBSTR(H.qstn_cd1||H.inqy_rspn_ctn3,-4) = K.inqy_cd
 GROUP BY h.rprs_apnt_no, H.ptno, H.ordr_prrn_ymd
