CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_name` varchar(15) NOT NULL,
  `gym_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`trainer_id`),
  FOREIGN KEY (`gym_id`) REFERENCES `user`(`gym_id`)
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;