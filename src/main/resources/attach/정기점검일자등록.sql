-- SELECT to_date('20230611','yyyymmdd')

-- SELECT to_char((date_trunc('MONTH', DATE '20230611') + INTERVAL '1 MONTH - 1 day')::date,'yyyymmdd')

-- SELECT (date_trunc('MONTH', TO_DATE('2023-06', 'YYYY-MM')) + INTERVAL '1 MONTH - 1 day')::date;

with
t_base as 
(
	select a.dt 
	     , to_char((date_trunc('MONTH', to_date(a.dt,'yyyymmdd')) + INTERVAL '1 MONTH - 1 day')::date,'yyyymmdd')   as last_dt
	  from cal   a
)
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '01'
   and '01'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '05'
   and '05'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '10'
   and '10'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '15'
   and '15'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '20'
   and '20'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '25'
   and '25'           = :gbn
   and dt       between :dt1 and :dt2
 union all 
select last_dt
  from t_base 
 where 1=1
   and substr(dt,7,2) = '01'
   and '99'           = :gbn
   and dt       between :dt1 and :dt2
 order by 1

   
