CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    pw VARCHAR(255) NOT NULL
);

CREATE TABLE food_products (
    id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    user_id INT,
    CONSTRAINT fk_users
        FOREIGN KEY(user_id)
            REFERENCES users(id)
);

CREATE TABLE recipes (
    id INT NOT NULL PRIMARY KEY,
    recipe_name VARCHAR(255),
    tags VARCHAR[],
    user_id INT,
    CONSTRAINT fk_users
        FOREIGN KEY(user_id)
            REFERENCES users(id)
);

CREATE TABLE recipe_sections (
    id INT NOT NULL PRIMARY KEY,
    subtitle VARCHAR(255),
    in_order INT NOT NULL,
    recipe_id INT,
    CONSTRAINT fk_recipes
        FOREIGN KEY(recipe_id)
            REFERENCES recipes(id)
            ON DELETE CASCADE
);

CREATE TABLE ingredients (
    id INT NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    quantity INT,
    unit VARCHAR(255),
    section_id INT,
    product_id INT,
    CONSTRAINT fk_recipe_sections
        FOREIGN KEY(section_id)
            REFERENCES recipe_sections(id),
    CONSTRAINT fk_food_products
        FOREIGN KEY(product_id)
            REFERENCES food_products(id)
);

CREATE TABLE preparation (
    id INT NOT NULL PRIMARY KEY,
    step_text VARCHAR(255),
    in_order INT NOT NULL,
    section_id INT,
    CONSTRAINT fk_recipe_sections
        FOREIGN KEY(section_id)
            REFERENCES recipe_sections(id)
);
