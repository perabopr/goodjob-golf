ALTER TABLE `savekorea2400`.`tb_golflink` ADD COLUMN `cancel_rule_nh` TEXT AFTER `cancel_rule`;

CREATE TABLE `tb_order_memo` (
  `reserve_uid` varchar(100) NOT NULL,
  `memo` text,
  `reg_dt` datetime default NULL,
  `up_dt` datetime default NULL,
  PRIMARY KEY  (`reserve_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
