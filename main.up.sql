-- The longest known name of a currency is "Pound sterling" - 14 characters.
-- Safe to assume no currency is longer than 30 characters.
CREATE TABLE currency_rates (
  ID INTEGER PRIMARY KEY,
  currency VARCHAR(30),
  currency_date DATE,
  exchange_rate REAL
);

-- Longest country name has 45 letters excluding spaces. Safe to assume 80 won't be exceeded.
-- As for the current moment, there are only two genders.
CREATE TABLE Customer_Info (
  customer_id INTEGER PRIMARY KEY,
  name VARCHAR(100),
  surname VARCHAR(100),
  patronymic VARCHAR(100),
  birth_date DATE,
  gender VARCHAR(1),
  marital_status VARCHAR(10),
  citizenship VARCHAR(80),
  education VARCHAR(200),
  work_status VARCHAR(200)
);

CREATE TABLE cards_info (
  application_id INTEGER PRIMARY KEY,
  application_date DATE,
  application_status CHAR(1),
  card_type CHAR(2),
  card_limit INTEGER,
  customer_id INTEGER REFERENCES Customer_Info (customer_id)
);

CREATE TABLE Credit_Info (
  credit_id INTEGER PRIMARY KEY,
  issue_date DATE,
  customer_id INTEGER REFERENCES Customer_Info (customer_id),
  loan_amount INTEGER,
  currency INTEGER REFERENCES currency_rates (ID),
  credit_type VARCHAR(20),
  credit_status CHAR(1),
  term INTEGER,
  action_type CHAR(100), -- for instance
  shop_name VARCHAR(200)
);

CREATE TABLE Payments_Info (
  ID INTEGER PRIMARY KEY,
  credit_id INTEGER REFERENCES Credit_Info (credit_id),
  num_installment CHAR(100), -- for instance
  payment_date DATE,
  delay_days INTEGER,
  payment_amount INTEGER
);

CREATE TABLE product_info (
    ID INTEGER PRIMARY KEY,
    product      VARCHAR(500),
    brand        VARCHAR(200),
    model        VARCHAR(500),
    price        INTEGER,
    credit_id    INTEGER REFERENCES Credit_Info (credit_id)
);
