INSERT INTO
  currency_rates (ID, currency, currency_date, exchange_rate)
VALUES
  (1, 'RUB', NOW (), 1.0);

INSERT INTO
  Customer_Info (
    customer_id,
    name,
    surname,
    patronymic,
    birth_date,
    gender,
    marital_status,
    citizenship,
    education,
    work_status
  )
VALUES
  (
    0,
    'Two',
    'One',
    'Threevich',
    '1928-08-12',
    'М',
    'В браке',
    'Some Country',
    'Some Country State University of Whatever City',
    'OOO "Previous Company"'
  );

INSERT INTO
  Customer_Info (
    customer_id,
    name,
    surname,
    patronymic,
    birth_date,
    gender,
    marital_status,
    citizenship,
    education,
    work_status
  )
VALUES
  (
    1,
    'First',
    'One',
    'Twoevich',
    '1998-03-25',
    'М',
    'В браке',
    'Some Country',
    'Some Country State University of Whatever City',
    'OOO "Another Company"'
  );

INSERT INTO
  Customer_Info (
    customer_id,
    name,
    surname,
    patronymic,
    birth_date,
    gender,
    marital_status,
    citizenship,
    education,
    work_status
  )
VALUES
  (
    2,
    'Second',
    'One',
    'Twoevich',
    '2002-01-03',
    'М',
    'В браке',
    'Some Country',
    'Some Country State University of Whatever City',
    'unemployed'
  );

INSERT INTO
  cards_info (
    application_id,
    application_date,
    application_status,
    card_type,
    card_limit,
    customer_id
  )
VALUES
  (0, NOW (), 'A', '03', 31000, 0);

INSERT INTO
  cards_info (
    application_id,
    application_date,
    application_status,
    card_type,
    card_limit,
    customer_id
  )
VALUES
  (1, NOW (), 'R', '02', 25000, 1);

INSERT INTO
  cards_info (
    application_id,
    application_date,
    application_status,
    card_type,
    card_limit,
    customer_id
  )
VALUES
  (2, NOW (), 'A', '02', 25000, 2);

INSERT INTO
  cards_info (
    application_id,
    application_date,
    application_status,
    card_type,
    card_limit,
    customer_id
  )
VALUES
  (3, NOW (), 'A', '02', 31000, 2);

INSERT INTO
  Credit_Info (
    credit_id,
    issue_date,
    customer_id,
    loan_amount,
    currency,
    credit_type,
    credit_status,
    term,
    action_type,
    shop_name
  )
VALUES
  (
    0,
    NOW (),
    2,
    100001,
    1,
    'потребительский',
    '1',
    25,
    '1234567890',
    'First Shop'
  );
