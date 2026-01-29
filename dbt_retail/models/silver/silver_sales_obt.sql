with sales_fact_cte as (
    select 
        "sales_id",
        "customer_sk",
        "gross_amount",
        "product_sk"
        
    from 
        {{ref('silver_fact_sales')}}    
),
product_cte as (
    select
        "product_sk",
        "category"
   
    from 
        {{ref('silver_products')}}    
),
customer_cte as (
    select 
        customer_sk,
        gender_type_of_customer
    from
        {{ref("silver_customer")}}

),
final_cte as (
    select 
        f."sales_id",
        f."gross_amount",
        p."category" as product_category,
        c.gender_type_of_customer
    from 
        sales_fact_cte f
    join 
        product_cte p on f."product_sk" = p."product_sk"
    join 
        customer_cte c on f."customer_sk" = c.customer_sk
)
select * from final_cte

