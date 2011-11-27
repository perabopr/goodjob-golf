DROP TABLE IF EXISTS TB_CONDO_RESERVE_TERM;
DROP TABLE IF EXISTS TB_CONDO_GALLERY;
DROP TABLE IF EXISTS TB_CONDO;
DROP TABLE IF EXISTS TB_GOLFLINK_RESERVE;
DROP TABLE IF EXISTS TB_PACKAGE_SUB;
DROP TABLE IF EXISTS TB_PACKAGE_PRICE;
DROP TABLE IF EXISTS TB_PACKAGE;
DROP TABLE IF EXISTS TB_GOLFLINK_SUB;
DROP TABLE IF EXISTS TB_GOLFLINK_PRICE;
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
		region_seq                    		INT		 NOT NULL AUTO_INCREMENT  primary key,
		region_type                   		CHAR(1)		 DEFAULT '1'		 NOT NULL,
		region_name                   		VARCHAR(50)		 NOT NULL,
		region_etc                    		VARCHAR(100)		 NULL 
);

/**********************************/
/* Table Name: 메뉴정보 */
/**********************************/
CREATE TABLE TB_MENU(
		menu_seq                      		INT		 NOT NULL AUTO_INCREMENT  primary key,
		menu_name                     		VARCHAR(40)		 NOT NULL
);

/**********************************/
/* Table Name: 골프장정보 */
/**********************************/
CREATE TABLE TB_GOLFLINK(
		golflink_seq                  		INT		 NOT NULL AUTO_INCREMENT  primary key,
		menu_seq                      		INT		 NULL ,
		golflink_name                 		VARCHAR(50)		 NOT NULL,
		region_seq                    		INT		 NULL ,
		golflink_type                 		VARCHAR(50)		 NULL ,
		golflink_address1             		VARCHAR(100)		 NULL ,
		golflink_address2             		VARCHAR(100)		 NULL ,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub1                      		VARCHAR(50)		 NULL ,
		img_sub2                      		VARCHAR(50)		 NULL ,
		img_sub3                      		VARCHAR(50)		 NULL ,
		img_map                       		VARCHAR(50)		 NULL ,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

/**********************************/
/* Table Name: 상품메인정보 */
/**********************************/
CREATE TABLE TB_PRODUCT(
		product_seq                   		INT		 NOT NULL AUTO_INCREMENT  primary key,
		menu_seq                      		INT		 NULL ,
		golflink_seq                  		INT		 NULL ,
		product_year                  		CHAR(4)		 NOT NULL,
		product_month                 		CHAR(2)		 NOT NULL,
		product_day                   		CHAR(2)		 NOT NULL,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL
);

/**********************************/
/* Table Name: 일별상품상세정보 */
/**********************************/
CREATE TABLE TB_PRODUCT_SUB(
		productsub_seq                		INT		 NOT NULL AUTO_INCREMENT  primary key,
		product_seq                   		INT		 NULL ,
		time_start                    		CHAR(4)		 NULL ,
		time_end                      		CHAR(4)		 NULL ,
		goodjob_price                 		INT		 NOT NULL,
		NH_price                      		INT		 NOT NULL,
		product_status                		CHAR(1)		 NULL 
);

/**********************************/
/* Table Name: 골프장코스 */
/**********************************/
CREATE TABLE TB_GOLFLINK_COURSE(
		golflink_seq                  		INT		 NULL ,
		course_name                   		VARCHAR(50)		 NOT NULL
);

/**********************************/
/* Table Name: 금액정보 */
/**********************************/
CREATE TABLE TB_GOLFLINK_PRICE(
		golflink_seq                  		INT		 NULL ,
		regular_1nor_weekday          		INT		 NULL ,
		regular_1nor_holiday          		INT		 NULL ,
		regular_1sale_weekday         		INT		 NULL ,
		regular_1sale_holiday         		INT		 NULL ,
		regular_4_weekday             		INT		 NULL ,
		regular_4_holiday             		INT		 NULL ,
		event_1nor_mon                		INT		 NULL ,
		event_1nor_tues               		INT		 NULL ,
		event_1nor_wednes             		INT		 NULL ,
		event_1nor_thurs              		INT		 NULL ,
		event_1nor_fri                		INT		 NULL ,
		event_1nor_satur              		INT		 NULL ,
		event_1nor_sun                		INT		 NULL ,
		event_1sale_mon               		INT		 NULL ,
		event_1sale_tues              		INT		 NULL ,
		event_1sale_wednes            		INT		 NULL ,
		event_1sale_thurs             		INT		 NULL ,
		event_1sale_fri               		INT		 NULL ,
		event_1sale_satur             		INT		 NULL ,
		event_1sale_sun               		INT		 NULL ,
		event_4_mon                   		INT		 NULL ,
		event_4_tues                  		INT		 NULL ,
		event_4_wednes                		INT		 NULL ,
		event_4_thurs                 		INT		 NULL ,
		event_4_fri                   		INT		 NULL ,
		event_4_satur                 		INT		 NULL ,
		event_4_sun                   		INT		 NULL 
);

/**********************************/
/* Table Name: 골프장상세정보 */
/**********************************/
CREATE TABLE TB_GOLFLINK_SUB(
		golflink_seq                  		INT		 NULL ,
		real_reserve                  		TEXT		 NULL ,
		use_guide                     		TEXT		 NULL ,
		golflink_introduce            		TEXT		 NULL ,
		way_map                       		TEXT		 NULL ,
		promise_rule                  		TEXT		 NULL ,
		use_rule                      		TEXT		 NULL 
);

/**********************************/
/* Table Name: 골프패키지 */
/**********************************/
CREATE TABLE TB_PACKAGE(
		package_seq                   		INT		 NOT NULL AUTO_INCREMENT  primary key,
		package_name                  		VARCHAR(50)		 NOT NULL,
		region_seq_1                  		INT		 NOT NULL,
		region_seq_2                  		INT		 NULL ,
		package_type                  		VARCHAR(50)		 NOT NULL,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub                       		VARCHAR(50)		 NULL ,
		img_sub1                      		VARCHAR(50)		 NULL ,
		img_sub2                      		VARCHAR(50)		 NULL ,
		img_sub3                      		VARCHAR(50)		 NULL ,
		img_sub4                      		VARCHAR(50)		 NULL ,
		img_map                       		VARCHAR(50)		 NULL ,
		view_yn                       		CHAR(1)		 NULL 
);

/**********************************/
/* Table Name: 패키지금액 */
/**********************************/
CREATE TABLE TB_PACKAGE_PRICE(
		package_seq                   		INT		 NOT NULL,
		peak_mon                      		INT		 NULL ,
		peak_tues                     		INT		 NULL ,
		peak_wednes                   		INT		 NULL ,
		peak_thurs                    		INT		 NULL ,
		peak_fri                      		INT		 NULL ,
		peak_satur                    		INT		 NULL ,
		peak_sun                      		INT		 NULL ,
		off_mon                       		INT		 NULL ,
		off_tues                      		INT		 NULL ,
		off_wednes                    		INT		 NULL ,
		off_thurs                     		INT		 NULL ,
		off_fri                       		INT		 NULL ,
		off_satur                     		INT		 NULL ,
		off_sun                       		INT		 NULL 
);

/**********************************/
/* Table Name: 패키지상세정보 */
/**********************************/
CREATE TABLE TB_PACKAGE_SUB(
		package_seq                   		INT		 NOT NULL,
		include_desc                  		TEXT		 NULL ,
		not_include_desc              		TEXT		 NULL ,
		etc_desc                      		TEXT		 NULL ,
		promise_rule                  		TEXT		 NULL ,
		use_rule                      		TEXT		 NULL ,
		default_rule                  		TEXT		 NULL ,
		way_map                       		TEXT		 NULL 
);

/**********************************/
/* Table Name: 예약현황 */
/**********************************/
CREATE TABLE TB_GOLFLINK_RESERVE(
		menu_seq                      		INT		 NOT NULL,
		productsub_seq                		INT		 NOT NULL AUTO_INCREMENT  primary key,
		golflink_name                 		VARCHAR(50)		 NOT NULL,
		reserve_name                  		VARCHAR(8)		 NOT NULL,
		reserve_day                   		DATETIME		 NOT NULL,
		booking_day                   		CHAR(10)		 NOT NULL,
		booking_time                  		CHAR(4)		 NULL ,
		golflink_course               		VARCHAR(50)		 NULL ,
		per_num                       		VARCHAR(2)		 NOT NULL,
		reserve_phone                 		VARCHAR(13)		 NOT NULL,
		product_price                 		INT		 NOT NULL,
		process_status                		CHAR(1)		 DEFAULT 1		 NOT NULL
);

/**********************************/
/* Table Name: 콘도예약 */
/**********************************/
CREATE TABLE TB_CONDO(
		condo_seq                     		INT		 NOT NULL AUTO_INCREMENT  primary key,
		region_seq                    		INT		 NULL ,
		condo_name                    		VARCHAR(50)		 NOT NULL,
		condo_desc                    		TEXT		 NULL ,
		condo_location                		MEDIUMINT(10)		 NULL ,
		use_method                    		MEDIUMINT(10)		 NULL ,
		condo_term                    		MEDIUMINT(10)		 NULL ,
		condo_homepage                		MEDIUMINT(10)		 NULL ,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub                       		VARCHAR(50)		 NULL ,
		condo_info                    		VARCHAR(50)		 NULL ,
		detail_info                   		VARCHAR(50)		 NULL ,
		way_map                       		VARCHAR(50)		 NULL ,
		reserve_term1                 		VARCHAR(10)		 NULL ,
		reserve_term2                 		VARCHAR(10)		 NULL ,
		family_week_price             		INT		 NULL ,
		family_holiday_price          		INT		 NULL ,
		sweet_week_price              		INT		 NULL ,
		sweet_holiday_price           		INT		 NULL ,
		gold_week_price               		INT		 NULL ,
		gold_holiday_price            		INT		 NULL ,
		edit_rule                     		TEXT		 NULL 
);

/**********************************/
/* Table Name: 콘도이미지갤러리 */
/**********************************/
CREATE TABLE TB_CONDO_GALLERY(
		condoimg_seq                  		INT		 NOT NULL AUTO_INCREMENT  primary key,
		condo_seq                     		INT		 NOT NULL,
		condo_img                     		VARCHAR(50)		 NOT NULL
);

/**********************************/
/* Table Name: 콘도예약기간 */
/**********************************/
CREATE TABLE TB_CONDO_RESERVE_TERM(
		condoterm_seq                 		INT		 NOT NULL AUTO_INCREMENT  primary key,
		condo_seq                     		INT		 NOT NULL,
		reserve_start                 		DATE		 NOT NULL,
		reserve_end                   		DATE		 NOT NULL
);


ALTER TABLE TB_REGION ADD CONSTRAINT IDX_TB_REGION_PK PRIMARY KEY (region_seq);

ALTER TABLE TB_MENU ADD CONSTRAINT IDX_TB_MENU_PK PRIMARY KEY (menu_seq);

ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_PK PRIMARY KEY (golflink_seq);
ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_FK0 FOREIGN KEY (region_seq) REFERENCES TB_REGION (region_seq);
ALTER TABLE TB_GOLFLINK ADD CONSTRAINT IDX_TB_GOLFLINK_FK1 FOREIGN KEY (menu_seq) REFERENCES TB_MENU (menu_seq);

ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_PK PRIMARY KEY (product_seq);
ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_FK0 FOREIGN KEY (menu_seq) REFERENCES TB_MENU (menu_seq);
ALTER TABLE TB_PRODUCT ADD CONSTRAINT IDX_TB_PRODUCT_FK1 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_PRODUCT_SUB ADD CONSTRAINT IDX_TB_PRODUCT_SUB_PK PRIMARY KEY (productsub_seq);
ALTER TABLE TB_PRODUCT_SUB ADD CONSTRAINT IDX_TB_PRODUCT_SUB_FK0 FOREIGN KEY (product_seq) REFERENCES TB_PRODUCT (product_seq);

ALTER TABLE TB_GOLFLINK_COURSE ADD CONSTRAINT IDX_TB_GOLFLINK_COURSE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_GOLFLINK_PRICE ADD CONSTRAINT IDX_TB_GOLFLINK_PRICE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_GOLFLINK_SUB ADD CONSTRAINT IDX_TB_GOLFLINK_SUB_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_PACKAGE ADD CONSTRAINT IDX_TB_PACKAGE_PK PRIMARY KEY (package_seq);

ALTER TABLE TB_PACKAGE_PRICE ADD CONSTRAINT IDX_TB_PACKAGE_PRICE_PK PRIMARY KEY (package_seq);
ALTER TABLE TB_PACKAGE_PRICE ADD CONSTRAINT IDX_TB_PACKAGE_PRICE_FK0 FOREIGN KEY (package_seq) REFERENCES TB_PACKAGE (package_seq);

ALTER TABLE TB_PACKAGE_SUB ADD CONSTRAINT IDX_TB_PACKAGE_SUB_PK PRIMARY KEY (package_seq);
ALTER TABLE TB_PACKAGE_SUB ADD CONSTRAINT IDX_TB_PACKAGE_SUB_FK0 FOREIGN KEY (package_seq) REFERENCES TB_PACKAGE (package_seq);

ALTER TABLE TB_GOLFLINK_RESERVE ADD CONSTRAINT IDX_TB_GOLFLINK_RESERVE_PK PRIMARY KEY (productsub_seq);
ALTER TABLE TB_GOLFLINK_RESERVE ADD CONSTRAINT IDX_TB_GOLFLINK_RESERVE_FK0 FOREIGN KEY (productsub_seq) REFERENCES TB_PRODUCT_SUB (productsub_seq);

ALTER TABLE TB_CONDO ADD CONSTRAINT IDX_TB_CONDO_PK PRIMARY KEY (condo_seq);

ALTER TABLE TB_CONDO_GALLERY ADD CONSTRAINT IDX_TB_CONDO_GALLERY_PK PRIMARY KEY (condoimg_seq);
ALTER TABLE TB_CONDO_GALLERY ADD CONSTRAINT IDX_TB_CONDO_GALLERY_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

ALTER TABLE TB_CONDO_RESERVE_TERM ADD CONSTRAINT IDX_TB_CONDO_RESERVE_TERM_PK PRIMARY KEY (condoterm_seq);
ALTER TABLE TB_CONDO_RESERVE_TERM ADD CONSTRAINT IDX_TB_CONDO_RESERVE_TERM_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

