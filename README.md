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

- **First, create the database structure using the `create_db.sql` script.**
This script will set up all the necessary tables and relationships required for CryptoHub.

- **Next, populate the database with initial information using the `insert_initial_data.sql` script.**
This script inserts the basic data needed to start using the system, such as classifications and statuses.

- **Now, populate the database with test data to demonstrate CryptoHub’s capabilities using the `insert_data.sql` script.**
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

1. **Activity Types**: 
   - Update the `activity_types` table with the actual types of activities relevant to your projects, such as "Staking," "Trading," or "Airdrop Participation".

2. **Wallet Types**:
   - Replace the entries in the `wallet_types` table with the actual types of cryptocurrency wallets you are using.

3. **List of Cryptocurrency Exchanges**:
   - Update the `exchanges` table with the real exchanges you interact with.

All these changes should be made in the `insert_initial_data.sql` file. By updating this file with your real data, you ensure that CryptoHub is fully customized to your specific needs, allowing you to accurately manage and track your accounts, projects, and wallet activities.
Now, you need to modify the data in the `insert_data.sql` file to reflect your real information.

### 4.2 Order of Data Entry

To ensure the integrity of your data and proper relational linking, follow this order when adding records:

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
