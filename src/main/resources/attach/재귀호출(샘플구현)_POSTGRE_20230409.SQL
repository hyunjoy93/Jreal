insert into ITSM.dept
values ( 'A0000', 'A', '0000', NULL, NULL, 'N', '99999999', CURRENT_TIMESTAMP, '99999999', CURRENT_TIMESTAMP );

insert into ITSM.dept
values ( 'A1000', 'A', '1000', NULL, 'A0000', 'N', '99999999', CURRENT_TIMESTAMP, '99999999', CURRENT_TIMESTAMP );

insert into ITSM.dept
values ( 'A2000', 'A', '2000', NULL, 'A0000', 'N', '99999999', CURRENT_TIMESTAMP, '99999999', CURRENT_TIMESTAMP );

insert into ITSM.dept
values ( 'A3000', 'A', '3000', NULL, 'A1000', 'N', '99999999', CURRENT_TIMESTAMP, '99999999', CURRENT_TIMESTAMP );



with recursive dept_rcsv (DEPT_ID, PAR_DEPT_ID, LEVEL, PATH)
as 
(
	select A.DEPT_ID, A.PAR_DEPT_ID, 0, ARRAY[''||A.DEPT_ID]   
      from ITSM.dept A
	 where A.par_dept_id is null
    union all
    select a.DEPT_ID, A.PAR_DEPT_ID, LEVEL+1, B.PATH||A.DEPT_ID   
	  from ITSM.dept         A
		 , dept_rcsv    b 
	  WHERE a.par_dept_id = b.dept_id
)
select DEPT_ID, PAR_DEPT_ID, LEVEL, PATH
     , CASE WHEN ( SELECT COUNT(*) 
                     FROM ITSM.DEPT 
                    WHERE PAR_DEPT_ID = DR.DEPT_ID ) > 0 
            THEN 'N' 
            ELSE 'Y' 
       END               AS ISLEAF_YN
  from dept_rcsv  DR
 ORDER BY PATH;
 
 
-------------------------------------


with recursive aset_rcsv (aset_clsf_cd, PAR_aset_clsf_cd, LEVEL, PATH)
as 
(
	select A.aset_clsf_cd, A.PAR_aset_clsf_cd, 0, ARRAY[''||A.aset_clsf_cd]   
      from aset_clsf_cd A
	 where A.par_aset_clsf_cd = ''
    union all
    select a.aset_clsf_cd,  A.PAR_aset_clsf_cd, LEVEL+1, B.PATH||A.aset_clsf_cd   
	  from aset_clsf_cd  A
		 , aset_rcsv     b 
	  WHERE a.par_aset_clsf_cd = b.aset_clsf_cd
)
select dr.aset_clsf_cd, b.aset_clsf_nm, dr.PAR_aset_clsf_cd, c.aset_clsf_nm, LEVEL, PATH
     , CASE WHEN ( SELECT COUNT(*) 
                     FROM aset_clsf_cd 
                    WHERE PAR_aset_clsf_cd = DR.aset_clsf_cd ) > 0 
            THEN 'N' 
            ELSE 'Y' 
       END               AS ISLEAF_YN
  from aset_rcsv  DR
       	  join aset_clsf_cd   b
     		on dr.aset_clsf_cd = b.aset_clsf_cd
          left outer join aset_clsf_cd   c
                  on dr.par_aset_clsf_cd = c.aset_clsf_cd
 ORDER BY PATH;