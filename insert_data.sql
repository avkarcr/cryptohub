INSERT INTO people (nickname, full_name, real) VALUES
('avkar', 'Alexey aka avkar', 1),
('nurlan', 'Nurlan', 0),
('gulnaz', 'Gulnaz', 0);

INSERT INTO projects (title, start_date, source, status_id, description) VALUES
('Sui', '2023', 'MM', 2, 'Sui Ambassador'),
('ZkSync', '2023', 'MM', 1, 'ZkSync Testnet');

INSERT INTO activities (title, project_id, type_id, status_id, result, description) VALUES
('Sui Ambassador', 1, 2, 3, 'Did not participated', 'Just example'),
('ZkSync Testnet', 2, 1, 3, 'Things are not always as they seem', 'ZkSync testnet airdrop');

INSERT INTO records (class_id, nicktag, email, telegram, twitter, discord, description) VALUES
(1, 'avkar', 'avkar@mail.mail', '@MyTelegram', '@MyTwitter', 'avkar', 'avkar main record'),
(2, 'avkar_test', NULL, NULL, NULL, 'avkar_test', 'avkar second record'),
(2, 'nurlan', 'nurlan@mail.mail', NULL, NULL, NULL, 'Kazakhstan 1'),
(2, 'gulnaz', 'gulnaz@mail.mail', NULL, NULL, NULL, 'Kazakhstan 2');

INSERT INTO withdrawals (address, type_id, exchange_id, person_id, comments) VALUES
('0x123', 1, 3, 1, 'Main account'),
('0x456', 1, 3, 1, 'Main account - deposit #2'),
('0x789', 1, 3, 1, 'Main account - deposit #3'),
('t123', 2, 3, 1, 'Subaccount #1'),
('EQD777', 3, 3, 1, 'Main account');

INSERT INTO activity_wallets (address, type_id, withdrawal_id, description) VALUES
('0x99999', 1, 1, 'Old wallet with badges'),
('0x88888', 1, 2, 'Another old wallet. Some minor activity'),
('0x77777', 1, 3, 'Created for testnets in 2023');

INSERT INTO records_wallets (record_id, activity_wallet_id, description) VALUES
(1, 1, 'Used in ZkSync testnet'),
(1, 2, 'Used in ZkSync testnet'),
(2, 2, 'Used in ZkSync testnet - my second address');

INSERT INTO activities_records_projects (activity_id, record_id, person_id, description) VALUES
(2, 1, 1, 'ZkSync testnet'),
(2, 2, 1, 'ZkSync testnet - second address');
