CREATE TABLE `time` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_start` varchar(30) NOT NULL,
  `time_duration` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`time_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;