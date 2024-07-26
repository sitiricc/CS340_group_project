SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

/* Creates a table for users */
CREATE OR REPLACE TABLE Users (
    userID INT AUTO_INCREMENT UNIQUE NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    dateJoined DATE NOT NULL,
    PRIMARY KEY (userID)
);

/* Creates a table for ingredients */
CREATE OR REPLACE TABLE Ingredients (
    ingredientID INT AUTO_INCREMENT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    unitOfMeasurement VARCHAR(255),
    PRIMARY KEY (ingredientID)
);

/* Creates a table for recipes */
CREATE OR REPLACE TABLE Recipes (
    recipeID INT AUTO_INCREMENT UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    prepTimeInMinutes INT,
    cookTimeInMinutes INT,
    servingSize INT,
    instructions VARCHAR(255) NOT NULL,
    dateAdded DATE,
    PRIMARY KEY (recipeID)
);

/* Creates a table for reviews */
CREATE OR REPLACE TABLE Reviews (
    reviewID INT AUTO_INCREMENT UNIQUE NOT NULL,
    recipeID INT,
    userID INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(255),
    datePosted DATE,
    PRIMARY KEY (reviewID),
    FOREIGN KEY (recipeID) REFERENCES Recipes(recipeID),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

/* Creates a table for recipe ingredients */
CREATE OR REPLACE TABLE RecipeIngredients (
    recipeID INT,
    ingredientID INT,
    quantity VARCHAR(255),
    PRIMARY KEY (recipeID, ingredientID),
    FOREIGN KEY (recipeID) REFERENCES Recipes(recipeID),
    FOREIGN KEY (ingredientID) REFERENCES Ingredients(ingredientID)
);

/* Inserts sample data into the Users table */
INSERT INTO Users (
    userID, 
    username, 
    email, 
    password, 
    dateJoined
) 
VALUES
    (1, 'BabyShellfish', 'Baby.shellfish@gmail.com', '&V9m!nQ7bX', '2003-07-15'),
    (2, 'SourdoughStarter', 'Crusty.magic@gmail.com', '#jR5t2W!gL0', '2007-10-21'),
    (3, 'HonestShamrock', 'Lucky.day777@gmail.com', 'xY3&lP!8zN', '2011-02-09'),
    (4, 'SpicyEnchilada', 'Spicy.enchilada@gmail.com', '4B%aT1o@Zx', '2016-12-01');

/* Inserts sample data into the Ingredients table */
INSERT INTO Ingredients (
    ingredientID, 
    name, 
    category, 
    unitOfMeasurement
) 
VALUES
    (256722, 'Salted Caramel', 'Sauce', 'tbsp, cup, bottle'),
    (439843, 'Basil', 'Herb', 'tsp'),
    (238221, 'Dragon Fruit', 'Fruit', 'cup, whole'),
    (934784, 'Matcha', 'Seasoning', 'tsp');

/* Inserts sample data into the Recipes table */
INSERT INTO Recipes (
    recipeID, 
    title, 
    description, 
    prepTimeInMinutes, 
    cookTimeInMinutes, 
    servingSize, 
    instructions, 
    dateAdded
) 
VALUES
    (54534584, 'Salted Caramel Brownies', 'Rich chocolate brownies with a salted caramel swirl topped with a delicious drizzle of caramel and flaky salt.', 15, 20, 12, 'Mix all ingredients and put in oven at 350 for 20 minutes.', '2007-04-05'),
    (22030319, 'Dragon Fruit Mango Salsa', 'The perfect salsa to add to your tacos this Tuesday.', 8, 0, 20, 'Dice all ingredients, mix it all together until combined and enjoy over some delicious chicken tacos.', '2010-05-05'),
    (48672831, 'Matcha Latte', 'Enjoy this matcha latte during those cold winter months. Easy to make!', 3, 0, 1, 'Warm up some milk for 30 seconds in the microwave or until warm in the stove, grind up and prepare the matcha until frothy and pour over warm milk.', '2018-06-19'),
    (58540234, 'Basil Pesto', 'Impress your Italian mother-in-law with this rich, decadent pesto sauce. Bada bing, bada boom!', 15, 0, 8, 'In a food processor, combine basil, pine nuts, parmesan and garlic. Add olive oil until smooth. Pour over pasta.', '2013-11-30');

/* Inserts sample data into the Reviews table */
INSERT INTO Reviews (
    reviewID, 
    recipeID, 
    userID, 
    rating, 
    comment, 
    datePosted
) 
VALUES
    (8545662, 54534584, 1, 5, 'These brownies are divine! They are rich, decadent, sweet, and salty. The combination of flavors is so incredible I ate the entire pan by myself. They came out ooey and gooey. The salt on top really adds so much to it as it cuts through the richness to give you that nice, finishing touch.', '2009-01-19'),
    (2323146, 22030319, 2, 4, 'I have found the perfect summer dish. My kids were raving about this one and I can’t believe it is so easy to make! Perfect addition to any pool party.', '2012-09-16'),
    (3490121, 48672831, 3, 4, 'So simple to make. If you’re a beginner in the world of matcha, this recipe will help get you prepared. I make this one in the mornings and take to work in a big tumbler.', '2020-12-21'),
    (4968425, 58540234, 4, 2, 'My mother-in-law was not that impressed, but it was still tasty. Next time, I would add more basil and less olive oil.', '2019-05-08');

/* Inserts sample data into the RecipeIngredients table */
INSERT INTO RecipeIngredients (
    recipeID, 
    ingredientID, 
    quantity
) 
VALUES
    (54534584, 256722, '½ cup'),
    (22030319, 238221, '1 cup'),
    (48672831, 934784, '2 tsp'),
    (58540234, 439843, '3 cups');


/*Creates a new user */
INSERT INTO Users(username, email, password, dateJoined) VALUES (:usernameInput, :emailInput, :passwordInput, :dateJoinedInput);


/*Creates a new ingredient */
INSERT INTO Ingredients(name, category, unitOfMeasurement) VALUES (:nameInput, :categoryInput, :unitOfMeasurementInput);


/*Creates a new recipe */
INSERT INTO Recipes(title, description, prepTime, cookTime, servingSize, instructions, dateAdded) VALUES (:titleInput, :descriptionInput, :prepTimeInput, :cookTimeInput, :servingSizeInput, :instructionsInput, :dateAddedInput);


/*Creates a new review */
INSERT INTO Reviews(recipeID, userID, rating, comment, datePosted) VALUES (:recipeIDInput, :userIDInput, :ratingInput, :commentInput, :datePostedInput);

/*Creates a new recipe ingredient */
INSERT INTO RecipeIngredients(recipeID, ingredientID, quantity) VALUES (:recipeIDInput, :ingredientIDInput, :quantityInput, :unitOfMeasurementInput);


/* Deletes a recipe ingredient */
DELETE FROM RecipeIngredients WHERE recipeID = :recipeIDInput AND ingredientID = :ingredientIDInput AND unitOfMeasurement = :unitOfMeasurementInput;

/* Deletes an ingredient*/
DELETE FROM Ingredients WHERE ingredientID = :ingredientIDInput;

/* Deletes a review */
DELETE FROM Reviews WHERE reviewID = :reviewIDInput;

/* Deletes from a recipe*/
DELETE FROM Recipes WHERE recipeID = :recipeIDInput;

/*Deletes from a user*/
DELETE FROM Users WHERE userID = :userIDInput;


/*Updates a review*/
UPDATE FROM Recipes SET title = :titleInput, description = :descriptionInput, prepTime = :prepTimeInput, cookTime = :cookTimeInput, servingSize = :servingSizeInput, instructions = :instructionsInput, dateAdded = :dateAddedInput WHERE recipeID = :recipeIDInput;

/*Updates a user*/
UPDATE FROM Users SET username = :usernameInput, email = :emailInput, password = :passwordInput, dateJoined = :dateJoinedInput WHERE userID = :userIDInput;

/*Updates an ingredient*/
UPDATE FROM Ingredients SET name = :nameInput, category = :categoryInput, unitOfMeasurement = :unitOfMeasurementInput WHERE ingredientID = :ingredientIDInput;

/*Updates a recipe ingredient*/
UPDATE FROM RecipeIngredients SET quantity = :quantityInput WHERE recipeID = :recipeIDInput AND ingredientID = :ingredientIDInput; AND unitOfMeasurement = :unitOfMeasurementInput;

/*Updates a review*/
UPDATE FROM Reviews SET recipeID = :recipeIDInput, userID = :userIDInput, rating = :ratingInput, comment = :commentInput, datePosted = :datePostedInput WHERE reviewID = :reviewIDInput;


/* Display user table*/
SELECT * FROM Users;

/* Display ingredient table*/
SELECT * FROM Ingredients;

/* Display recipe table*/
SELECT * FROM Recipes;

/* Display review table*/
SELECT * FROM Reviews;

/* Display recipe ingredient table*/
SELECT * FROM RecipeIngredients;

/* Show all reviews for a specific recipe */
SELECT Users.username, Recipes.title
FROM Users
INNER JOIN Reviews ON Users.userID = Reviews.userID
INNER JOIN Recipes ON Reviews.recipeID = Recipes.recipeID;

/* Show all ingredients for a specific recipe */
SELECT Ingredients.name, Recipe.title
FROM Ingredients
INNER JOIN RecipeIngredients ON Ingredients.ingredientID = RecipeIngredients.ingredientID

/* Show all reviews for a specific user */
SELECT Users.username, Reviews.comment
FROM Users
INNER JOIN Reviews ON Users.userID = Reviews.userID;

/* Show all recipes for a specific user */
SELECT Users.username, Recipes.title
FROM User
INNER JOIN Recipes ON User.userID = Recipes.userID;
