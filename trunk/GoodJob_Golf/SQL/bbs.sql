CREATE TABLE IF NOT EXISTS `notice_bbs` (
  `idx` int(11) NOT NULL auto_increment,
  `mem_id` varchar(50) default NULL,
  `name` varchar(30) default NULL,
  `email` varchar(100) default NULL,
  `subject` varchar(255) default NULL,
  `content` text,
  `password` varchar(20) default NULL,
  `readcount` int(5) default NULL,
  `write_date` varchar(15) default NULL,
  `filename` varchar(100) default NULL,
  `position` varchar(100) default NULL,
  `thread` int(11) default NULL,
  `ishtml` char(1) default NULL,
  `writeip` varchar(15) default NULL,
  `notice` char(1) default NULL,
  PRIMARY KEY  (`idx`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;