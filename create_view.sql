DROP VIEW IF EXISTS Enrollment;

CREATE VIEW Enrollment AS
SELECT
    a.title AS Activity,
    acc.title AS Account,
    w.address AS Wallet,
    e.title AS Exchange,
    wit.address AS Withdrawal,
    s.title AS Scheme
FROM
    wallet_activity_state was
JOIN
    activities a ON was.activity_id = a.id
JOIN
    wallets w ON was.wallet_id = w.id
JOIN
    activity_scheme acs ON (a.id = acs.activity_id AND w.id = acs.wallet_id)
JOIN
    schemes s ON acs.scheme_id = s.id
JOIN
    accounts acc ON w.account_id = acc.id
JOIN
    withdrawals wit ON wit.id = w.withdrawal_id
JOIN
    exchanges e ON e.id = wit.exchange_id;