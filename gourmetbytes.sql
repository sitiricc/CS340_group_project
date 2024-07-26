SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;


/*Creates a table for users */
CREATE OR REPLACE TABLE User (
    userID INT AUTO_INCREMENT UNIQUE NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    dateJoined DATE NOT NULL,
    PRIMARY KEY (userID)
);

/* Creates a table for ingredients*/
CREATE OR REPLACE TABLE Ingredient (
    ingredientID INT AUTO_INCREMENT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    unitOfMeasurement VARCHAR(255),
    PRIMARY KEY (ingredientID)
);


/*Creates a table for recipes */
CREATE OR REPLACE TABLE Recipe (
    recipeID INT AUTO_INCREMENT UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    prepTime INT,
    cookTime INT,
    servingSize INT,
    instructions VARCHAR(255) NOT NULL,
    dateAdded DATE,
    PRIMARY KEY (recipeID)
);

/*Creates a table for reviews */
CREATE OR REPLACE TABLE Review (
    reviewID INT AUTO_INCREMENT UNIQUE NOT NULL,
    recipeID INT,
    userID INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(255),
    datePosted DATE,
    PRIMARY KEY (reviewID),
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

/*Creates a table for recipe ingredients */
CREATE OR REPLACE TABLE RecipeIngredient (
    recipeID INT,
    ingredientID INT,
    quantity VARCHAR(255),
    PRIMARY KEY (recipeID, ingredientID),
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
    FOREIGN KEY (ingredientID) REFERENCES Ingredient(ingredientID)
);


/*Inserts sample data into the User table */
INSERT INTO User (
    userID, 
    username, 
    email, 
    password, 
    dateJoined
    ) 
    VALUES

    (1, 
    'BabyShellfish', 
    'Baby.shellfish@gmail.com', 
    '&V9m!nQ7bX', 
    '2003-07-15'),

    (2, 
    'SourdoughStarter',
    'Crusty.magic@gmail.com',
    '#jR5t2W!gL0',
    '2007-10-21'
    ),

    (3,
    'HonestShamrock', 
    'Lucky.day777@gmail.com', 
    'xY3&lP!8zN', '2011-02-09'
    ),
    
    (4,
    'SpicyEnchilada',
    'Spicy.enchilada@gmail.com', 
    '4B%aT1o@Zx', 
    '2016-12-01'
    );


/*Inserts sample data into the Ingredient table */
INSERT INTO Ingredient 
(
    ingredientID, 
    name, 
    category, 
    unitOfMeasurement
    ) 
    
    VALUES
    
    (256722, 
    'Salted Caramel', 
    'Sauce', 
    'tbsp, cup, bottle'
    ),
    
    (439843, 
    'Basil', 
    'Herb', 
    'tsp'
    ),
    
    (238221, 
    'Dragon Fruit', 
    'Fruit', 
    'cup, whole'),
    
    (934784, 
    'Matcha', 
    'Seasoning', 
    'tsp'
    );

/*Inserts sample data into the Recipe table */
INSERT INTO Recipe (recipeID, title, description, prepTime, cookTime, servingSize, instructions, dateAdded) VALUES
(
    54534584,
    'Salted Caramel Brownies',
    'Rich chocolate brownies with a salted caramel swirl topped with a delicious drizzle of caramel and flaky salt.',
    15,
    20,
    12,
    'Mix all ingredients and put in oven at 350 for 20 minutes.',
    '2007-04-05'
),
(
    22030319,
    'Dragon Fruit Mango Salsa',
    'The perfect salsa to add to your tacos this Tuesday.',
    8,
    0,
    20,
    'Dice all ingredients, mix it all together until combined and enjoy over some delicious chicken tacos.',
    '2010-05-05'
),
(
    48672831,
    'Matcha Latte',
    'Enjoy this matcha latte during those cold winter months. Easy to make!',
    3,
    0,
    1,
    'Warm up some milk for 30 seconds in the microwave or until warm in the stove, grind up and prepare the matcha until frothy and pour over warm milk.',
    '2018-06-19'
),
(
    58540234,
    'Basil Pesto',
    'Impress your Italian mother-in-law with this rich, decadent pesto sauce. Bada bing, bada boom!',
    15,
    0,
    8,
    'In a food processor, combine basil, pine nuts, parmesan and garlic. Add olive oil until smooth. Pour over pasta.',
    '2013-11-30'
);


/*Inserts sample data into the Review table */
INSERT INTO Review (reviewID, recipeID, userID, rating, comment, datePosted) VALUES
(
    8545662,
    54534584,
    1,
    5,
    'These brownies are divine! They are rich, decadent, sweet, and salty. The combination of flavors is so incredible I ate the entire pan by myself. They came out ooey and gooey. The salt on top really adds so much to it as it cuts through the richness to give you that nice, finishing touch.',
    '2009-01-19'
),
(
    2323146,
    22030319,
    2,
    4,
    'I have found the perfect summer dish. My kids were raving about this one and I can’t believe it is so easy to make! Perfect addition to any pool party.',
    '2012-09-16'
),
(
    3490121,
    48672831,
    3,
    4,
    'So simple to make. If you’re a beginner in the world of matcha, this recipe will help get you prepared. I make this one in the mornings and take to work in a big tumbler.',
    '2020-12-21'
),
(
    4968425,
    58540234,
    4,
    2,
    'My mother-in-law was not that impressed, but it was still tasty. Next time, I would add more basil and less olive oil.',
    '2019-05-08'
);

/*Inserts sample data into the RecipeIngredient table */
INSERT INTO RecipeIngredient (recipeID, ingredientID, quantity) VALUES
(
    54534584,
    256722,
    '½ cup'
),
(
    22030319,
    238221,
    '1 cup'
),
(
    48672831,
    934784,
    '2 tsp'
),
(
    58540234,
    439843,
    '3 cups'
);


/*Creates a new user */
INSERT INTO User(username, email, password, dateJoined) VALUES (:usernameInput, :emailInput, :passwordInput, :dateJoinedInput);


/*Creates a new ingredient */
INSERT INTO Ingredient(name, category, unitOfMeasurement) VALUES (:nameInput, :categoryInput, :unitOfMeasurementInput);


/*Creates a new recipe */
INSERT INTO Recipe(title, description, prepTime, cookTime, servingSize, instructions, dateAdded) VALUES (:titleInput, :descriptionInput, :prepTimeInput, :cookTimeInput, :servingSizeInput, :instructionsInput, :dateAddedInput);


/*Creates a new review */
INSERT INTO Review(recipeID, userID, rating, comment, datePosted) VALUES (:recipeIDInput, :userIDInput, :ratingInput, :commentInput, :datePostedInput);

/*Creates a new recipe ingredient */
INSERT INTO RecipeIngredient(recipeID, ingredientID, quantity) VALUES (:recipeIDInput, :ingredientIDInput, :quantityInput);


/* Deletes a recipe ingredient */
DELETE FROM RecipeIngredient WHERE recipeID = :recipeIDInput AND ingredientID = :ingredientIDInput;

/* Deletes an ingredient*/
DELETE FROM Ingredient WHERE ingredientID = :ingredientIDInput;

/* Deletes a review */
DELETE FROM Review WHERE reviewID = :reviewIDInput;

/* Deletes from a recipe*/
DELETE FROM Recipe WHERE recipeID = :recipeIDInput;

/*Deletes from a user*/
DELETE FROM User WHERE userID = :userIDInput;


/*Updates a review*/
UPDATE FROM Recipe SET title = :titleInput, description = :descriptionInput, prepTime = :prepTimeInput, cookTime = :cookTimeInput, servingSize = :servingSizeInput, instructions = :instructionsInput, dateAdded = :dateAddedInput WHERE recipeID = :recipeIDInput;

/*Updates a user*/
UPDATE FROM User SET username = :usernameInput, email = :emailInput, password = :passwordInput, dateJoined = :dateJoinedInput WHERE userID = :userIDInput;

/*Updates an ingredient*/
UPDATE FROM Ingredient SET name = :nameInput, category = :categoryInput, unitOfMeasurement = :unitOfMeasurementInput WHERE ingredientID = :ingredientIDInput;

/*Updates a recipe ingredient*/
UPDATE FROM RecipeIngredient SET quantity = :quantityInput WHERE recipeID = :recipeIDInput AND ingredientID = :ingredientIDInput;

/*Updates a review*/
UPDATE FROM Review SET recipeID = :recipeIDInput, userID = :userIDInput, rating = :ratingInput, comment = :commentInput, datePosted = :datePostedInput WHERE reviewID = :reviewIDInput;


/* Display user table*/
SELECT * FROM User;

/* Display ingredient table*/
SELECT * FROM Ingredient;

/* Display recipe table*/
SELECT * FROM Recipe;

/* Display review table*/
SELECT * FROM Review;

/* Display recipe ingredient table*/
SELECT * FROM RecipeIngredient;

/* Show all reviews for a specific recipe */
SELECT User.username, Recipe.title
FROM User
INNER JOIN Review ON User.userID = Review.userID
INNER JOIN Recipe ON Review.recipeID = Recipe.recipeID;

/* Show all ingredients for a specific recipe */
SELECT Ingredient.name, Recipe.title
FROM Ingredient
INNER JOIN RecipeIngredient ON Ingredient.ingredientID = RecipeIngredient.ingredientID

/* Show all reviews for a specific user */
SELECT User.username, Review.comment
FROM User
INNER JOIN Review ON User.userID = Review.userID;

/* Show all recipes for a specific user */
SELECT User.username, Recipe.title
FROM User
INNER JOIN Recipe ON User.userID = Recipe.userID;

