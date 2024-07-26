/*Creates a new user */
INSERT INTO Users(username, email, password, dateJoined) VALUES (:usernameInput, :emailInput, :passwordInput, :dateJoinedInput);


/*Creates a new ingredient */
INSERT INTO Ingredients(name, category, unitOfMeasurement) VALUES (:nameInput, :categoryInput, :unitOfMeasurementInput);


/*Creates a new recipe */
INSERT INTO Recipes(title, description, prepTimeInMin, cookTimeinMin, servingSize, instructions, dateAdded) VALUES (:titleInput, :descriptionInput, :prepTimeInMinInput, :cookTimeInMinInput, :servingSizeInput, :instructionsInput, :dateAddedInput);


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
UPDATE FROM Recipes SET title = :titleInput, description = :descriptionInput, prepTimeInMin = :prepTimeinMinInput, cookTimeInMin = :cookTimeInMinInput, servingSize = :servingSizeInput, instructions = :instructionsInput, dateAdded = :dateAddedInput WHERE recipeID = :recipeIDInput;

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
