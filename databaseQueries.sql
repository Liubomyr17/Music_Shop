CREATE TABLE category (
    id IDENTITY,
    name VARCHAR(50),
    description VARCHAR(255),
    image_url VARCHAR(50),
    is_active BOOLEAN,

    CONSTRAINT pk_category_id PRIMARY KEY (id)

    );

CREATE TABLE user_detail (
    id IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    enabled BOOLEAN,
    password VARCHAR(60),
    email VARCHAR(100),
    contact_number VARCHAR(15),
    CONSTRAINT pk_user_id PRIMARY KEY(id)
);

CREATE TABLE product (
                         id IDENTITY,
                         code VARCHAR(20),
                         name VARCHAR(50),
                         brand VARCHAR(50),
                         description VARCHAR(255),
                         unit_price DECIMAL(10,2),
                         quantity INT,
                         is_active BOOLEAN,
                         category_id INT,
                         supplier_id INT,
                         purchases INT DEFAULT 0,
                         views INT DEFAULT 0,
                         CONSTRAINT pk_product_id PRIMARY KEY (id),
                         CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
                         CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),
);

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);

-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id) REFERENCES cart (id),
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);



-- adding three categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Laptop', 'This is description for Laptop category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Television', 'This is description for Television category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Mobile', 'This is description for Mobile category!', 'CAT_3.png', true);

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ( 'Igor', 'Gordiy', 'ADMIN', true, '$2b$10$P78H64X2cVgexRsjayM3Juj64l0kApdrVPlWNvZsnSlmmOmxrFybW', 'gordiy@gmail.com', '+380677777777' );

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ( 'Liubomur', 'Izdepskyi', 'SUPPLIER', true, '$2b$10$dBZ5pkMRTIgRXAavhhNKUOcyuTom9uUQY.aoRlUrtoGrecMV3F2aK', 'lizdepskij@gmail.com', '+380673478692' );

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Zakhar', 'Gordiy', 'ADMIN', true, '$2a$10$K81Kx79lBJZjuEM47qwOkeHkEVIFQmio.OKzh7OZQZ9x5gxTY1V6S', 'zg@gmail.com', '+38(077)7777777');



INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone 10s', 'apple', 'This is one of the best phone available in the market right now!', 800, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 'A smart phone by samsung!', 300, 2, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', 500, 5, true, 3, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', 400, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', 480, 5, true, 1, 3, 0, 0 );
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBD41B8F6C5', 'Oppo Selfie S53', 'Oppo', 'This is one of the best mobile phone from Oppo that can be used!', 250, 2, true, 2, 3, 0, 0 );

-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping)
VALUES (4, '102 Sabarmati Society, Mahatma Gandhi Road', 'Near Salt Lake, Gandhi Nagar', 'Ahmedabad', 'Gujarat', 'India', '111111', true, false );
-- adding a cart for testing
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);
