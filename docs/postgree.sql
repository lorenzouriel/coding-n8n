CREATE TABLE billing_info (
    billing_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    billing_year INTEGER NOT NULL,
    billing_month INTEGER NOT NULL CHECK (billing_month BETWEEN 1 AND 12),
    amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'UNPAID',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DO $$
DECLARE
    m INTEGER;
    amount NUMERIC;
BEGIN
    FOR m IN 1..12 LOOP
        -- Gera um novo valor aleatório e arredondado
        amount := ROUND((RANDOM() * 500 + 100)::NUMERIC, 2);

        INSERT INTO billing_info (
            customer_id, billing_year, billing_month, amount, status
        )
        VALUES (
            1, 2025, m, amount, 'UNPAID'
        );
    END LOOP;
END $$;


select * from billing_info

truncate TABLE billing_info