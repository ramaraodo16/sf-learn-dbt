with dim_cust1 as (select 
ID as employee_id, COMPANY, LAST_NAME, 
FIRST_NAME, EMAIL_ADDRESS, JOB_TITLE, 
BUSINESS_PHONE, HOME_PHONE, MOBILE_PHONE, FAX_NUMBER, 
ADDRESS, CITY, STATE_PROVINCE, ZIP_POSTAL_CODE, 
COUNTRY_REGION, WEB_PAGE, NOTES, ATTACHMENTS, 
current_timestamp() as insertion_timestamp

FROM {{ref('stg_employees')}}
),
unique_source as 
( select * , row_number() over(partition by employee_id order by employee_id) as row_num
from dim_cust1)
select *  EXCLUDE row_num from unique_source
where row_num = 1
