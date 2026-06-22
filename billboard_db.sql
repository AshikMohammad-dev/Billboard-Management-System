CREATE TABLE login (
    login_id INT PRIMARY KEY AUTO_INCREMENT,
    login_username VARCHAR(45),
    login_password VARCHAR(45),
    login_role VARCHAR(45)
);

CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location_name VARCHAR(45),
    location_address VARCHAR(60)
);

CREATE TABLE billboard_size (
    billboardsize_id INT PRIMARY KEY AUTO_INCREMENT,
    billboard_size VARCHAR(45)
);

CREATE TABLE location_size (
    locationsize_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    billboardsize_id INT,
    price FLOAT,
    status VARCHAR(45),

    FOREIGN KEY (location_id)
        REFERENCES location(location_id),

    FOREIGN KEY (billboardsize_id)
        REFERENCES billboard_size(billboardsize_id)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(45),
    contact_person VARCHAR(45),
    phone BIGINT
);


CREATE TABLE billboard_purchase (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    locationsize_id INT,
    start_date DATE,
    duration INT,
    amount FLOAT,

    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),

    FOREIGN KEY (locationsize_id)
        REFERENCES location_size(locationsize_id)
);

CREATE TABLE inspector (
    inspector_id INT PRIMARY KEY AUTO_INCREMENT,
    login_id INT,
    inspector_name VARCHAR(45),
    phone BIGINT,

    FOREIGN KEY (login_id)
        REFERENCES login(login_id)
);

CREATE TABLE work_allocation (
    work_id INT PRIMARY KEY AUTO_INCREMENT,
    inspector_id INT,
    purchase_id INT,
    assigned_date DATE,
    work_description VARCHAR(45),
    status VARCHAR(45),

    FOREIGN KEY (inspector_id)
        REFERENCES inspector(inspector_id),

    FOREIGN KEY (purchase_id)
        REFERENCES billboard_purchase(purchase_id)
);

CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    payment_status VARCHAR(45),

    FOREIGN KEY (purchase_id)
        REFERENCES billboard_purchase(purchase_id)
);



