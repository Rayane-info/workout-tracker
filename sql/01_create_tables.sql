"LANGUAGE IS SQL (H2)"

CREATE TABLE IF NOT EXISTS athlete(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    genre VARCHAR(16) NOT NULL,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    weight FLOAT NOT NULL,
    height INTEGER NOT NULL,    
)
 
CREATE TABLE IF NOT EXISTS workout(
    id_workout INTEGER AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    type VARCHAR(255),
    duration INTEGER NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)

CREATE TABLE IF NOT EXISTS workout_set(
    id_set INTEGER AUTO_INCREMENT PRIMARY KEY,
    repetitions INTEGER,
    duration_seconds INTEGER,
    weight FLOAT,
    optional VARCHAR(255),
    workout_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    FOREIGN KEY (workout_id) REFERENCES workout(id_workout),
    FOREIGN KEY (exercise_id) REFERENCES exercise(id_exercise)
)

CREATE TABLE IF NOT EXISTS exercise(
    id_exercise INTEGER AUTO_INCREMENT PRIMARY KEY,
    exercise_name VARCHAR(255) NOT NULL,
    optional_description VARCHAR(255)
)

CREATE TABLE IF NOT EXISTS meal(
    id_meal INTEGER AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    meal_type VARCHAR(255) NOT NULL,
    calories INTEGER NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)

CREATE TABLE IF NOT EXISTS aliment(
    id_aliment INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity FLOAT NOT NULL,
    calories_per_100g FLOAT NOT NULL
    protein_per_100g FLOAT NOT NULL,
    carbs_per_100g FLOAT NOT NULL,
    fats_per_100g FLOAT NOT NULL,
)

CREATE TABLE IF NOT EXISTS hydration(
    id_hydration INTEGER AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    volume FLOAT NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)


CREATE TABLE IF NOT EXISTS sleep(
    id_sleep INTEGER AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    duration INTEGER NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)

CREATE TABLE IF NOT EXISTS meal_aliment(
    meal_id INTEGER NOT NULL,
    aliment_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    PRIMARY KEY (meal_id, aliment_id),
    FOREIGN KEY (meal_id) REFERENCES meal(id_meal),
    FOREIGN KEY (aliment_id) REFERENCES aliment(id_aliment)
)

CREATE TABLE IF NOT EXISTS athlete_goal(
    id_goal INTEGER AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    target_date DATE NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)

CREATE TABLE IF NOT EXISTS progress(
    id_progress INTEGER AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    weight FLOAT NOT NULL,
    body_fat_percentage FLOAT NOT NULL,
    muscle_mass FLOAT NOT NULL,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)

CREATE TABLE IF NOT EXISTS injury(
    id_injury INTEGER AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    recovery_date DATE,
    athlete_id INTEGER NOT NULL,
    FOREIGN KEY (athlete_id) REFERENCES athlete(id)
)
