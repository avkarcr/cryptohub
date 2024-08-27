INSERT INTO activity_schemes (title, description) VALUES
('full ownership', '100% to me'),
('50/50', '50% to me, 50% to the other party'),
('80/20', '80% to me, 20% to the other party'),
('special', '90% to me, 10% to charity'),
('donation', '100% to the other party');

INSERT INTO activity_types (title, description) VALUES
('Testnet', 'Participation in testnets'),
('Ambassador', 'Ambassador program'),
('Node', 'Participation in node maintenance activities');

INSERT INTO wallet_types (type, description) VALUES
('EVM', 'Ethereum Virtual Machine wallets (ETH, BSC, ARB, Polygon, Avalanche, Fantom, and more)'),
('BTC', 'Bitcoin'),
('TON', 'TON'),
('Tron', 'TRC-20');

INSERT INTO exchanges (title, description) VALUES
('Binance', 'www.binance.com'),
('ByBit', 'www.bybit.com'),
('OKX', 'www.okx.com'),
('MEXC', 'www.mexc.com');

INSERT INTO status (title) VALUES
('active'),
('distributing'),
('closed');

INSERT INTO wallet_states (state, description) VALUES
('good', 'project has considered this wallet as eligible for reward or airdrop'),
('idle', 'no rewards or airdrops without any Sybil mark'),
('sybil', 'this wallet has been classified by the project as Sybil');

INSERT INTO record_classification (class) VALUES
('full'),
('trusted'),
('dust');