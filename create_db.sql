CREATE TABLE schemes (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    start_date TEXT,
    website TEXT,
    description TEXT
);

CREATE TABLE status (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT
);

CREATE TABLE activities (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    project_id INTEGER,
    status_id INTEGER,
    description TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (status_id) REFERENCES status(id)
);

CREATE TABLE activity_scheme (
    id INTEGER PRIMARY KEY,
    activity_id INTEGER,
    wallet_id INTEGER,
    scheme_id INTEGER,
    description TEXT,
    FOREIGN KEY (activity_id) REFERENCES activities(id),
    FOREIGN KEY (wallet_id) REFERENCES wallets(id),
    FOREIGN KEY (scheme_id) REFERENCES schemes(id),
    UNIQUE(activity_id, wallet_id)
);

CREATE TABLE wallet_states (
    id INTEGER PRIMARY KEY,
    state TEXT NOT NULL,
    description TEXT
);

CREATE TABLE wallet_activity_state (
    id INTEGER PRIMARY KEY,
    activity_id INTEGER,
    wallet_id INTEGER,
    wallet_state_id INTEGER,
    description TEXT,
    FOREIGN KEY (wallet_id) REFERENCES wallets(id),
    FOREIGN KEY (activity_id) REFERENCES activities(id),
    FOREIGN KEY (wallet_state_id) REFERENCES wallet_states(id)
);

CREATE TABLE account_class (
    id INTEGER PRIMARY KEY,
    class TEXT NOT NULL
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY,
    nickname TEXT NOT NULL,
    full_name TEXT,
    description TEXT
);

CREATE TABLE accounts (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    telegram TEXT,
    twitter TEXT,
    discord TEXT,
    class_id INTEGER,
    person_id INTEGER,
    description TEXT,
    FOREIGN KEY (class_id) REFERENCES account_class(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE wallet_types (
    id INTEGER PRIMARY KEY,
    type TEXT NOT NULL,
    description TEXT
);

CREATE TABLE exchanges (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT
);

CREATE TABLE withdrawals (
    id INTEGER PRIMARY KEY,
    address TEXT NOT NULL,
    type_id INTEGER,
    exchange_id INTEGER,
    person_id INTEGER,
    description TEXT,
    FOREIGN KEY (type_id) REFERENCES wallet_types(id),
    FOREIGN KEY (exchange_id) REFERENCES exchanges(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE wallets (
    id INTEGER PRIMARY KEY,
    address TEXT NOT NULL,
    account_id INTEGER,
    type_id INTEGER,
    withdrawal_id INTEGER,
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (type_id) REFERENCES wallet_types(id),
    FOREIGN KEY (withdrawal_id) REFERENCES withdrawals(id)
);