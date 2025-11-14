SELECT
    ordinal_position AS col_number,
    column_name,
    data_type,
    is_nullable,
    column_default AS default_value,
    character_maximum_length AS max_length,
    numeric_precision,
    numeric_scale
FROM
    information_schema.columns
WHERE
    -- table_name = 'companies'
    table_name = 'metric_snapshots'
    -- You can also specify the schema if it's not 'public'
    -- AND table_schema = 'public' 
ORDER BY
    ordinal_position;
