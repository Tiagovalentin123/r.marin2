-- Estrutura da Base de Dados R.MARIN para MySQL

-- Tabela: Product
CREATE TABLE IF NOT EXISTS `product` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT NULL,
    `price` FLOAT NOT NULL,
    `image_url` VARCHAR(200) NULL,
    `stock` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela: Customer
CREATE TABLE IF NOT EXISTS `customer` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `phone` VARCHAR(20) NOT NULL,
    `address` VARCHAR(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela: `Order` (usar backticks pois Order é uma palavra reservada)
CREATE TABLE IF NOT EXISTS `order` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `customer_id` INT NOT NULL,
    `order_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `total_amount` FLOAT NOT NULL,
    `status` VARCHAR(50) DEFAULT 'Pending',
    `payment_method` VARCHAR(50) NULL, -- Adicionado com base no código das rotas
    `payment_intent_id` VARCHAR(255) NULL, -- Adicionado com base no código das rotas
    FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela: OrderItem
CREATE TABLE IF NOT EXISTS `order_item` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `price` FLOAT NOT NULL, -- Preço no momento da encomenda
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`product_id`) REFERENCES `product`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Notas:
-- 1. `ENGINE=InnoDB` é usado para suportar transações e chaves estrangeiras.
-- 2. `DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci` é recomendado para bom suporte a caracteres internacionais.
-- 3. A coluna `payment_method` e `payment_intent_id` foram inferidas da lógica da aplicação e adicionadas à tabela `order`.
-- 4. `ON DELETE CASCADE` foi adicionado à chave estrangeira `order_id` na tabela `order_item` para que os itens da encomenda sejam eliminados se a encomenda for eliminada.

