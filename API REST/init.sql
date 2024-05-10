CREATE TABLE recetas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ingredientes TEXT NOT NULL,
    instrucciones TEXT NOT NULL
);
