BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `user` (
	`id`	INTEGER NOT NULL,
	`username`	VARCHAR ( 80 ) UNIQUE,
	`email`	VARCHAR ( 120 ) UNIQUE,
	`password_hash`	VARCHAR,
	PRIMARY KEY(`id`)
);
INSERT INTO `user` VALUES (1,'micdoher','micdoher@gmail.com','pbkdf2:sha256:50000$6LwAXFkA$df7b643ab0ee3b82e223aa2596fd7baae2bd4fd4612072b06eea4673dc62818e');
CREATE TABLE IF NOT EXISTS `bookmark` (
	`id`	INTEGER NOT NULL,
	`food_word_1`	TEXT NOT NULL,
	`food_word_2`	TEXT NOT NULL,
	`food_word_3`	TEXT NOT NULL,
	`date`	DATETIME,
	`amount`	INTEGER NOT NULL,
	`mood`	INTEGER NOT NULL,
	`user_id`	INTEGER NOT NULL,
	FOREIGN KEY(`user_id`) REFERENCES `user`(`id`),
	PRIMARY KEY(`id`)
);
INSERT INTO `bookmark` VALUES (1,'chillies','chillies','chillies','2018-02-19 09:04:54.122229',33,'high',1);
INSERT INTO `bookmark` VALUES (2,'chillies','chillies','chillies','2018-02-19 09:05:45.482568',3,'high',1);
INSERT INTO `bookmark` VALUES (3,'chillies','chillies','chillies','2018-02-19 09:06:33.069685',2,'high',1);
COMMIT;
