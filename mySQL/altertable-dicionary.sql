-- chance the column type
ALTER TABLE destineTable ADD FOREIGN KEY(id_foreign_key) REFERENCES originForeignKeyTable(id_foreign_key);

ALTER TABLE destineTable RENAME newTableName;

ALTER TABLE destineTable ADD newColumnName CHAR(1);

-- using dicionary
SHOW DATABASES;
STATUS;
SHOW TABLES;