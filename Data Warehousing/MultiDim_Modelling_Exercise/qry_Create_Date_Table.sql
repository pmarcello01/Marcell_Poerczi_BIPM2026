
-- =============================================
-- YOURPHONE: DATE DIMENSION
-- =============================================
-- !!! rewrite [database] 3 times !!!
-- !!! SELECT START & END DATE at FILL VALUES PART !!!

-- Delete if there is existing (wo connection)
--DROP TABLE IF EXISTS database.dim_date;

-- 1. Create the date dimension
CREATE TABLE [database].dim_date (

    full_date DATE PRIMARY KEY,

    day_of_month SMALLINT
        GENERATED ALWAYS AS (
            EXTRACT(DAY FROM full_date)
        ) STORED,

    month SMALLINT
        GENERATED ALWAYS AS (
            EXTRACT(MONTH FROM full_date)
        ) STORED,

    quarter SMALLINT
        GENERATED ALWAYS AS (
            EXTRACT(QUARTER FROM full_date)
        ) STORED,

    year INTEGER
        GENERATED ALWAYS AS (
            EXTRACT(YEAR FROM full_date)
        ) STORED,

    week SMALLINT
        GENERATED ALWAYS AS (
            EXTRACT(WEEK FROM full_date)
        ) STORED,

    iso_year INTEGER
        GENERATED ALWAYS AS (
            EXTRACT(ISOYEAR FROM full_date)
        ) STORED
);

-- 2. Populate the date dimension
INSERT INTO [database].dim_date (full_date)
SELECT d::date
FROM generate_series(
    '2025-01-01'::timestamp,
    (CURRENT_DATE + INTERVAL '5 years')::timestamp,
    INTERVAL '1 day'
) AS dates(d)
ON CONFLICT (full_date) DO NOTHING;

-- 3. Verify the results
SELECT *
FROM [database].dim_date
ORDER BY full_date
LIMIT 20;
