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
