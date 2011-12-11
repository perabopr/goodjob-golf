DROP TABLE IF EXISTS TB_PACKAGE_PROMISE;
DROP TABLE IF EXISTS TB_GOLFLINK_PROMISE;
DROP TABLE IF EXISTS TB_GOLFLINK_PRICE;
DROP TABLE IF EXISTS TB_CONDO_TERM;
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
		point_x                       		VARCHAR(10)		 NULL ,
		point_y                       		VARCHAR(10)		 NULL ,
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
		golflink_guide                		TEXT		 NULL 
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
		package_name1                 		VARCHAR(50)		 NOT NULL,
		package_name2                 		VARCHAR(50)		 NULL ,
		region_seq                    		INT		 NOT NULL,
		package_type                  		VARCHAR(50)		 NOT NULL,
		img_main                      		VARCHAR(50)		 NULL ,
		img_sub                       		VARCHAR(50)		 NULL ,
		img_sub1                      		VARCHAR(50)		 NULL ,
		img_sub2                      		VARCHAR(50)		 NULL ,
		img_sub3                      		VARCHAR(50)		 NULL ,
		img_sub4                      		VARCHAR(50)		 NULL ,
		address1                      		VARCHAR(50)		 NULL ,
		address2                      		VARCHAR(50)		 NULL ,
		point_x                       		VARCHAR(10)		 NULL ,
		point_y                       		VARCHAR(10)		 NULL ,
		view_yn                       		CHAR(1)		 NULL ,
		package_guide                 		TEXT		 NULL ,
		use_guide                     		TEXT		 NULL ,
		golflink_guide                		TEXT		 NULL ,
		way_map                       		TEXT		 NULL 
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
		productsub_seq                		INT		 NOT NULL,
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
		condo_seq                     		INT		 NOT NULL AUTO_INCREMENT,
		condo_name                    		VARCHAR(50)		 NOT NULL,
		region_seq                    		INT		 NOT NULL,
		saledate_start                		VARCHAR(10)		 NULL ,
		saledate_end                  		MEDIUMINT(10)		 NULL ,
		img_main                      		VARCHAR(50)		 NULL ,
		address1                      		VARCHAR(50)		 NOT NULL,
		address2                      		VARCHAR(50)		 NOT NULL,
		point_x                       		VARCHAR(10)		 NULL ,
		point_y                       		VARCHAR(10)		 NULL ,
		view_yn                       		CHAR(1)		 DEFAULT 'N'		 NOT NULL,
		condo_info                    		VARCHAR(50)		 NULL ,
		detail_info                   		VARCHAR(50)		 NULL ,
		way_map                       		VARCHAR(50)		 NULL ,
		edit_rule                     		TEXT		 NULL 
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
/* Table Name: 콘도예약기간 */
/**********************************/
CREATE TABLE TB_CONDO_TERM(
		condoterm_seq                 		INT		 NOT NULL AUTO_INCREMENT,
		condo_seq                     		INT		 NOT NULL,
		reserve_start                 		DATE		 NOT NULL,
		reserve_end                   		DATE		 NOT NULL,
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

ALTER TABLE TB_CONDO_TERM ADD CONSTRAINT IDX_TB_CONDO_TERM_PK PRIMARY KEY (condoterm_seq);
ALTER TABLE TB_CONDO_TERM ADD CONSTRAINT IDX_TB_CONDO_TERM_FK0 FOREIGN KEY (condo_seq) REFERENCES TB_CONDO (condo_seq);

ALTER TABLE TB_GOLFLINK_PRICE ADD CONSTRAINT IDX_TB_GOLFLINK_PRICE_PK PRIMARY KEY (golflink_seq, price_type);
ALTER TABLE TB_GOLFLINK_PRICE ADD CONSTRAINT IDX_TB_GOLFLINK_PRICE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_GOLFLINK_PROMISE ADD CONSTRAINT IDX_TB_GOLFLINK_PROMISE_PK PRIMARY KEY (golflink_seq);
ALTER TABLE TB_GOLFLINK_PROMISE ADD CONSTRAINT IDX_TB_GOLFLINK_PROMISE_FK0 FOREIGN KEY (golflink_seq) REFERENCES TB_GOLFLINK (golflink_seq);

ALTER TABLE TB_PACKAGE_PROMISE ADD CONSTRAINT IDX_TB_PACKAGE_PROMISE_PK PRIMARY KEY (package_seq);
ALTER TABLE TB_PACKAGE_PROMISE ADD CONSTRAINT IDX_TB_PACKAGE_PROMISE_FK0 FOREIGN KEY (package_seq) REFERENCES TB_PACKAGE (package_seq);

