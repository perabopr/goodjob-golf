CREATE TABLE IF NOT EXISTS `TB_NOTICE_BBS` (
  `seq` int(11) NOT NULL auto_increment,
  `mem_id` varchar(50) default NULL,
  `name` varchar(30) default NULL,
  `email` varchar(100) default NULL,
  `subject` varchar(255) default NULL,
  `content` text,
  `password` varchar(20) default NULL,
  `readcount` int(5) default NULL,
  `write_date`DATETIME,
  `filename` varchar(100) default NULL,
  `position` varchar(100) default NULL,
  `thread` int(11) default NULL,
  `ishtml` char(1) default NULL,
  `writeip` varchar(15) default NULL,
  `notice` char(1) default NULL,
  PRIMARY KEY  (`seq`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `TB_FAQ_BBS` (
  `seq` int(11) NOT NULL auto_increment,
  `mem_id` varchar(50) default NULL,
  `name` varchar(30) default NULL,
  `email` varchar(100) default NULL,
  `subject` varchar(255) default NULL,
  `content` text,
  `password` varchar(20) default NULL,
  `readcount` int(5) default NULL,
  `write_date` DATETIME,
  `filename` varchar(100) default NULL,
  `position` varchar(100) default NULL,
  `thread` int(11) default NULL,
  `ishtml` char(1) default NULL,
  `writeip` varchar(15) default NULL,
  `notice` char(1) default NULL,
  PRIMARY KEY  (`seq`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- join_bbs --
CREATE TABLE `savekorea`.`TB_JOIN_BBS` (
  `join_no` INT NOT NULL AUTO_INCREMENT,
  `join_name` VARBINARY(30),
  `tel1` CHAR(3),
  `tel2` CHAR(4),
  `tel3` CHAR(4),
  `region` CHAR(1),
  `golflink_name` VARBINARY(100),
  `sex` CHAR(1),
  `age` CHAR(2),
  `join_person` SMALLINT(0),
  `rounding_dt` VARBINARY(15),
  `price_info1` VARBINARY(10),
  `price_info2` VARBINARY(10),
  `price_info3` VARBINARY(10),
  `content` TEXT,
  readcount SMALLINT(6) default 0,
  apply_count SMALLINT(2) default 0,
  join_status CHAR(1),
  `reg_dt` DATETIME,
  PRIMARY KEY(join_no)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `savekorea`.`TB_JOIN_COMMENT` (
  `cmt_no` INT NOT NULL  AUTO_INCREMENT,
  `join_no` INT NOT NULL,
  `cmt_name` VARBINARY(30),
  `comment` TEXT,
  `reg_dt` DATETIME,
  PRIMARY KEY(cmt_no)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
