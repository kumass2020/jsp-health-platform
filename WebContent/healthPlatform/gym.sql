CREATE TABLE `gym` (
  `gym_id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_name` varchar(15) NOT NULL,
  `gym_address` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`gym_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;