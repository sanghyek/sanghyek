CREATE TABLE `withme` (
  `num` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `people` int(11) NOT NULL,
  `limit` varchar(200) DEFAULT NULL,
  `photo` varchar(200) NOT NULL,
  `pic1` varchar(200) DEFAULT NULL,
  `pic2` varchar(200) DEFAULT NULL,
  `pic3` varchar(200) DEFAULT NULL,
  `pic4` varchar(200) DEFAULT NULL,
  `writedate` date NOT NULL,
  `limitdate` date NOT NULL,
  `writer` varchar(50) NOT NULL,
  `localcontent` varchar(100) NOT NULL,
  `contents` varchar(2000) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8