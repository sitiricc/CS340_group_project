
CREATE OR REPLACE TABLE User (
    userID INT AUTO_INCREMENT UNIQUE NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    dateJoined DATE NOT NULL,
    PRIMARY KEY (userID)
);


CREATE OR REPLACE TABLE Ingredient (
    ingredientID INT AUTO_INCREMENT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    unitOfMeasurement VARCHAR(255),
    PRIMARY KEY (ingredientID)
);

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

CREATE OR REPLACE TABLE RecipeIngredient (
    recipeID INT,
    ingredientID INT,
    quantity VARCHAR(255),
    PRIMARY KEY (recipeID, ingredientID),
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID),
    FOREIGN KEY (ingredientID) REFERENCES Ingredient(ingredientID)
);
