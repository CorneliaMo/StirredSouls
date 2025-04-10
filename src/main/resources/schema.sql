CREATE TABLE IF NOT EXISTS "liquor_categories" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "base_liquor" (
    "id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "alcohol_content" REAL NOT NULL,
    "comment" TEXT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("category_id") REFERENCES "liquor_categories" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "cocktail_record" (
    "id" INTEGER NOT NULL,
    "name" TEXT NULL,
    "time" DATETIME NOT NULL,
    "rating" TINYINT NOT NULL,
    "mood" TEXT NULL,
    "alcohol_content" REAL NOT NULL,
    "comment" TEXT NULL,
    "is_favorite" TINYINT NOT NULL,
    "photo_path" TEXT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE IF NOT EXISTS "ingredient_record" (
    "id" INTEGER NOT NULL,
    "cocktail_record_id" INTEGER NOT NULL,
    "name" TEXT NULL,
    "base_liquor_id" INTEGER NULL,
    "amount" REAL NOT NULL,
    "unit" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "comment" TEXT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("base_liquor_id") REFERENCES "base_liquor" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY ("cocktail_id") REFERENCES "cocktail_record" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);