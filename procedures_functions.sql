CREATE OR REPLACE PROCEDURE late_fee_nick (
    p_id INTEGER,
    fee_amount NUMERIC(4,2)

)
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Code body
    UPDATE payment
    SET amount = amount + fee_amount
    WHERE payment_id = p_id;

    -- You can do as many updates to as many tables here
    -- Once you are done, commit these as a single transaction
    COMMIT;

END
$$
;

CREATE OR REPLACE FUNCTION add_actor_nick(
    a_id INTEGER,
    f_name VARCHAR(45),
    l_name VARCHAR(45)
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS
    $MAIN$
    BEGIN
    -- Code body
        INSERT INTO actor(actor_id, first_name, last_name, last_update) 
        VALUES(a_id, f_name, l_name, NOW()::TIMESTAMP);
    END
    $MAIN$
    ;


SELECT * FROM payment WHERE payment_id=17510;
-- to use a procedure use the CALL keyword
CALL late_fee_nick (17510, 500.00)

SELECT * from actor WHERE actor_id = 2002;
-- to use a function use the SELECT keyword
SELECT add_actor_nick(2002, 'Nico', 'Majinbuu')