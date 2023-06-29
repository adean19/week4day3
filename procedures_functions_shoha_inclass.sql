CREATE OR REPLACE PROCEDURE late_fee_shoha(
    p_id INTEGER,
    feeAmount NUMERIC(4,2)
    )
    LANGUAGE plpgsql
    AS
    $$
    BEGIN
        -- Code goes body
        UPDATE payment
        SET amount = amount + feeAmount
        WHERE payment_id = p_id;

        -- you can do as many updates to as many tables here
        --once you are done, commit these as a single transaction
        COMMIT;

    END
    $$
    ;

CREATE OR REPLACE FUNCTION add_actor_shoha(
    a_id INTEGER,
    f_name VARCHAR(45),
    l_name VARCHAR(45)
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS
    $MAIN$
    BEGIN
        -- code goes here
        INSERT INTO actor(actor_id, first_name, last_name, last_update)
        VALUES(a_id, f_name, l_name, NOW()::TIMESTAMP);
        -- more code can go here

        --
    END
    $MAIN$
    ;


SELECT * FROM payment WHERE payment_id=18496;
-- to use a procedure use the CALL keyword
CALL late_fee_shoha(18496, 30.00)


SELECT * from actor ORDER BY actor_id DESC;
-- to use a function, use the SELECT keyword
SELECT add_actor_shoha(3757, 'Shoha', 'EagleEye')