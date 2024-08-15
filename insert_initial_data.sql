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
('awaiting'),
('ended');

INSERT INTO record_classification (class) VALUES
('full'),
('trusted'),
('dust');