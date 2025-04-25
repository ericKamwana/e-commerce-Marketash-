USE marketash_db;
-- 1. FARM TABLE
CREATE TABLE farm (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    farmer_name VARCHAR(100),
    location VARCHAR(255),
    contact_info VARCHAR(100)
);

-- 2. PRODUCT CATEGORY
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) -- e.g., Crops, Livestock, Nuts & Seeds
);

-- 3. PRODUCT TABLE
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    farm_id INT,
    base_price_per_kg DECIMAL(10,2),
    description TEXT,
    harvest_date DATE,
    organic_certified BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (farm_id) REFERENCES farm(farm_id)
);

-- 4. PRODUCT ITEM (Batch or Listing)
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity_kg DECIMAL(10,2),
    quantity_units INT,
    available_from DATE,
    expiry_date DATE,
    price DECIMAL(10,2),
    status ENUM('available', 'reserved', 'sold') DEFAULT 'available',
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 5. PRODUCT ATTRIBUTES
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_name VARCHAR(100), -- e.g., Breed, Variety
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- product_image
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- color
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50)
);
-- product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    variation_name VARCHAR(100), -- e.g., "Grade A", "Pack of 10", etc.
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);
-- size_category +  size_option
CREATE TABLE size_category (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) -- e.g., "Animal Size", "Packaging Weight"
);

CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_cat_id INT,
    label VARCHAR(50),     -- e.g., "Small", "Medium", "Large", "50kg"
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);
-- attribute_category +  attribute_type
CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('text', 'number', 'boolean')
);
-- Then, update product_attribute to use them:
ALTER TABLE product_attribute
ADD attr_cat_id INT,
ADD attr_type_id INT,
ADD FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
ADD FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id);

-- Buyer Bidding System
CREATE TABLE bid (
    bid_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    buyer_name VARCHAR(100),
    bid_amount DECIMAL(10,2),
    bid_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);
-- AI Diagnostic Records
CREATE TABLE diagnostic_record (
    diag_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT,
    image_url VARCHAR(255),
    diagnosis TEXT,
    suggested_action TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (farm_id) REFERENCES farm(farm_id)
);
-- Logistics Tracking
CREATE TABLE logistics (
    logistics_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    status ENUM('pending', 'in_transit', 'delivered') DEFAULT 'pending',
    delivery_date DATE,
    tracking_code VARCHAR(100),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);
-- Payment History
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    amount_paid DECIMAL(10,2),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50),
    transaction_ref VARCHAR(100),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);