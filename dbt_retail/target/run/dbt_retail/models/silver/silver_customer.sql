
  
    

create or replace transient table retails.bronze.silver_customer
    
    
    
    as (

select 
    try_cast(customer_code as varchar(30))        as customer_code,
    try_cast(first_name as varchar(30))           as customer_first_name,
    try_cast(last_name as varchar(30))            as customer_last_name,

    try_cast(
        
    coalesce(first_name, '') || ' ' || coalesce(last_name, '')

        as varchar(60)
    )                                             as customer_full_name,

    try_cast(gender as varchar(10))               as gender_type_of_customer,
    try_cast(email as varchar(40))                as customer_email,

    try_cast(phone as varchar(20))                as customer_mobile_number,

    try_to_timestamp_ntz(signup_date)              as customer_signup_date,
    ingest_ts

from retails.bronze.stg_customer


    )
;


  