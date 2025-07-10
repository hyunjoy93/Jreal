with
T_DT as 
(	
	select cast(NOW() as DATE )   as DT 
)
, T_UNION as 
(
	select A.DT - B.ID   as DT
	  from T_DT   A
	     , ( select gs.id from generate_series(1,36000) gs(id) )   B
	 union all
	select A.DT from T_DT A
	 union ALL
	select A.DT + B.ID   as DT
	  from T_DT   A
	     , ( select gs.id from generate_series(1,36000) gs(id) )   B
)
select TO_CHAR(DT,'YYYYMMDD')                  as DT
     , SUBSTRING(TO_CHAR(DT,'YYYYMMDD'),1,4)   as YYYY
     , SUBSTRING(TO_CHAR(DT,'YYYYMMDD'),5,2)   as MM
     , SUBSTRING(TO_CHAR(DT,'YYYYMMDD'),7,2)   as DD
     , case when TO_CHAR(DT,'D') in ( '1','7') then 'Y' else 'N' end   as HLDT_YN
     , 'jsnam@itsm.co.kr'                      as REG_EMP_ID
     , NOW()                                   as REG_DTTM
     , 'jsnam@itsm.co.kr'                      as MOD_EMP_ID
     , NOW()                                   as MOD_DTTM
  from T_UNION
 where 1=1
   and DT BETWEEN '2020-01-01' and '2050-12-31'
 order by 1