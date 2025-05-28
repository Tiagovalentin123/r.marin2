# Adaptação do Script SQL para PostgreSQL

-- Tabela: Product
CREATE TABLE IF NOT EXISTS product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    price FLOAT NOT NULL,
    image_url VARCHAR(200) NULL,
    stock INT DEFAULT 0
);

-- Tabela: Customer
CREATE TABLE IF NOT EXISTS customer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    phone VARCHAR(20) NULL,
    address VARCHAR(200) NULL
);

-- Tabela: "order" (usar aspas pois Order é uma palavra reservada)
CREATE TABLE IF NOT EXISTS "order" (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount FLOAT NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    payment_method VARCHAR(50) NULL,
    payment_intent_id VARCHAR(255) NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Tabela: OrderItem
CREATE TABLE IF NOT EXISTS order_item (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES "order"(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Notas:
-- 1. PostgreSQL usa SERIAL em vez de AUTO_INCREMENT para colunas de incremento automático
-- 2. TIMESTAMP é usado em vez de DATETIME
-- 3. As aspas são necessárias para a tabela "order" pois é uma palavra reservada
-- 4. Não é necessário especificar ENGINE ou CHARSET no PostgreSQL
