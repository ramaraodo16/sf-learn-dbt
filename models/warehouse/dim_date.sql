SELECT 
    date_column AS date_key,
    TO_CHAR(date_column, 'YYYY-MM-DD') AS full_date,
    TO_CHAR(date_column, 'Day') AS day_of_week,
    EXTRACT(DOW FROM date_column) + 1 AS day_of_week_num,  -- Snowflake starts DOW from 0 (Sunday)
    EXTRACT(DAY FROM date_column) AS day_of_month,
    EXTRACT(DOY FROM date_column) AS day_of_year,
    EXTRACT(WEEK FROM date_column) AS week_of_year,
    TO_CHAR(date_column, 'Month') AS month_name,
    EXTRACT(MONTH FROM date_column) AS month_number,
    EXTRACT(QUARTER FROM date_column) AS quarter,
    EXTRACT(YEAR FROM date_column) AS year,
    CASE WHEN EXTRACT(DOW FROM date_column) IN (0,6) THEN TRUE ELSE FALSE END AS is_weekend,
    EXTRACT(QUARTER FROM DATEADD(MONTH, -3, date_column)) AS fiscal_quarter,  -- Example fiscal year shift (starts in April)
    EXTRACT(YEAR FROM DATEADD(MONTH, -3, date_column)) AS fiscal_year
FROM (
    SELECT 
        DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY SEQ4()) - 1, '2000-01-01') AS date_column
    FROM TABLE(GENERATOR(ROWCOUNT => 18500))  -- Generates ~50 years of dates
)