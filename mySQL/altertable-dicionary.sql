-- chance the column type
ALTER TABLE destineTable ADD FOREIGN KEY(id_foreign_key) REFERENCES originForeignKeyTable(id_foreign_key);

ALTER TABLE destineTable RENAME newTableName;

ALTER TABLE destineTable ADD newColumnName CHAR(1);

-- using dicionary
STATUS;
SHOW DATABASES; -- show information about the database
SHOW TABLES; -- show all tables in the database
SELECT CURRENT_USER(); -- user who has the action
SELECT NOW(); -- time of the action happened
