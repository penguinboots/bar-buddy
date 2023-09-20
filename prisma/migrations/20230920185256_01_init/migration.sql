-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IngredientCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "IngredientCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CocktailCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CocktailCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ingredient" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "Ingredient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cocktail" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "instructions" TEXT[],

    CONSTRAINT "Cocktail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserIngredientStock" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "ingredientId" INTEGER NOT NULL,
    "inStock" BOOLEAN NOT NULL DEFAULT false,
    "quantity" INTEGER,

    CONSTRAINT "UserIngredientStock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CocktailIngredient" (
    "id" SERIAL NOT NULL,
    "quantity" TEXT NOT NULL,
    "cocktailId" INTEGER NOT NULL,
    "ingredientId" INTEGER NOT NULL,

    CONSTRAINT "CocktailIngredient_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "IngredientCategory_name_key" ON "IngredientCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CocktailCategory_name_key" ON "CocktailCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Ingredient_name_key" ON "Ingredient"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Cocktail_name_key" ON "Cocktail"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CocktailIngredient_cocktailId_ingredientId_key" ON "CocktailIngredient"("cocktailId", "ingredientId");

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "IngredientCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cocktail" ADD CONSTRAINT "Cocktail_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "CocktailCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserIngredientStock" ADD CONSTRAINT "UserIngredientStock_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserIngredientStock" ADD CONSTRAINT "UserIngredientStock_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "Ingredient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CocktailIngredient" ADD CONSTRAINT "CocktailIngredient_cocktailId_fkey" FOREIGN KEY ("cocktailId") REFERENCES "Cocktail"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CocktailIngredient" ADD CONSTRAINT "CocktailIngredient_ingredientId_fkey" FOREIGN KEY ("ingredientId") REFERENCES "Ingredient"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
