DROP TABLE `product` IF EXISTS;
DROP TABLE `user` IF EXISTS;

CREATE TABLE `product`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT,
    `sku`        varchar(60)             DEFAULT '' COMMENT '상품 식별값',
    `name`       varchar(125)   NOT NULL COMMENT '상품명',
    `price`      decimal(12, 2) NOT NULL COMMENT '가격',
    `quantity`   int            NOT NULL COMMENT '재고량',
    `created_at` datetime       NOT NULL DEFAULT current_timestamp(),
    `updated_at` datetime                DEFAULT current_timestamp(),
    `deleted_at` datetime                DEFAULT NULL,
    `viewed`     int            NOT NULL DEFAULT 0,
    `total_liked` int            NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
);

CREATE TABLE `user`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT,
    `email`      varchar(120) NOT NULL DEFAULT '',
    `name`       varchar(45)           DEFAULT '',
    `created_at` datetime     NOT NULL DEFAULT current_timestamp(),
    `deleted_at` datetime              DEFAULT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `liked`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT,
    `user_id`    bigint(20),
    `product_id` bigint(20),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES user (`id`),
    FOREIGN KEY (`product_id`) REFERENCES product (`id`)
);