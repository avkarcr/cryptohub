# CryptoHub Project

CryptoHub is a data model designed for managing accounts and cryptocurrency wallets, specifically tailored for tracking activities in various crypto projects. The system provides a structured way to organize and monitor your accounts, link them to projects, and manage associated wallets for seamless fund withdrawals.

You may find this project useful if you need to organize information across multiple accounts for working with various crypto projects. To work with this project, you should have basic knowledge of the following software products: SQLite and DBeaver.

## 1. Setup and Installation

### 1.1 Prerequisites

Before you start using CryptoHub, ensure that you have the following installed on your system:

- **SQLite**: A lightweight, disk-based database that doesn’t require a separate server process.
- **DBeaver**: A powerful SQL client that supports a wide range of databases, including SQLite, and provides a user-friendly interface for managing databases.

### 1.2 Installation of SQLite

1. **Windows**:
   - Download SQLite from the [official website](https://sqlite.org/download.html).
   - Unzip the file and add the path to the executable to your system's `PATH` environment variable.

2. **macOS**:
   - Install SQLite using Homebrew:
     ```sh
     brew install sqlite3
     ```

3. **Linux**:
   - Install SQLite using your distribution’s package manager:
     ```sh
     sudo apt-get install sqlite3
     ```

### 1.3 Installation of DBeaver

1. **Download and Install**:
   - Download DBeaver (Community edition is OK) from the [official website](https://dbeaver.io/download/).
   - Install it on your system following the provided instructions.

2. **Setting Up SQLite in DBeaver**:
   - Open DBeaver and create a new connection.
   - Select SQLite from the list of database types.
   - Specify the path to your database file or create a new one.

## 2. Entity Relationship Model

The diagram below illustrates the Entity Relationship Model (ERM) for the CryptoHub project. This model outlines the key entities and their relationships within the database, providing a clear structure for managing accounts, projects, wallets, and related activities.

![Entity Relationship Model](entity_relationship_model.png)

## 3. Steps to Set Up the Database

**First, create the database structure using the `create_db.sql` script.**
This script will set up all the necessary tables and relationships required for CryptoHub.

**Next, populate the database with initial information using the `insert_initial_data.sql` script.**
This script inserts the basic data needed to start using the system, such as classifications and statuses.

**Now, populate the database with test data to demonstrate CryptoHub’s capabilities using the `insert_data.sql` script.**
Use the provided test data script to add sample records, which will allow you to explore and understand how CryptoHub functions.
   
**Run the following commands:**
```sh
sqlite3 cryptohub.db < create_db.sql
sqlite3 cryptohub.db < insert_initial_data.sql
sqlite3 cryptohub.db < insert_data.sql
```

## 4. Usage: Entering Account Information

After the initial setup and testing with the provided test data, you can begin populating the system with your real data.

### 4.1 Transition from Test Data to Real Data

After successfully setting up and testing the system with the provided test data, it’s time to replace these test entries with your actual data. The following test data should be replaced with real information:

### **Activity Types**
Update the `activity_types` table with the actual types of activities relevant to your projects.

### **Wallet Types**
Replace the entries in the `wallet_types` table with the actual types of cryptocurrency wallets you are using.

### **Exchanges**
Update the `exchanges` table with the real exchanges you interact with.

All these changes should be made in the `insert_initial_data.sql` file. By updating this file with your real data, you ensure that CryptoHub is fully customized to your specific needs, allowing you to accurately manage and track your accounts, projects, and wallet activities.
Now, you need to modify the data in the `insert_data.sql` file to reflect your real information.

### 4.2 Order of Data Entry - test data example

In the `activity_types`, `wallet_types`, `exchanges`, `status`, and `record_classification` tables, we will keep the initial values for now.

---
### **Table `people`**

`nickname` = 'john_1981' - a nickname of a person.

`full_name` = 'John Nukem' - a full name of a person.

`real` = 1 - a boolean value indicating whether the person is real or not.

---
### **Table `projects`**

`title` = 'CryptoProject' - the name of the project.

`start_date` = 'June 2023' - a text field with the date in any convenient format, so you can approximately determine when the project activity started.

`source` = 'nodes.guru' - a text field describing the source of information from which the project details were obtained (for example, the website nodes.guru).

`status_id` = 1 - this is a foreign key referencing the status table. If you add the project to the database using DBeaver, the foreign key will be set automatically when selecting the related value.

`description` = 'CryptoProject's description' - your brief description of the project for convenience.

---
### **Table `activities`**

`title` = 'CryptoProject Airdrop' - the name of the specific activity of the project.

`project_id` = 1 - this is a foreign key referencing out **CryptoProject** project.

`type_id` = 1 - this is a foreign key referencing out project type ('testnet').

`status_id` = 1 - this is a foreign key referencing out status ('active').

`result` = 'Gathering project info' - a text field with the activity result.

`description` = 'Activity description' - your brief description of the activity.

---
### **Table `records`**

`class_id` = 1 - this is a foreign key referencing out `record_classification` table.
Index 1 refers to a **full** account, which includes a well-developed wallet, social media records,
and other registration information. These accounts are usually few in number, 
and all activities related to them in the project are performed manually, without the use of automation. 

`nicktag` = 'John' - the nick tag of the record.
Some real people may have several records (accounts) to participate in different projects

`email` = 'johnl@gmail.com' - the e-mail of the record.

`telegram` = '@John' - the Telegram account of the record.

`twitter` = '@John' - the Twitter (x.com) account of the record.

`discord` = 'john' - the Discord account of the record.

`description` = 'John main record' - brief description of the record.

---
### **Table `withdrawals`**

`address` = 0x98765 - an address (mostly on a crypto exchange) that is used for withdrawing tokens. 

`type_id` = 1 - this is a foreign key referencing out `wallet_types` table.
Index 1 refers to a **EVM** wallet type (ETH, BSC, ARB, Polygon, etc.).

`exchange_id` = 1 - this is a foreign key referencing out `exchanges` table.
Index 1 refers to a **Binance** exchange.

`person_id` = 1 - this is a foreign key referencing out `people` table.
Index 1 refers to a **John Nukem** person. He is the one who owns this exchange wallet.

`memo` = NULL - this option may be useful for some networks (i.e. TON)

`comments` = 'John's withdraw address on Binance' - any comment you need.

---
### **Table `activity_wallets`**

`address` = 0x12345 - an address which is used in different activities. 

`type_id` = 1 - this is a foreign key referencing out `wallet_types` table.
Index 1 refers to a **EVM** wallet type (ETH, BSC, ARB, Polygon, etc.).

`withdrawal_id` = 1 - this is a foreign key referencing out `withdrawals` table.

`description` = 'Main activity wallet for John record' - brief description of the wallet.

---
### **Table `records_wallets`**

`record_id` = 1 - this is a foreign key referencing out `records` table.
Index 1 refers to John.

`activity_wallet_id` = 1 - this is a foreign key referencing out `activity_wallets` table.

`description` = 'Main activity wallet for John record' - brief description of the wallet.

---
### **Table `activities_records_projects`**

`activity_id` = 1 - this is a foreign key referencing out `activities` table.
Index 1 refers to 'CryptoProject Airdrop' activity.

`record_id` = 1 - this is a foreign key referencing out `records` table.
Index 1 refers to John.

`person_id` = 1 - this is a foreign key referencing out `people` table.
Index 1 refers to a **John Nukem** person.

`description` = 'CryptoProject Airdrop for John's main record.' - brief description.

---

### 4.3 Use of example data

Now that you have populated the tables with test data, let's run a query for the activity
'CryptoProject Airdrop' to see where John can withdraw funds from his wallet for this activity.

```sql
CREATE VIEW CryptoProjectAirdrop AS
SELECT
   r.nicktag AS nickname,
   wt.type AS type,
   aw.address AS wallet,
   w.address AS withdraw
FROM
   activities a
JOIN
   activities_records_projects arp ON arp.activity_id = a.id
JOIN
   records r ON r.id = arp.record_id
JOIN
   records_wallets rw ON rw.record_id = r.id
JOIN
   activity_wallets aw ON aw.id = rw.activity_wallet_id
JOIN
   withdrawals w ON w.id = aw.withdrawal_id
JOIN
   wallet_types wt ON wt.id = w.type_id
WHERE
   a.title = 'CryptoProject Airdrop';
```




To ensure the integrity of your data and proper relational linking, follow this order when adding records:

### Lists (Initial Settings)

### `activity_types`
This table stores the different types of activities that can be associated with projects. Each activity type has a unique identifier (`id`), a `title` for the activity type, and an optional `description` to provide more context.

### `wallet_types`
This table defines the different types of wallets that can be used in the system. Each type has a `type` field to specify the wallet type (e.g., Bitcoin, Ethereum) and a `description` field for further explanation.

### `exchanges`
The `exchanges` table contains information about cryptocurrency exchanges. Each exchange has a `title` and a `description` to explain what the exchange is and its role in the system.

### `status`
The `status` table defines various statuses that can be applied to projects and activities. Each status has a `title` that describes it (e.g., active, awaiting, ended).

### `record_classification`
This table categorizes user accounts into different classes. The `class` field specifies the category, which helps in classifying accounts according to their purpose or level of verification (e.g., full, trusted, dust).

---

### Data for Filling

### `projects`
The `projects` table contains information about various crypto projects. Each project has a unique identifier (`id`), a `title`, a `start_date`, a `source` (indicating where the project originates from), a `status_id` linking to the current status of the project, and a `description` providing further details.

### `activities`
This table tracks individual activities within a project. Each activity is linked to a specific project (`project_id`), has a type (`type_id`), and a status (`status_id`). The `result` field stores the outcome of the activity, and the `description` field provides additional details.

### `records`
The `records` table holds information about user accounts used in crypto projects. Each record includes a `class_id` to classify the account, a `nicktag` (nickname), contact details such as `email`, `telegram`, `twitter`, and `discord`, and a `description` field for any additional information.

### `people`
This table stores information about individuals associated with accounts or activities. It includes fields for `nickname`, `full_name`, and a `real` boolean field indicating whether the person is a real individual (as opposed to a fictional or placeholder name).

### `activity_wallets`
The `activity_wallets` table stores information about wallets used in activities. Each wallet is associated with a `type_id` indicating the type of wallet (e.g., Bitcoin, Ethereum), and a `withdrawal_id` if the wallet has been used for withdrawals. The `address` field stores the wallet address, and `description` provides additional details.

### `withdrawals`
This table records the details of funds withdrawals from wallets. Each withdrawal is linked to a `type_id` indicating the type of wallet used, an `exchange_id` for the exchange used in the transaction, and a `person_id` for the individual involved in the withdrawal. The `address` field stores the withdrawal address, and `comments` can be used for any additional information.

---

## 3. Many-to-Many Relationship Tables

### `activities_records_projects`
This is a junction table that connects activities, records (accounts), and people. It records which account (record) and person are involved in a specific activity within a project. The `description` field can be used to store any additional notes about the association.

### `records_wallets`
This junction table links user accounts (`record_id`) to wallets (`activity_wallet_id`). The `description` field can be used to provide more context about the relationship between the account and the wallet.



#### 4. **Add Projects**
   - Create records in the `projects` table, specifying the project’s title, start date, source, and status.

#### 6. **Add People**
   - Populate the `people` table with information about individuals who are associated with the accounts or involved in fund withdrawals.

#### 7. **Add Accounts**
   - Enter account details in the `records` table, including nicknames, contact information, and classifications.

#### 8. **Link Accounts to Activities and Projects**
   - Use the `activities_records_projects` table to link accounts to specific activities and projects.

#### 9. **Add Wallets**
   - Create wallet records in the `activity_wallets` table, specifying the type and related activities.

#### 10. **Link Wallets to Accounts**
   - Use the `records_wallets` table to associate wallets with specific accounts.

#### 11. **Add Exchanges**
   - Populate the `exchanges` table with information about the exchanges used for withdrawals.

#### 12. **Create Withdrawal Records**
   - Add withdrawal entries in the `withdrawals` table, linking them to wallets, exchanges, and people.

### Conclusion

CryptoHub provides a comprehensive and flexible data model for managing your crypto-related activities. It is designed to be populated with your specific data, allowing you to track your accounts, projects, and financial transactions effectively.
