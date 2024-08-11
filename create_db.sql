DROP TABLE IF EXISTS activity_types;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS activities_records_projects;
DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS records_wallets;
DROP TABLE IF EXISTS activity_wallets;
DROP TABLE IF EXISTS wallet_types;
DROP TABLE IF EXISTS exchanges;
DROP TABLE IF EXISTS withdrawals;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS record_classification;

CREATE TABLE activity_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    start_date TEXT,
    source TEXT,
    status_id INTEGER,
    description TEXT,
    FOREIGN KEY (status_id) REFERENCES status(id)
);

CREATE TABLE activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    project_id INTEGER,
    type_id INTEGER,
    status_id INTEGER,
    result TEXT,
    description TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (type_id) REFERENCES activity_types(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);

CREATE TABLE activities_records_projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    activity_id INTEGER,
    record_id INTEGER,
    person_id INTEGER,
    description TEXT,
    FOREIGN KEY (activity_id) REFERENCES activities(id),
    FOREIGN KEY (record_id) REFERENCES records(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE records (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER,
    nicktag TEXT NOT NULL,
    email TEXT,
    telegram TEXT,
    twitter TEXT,
    discord TEXT,
    description TEXT,
    FOREIGN KEY (class_id) REFERENCES record_classification(id)
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nickname TEXT NOT NULL,
    full_name TEXT NOT NULL,
    real INTEGER CHECK(real IN (0, 1))
);

CREATE TABLE records_wallets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    record_id INTEGER,
    activity_wallet_id INTEGER,
    description TEXT,
    FOREIGN KEY (record_id) REFERENCES records(id),
    FOREIGN KEY (activity_wallet_id) REFERENCES activity_wallets(id)
);

CREATE TABLE activity_wallets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    address TEXT NOT NULL,
    type_id INTEGER,
    withdrawal_id INTEGER,
    description TEXT,
    FOREIGN KEY (type_id) REFERENCES wallet_types(id),
    FOREIGN KEY (withdrawal_id) REFERENCES withdrawals(id)
);

CREATE TABLE wallet_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL,
    description TEXT
);

CREATE TABLE exchanges (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT
);

CREATE TABLE withdrawals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    address TEXT NOT NULL,
    type_id INTEGER,
    exchange_id INTEGER,
    person_id INTEGER,
    memo TEXT,
    comments TEXT,
    FOREIGN KEY (type_id) REFERENCES wallet_types(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (exchange_id) REFERENCES exchanges(id)
);

CREATE TABLE status (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

CREATE TABLE record_classification (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class TEXT NOT NULL
);

