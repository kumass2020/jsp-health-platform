CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_birth` varchar(10) NOT NULL,
  `user_phone_num` varchar(20) DEFAULT NULL,
  `user_memo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;