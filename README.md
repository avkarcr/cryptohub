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

## 3. Usage: Entering Account Information

Once your environment is set up, you can start populating your database with your account and project data.

### 3.1 Order of Data Entry

To ensure the integrity of your data and proper relational linking, follow this order when adding records:

#### 1. **Create Statuses**
   - Start by creating status records in the `status` table. For example, statuses like `active`, `awaiting`, `ended` can be used for projects and activities.

#### 2. **Create Activity Types**
   - Add entries to the `activity_types` table to define different types of activities, such as `participation`, `task completion`.

#### 3. **Create Wallet Types**
   - Define the types of wallets in the `wallet_types` table, such as `Bitcoin`, `Ethereum`.

#### 4. **Add Projects**
   - Create records in the `projects` table, specifying the project’s title, start date, source, and status.

#### 5. **Add Activities**
   - Add activities related to the projects in the `activities` table, linking them to the relevant project and activity type.

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
