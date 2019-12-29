CREATE TABLE "Bank" (
  "bank_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
  "name" TEXT NOT NULL UNIQUE,
  "created_at" INTEGER NOT NULL
);
CREATE TABLE "Deposit" (
  "deposit_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "bank_id" INTEGER,
  "branch" TEXT,
  "amount" REAL NOT NULL,
  "start_date" INTEGER NOT NULL,
  "month" INTEGER,
  "interest" REAL,
  "created_at" INTEGER
);