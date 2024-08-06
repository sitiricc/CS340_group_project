
-- SELECT statements ----------------------------------------------------------
    SELECT * FROM Users;
    SELECT * FROM Ingredients;
    SELECT * FROM Recipes;
    SELECT * FROM Reviews;
    SELECT * FROM RecipeIngredients;


-- INSERT -----------------------------------------------------------------------
    -- Insert a new user
    INSERT INTO Users(username, email, password, dateJoined) 
        VALUES (:usernameInput, :emailInput, :passwordInput, :dateJoinedInput);
    
    -- Insert a new ingredient
    INSERT INTO Ingredients(name, category, unitOfMeasurement) 
        VALUES (:nameInput, :categoryInput, :unitOfMeasurementInput);
    
    -- Insert a new recipe
    INSERT INTO Recipes(title, description, prepTimeInMin, cookTimeinMin, servingSize, instructions, dateAdded) 
        VALUES (:titleInput, :descriptionInput, :prepTimeInMinInput, :cookTimeInMinInput, :servingSizeInput, :instructionsInput, :dateAddedInput);
    
    -- Insert a new review
    INSERT INTO Reviews(recipeID, userID, rating, comment, datePosted) 
        VALUES (:recipeIDInput, :userIDInput, :ratingInput, :commentInput, :datePostedInput);
    
    -- Insert a new recipe ingredient
    INSERT INTO RecipeIngredients(recipeID, ingredientID, quantity) 
        VALUES (:recipeIDInput, :ingredientIDInput, :quantityInput, :unitOfMeasurementInput);

-- SELECT ------------------------------------------------------------------------
    -- RECIPES table
        -- Show all reviews for a specific recipe
        SELECT Recipes.title, Reviews.rating, Reviews.comment
        FROM Recipes
        INNER JOIN Reviews ON Recipes.recipeID = Reviews.recipeID;

        -- Show all ingredients for a specific recipe
        SELECT Ingredients.name, RecipeIngredients.quantity
        FROM Ingredients
        INNER JOIN RecipeIngredients ON Ingredients.ingredientID = RecipeIngredients.ingredientID;

    -- USERS table
        -- Show all reviews for a user by username
        SELECT Users.username, Reviews.rating, Reviews.comment
        FROM Users
        INNER JOIN Reviews ON Users.userID = Reviews.userID;

        -- Show all recipes for a user by username
        SELECT Users.username, Recipes.title
        FROM Users
        INNER JOIN Recipes ON Users.userID = Recipes.userID;

    -- INGREDIENTS table
        -- Show all recipes that use a specific ingredient
        SELECT Ingredients.name, Recipes.title
        FROM Ingredients
        INNER JOIN RecipeIngredients ON Ingredients.ingredientID = RecipeIngredients.ingredientID
        INNER JOIN Recipes ON RecipeIngredients.recipeID = Recipes.recipeID;

        -- Show all ingredients in a specific category
        SELECT Ingredients.name, Ingredients.category
        FROM Ingredients
        WHERE Ingredients.category = Ingredients.category;

    -- REVIEWS table
        -- Show reviews in ascending order by rating
        SELECT Reviews.rating, Reviews.comment
        FROM Reviews
        ORDER BY Reviews.rating ASC;

        -- Show reviews in descending order by rating
        SELECT Reviews.rating, Reviews.comment
        FROM Reviews
        ORDER BY Reviews.rating DESC;

        -- FILTER/SEARCH: Show reviews with a specific rating
        SELECT Reviews.rating, Reviews.comment
        FROM Reviews
        WHERE Reviews.rating = :ratingInput;

-- DELETE ------------------------------------------------------------------------
    -- Delete a recipe ingredient
    DELETE FROM RecipeIngredients 
    WHERE recipeID = :recipeIDInput 
    AND ingredientID = :ingredientIDInput 
    AND unitOfMeasurement = :unitOfMeasurementInput;

    -- Delete an ingredient by ingredientID
    DELETE FROM Ingredients 
    WHERE ingredientID = :ingredientIDInput;

    -- Delete an ingredient by name
    DELETE FROM Ingredients 
    WHERE name = :nameInput;


    -- Delete a review by reviewID
    DELETE FROM Reviews 
    WHERE reviewID = :reviewIDInput;

    -- Delete a review by title
    DELETE FROM Reviews 
    WHERE title = :titleInput;

    -- Delete a review by userID
    DELETE FROM Reviews 
    WHERE userID = :userIDInput;

    -- Delete a review by username
    DELETE FROM Reviews 
    WHERE username = :usernameInput;

    -- Delete a recipe by recipeID
    DELETE FROM Recipes 
    WHERE recipeID = :recipeIDInput;

    -- Delete a recipe by title
    DELETE FROM Recipes 
    WHERE title = :titleInput;

    -- Delete a user by userID
    DELETE FROM Users 
    WHERE userID = :userIDInput;

    -- Delete a user by username
    DELETE FROM Users 
    WHERE username = :usernameInput;

-- UPDATE ------------------------------------------------------------------------
    -- Update a review
    UPDATE Reviews
    SET rating = :ratingInput, comment = :commentInput
    WHERE reviewID = :reviewIDInput;

    -- Update a user
    UPDATE Users
    SET username = :usernameInput, email = :emailInput, password = :passwordInput, dateJoined = :dateJoinedInput
    WHERE userID = :userIDInput;

    -- Update an ingredient
    UPDATE Ingredients
    SET name = :nameInput, category = :categoryInput, unitOfMeasurement = :unitOfMeasurementInput
    WHERE ingredientID = :ingredientIDInput;

    -- Update a recipe ingredient
    UPDATE RecipeIngredients
    SET quantity = :quantityInput
    WHERE recipeID = :recipeIDInput
    AND ingredientID = :ingredientIDInput
    AND unitOfMeasurement = :unitOfMeasurementInput;

    -- Update a recipe
    UPDATE Recipes
    SET title = :titleInput, description = :descriptionInput, prepTimeInMin = :prepTimeinMinInput, cookTimeInMin = :cookTimeInMinInput, servingSize = :servingSizeInput, instructions = :instructionsInput, dateAdded = :dateAddedInput
    WHERE recipeID = :recipeIDInput;

    

    

    















