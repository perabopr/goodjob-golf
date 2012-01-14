DROP TABLE IF EXISTS tb_coupon;
DROP TABLE IF EXISTS TB_CONDO_PROMISE;
DROP TABLE IF EXISTS tb_logon_history;
DROP TABLE IF EXISTS tb_sms_log;
DROP TABLE IF EXISTS tb_sms_auth;
DROP TABLE IF EXISTS tb_join_comment;
DROP TABLE IF EXISTS tb_notice_bbs / tb_faq_bbs;
DROP TABLE IF EXISTS tb_join_bbs;
DROP TABLE IF EXISTS tb_member;
DROP TABLE IF EXISTS TB_CONDO_RESERVE;
DROP TABLE IF EXISTS TB_PACKAGE_RESERVE;
DROP TABLE IF EXISTS TB_PACKAGE_PROMISE;
DROP TABLE IF EXISTS TB_GOLFLINK_PROMISE;
DROP TABLE IF EXISTS TB_GOLFLINK_PRICE;
DROP TABLE IF EXISTS TB_CONDO_ROOM;
DROP TABLE IF EXISTS TB_CONDO_GALLERY;
DROP TABLE IF EXISTS TB_CONDO;
DROP TABLE IF EXISTS TB_GOLFLINK_RESERVE;
DROP TABLE IF EXISTS TB_PACKAGE_PRICE;
DROP TABLE IF EXISTS TB_PACKAGE;
DROP TABLE IF EXISTS TB_GOLFLINK_COURSE;
DROP TABLE IF EXISTS TB_PRODUCT_SUB;
DROP TABLE IF EXISTS TB_PRODUCT;
DROP TABLE IF EXISTS TB_GOLFLINK;
DROP TABLE IF EXISTS TB_MENU;
DROP TABLE IF EXISTS TB_REGION;

/**********************************/
/* Table Name: 지역정보 */
/**********************************/
CREATE TABLE TB_REGION(
		region_seq                    		INT		 NOT NULL AUTO_INCREMENT,
		region_type                   		CHAR(1)		 DEFAULT '1'		 NOT NULL,
		region_name                   		VARCHAR(50)		 NOT NULL,
		region_etc                    		VARCHAR(100)		 NULL 
);

/**********************************/
/* Table Name: 메뉴정보 */
/**********************************/
CREATE TABLE TB_MENU(
		menu_seq                      		INT		 NOT NULL AUTO_INCREMENT,
		menu_name                     		VARCHAR(40)		 NOT NULL
);

/**********************************/
/* Table Name: 골프장정보 */
/**********************************/
CREATE TABLE TB_GOLFLINK(
		golflink_seq                  		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NULL ,
		golflink_name                 		VARCHAR(50)		 NOT NULL,
		region_seq                    		INT		 NULL ,
		holl_type                     		VARCHAR(50)		 NULL ,
		course_guide                  		VARCHAR(1000)		 NULL ,
		golflink_address1             		VARCHAR(100)		 NULL ,
		golflink_address2             		VARCHAR(100)		 NULL ,
		point_x                       		VARCHAR(20)		 NULL ,
		point_y                       		VARCHAR(20)		 NULL ,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub1                      		VARCHAR(50)		 NULL ,
		img_sub2                      		VARCHAR(50)		 NULL ,
		img_sub3                      		VARCHAR(50)		 NULL ,
		img_sub4                      		VARCHAR(50)		 NULL ,
		cancel_term                   		VARCHAR(2)		 NULL ,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		cancel_rule                   		TEXT		 NULL ,
		promise_rule                  		TEXT		 NULL ,
		use_guide                     		TEXT		 NULL ,
		golflink_guide                		TEXT		 NULL ,
		use_rule                      		TEXT		 NULL 
);

/**********************************/
/* Table Name: 상품메인정보 */
/**********************************/
CREATE TABLE TB_PRODUCT(
		product_seq                   		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NOT NULL,
		golflink_seq                  		INT		 NOT NULL,
		product_year                  		CHAR(4)		 NOT NULL,
		product_month                 		CHAR(2)		 NOT NULL,
		product_day                   		CHAR(2)		 NOT NULL,
		product_date                  		CHAR(8)		 NOT NULL,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

/**********************************/
/* Table Name: 일별상품상세정보 */
/**********************************/
CREATE TABLE TB_PRODUCT_SUB(
		productsub_seq                		INT		 NOT NULL AUTO_INCREMENT,
		product_seq                   		INT		 NOT NULL,
		golflink_course_seq           		INT		 NULL ,
		time_start                    		CHAR(4)		 NULL ,
		time_end                      		CHAR(4)		 NULL ,
		goodjob_price                 		INT		 NOT NULL,
		NH_price                      		INT		 NOT NULL,
		product_status                		CHAR(1)		 DEFAULT '0'		 NULL 
);

/**********************************/
/* Table Name: 골프장코스 */
/**********************************/
CREATE TABLE TB_GOLFLINK_COURSE(
		golflink_course_seq           		INT		 NOT NULL AUTO_INCREMENT,
		golflink_seq                  		INT		 NOT NULL,
		course_name                   		VARCHAR(50)		 NOT NULL
);

/**********************************/
/* Table Name: 골프패키지 */
/**********************************/
CREATE TABLE TB_PACKAGE(
		package_seq                   		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NULL ,
		package_name1                 		VARCHAR(50)		 NOT NULL,
		package_name2                 		VARCHAR(50)		 NULL ,
		region_seq                    		INT		 NOT NULL,
		saledate_start                		VARCHAR(10)		 NULL ,
		saledate_end                  		VARCHAR(10)		 NULL ,
		package_type                  		VARCHAR(50)		 NOT NULL,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub                       		VARCHAR(50)		 NULL ,
		img_sub1                      		VARCHAR(50)		 NULL ,
		img_sub2                      		VARCHAR(50)		 NULL ,
		img_sub3                      		VARCHAR(50)		 NULL ,
		img_sub4                      		VARCHAR(50)		 NULL ,
		address1                      		VARCHAR(50)		 NULL ,
		address2                      		VARCHAR(50)		 NULL ,
		point_x                       		VARCHAR(20)		 NULL ,
		point_y                       		VARCHAR(20)		 NULL ,
		view_yn                       		CHAR(1)		 NULL ,
		package_guide                 		TEXT		 NULL ,
		use_guide                     		TEXT		 NULL ,
		golflink_guide                		TEXT		 NULL ,
		use_rule                      		TEXT		 NULL ,
		way_map                       		TEXT		 NULL ,
		userinfo_terms                		TEXT		 NULL 
);

/**********************************/
/* Table Name: 패키지금액 */
/**********************************/
CREATE TABLE TB_PACKAGE_PRICE(
		package_seq                   		INT		 NOT NULL,
		peak_n_mon                    		INT		 NULL ,
		peak_n_tue                    		INT		 NULL ,
		peak_n_wed                    		INT		 NULL ,
		peak_n_thu                    		INT		 NULL ,
		peak_n_fri                    		INT		 NULL ,
		peak_n_sat                    		INT		 NULL ,
		peak_n_sun                    		INT		 NULL ,
		peak_s_mon                    		INT		 NULL ,
		peak_s_tue                    		INT		 NULL ,
		peak_s_wed                    		INT		 NULL ,
		peak_s_thu                    		INT		 NULL ,
		peak_s_fri                    		INT		 NULL ,
		peak_s_sat                    		INT		 NULL ,
		peak_s_sun                    		INT		 NULL ,
		off_n_mon                     		INT		 NULL ,
		off_n_tue                     		INT		 NULL ,
		off_n_wed                     		INT		 NULL ,
		off_n_thu                     		INT		 NULL ,
		off_n_fri                     		INT		 NULL ,
		off_n_sat                     		INT		 NULL ,
		off_n_sun                     		INT		 NULL ,
		off_s_mon                     		INT		 NULL ,
		off_s_tue                     		INT		 NULL ,
		off_s_wed                     		INT		 NULL ,
		off_s_thu                     		INT		 NULL ,
		off_s_fri                     		INT		 NULL ,
		off_s_sat                     		INT		 NULL ,
		off_s_sun                     		INT		 NULL 
);

/**********************************/
/* Table Name: 예약현황 */
/**********************************/
CREATE TABLE TB_GOLFLINK_RESERVE(
		reserve_seq                   		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NOT NULL,
		golflink_seq                  		INT		 NOT NULL,
		product_seq                   		INT		 NOT NULL,
		productsub_seq                		INT		 NOT NULL,
		reserve_day                   		DATETIME		 NOT NULL,
		reserve_name                  		VARCHAR(8)		 NOT NULL,
		reserve_uid                   		VARCHAR(50)		 NOT NULL,
		golflink_name                 		VARCHAR(50)		 NOT NULL,
		booking_day                   		CHAR(10)		 NOT NULL,
		booking_time_s                		CHAR(4)		 NOT NULL,
		booking_time_e                		CHAR(4)		 NULL ,
		golflink_course               		VARCHAR(50)		 NULL ,
		per_num                       		VARCHAR(2)		 NOT NULL,
		reserve_phone                 		VARCHAR(13)		 NOT NULL,
		product_price                 		INT		 NOT NULL,
		coupon_price                  		INT		 NOT NULL,
		process_status                		CHAR(1)		 DEFAULT 0		 NOT NULL,
		card_bill_num                 		VARCHAR(20)		 NULL 
);

/**********************************/
/* Table Name: 콘도예약 */
/**********************************/
CREATE TABLE TB_CONDO(
		condo_seq                     		INT		 NOT NULL AUTO_INCREMENT,
		condo_name                    		VARCHAR(50)		 NOT NULL,
		region_seq                    		INT		 NOT NULL,
		saledate_start                		VARCHAR(10)		 NULL ,
		saledate_end                  		VARCHAR(10)		 NULL ,
		img_main                      		VARCHAR(50)		 NULL ,
		address1                      		VARCHAR(50)		 NOT NULL,
		address2                      		VARCHAR(50)		 NOT NULL,
		point_x                       		VARCHAR(20)		 NULL ,
		point_y                       		VARCHAR(20)		 NULL ,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		reserve_start                 		VARCHAR(10)		 NULL ,
		reserve_end                   		VARCHAR(10)		 NULL ,
		condo_info                    		TEXT		 NULL ,
		detail_info                   		TEXT		 NULL ,
		way_map                       		TEXT		 NULL ,
		use_rule                      		TEXT		 NULL 
);

/**********************************/
/* Table Name: 콘도이미지갤러리 */
/**********************************/
CREATE TABLE TB_CONDO_GALLERY(
		condoimg_seq                  		INT		 NOT NULL AUTO_INCREMENT,
		condo_seq                     		INT		 NOT NULL,
		condo_img                     		VARCHAR(50)		 NOT NULL
);

/**********************************/
/* Table Name: 콘도예약객실 */
/**********************************/
CREATE TABLE TB_CONDO_ROOM(
		condoroom_seq                 		INT		 NOT NULL AUTO_INCREMENT,
		condo_seq                     		INT		 NOT NULL,
		roomtype                      		VARCHAR(50)		 NULL ,
		price_n1                      		INT		 NULL ,
		price_n2                      		INT		 NULL ,
		price_n3                      		INT		 NULL ,
		price_s1                      		INT		 NULL ,
		price_s2                      		INT		 NULL ,
		price_s3                      		INT		 NULL 
);

/**********************************/
/* Table Name: 골프장_가격 */
/**********************************/
CREATE TABLE TB_GOLFLINK_PRICE(
		golflink_seq                  		INT		 NOT NULL,
		price_type                    		VARCHAR(2)		 NOT NULL,
		golflink_price                		INT		 NOT NULL
);

/**********************************/
/* Table Name: 위약처리규정 */
/**********************************/
CREATE TABLE TB_GOLFLINK_PROMISE(
		golflink_seq                  		INT		 NOT NULL,
		promise1_type                 		VARCHAR(1000)		 NULL ,
		promise1                      		VARCHAR(1000)		 NULL ,
		promise2_type                 		VARCHAR(1000)		 NULL ,
		promise2                      		VARCHAR(1000)		 NULL ,
		promise3_type                 		VARCHAR(1000)		 NULL ,
		promise3                      		VARCHAR(1000)		 NULL ,
		promise4_type                 		VARCHAR(1000)		 NULL ,
		promise4                      		VARCHAR(1000)		 NULL ,
		promise5_type                 		VARCHAR(1000)		 NULL ,
		promise5                      		VARCHAR(1000)		 NULL ,
		cancelrule                    		TEXT		 NULL 
);

/**********************************/
/* Table Name: 패키지_위약처리규정 */
/**********************************/
CREATE TABLE TB_PACKAGE_PROMISE(
		package_seq                   		INT		 NOT NULL,
		promise1_type                 		VARCHAR(1000)		 NULL ,
		promise1                      		VARCHAR(1000)		 NULL ,
		promise2_type                 		VARCHAR(1000)		 NULL ,
		promise2                      		VARCHAR(1000)		 NULL ,
		promise3_type                 		VARCHAR(1000)		 NULL ,
		promise3                      		VARCHAR(1000)		 NULL ,
		promise4_type                 		VARCHAR(1000)		 NULL ,
		promise4                      		VARCHAR(1000)		 NULL ,
		promise5_type                 		VARCHAR(1000)		 NULL ,
		promise5                      		VARCHAR(1000)		 NULL ,
		cancelrule                    		TEXT		 NULL 
);

/**********************************/
/* Table Name: 패키지예약현황 */
/**********************************/
CREATE TABLE TB_PACKAGE_RESERVE(
		reserve_seq                   		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NOT NULL,
		package_seq                   		INT		 NOT NULL,
		reserve_day                   		DATETIME		 NOT NULL,
		reserve_name                  		VARCHAR(8)		 NOT NULL,
		reserve_uid                   		VARCHAR(50)		 NULL ,
		package_name1                 		VARCHAR(50)		 NOT NULL,
		package_name2                 		VARCHAR(50)		 NOT NULL,
		tour_date                     		VARCHAR(10)		 NOT NULL,
		per_num                       		VARCHAR(2)		 DEFAULT 4		 NOT NULL,
		reserve_phone                 		VARCHAR(13)		 NOT NULL,
		package_price                 		INT		 NOT NULL,
		request_content               		TEXT		 NULL ,
		process_status                		CHAR(1)		 DEFAULT 0		 NULL 
);

/**********************************/
/* Table Name: 콘도예약현환 */
/**********************************/
CREATE TABLE TB_CONDO_RESERVE(
		reserve_seq                   		INT		 NOT NULL AUTO_INCREMENT,
		menu_seq                      		INT		 NOT NULL,
		condo_seq                     		INT		 NOT NULL,
		reserve_day                   		DATETIME		 NOT NULL,
		reserve_name                  		VARCHAR(8)		 NOT NULL,
		reserve_uid                   		VARCHAR(100)		 NULL ,
		condo_name                    		VARCHAR(50)		 NOT NULL,
		roomtype                      		VARCHAR(50)		 NOT NULL,
		condoroom_seq                 		INT(11)		 NOT NULL,
		in_date                       		VARCHAR(8)		 NOT NULL,
		out_date                      		VARCHAR(8)		 NOT NULL,
		room_num                      		INT(2)		 NULL ,
		per_num                       		INT(2)		 NULL ,
		reserve_phone                 		VARCHAR(13)		 NOT NULL,
		condo_price                   		INT		 NOT NULL,
		reserve_memo                  		TEXT		 NULL ,
		process_status                		CHAR(1)		 DEFAULT 0		 NOT NULL
);

/**********************************/
/* Table Name: 회원 테이블 */
/**********************************/
CREATE TABLE tb_member(
		mem_seq                       		INT(11)		 NOT NULL AUTO_INCREMENT,
		mem_id                        		VARCHAR(100)		 NOT NULL,
		mem_name                      		VARCHAR(20)		 NOT NULL,
		mem_pwd                       		VARCHAR(50)		 NOT NULL,
		mem_jumin                     		VARCHAR(14)		 NULL ,
		mem_mtel                      		VARCHAR(13)		 NULL ,
		sms_yn                        		CHAR(1)		 DEFAULT N		 NULL ,
		email_yn                      		CHAR(1)		 DEFAULT N		 NULL ,
		mem_type                      		CHAR(1)		 DEFAULT F		 NULL ,
		recommend                     		VARCHAR(100)		 NULL ,
		secession                     		CHAR(1)		 NULL ,
		secession_dt                  		DATETIME		 NULL ,
		memo                          		TEXT		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: tb_join_bbs */
/**********************************/
CREATE TABLE tb_join_bbs(
		join_seq                      		INT(11)		 NOT NULL AUTO_INCREMENT,
		mem_id                        		VARCHAR(100)		 NOT NULL,
		join_name                     		VARCHAR(20)		 NULL ,
		tel1                          		VARCHAR(3)		 NULL ,
		tel2                          		VARCHAR(4)		 NULL ,
		tel3                          		VARCHAR(4)		 NULL ,
		region                        		CHAR(1)		 NULL ,
		golflink_name                 		VARCHAR(255)		 NULL ,
		sex                           		CHAR(1)		 NULL ,
		age                           		CHAR(2)		 NULL ,
		join_person                   		SMALLINT(3)		 NULL ,
		rounding_dt                   		VARCHAR(20)		 NULL ,
		price_info1                   		VARCHAR(100)		 NULL ,
		price_info2                   		VARCHAR(10)		 NULL ,
		price_info3                   		VARCHAR(10)		 NULL ,
		content                       		TEXT		 NULL ,
		readcount                     		SMALLINT(5)		 NULL ,
		apply_count                   		SMALLINT(5)		 NULL ,
		join_status                   		CHAR(1)		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: tb_notice_bbs / tb_faq_bbs */
/**********************************/
CREATE TABLE tb_notice_bbs / tb_faq_bbs(
		seq                           		INT(11)		 NOT NULL AUTO_INCREMENT,
		mem_id                        		VARCHAR(100)		 NULL ,
		name                          		VARCHAR(20)		 NULL ,
		email                         		VARCHAR(100)		 NULL ,
		subject                       		VARCHAR(255)		 NULL ,
		content                       		TEXT		 NULL ,
		password                      		VARCHAR(20)		 NULL ,
		readcount                     		INT(5)		 NULL ,
		filename                      		VARCHAR(100)		 NULL ,
		position                      		VARCHAR(100)		 NULL ,
		thread                        		INT(11)		 NULL ,
		ishtml                        		CHAR(1)		 NULL ,
		notice_yn                     		CHAR(1)		 NULL ,
		writeip                       		VARCHAR(15)		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: tb_join_comment */
/**********************************/
CREATE TABLE tb_join_comment(
		cmt_seq                       		INT(11)		 NOT NULL AUTO_INCREMENT,
		join_seq                      		INT(11)		 NULL ,
		mem_id                        		VARCHAR(100)		 NULL ,
		cmt_name                      		VARCHAR(20)		 NULL ,
		comment                       		TEXT		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: tb_sms_auth */
/**********************************/
CREATE TABLE tb_sms_auth(
		seq                           		INT(11)		 NOT NULL AUTO_INCREMENT,
		tel_no                        		VARCHAR(13)		 NULL ,
		auth_no                       		VARCHAR(5)		 NULL ,
		send_date                     		INT(11)		 NULL 
);

/**********************************/
/* Table Name: tb_sms_log */
/**********************************/
CREATE TABLE tb_sms_log(
		seq                           		INT(11)		 NOT NULL AUTO_INCREMENT,
		mem_id                        		VARCHAR(100)		 NULL ,
		message                       		VARCHAR(255)		 NULL ,
		rtel                          		VARCHAR(13)		 NULL ,
		stel                          		VARCHAR(13)		 NULL ,
		rdate                         		VARCHAR(10)		 NULL ,
		rtime                         		VARCHAR(10)		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: tb_logon_history */
/**********************************/
CREATE TABLE tb_logon_history(
		seq                           		BIGINT(15)		 NOT NULL AUTO_INCREMENT,
		mem_id                        		VARCHAR(100)		 NULL ,
		logon_type                    		CHAR(1)		 NULL ,
		reg_dt                        		DATETIME		 NULL 
);

/**********************************/
/* Table Name: 콘도_위약처리규정 */
/**********************************/
CREATE TABLE TB_CONDO_PROMISE(
		condo_seq                     		INT		 NOT NULL,
		promise1_type                 		VARCHAR(1000)		 NULL ,
		promise1                      		VARCHAR(1000)		 NULL ,
		promise2_type                 		VARCHAR(1000)		 NULL ,
		promise2                      		VARCHAR(1000)		 NULL ,
		promise3_type                 		VARCHAR(1000)		 NULL ,
		promise3                      		VARCHAR(1000)		 NULL ,
		promise4_type                 		VARCHAR(1000)		 NULL ,
		promise4                      		VARCHAR(1000)		 NULL ,
		promise5_type                 		VARCHAR(1000)		 NULL ,
		promise5                      		VARCHAR(1000)		 NULL ,
		cancelrule                    		TEXT		 NULL 
);

/**********************************/
/* Table Name: 쿠폰메인 */
/**********************************/
CREATE TABLE tb_coupon(
		coupon_seq                    		INT		 NOT NULL AUTO_INCREMENT,
		coupon_name                   		VARCHAR(50)		 NOT NULL,
		coupon_type                   		CHAR(1)		 NOT NULL,
		coupon_code                   		INT		 NOT NULL,
		sale_price                    		INT		 NOT NULL,
		expiredate_start              		VARCHAR(10)		 NOT NULL,
		expiredate_end                		VARCHAR(10)		 NOT NULL,
		reg_user                      		VARCHAR(50)		 NULL ,
		reg_date                      		DATETIME		 NULL ,
		use_date                      		DATETIME		 NULL 
);


ALTER TABLE TB_REGION ADD CONSTRAINT IDX_TB_REGION_PK PRIMARY KEY (region_seq);

ALTER TABLE TB_MENU ADD CONSTRAINT IDX_TB_MENU_PK PRIMARY KEY (menu_seq);

ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_PK PRIMARY KEY (golflink_seq);
ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_FK0 FOREIGN KEY (region_seq) REFERENCES TB_REGION (region_seq);
ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_FK1 FOREIGN KEY (menu_seq) REFERENCES TB_MENU (menu_seq);

ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_PK PRIMARY KEY (product_seq);
ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_FK0 FOREIGN KEY (menu_seq) REFERENCES TB_MENU (menu_seq);
ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_FK1 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);
CREATE INDEX IDX_TB_PRODUCT_1 ON TB_PRODUCT (menu_seq, golflink_seq, product_year, product_month);
CREATE INDEX IDX_TB_PRODUCT_2 ON TB_PRODUCT (product_year, product_month);

ALTER TABLE TB_PRODUCT_SUB ADD CONSTRAINT IDX_TB_PRODUCT_SUB_PK PRIMARY KEY (productsub_seq);
ALTER TABLE TB_PRODUCT_SUB ADD CONSTRAINT IDX_TB_PRODUCT_SUB_FK0 FOREIGN KEY (product_seq) REFERENCES TB_PRODUCT (product_seq);

ALTER TABLE TB_GOLFLINK_COURSE ADD CONSTRAINT IDX_TB_GOLFLINK_COURSE_PK PRIMARY KEY (golflink_course_seq);
ALTER TABLE TB_GOLFLINK_COURSE ADD CONSTRAINT IDX_TB_GOLFLINK_COURSE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_PACKAGE ADD CONSTRAINT IDX_TB_PACKAGE_PK PRIMARY KEY (package_seq);

ALTER TABLE TB_PACKAGE_PRICE ADD CONSTRAINT IDX_TB_PACKAGE_PRICE_PK PRIMARY KEY (package_seq);
ALTER TABLE TB_PACKAGE_PRICE ADD CONSTRAINT IDX_TB_PACKAGE_PRICE_FK0 FOREIGN KEY (package_seq) REFERENCES TB_PACKAGE (package_seq);

ALTER TABLE TB_GOLFLINK_RESERVE ADD CONSTRAINT IDX_TB_GOLFLINK_RESERVE_PK PRIMARY KEY (reserve_seq);
ALTER TABLE TB_GOLFLINK_RESERVE ADD CONSTRAINT IDX_TB_GOLFLINK_RESERVE_FK0 FOREIGN KEY (productsub_seq) REFERENCES TB_PRODUCT_SUB (productsub_seq);

ALTER TABLE TB_CONDO ADD CONSTRAINT IDX_TB_CONDO_PK PRIMARY KEY (condo_seq);

ALTER TABLE TB_CONDO_GALLERY ADD CONSTRAINT IDX_TB_CONDO_GALLERY_PK PRIMARY KEY (condoimg_seq);
ALTER TABLE TB_CONDO_GALLERY ADD CONSTRAINT IDX_TB_CONDO_GALLERY_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

ALTER TABLE TB_CONDO_ROOM ADD CONSTRAINT IDX_TB_CONDO_ROOM_PK PRIMARY KEY (condoroom_seq);
ALTER TABLE TB_CONDO_ROOM ADD CONSTRAINT IDX_TB_CONDO_ROOM_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

ALTER TABLE TB_GOLFLINK_PRICE ADD CONSTRAINT IDX_TB_GOLFLINK_PRICE_PK PRIMARY KEY (golflink_seq, price_type);
ALTER TABLE TB_GOLFLINK_PRICE ADD CONSTRAINT IDX_TB_GOLFLINK_PRICE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_GOLFLINK_PROMISE ADD CONSTRAINT IDX_TB_GOLFLINK_PROMISE_PK PRIMARY KEY (golflink_seq);
ALTER TABLE TB_GOLFLINK_PROMISE ADD CONSTRAINT IDX_TB_GOLFLINK_PROMISE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_PACKAGE_PROMISE ADD CONSTRAINT IDX_TB_PACKAGE_PROMISE_PK PRIMARY KEY (package_seq);
ALTER TABLE TB_PACKAGE_PROMISE ADD CONSTRAINT IDX_TB_PACKAGE_PROMISE_FK0 FOREIGN KEY (package_seq) REFERENCES TB_PACKAGE (package_seq);

ALTER TABLE TB_PACKAGE_RESERVE ADD CONSTRAINT IDX_TB_PACKAGE_RESERVE_PK PRIMARY KEY (reserve_seq);

ALTER TABLE TB_CONDO_RESERVE ADD CONSTRAINT IDX_TB_CONDO_RESERVE_PK PRIMARY KEY (reserve_seq);

ALTER TABLE tb_member ADD CONSTRAINT IDX_tb_member_PK PRIMARY KEY (mem_seq);
ALTER TABLE tb_member ADD CONSTRAINT IDX_tb_member_1 UNIQUE ();

ALTER TABLE tb_join_bbs ADD CONSTRAINT IDX_tb_join_bbs_PK PRIMARY KEY (join_seq);

ALTER TABLE tb_notice_bbs / tb_faq_bbs ADD CONSTRAINT IDX_tb_notice_bbs / tb_faq_bbs_PK PRIMARY KEY (seq);

ALTER TABLE tb_join_comment ADD CONSTRAINT IDX_tb_join_comment_PK PRIMARY KEY (cmt_seq);
ALTER TABLE tb_join_comment ADD CONSTRAINT IDX_tb_join_comment_FK0 FOREIGN KEY (join_seq) REFERENCES tb_join_bbs (join_seq);

ALTER TABLE tb_sms_auth ADD CONSTRAINT IDX_tb_sms_auth_PK PRIMARY KEY (seq);
ALTER TABLE tb_sms_auth ADD CONSTRAINT IDX_tb_sms_auth_1 UNIQUE ();

ALTER TABLE tb_sms_log ADD CONSTRAINT IDX_tb_sms_log_PK PRIMARY KEY (seq);

ALTER TABLE tb_logon_history ADD CONSTRAINT IDX_tb_logon_history_PK PRIMARY KEY (seq);
CREATE INDEX IDX_tb_logon_history_1 ON tb_logon_history ();

ALTER TABLE TB_CONDO_PROMISE ADD CONSTRAINT IDX_TB_CONDO_PROMISE_PK PRIMARY KEY (condo_seq);
ALTER TABLE TB_CONDO_PROMISE ADD CONSTRAINT IDX_TB_CONDO_PROMISE_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

ALTER TABLE tb_coupon ADD CONSTRAINT IDX_tb_coupon_PK PRIMARY KEY (coupon_seq);

