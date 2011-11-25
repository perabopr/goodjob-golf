
CREATE TABLE tb_member (
  MEM_NO int(11) NOT NULL auto_increment,
  MEM_ID varbinary(100) NOT NULL,
  MEM_NAME varbinary(20) NOT NULL,
  MEM_PWD varbinary(20) NOT NULL,
  MEM_MTEL varbinary(13) default NULL,
  SMS_YN char(1) default NULL,
  EMAIL_YN char(1) default NULL,
  RECOMMEND varbinary(100) default NULL,
  SECESSION char(1) default 'N',
  SECESSION_DT datetime default NULL,
  REG_DT varbinary(20) default NULL,
  LOGIN_DT varbinary(20) default NULL,
  LOGIN_ATTEMPT int(1) default '0',
  PRIMARY KEY  (MEM_NO),
  UNIQUE KEY u_mem_id (MEM_ID),
  KEY index_secession (SECESSION)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
