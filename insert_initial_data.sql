INSERT INTO schemes (title, description) VALUES
('full ownership', '100% to me'),
('50/50', '50% to me, 50% to the other party'),
('80/20', '80% to me, 20% to the other party'),
('special', '90% to me, 10% to charity'),
('donation', '100% to the other party');

INSERT INTO wallet_types (type, description) VALUES
('EVM', 'Ethereum Virtual Machine wallets (ETH, BSC, ARB, Polygon, Avalanche, Fantom, and more)'),
('BTC', 'Bitcoin'),
('TON', 'TON'),
('Tron', 'TRC-20');

INSERT INTO exchanges (title, description) VALUES
('ByBit', 'www.bybit.com'),
('OKX', 'www.okx.com'),
('Gate.io', 'www.gate.io'),
('Binance', 'www.binance.com'),
('MEXC', 'www.mexc.com');

INSERT INTO status (title, description) VALUES
('active', 'active phase'),
('distributing', 'time to get reward'),
('closed', 'activity is ended');

INSERT INTO wallet_states (state, description) VALUES
('good', 'project has considered this wallet as eligible for reward or airdrop'),
('idle', 'no rewards or airdrops without any Sybil mark'),
('sybil', 'this wallet has been classified by the project as Sybil');

INSERT INTO account_class (class) VALUES
('full'),
('trusted'),
('dust');