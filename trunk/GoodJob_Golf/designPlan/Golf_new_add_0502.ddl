ALTER TABLE `savekorea2400`.`tb_golflink_reserve` ADD COLUMN `site_seq` INT(2) NOT NULL DEFAULT '1' AFTER `card_bill_num`;
ALTER TABLE `savekorea2400`.`tb_package_reserve` ADD COLUMN `site_seq` INT(2) NOT NULL DEFAULT '1' AFTER `card_bill_num`;
ALTER TABLE `savekorea2400`.`tb_condo_reserve` ADD COLUMN `site_seq` INT(2) NOT NULL DEFAULT '1' AFTER `card_bill_num`;
