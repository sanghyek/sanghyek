CREATE TABLE `board` (
  `number` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `writer` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `hits` int(11) NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8