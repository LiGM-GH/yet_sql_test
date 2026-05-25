WITH
  cards AS (
    SELECT
      COUNT(application_status)
    FROM
      cards_info
      JOIN Customer_Info USING (customer_id)
    WHERE
      application_status = 'A'
      AND birth_date >= '2000-01-01'
  ),
  cards_above_x AS (
    SELECT
      COUNT(application_status) AS count_above
    FROM
      cards_info
      JOIN Customer_Info USING (customer_id)
    WHERE
      application_status = 'A'
      AND card_limit > 30000
      AND birth_date >= '2000-01-01'
  ),
  given_credits AS (
    SELECT
      COUNT(credit_type) AS credits
    FROM
      Credit_Info
      JOIN Customer_Info USING (customer_id)
    WHERE
      credit_status = '1'
      AND birth_date >= '2000-01-01'
  ),
  given_credits_above_x AS (
    SELECT
      COUNT(credit_type) AS credits_above
    FROM
      Credit_Info
      JOIN Customer_Info USING (customer_id)
    WHERE
      credit_status = '1'
      AND loan_amount > 100000
      AND birth_date >= '2000-01-01'
  )
SELECT
  count,
  count_above,
  credits,
  credits_above
FROM
  cards,
  cards_above_x,
  given_credits,
  given_credits_above_x;

SELECT
  name,
  surname,
  patronymic,
  credit_type,
  loan_amount
FROM
  Credit_Info
  JOIN Customer_Info cust USING (customer_id)
  JOIN Payments_Info USING (credit_id)
WHERE
  payment_date >= '2022-10-01'
  AND delay_days > 0
  AND loan_amount > 100000
  AND (
    SELECT
      COUNT(application_status)
    FROM
      cards_info
      JOIN Customer_Info USING (customer_id)
    WHERE
      application_status = 'A'
      AND customer_id = cust.customer_id
  ) = 0;

SELECT
  shop_name,
  credits_num,
  summary_loan,
  average_loan
FROM
  (
    SELECT
      shop_name,
      COUNT(credit_type) AS credits_num,
      SUM(loan_amount) AS summary_loan,
      AVG(loan_amount) AS average_loan
    FROM
      Credit_Info
    WHERE
      credit_status = '1'
    GROUP BY
      shop_name
  )
ORDER BY
  credits_num
LIMIT
  15;

CREATE FUNCTION credits_between (INTEGER, INTEGER) RETURNS INTEGER AS '
SELECT
  COUNT(loan_amount)
FROM
  Credit_Info
WHERE
  loan_amount >= $1
  AND loan_amount < $2
' LANGUAGE SQL;

SELECT credits_between(0, 5000);
SELECT credits_between(5000, 10000);
SELECT credits_between(10000, 15000);
SELECT credits_between(20000, 100000);
SELECT credits_between(100000, 1000000);

DROP FUNCTION credits_between;
