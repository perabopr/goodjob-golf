
CREATE TABLE tb_sms_auth (
  idx int(11) NOT NULL auto_increment,
  tel_no varbinary(13) NOT NULL,
  auth_no int(5) NOT NULL,
  send_date int(11) NOT NULL,
  PRIMARY KEY  (idx),
  UNIQUE KEY auth_no (auth_no)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
