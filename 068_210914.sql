-- dltndus
-- EGD
SELECT /*+ index(a 3E3C0E433E3C0E3E28_i01) index(c 3E3243333E2E143C28_pk) */
       to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd, A.ptno, D.ptnt_nm
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) AGE
     , MAX(DECODE(C.exmn_cd,'BS4100',C.indr_id1,'')) DR_ID
     , MAX(DECODE(C.exmn_cd,'BS4100',E.user_nm,'')) DR_NM
     , max(decode(C.exmn_cd,'BS4100',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) ENDO_EGD1
     , max(decode(C.exmn_cd,'BS4100',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) ENDO_EGD2
     , max(decode(C.exmn_cd,'BS4100',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) ENDO_EGD3
     , '' endo_egd
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',C.indr_id1, 'BP1A151',C.indr_id1,'')) BP_ID_STOMACH
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',E.user_nm , 'BP1A151',E.user_nm ,'')) BP_NM_STOMACH
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1))
                                       ,'BP1A151',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) BIOPSY_STOMACH1
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001))
                                       ,'BP1A151',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) BIOPSY_STOMACH2
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001))
                                       ,'BP1A151',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) BIOPSY_STOMACH3
     , '' BIOPSY_STOMACH
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',C.indr_id1,'BP1A155',C.indr_id1,'')) BP_ID_ESO
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',E.user_nm ,'BP1A155',E.user_nm ,'')) BP_NM_ESO
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1))
                                       ,'BP1A155',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) BIOPSY_ESO1
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001))
                                       ,'BP1A155',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) BIOPSY_ESO2
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001))
                                       ,'BP1A155',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) BIOPSY_ESO3
     , '' BIOPSY_ESO
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',C.indr_id1,'BP1A154',C.indr_id1,'')) BP_ID_SI
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01A',E.user_nm ,'BP1A154',E.user_nm ,'')) BP_NM_SI
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1))
                                       ,'BP1A154',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) BIOPSY_SI1
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001))
                                       ,'BP1A154',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) BIOPSY_SI2
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01A',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001))
                                       ,'BP1A154',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) BIOPSY_SI3
     , '' BIOPSY_SI
  FROM 스키마.3E3C0E433E3C0E3E28 A
     , 스키마.3E3C15433E14332B28 B
     , 스키마.3E3243333E2E143C28 C
     , 스키마.47472E3E43155B2928 E
     , 스키마.0E5B5B285B28402857 d
 WHERE A.ordr_ymd BETWEEN TO_DATE('20200901','YYYYMMDD') AND TO_DATE('20210831','YYYYMMDD')
   AND A.ptno = B.ptno
   AND A.ordr_ymd = B.ordr_ymd
   AND SUBSTR(B.exmn_cd,1,7)  IN ('BP1A01A','BP1A151','BP1A155','BP1A154')
   AND B.hlsc_rslt_cd IN ('D406','G052','G100','G101','G102','G103','G120','G301','G303','G304','G051','G104','G080','G160')
--G051,G104,G080  추가 2011.01.19 나윤주
--G160 추가 2018.06.20 양문희
   AND A.ptno = C.ptno
   AND A.ordr_ymd = C.ordr_ymd
   AND (C.exmn_cd IN ('BS4100', 'BP1A01A')
       OR SUBSTR(C.exmn_cd,1,7) IN ('BP1A151','BP1A155','BP1A154'))
   AND NVL(C.exrs_updt_yn,'N') = 'N'
   AND C.indr_id1  = E.user_id
   and a.ptno = d.ptno
 GROUP BY  a.ordr_ymd, A.ptno, D.ptnt_nm
      , d.gend_cd

-- COL
SELECT /*+ index(a 3E3C0E433E3C0E3E28_i01) index(c 3E3243333E2E143C28_pk) */
       to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd, A.ptno, D.ptnt_nm
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) AGE
     , MAX(DECODE(C.exmn_cd,'BS4141',C.indr_id1,'')) DR_ID_col
     , MAX(DECODE(C.exmn_cd,'BS4141',E.user_nm,'')) DR_NM_col
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) ENDO_COL1
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) ENDO_COL2
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) ENDO_COL3
     , '' ENDO_COL
     , MAX(DECODE(C.exmn_cd,'BS4152',C.indr_id1,'')) DR_ID_sig
     , MAX(DECODE(C.exmn_cd,'BS4152',E.user_nm,'')) DR_NM_sig
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) ENDO_sig1
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) ENDO_sig2
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) ENDO_sig3
     , '' ENDO_sig
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01B',C.indr_id1,'BP1A152',C.indr_id1,'')) BP_ID_COL
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01B',E.user_nm,'BP1A152',E.user_nm,'')) BP_NM_COL
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01B',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1))
                                       ,'BP1A152',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) BIOPSY_COL1
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01B',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001))
                                       ,'BP1A152',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) BIOPSY_COL2
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01B',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001))
                                       ,'BP1A152',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) BIOPSY_COL3
     , '' BIOPSY_COL
  FROM 스키마.3E3C0E433E3C0E3E28 A
     , 스키마.3E3C15433E14332B28 B
     , 스키마.3E3243333E2E143C28 C
     , 스키마.47472E3E43155B2928 E
     , 스키마.0E5B5B285B28402857 d
 WHERE A.ordr_ymd BETWEEN TO_DATE('20200901','YYYYMMDD') AND TO_DATE('20210831','YYYYMMDD')
   AND A.ptno = B.ptno
   AND A.ordr_ymd = B.ordr_ymd
   AND SUBSTR(B.exmn_cd,1,7)  IN ('BP1A01B','BP1A152')
   AND B.hlsc_rslt_cd IN ('060','091','110','130')
--130 추가 2018.06.20 양문희   
   AND A.ptno = C.ptno
   AND A.ordr_ymd = C.ordr_ymd
   AND (C.exmn_cd IN ('BS4141', 'BP1A01B','BS4152','BS4148')
       OR SUBSTR(C.exmn_cd,1,7) IN ('BP1A152','BP1A154'))
   AND NVL(C.exrs_updt_yn,'N') = 'N'
   AND C.indr_id1  = E.user_id
   and a.ptno = d.ptno
 GROUP BY  a.ordr_ymd, A.ptno, D.ptnt_nm
      , d.gend_cd

-- SIG
SELECT /*+ index(a 3E3C0E433E3C0E3E28_i01) index(c 3E3243333E2E143C28_pk) */
       to_char(a.ordr_ymd,'yyyy-mm-dd') ordr_ymd, A.ptno, D.ptnt_nm
     , d.gend_cd
     , 펑션.나이계산펑션(a.ptno,a.ordr_ymd) AGE
     , MAX(DECODE(C.exmn_cd,'BS4152',C.indr_id1,'')) DR_ID_sig
     , MAX(DECODE(C.exmn_cd,'BS4152',E.user_nm,'')) DR_NM_sig
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) ENDO_sig1
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) ENDO_sig2
     , max(decode(C.exmn_cd,'BS4152',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) ENDO_sig3
     , '' ENDO_SIG
     , MAX(DECODE(C.exmn_cd,'BS4141',C.indr_id1,'')) DR_ID_col
     , MAX(DECODE(C.exmn_cd,'BS4141',E.user_nm,'')) DR_NM_col
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) ENDO_COL1
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) ENDO_COL2
     , max(decode(C.exmn_cd,'BS4141',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) ENDO_COL3
     , '' ENDO_COL
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01C',C.indr_id1,'BP1A153',C.indr_id1,'')) BP_ID_RECTUM
     , MAX(DECODE(SUBSTR(C.exmn_cd,1,7),'BP1A01C',E.user_nm,'BP1A153',E.user_nm,'')) BP_NM_RECTUM
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01C',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1))
                                       ,'BP1A153',to_char(dbms_lob.substr(c.exrs_ctn,3000,   1)),'')) BIOPSY_rectum1
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01C',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001))
                                       ,'BP1A153',to_char(dbms_lob.substr(c.exrs_ctn,3000,3001)),'')) BIOPSY_rectum2
     , max(decode(SUBSTR(C.exmn_cd,1,7),'BP1A01C',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001))
                                       ,'BP1A153',to_char(dbms_lob.substr(c.exrs_ctn,3000,6001)),'')) BIOPSY_rectum3
     , '' BIOPSY_rectum
  FROM 스키마.3E3C0E433E3C0E3E28 A
     , 스키마.3E3C15433E14332B28 B
     , 스키마.3E3243333E2E143C28 C
     , 스키마.47472E3E43155B2928 E
     , 스키마.0E5B5B285B28402857 d
 WHERE A.ordr_ymd BETWEEN TO_DATE('20200901','YYYYMMDD') AND TO_DATE('20210831','YYYYMMDD')
   AND A.ptno = B.ptno
   AND A.ordr_ymd = B.ordr_ymd
   AND SUBSTR(B.exmn_cd,1,7)  IN ('BP1A01C','BP1A153')
   AND B.hlsc_rslt_cd IN ('060','091','110','130')
--130 추가 2018.06.20 양문희  
   AND A.ptno = C.ptno
   AND A.ordr_ymd = C.ordr_ymd
   AND (C.exmn_cd IN ('BS4152','BS4141', 'BP1A01C','BS4148')
       OR SUBSTR(C.exmn_cd,1,7) IN ('BP1A153'))
   AND NVL(C.exrs_updt_yn,'N') = 'N'
   AND C.indr_id1  = E.user_id
   and a.ptno = d.ptno
 GROUP BY  a.ordr_ymd, A.ptno, D.ptnt_nm
      , d.gend_cd
