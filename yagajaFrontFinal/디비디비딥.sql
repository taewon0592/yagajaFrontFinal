--더미데이터 지우기

--DROP TABLE SURROUND CASCADE CONSTRAINTS;
--DROP TABLE RESERVATION CASCADE CONSTRAINTS;
--DROP TABLE AUCTION CASCADE CONSTRAINTS;
--DROP TABLE HOTDEAL CASCADE CONSTRAINTS;
--DROP TABLE LEAVE_MEMBER CASCADE CONSTRAINTS;
--DROP TABLE LODGE_ADDR CASCADE CONSTRAINTS;
--DROP TABLE REVIEW CASCADE CONSTRAINTS;
--DROP TABLE ROOM CASCADE CONSTRAINTS;
--DROP TABLE LODGE CASCADE CONSTRAINTS;
--DROP TABLE Member CASCADE CONSTRAINTS;
--DROP TABLE NOTICE CASCADE CONSTRAINTS;

-- 야가자회원테이블
CREATE TABLE Member
(
   -- 회원일련번호
   MEMBER_NO number NOT NULL,
   -- 회원아이디
   ID varchar2(50) NOT NULL,
   -- 패스워드
   PASS varchar2(50) NOT NULL,
   -- 닉네임
   NICKNAME varchar2(30) NOT NULL,
   -- 핸드폰번호
   PHONE varchar2(20) NOT NULL,
   -- 마일리지
   M_POINT number DEFAULT 0,
   -- 이메일
   EMAIL varchar2(70) NOT NULL,
   -- 회원가입일
   REGIDATE date DEFAULT sysdate,
   -- 권한설정 : DEFUALT USER
   AUTHORITY varchar2(30) DEFAULT 'user',
   PRIMARY KEY (MEMBER_NO)
);

--member_no_seq 생성
create sequence member_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 탈퇴회원테이블
CREATE TABLE LEAVE_MEMBER
(
   -- 탈퇴사유
   LEAVE_REASON varchar2(500),
   -- 세부내용
   LEAVE_REASON2 varchar2(1000),
   -- 탈퇴일
   LEAVE_DATE date DEFAULT sysdate NOT NULL,
   -- 회원일련번호
   MEMBER_NO number NOT NULL,
    ID varchar(50) not null,
    authority varchar2(30) not null
);


-- 숙박시설테이블
CREATE TABLE LODGE
(
   -- 숙소일련번호
   LODGE_NO number NOT NULL,
   -- 숙소종류
   LODGE_TYPE varchar2(30) NOT NULL,
   -- 숙소명
   LODGE_NAME varchar2(60) NOT NULL,
   -- 숙소전화번호
   LODGE_TEL varchar2(20) NOT NULL,
   -- 숙소방개수
   LODGE_ROOMCOUNT number NOT NULL,
   -- 숙소태그
   LODGE_TAG varchar2(100),
   -- 숙소대표사진
   LODGE_PHOTO varchar2(50) NOT NULL,
   -- 숙소테마
   LODGE_THEMA varchar2(3000),
   -- 숙소간단설명
   LODGE_NOTE varchar2(1000),
   -- 숙소 특징
    LODGE_FEATURE varchar2(200) not null,
   PRIMARY KEY (LODGE_NO)
);

--lodge_no_seq 생성
create sequence lodge_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 숙박시설주소테이블
CREATE TABLE LODGE_ADDR
(
   -- 숙박시설 주소
   ADDR_COMMON varchar2(200) NOT NULL,
   -- 숙박시설 상세주소
   ADDR_DETAIL varchar2(100) NOT NULL,
   -- 숙박시설 우편번호
   ADDR_ZIPCODE number NOT NULL,
   -- 숙박시설위도
   ADDR_LAT varchar2(50),
   -- 숙박시설경도
   ADDR_LONG varchar2(50),
   -- 숙소일련번호
   LODGE_NO number NOT NULL
);

-- 예약테이블
CREATE TABLE RESERVATION
(
   -- 예약번호
   RESER_NO number NOT NULL,
   -- 예약자명
   RESER_NAME varchar2(50) NOT NULL,
   -- 입실시간
   CHECK_IN date NOT NULL,
   -- 퇴실시간
   CHECK_OUT date NOT NULL,
   -- 예약자휴대폰번호
   RESER_PHONE varchar2(20) NOT NULL,
   -- 방문형태 : CHECK로 제약조건
   VISIT_TYPE varchar2(20) NOT NULL,
   -- 예약일자
   RESER_DATE date DEFAULT SYSDATE NOT NULL,
   -- 취소일자
   CANCLE_DATE date DEFAULT SYSDATE,
   -- 취소수수료
   CANCLE_FEE number DEFAULT 0 NOT NULL,
   -- 예약종류 : CHECK
   RESER_TYPE varchar2(20) NOT NULL,
   -- 결제수단 : CHECK
   PAYMENT_TYPE varchar2(20) NOT NULL,
   -- 결제금액
   PAYMENT_PRICE number NOT NULL,
   -- 경매상품번호
   AUCTION_NO number NOT NULL,
   -- 핫딜일련번호
   HOTDEAL_NO number NOT NULL,
   -- 숙소일련번호
   LODGE_NO number NOT NULL,
   -- 회원일련번호
   MEMBER_NO number NOT NULL,
   PRIMARY KEY (RESER_NO)
);

--RESERVATION_no_seq 생성
create sequence reservation_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- 객실테이블
CREATE TABLE ROOM
(
   -- 객실일련번호
   ROOM_NO number NOT NULL,
   -- 객실종류
   ROOM_TYPE varchar2(100) NOT NULL,
   -- 객실인원
   ROOM_PERSON number NOT NULL,
   -- 객실사진
   ROOM_PHOTO varchar2(1000),
   -- 주중숙박가격
   D_SLEEP_PRICE number NOT NULL,
   -- 주말숙박가격
   W_SLEEP_PRICE number NOT NULL,
   -- 주중대실가격
   D_RENT_PRICE number NOT NULL,
   -- 주말대실가격
   W_RENT_PRICE number NOT NULL,
   -- 숙소일련번호
   LODGE_NO number NOT NULL,
   PRIMARY KEY (ROOM_NO)
);

--room_no_seq 생성
create sequence room_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 주변시설테이블
CREATE TABLE SURROUND
(
   -- 주변시설일련번호
   SURROUND_NO number NOT NULL,
   -- 주변시설상호명
   SURROUND_NAME varchar2(100) NOT NULL,
   -- 주변시설 전화번호
   SURROUND_TEL varchar2(20) NOT NULL,
   -- 주변시설 종류
   SURROUND_TYPE varchar2(50) NOT NULL,
   -- 주변시설 주소
   SURROUND_ADDR varchar2(200) NOT NULL,
    -- 주변시설 주소
   SURROUND_DETAIL varchar2(100) NOT NULL,
    -- 주변시설 주소
   SURROUND_ZIPCODE NUMBER NOT NULL,
   -- 주변시설 위도
   SURROUND_LAT varchar2(50),
   -- 주변시설 경도
   SURROUND_LONG varchar2(50),
   PRIMARY KEY (SURROUND_NO)
);
--SURROUND_no_seq 생성
create sequence surround_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 경매테이블
CREATE TABLE AUCTION
(
   -- 경매상품번호
   AUCTION_NO number NOT NULL,
   -- 경매시작가
   START_PRICE number NOT NULL,
   -- 경매낙찰가
   END_PRICE number,
   -- 경매최고낙찰자
   FINAL_BIDDER varchar2(30),
   -- 경매입찰수
   TENDER_COUNT number DEFAULT 0,
   -- 경매조회수
   AUCTION_HITS number DEFAULT 0,
    -- 경매 입찰단가
    AUCTION_UNIT number NOT NULL,
   -- 경매 시작시간
   AUCTION_STIME date NOT NULL,
   -- 경매 종료시간
   AUCTION_ETIME date NOT NULL,
   -- 경매 등록일자
   AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
   -- 숙소 일련번호
   LODGE_NO number NOT NULL,
    -- 룸 일련번호
    ROOM_NO number NOT NULL,
    -- 체크인
    check_in date not null,
    -- 체크아웃
    check_out date not null,

   PRIMARY KEY (AUCTION_NO)
);

--auction_no_seq 생성
create sequence auction_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;
-- 핫딜테이블
CREATE TABLE HOTDEAL
(
   -- 핫딜일련번호
   HOTDEAL_NO number NOT NULL,
   -- 핫딜시작시간
   HOTDEAL_STIME date NOT NULL,
   -- 핫딜마감시간
   HOTDEAL_ETIME date NOT NULL,
   -- 핫딜적용금액
   HOTDEAL_PRICE number NOT NULL,
   -- 핫딜구매가능수량
   HOTDEAL_BUY number NOT NULL,
   -- 핫딜판매수량
   HOTDEAL_SELL number DEFAULT 0,
   -- 핫딜등록일자
   HOTDEAL_DATE date DEFAULT SYSDATE,
   -- 핫딜사용시작일
   HOTDEAL_SDAY date NOT NULL,
   -- 핫딜사용종료일
   HOTDEAL_EDAY date NOT NULL,
   -- 숙소일련번호
   LODGE_NO number NOT NULL,
    -- 룸일련번호
   ROOM_NO number NOT NULL,
   PRIMARY KEY (HOTDEAL_NO)
);
--hotdeal_no_seq 생성
create sequence hotdeal_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 공지사항테이블
CREATE TABLE NOTICE
(
   -- 공지사항일련번호
   NOTICE_NO number NOT NULL,
   -- 공지사항 제목
   NOTICE_TITLE varchar2(100) NOT NULL,
   -- 공지사항 내용
   NOTICE_CONTENTS varchar2(4000) NOT NULL,
   -- 공지사항 등록일자
   NOTICE_REGIDATE date DEFAULT SYSDATE,
   -- 공지사항 작성자
   NOTICE_NAME varchar2(50) NOT NULL,
   PRIMARY KEY (NOTICE_NO)
);

--notice_no_seq 생성
create sequence notice_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- 이용후기테이블
CREATE TABLE REVIEW
(
   -- 이용후기일련번호
   REVIEW_NO number NOT NULL,
   -- 이용후기평점
   REVIEW_SCORE varchar2(10) NOT NULL,
   -- 이용후기내용
   REVIEW_CONTENTS varchar2(500) NOT NULL,
   -- 이용후기첨부파일
   REVIEW_PHOTO varchar2(1000),
   -- 이용후기작성일자
   REVIEW_DATE date DEFAULT SYSDATE,
   -- 숙소일련번호
   LODGE_NO number NOT NULL,
   PRIMARY KEY (REVIEW_NO)
);

--review_no_seq 생성
create sequence review_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

/* Create Foreign Keys */

--ALTER TABLE AUCTION
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--ALTER TABLE HOTDEAL
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--ALTER TABLE ROOM
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--
--ALTER TABLE LODGE_ADDR
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--
--ALTER TABLE RESERVATION
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--
--ALTER TABLE REVIEW
--   ADD FOREIGN KEY (LODGE_NO)
--   REFERENCES LODGE (LODGE_NO)
--;
--
--
--ALTER TABLE LEAVE_MEMBER
--   ADD FOREIGN KEY (MEMBER_NO)
--   REFERENCES Member (MEMBER_NO)
--;

--
--ALTER TABLE RESERVATION
--   ADD FOREIGN KEY (MEMBER_NO)
--   REFERENCES Member (MEMBER_NO)
--;

--모텔
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','미아 붐','02-6565-9659',30,'#쿠폰혜택#마이룸#현장적립#최저가보상','boom.jpg','주차가능,커플PC,객실금연,이벤트가능','편안함과 아늑함이 공존하는 모텔','좋은숙박BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강북구','도봉로 34-7',11220,'37.5235975','126.9435013',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'boom_01.jpg',50000,50000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실1',2,'boom_02.jpg',50000,50000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실2',2,'boom_03.jpg',50000,50000,20000,20000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','가산 캐슬','02-6598-1254',25,'#현장적립','castle.jpg','주차가능,트윈베드','누구나 편히 쉴 수 있는 모텔','최저가보상, 몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 금천구','디지털로12길 5 모텔캐슬',18515,'37.478442','126.8871335',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'castle_01.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'준특실',2,'castle_02.jpg',60000,60000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실',2,'castle_03.jpg',65000,65000,35000,35000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','잠실 첼로','02-6623-7820',35,'#쿠폰혜택#마이룸#당일예약취소가능#현장적립#최저가보상','cello.jpg','주차가능,무료영화,게임기','영화나 게임을 좋아하는 분들을 위해 준비된 모텔','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 송파구','방이동 37-3',14605,'37.515807','127.1095807',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'cello_03.jpg',70000,70000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'cello_04.jpg',75000,75000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'로얄스위트',2,'cello_02.jpg',120000,120000,50000,50000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','일산 행신 체스','031-986-4586',30,'#쿠폰혜택#최저가보상','chess_01.jpg','주차가능,커플PC','위생 좋고 깔끔하고 사장님이 친절하신 모텔','최저가 보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 고양시 덕양구','행신동 714-2',10523,'37.6149236','126.8316115',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'chess_01.jpg',61000,61000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실1',2,'chess_02.jpg',61000,61000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실2',2,'chess_04.jpg',61000,61000,26000,26000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','은평 대명','02-5269-7856',31,'#현장적립','daemyeong.jpg','주차가능,이벤트 가능,무료영화','깔끔한건 기본이고 가격도 저렴한 모텔','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 은평구','역촌동 16-17',13404,'37.6068326','126.9216507',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'daemyeong_01.jpg',40000,40000,20000,20000,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','노원 딘','02-935-6541',30,'#쿠폰혜택#현장적립#신축_리모델링','dean.jpg','주차가능,무인텔','모든게 훌륭한 모텔 커플안마의자는 덤','최저가보상,좋은숙박BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 노원구','상계동 708-1',13605,'37.6544685','127.0585352',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'dean_01.jpg',85000,85000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스1',2,'dean_02.jpg',90000,90000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스2',2,'dean_03.jpg',90000,90000,35000,35000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','H Avenue-역삼','02-589-5963',25,'#쿠폰혜택#TOP100#마이룸#좋은숙박연구소#현장적립#최저가보상','h_avenue.jpg','주차가능,이벤트가능,안마의자','말이 필요없는 모텔','몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강남구','역삼동 678-14',12605,'37.5024315','127.0387326',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'h_avenue_02.jpg',80000,80000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'글램핑',2,'h_avenue_01.jpg',400000,400000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','Hotel the Artist-역삼','02-569-4920',30,'#쿠폰혜택#TOP100#마이룸#현장적립#최저가보상','hotel_the_artist.jpg','이벤트가능,야외테라스,주차가능','악플이 없는 모텔','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강남구','역삼동 678-13',15505,'37.5023554','127.0384599',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'hotel_the_artist_03.jpg',99000,99000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'hotel_the_artist_01.jpg',110000,110000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'프리미엄_이벤트',2,'hotel_the_artist_02.jpg',120000,120000,50000,50000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','독산 휴','02-896-4521',30,'#쿠폰혜택#마이룸#최저가보상','hugh_01.jpg','주차가능,파티가능','가성비 좋은 편하게 쉴 수 있는 곳','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 금천구','독산동 973-4',14675,'37.4759904','126.9032239',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실(미니)',2,'hugh_02.jpg',58000,58000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2, 'hugh_01.jpg',60000,60000,40000,40000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','독산 이사벨','02-895-2567',25,'#쿠폰혜택#TOP100#현장적립','isabel.jpg','주차가능,커플PC,이벤트가능','깨끗한 실내에 직원들이 친절함','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 금천구','독산동 152-10','19605','37.4716823','126.8974884',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2, 'isabel_01.jpg',80000,80000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',2, 'isabel_01.jpg',100000,100000,40000,40000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'복층 트윈',2,'isabel_03.jpg',100000,100000,40000,40000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','녹스-역삼','02-784-9632',30,'#쿠폰혜택#마이룸#현장적립','knox.jpg','주차가능,파티가능,무료영화,게임기','그냥 저냥 무난하다','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강남구','역삼동 677-13',10605,'37.5026586','127.0397283',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드', 2,'knox_02.jpg',80000,80000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트 파티룸',2,'knox_03.jpg',300000,300000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트 파티룸(복층)',5,'knox_04.jpg',500000,500000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','신도림 m7','02-1235-9861',30,'#당일예약취소가능#현장적립','m7.jpg','주차가능,트윈베드,게임기','여성분들을 위한 고대기 구비 및 일회용 샴푸 린스','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 구로구','구로동 44-2',11605,'37.5028578','126.8910834',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'m7_01.jpg',66000,66000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실',2,'m7_02.jpg',76000,76000,31000,31000, lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','가산 마리호텔','02-8961-7549',28,'#현장적립','mari.jpg','무인텔,무료영화,게임기','넓은 객실로 보다 여유롭게 쉴 수 있음','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 금천구','가산동 139-19',12705, '37.4791432','126.8887714',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'mari_02.jpg',70000,70000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실',2,'mari_01.jpg',70000,70000,30000,30000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','여수 오페라','061-644-5005',30,'#현장적립#최저가보상','opera.jpg','주차가능,이벤트가능,무인텔','여수 아쿠아리움,오동도,엑스포5분거리','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('전남 여수시','강남1길 39-17',14625,'34.7198197','127.7477553',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',2,'opera_03.jpg',130000,130000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈',2,'opera_01.jpg',140000,140000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'opera_04.jpg',70000,70000,20000,20000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','신촌 오렌지카운티','02-8567-4626',30,'#쿠폰혜택#마이룸#당일예약취소가능#현장적립#최저가보상','orange.jpg','주차가능,커플PC,파티가능','파티룸 무료로 숙박 할 수 있는 방','최저가보상');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 서대문구','홍제동 323-8',17605,'37.5906565','126.9414539',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'orange_01.jpg',75000,75000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실1',2,'orange_03.jpg',75000,75000,25000,25000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','종로 산장 모텔','02-8932-1452',25,'#쿠폰헤택#마이룸#최저가보상','sanjang.jpg','주차가능,트윈베드,게임기','잠만자기 좋은곳','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 종로구','사직동 262-1',14695,'37.575552','126.9654868',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'sanjang_03.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'준특실',2,'sanjang_01.jpg',60000,60000,20000,20000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','신림cs 프리미어','02-8528-8525',35,'#쿠폰혜택#현장적립','sinlim_cs.jpg','주차가능,안마의자,파티가능','비즈니스 모텔 뷔페 레스토랑 Open Event가격 제공','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 관악구','신림동 1474-11',14605,'37.6085809','126.9299001',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'프리미어 스위트',2,'sinlim_cs_01',99000,99000,33000,33000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'슈페리어 킹',2,'sinlim_cs_04',88000,88000,30000,30000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','건대 테마','02-5689-1247',30,'#쿠폰혜택#현장적립#최저가보상','theme.jpg','주차가능,무료영화,커플PC','연인끼리 가기 딱 좋은곳','최저가보상,현장적립,좋은숙박BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 광진구','화양동 18-11 건대 테마',15008,'37.5477863','127.0668723',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드룸',2,'theme_01.jpg',80000,80000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'원더불룸',2,'theme_02.jpg',90000,90000,30000,30000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','가산 뷰','02-794-5589',35,'#현장적립#최저가보상','view.jpg','주차가능,이벤트가능,파티가능,무인텔','저렴하게 쉬기 괜찮은 모텔','최저가보상,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울 금천구','디지털로12길 7 쉐르빌파크',18515,'37.4642321','126.878492',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'view_04.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈',2,'view_01.jpg',60000,60000,25000,25000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'모텔','태릉(공릉역) W','02-5964-8569',30,'#쿠폰혜택#당일예약취소가능#현장적립#최저가보상','w.jpg','주차가능,커플PC,무료영화','대체적으로 괜찮은 모텔','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 노원구','공릉동 670-8',11849,'37.6183153','127.074564',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'일반실',2,'w_03.jpg',65000,65000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'준특실',2,'w_02.jpg',70000,70000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'특실',2,'w_01.jpg',75000,75000,25000,25000,lodge_no_seq.currval);


--호텔
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','홍대 나인브릭','02-145-8956',50,'#최고의서비스#최고의라운지#최고급시설','n9brick_01.jpg','주차가능,객실금연','최고의 서비스를 자랑하는 호텔','최저가보상,몰카예방');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','홍익로5길 32',14038,'37.553779','126.9183463',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'슈페리어 더블',2,'n9brick_03.jpg',12000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스 더블',2,'n9brick_02.jpg',137500,137500,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','베니키아 아카시아','02-2277-4771',70,'#최고의서비스#최고의라운지#최고급시설','acacia_01.jpg','주차가능,객실금연','깔금한 디자인에 심플한 방을 선호하는 고객을 위한 객실 보유','최저가보상,몰카예방,좋은숙박BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 중구','을지로5가 99',14561,'37.5664456','127.0005068',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'프리미어 트윈',2,'acacia_03.jpg',88000,88000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'슈페리어 트윈',2,'acacia_04.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스 더블',2,'acacia_02.jpg',88000,88000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','그랜드 앰배서더 서울 풀만','02-2275-1101',413,'#최고의서비스#최고의라운지#최고급시설','ambassador_01.jpg','주차가능,객실금연,무료세탁','모던 클래식한 인테리어와 고급스러운 어메니티','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 중구','동호로 287',14618,'37.5602645','127.000193',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'ambassador_02.jpg',145200,145200,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트 디럭스',2,'ambassador_04.jpg',170000,170000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'온돌방',2,'ambassador_03.jpg',180000,180000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','베스트 웨스턴 아리랑 힐 동대문','02-925-7000',190,'#최고의서비스#최고의라운지#최고급시설','arirang_01.jpg','주차가능,객실금연,이벤트가능','합리적인 가격대의 객실, 편안하고 여유로운 휴식을 즐길 수 있는 보다 높은 서비스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 성북구','아리랑로 8',12829,'37.5935481','127.0143813',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'슈페리어 더블',2,'arirang_03.jpg',88000,88000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'슈페리어 디럭스',2,'arirang_04.jpg',99000,99000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','아벤트리 호텔','02-736-1234',136,'#최고의서비스#최고의라운지#최고급시설','aventree_01.jpg','주차가능,이벤트가능,조식가능','모던하면서 아늑한 객실, 최고의 서비드 제공','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 종로구','우정국로 46',13145,'37.5730642','126.9811352',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'aventree_04.jpg',121000,121000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드 트윈',2,'aventree_02.jpg',121000,121000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','반얀트리 클럽 앤 스파 서울','02-2250-8074',100,'#최고의서비스#최고의라운지#최고급시설','banyantree_01.jpg','주차가능,스낵바,픽업가능','안락한 공간에서 편안한 휴식을 즐길 수 있음.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 중구','장충단로 60 길',14605,'37.5505089','126.9984533',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'banyantree_02.jpg',130000,130000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'banyantree_04.jpg',140000,140000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',2,'banyantree_05.jpg',150000,150000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','베스트웨스턴 프리미어 서울가든','02-710-71111',372,'#최고의서비스#최고의라운지#최고급시설','best_01.jpg','주차가능,객실금연,파티가능,이벤트가능','전 객실에서 서울의 야경을 즐길 수 있음','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','마포대로 58 가든호텔',14168,'37.5407089','126.9462625',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'best_02.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'패밀리 트윈',3,'best_04.jpg',132000,132000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'best_03.jpg',99000,99000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','동대문 부티크나인','02-925-0720',110,'#최고의서비스#최고의라운지#최고급시설','boutique_01.jpg','주차가능,파티가능,이벤트가능,객실금연,트윈베드','감각적인 디자인의 객실은 부티크나인의 독특함을 선사하면서 트랜디한 편의시설과 편안한 휴식을 제공','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 동대문구','왕산로 28',12582,'37.57644','127.0244113',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'boutique_02.jpg',60000,60000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'웨스턴 스위트',2,'boutique_04.jpg',70000,70000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'커스터마이즈드 스위트',2,'boutique_03.jpg',70000,70000,35000,35000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','카푸치노 호텔','02-2038-9500',198,'#최고의서비스#최고의라운지#최고급시설','cappuccino_01.jpg','주차가능,조식가능,트윈베드,무료영화','연인, 가족, 사업차방문등 맞춤형 객실로 고객 한사람 한사람에게 만족을 줌','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강남구','봉은사로 155 호텔 카푸치노',16122,'37.506694','127.0293683',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'카푸치노킹',2,'cappuccino_04.jpg',109000,109000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'카푸치노킹(2층침대)',2,'cappuccino_03.jpg',130000,130000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','쉐라톤 서울 디큐브시티 호텔','02-2211-2000',269,'#최고의서비스#최고의라운지#최고급시설','dcube_01.jpg','주차가능,객실금연,이벤트가능,파티가능','서울의 환상적인 파노라마 뷰를 즐길 수 있는 전면 창과 넓고 아늑한 객실','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 구로구','경인로 662 디큐브시티',18209,'37.5088179','126.8875991',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'dcube_03.jpg',193600,193600,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스 코너',2,'dcube_04.jpg',217800,217800,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'클럽룸',2,'dcube_02.jpg',278300,278300,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','수앤수','064-799-7090',56,'#바베큐#관광명소#글램핑','su_and_su1.jpg','주차가능,스낵바,트윈베드','올레 16코스에 위치, 관광 인프라가 풍부','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('제주 제주시 애월읍','부룡수길 60',63047,'33.4741947','126.3564934',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'su_and_su2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'su_and_su3.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'su_and_su4.jpg',200000,220000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','스웨덴','064-796-3721',50,'#바베큐#관광명소#글램핑','sweden1.jpg','주차가능,객실금연,트윈베드','협재 해수욕장과 차량 5분거리','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('제주 제주시 한림읍','명재로 100-47',63015,'33.3906913','126.2583395',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'sweden2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'sweden2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'sweden3.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','에버리치','032-934-1688',70,'#바베큐#관광명소#글램핑','ever_ritch1.jpg','주차가능,무료세탁,트윈베드','해발 100m위에 위치, 다양한 산책코스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천시 강화군 강화읍','화성길 50번길 43',23037,'37.736095','126.4737713',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'ever_ritch3.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'ever_ritch5.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'ever_ritch2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','영종 스카이 리조트','032-745-9000',185,'#바베큐#관광명소#글램핑','yeongjong_sky1.jpg','주차가능,스낵바,조식가능,픽업가능,야외테라스,파티가능','인천공항과 15분거리 위치','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천시 중구','용유서로 379 골든스카이리조트',22383,'37.4504717','1263686166',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'yeongjong_sky2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'yeongjong_sky2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'yeongjong_sky2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','오리엔트','033-332-9797',210,'#바베큐#관광명소#글램핑','orient1.jpg','주차가능,객실금연,트윈베드,야외테라스','해발700m에 위치, 사계절 종합 리조트','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('강원도 평창군 봉평면','태기로 80-56 오리엔리조트',25306,'37.586904','128.3169473',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'orient2.jpg',17000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'orient3.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'orient2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','올레요','064-799-9511',53,'#바베큐#관광명소#글램핑','ollehyo1.jpg','주차가능,객실금연,무료세탁,야외테라스','여유를 즐길 수 있는 리조트','제주 올레길 중 최고의 7번길에 위치');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('제주 서귀포시','이어도로 720',63564,'33.2347443','126.4905212',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'ollehyo4.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'ollehyo2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'ollehyo3.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','일성남한강리조트','031-883-1199',167,'#바베큐#관광명소#글램핑','ilsung_namhangang1.jpg','주차가능,객실금연,스낵바,야외테라스','가족과 휴식을 취하기 알맞은 리조트','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 여주시','신륵로 5',12636,'37.3011181','127.6485774',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'ilsung_namhangang3.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'ilsung_namhangang2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'ilsung_namhangang2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','제주 코델리아','070-4548-2200',150,'#바베큐#관광명소#글램핑','jeju_cordelia1.jpg','주차가능,객실금연,야외테라스,상비약','아름다운 정원과 풀장이 성산일출봉을 배경으로 어우러져 있음.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('제주 서귀포시 성산읍','일주동로4120번길 23-20',63639,'33.4590781','126.9081368',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'jeju_cordelia6.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'한실',2,'jeju_cordelia7.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'jeju_cordelia2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','파라다이스 시티','1833-8855',586,'#카지노#인천공항#연회장','paradise1.jpg','주차가능,객실금연,이벤트가능,조식사능,무료세탁,트윈베드,야외테라스,안마의자,파티가능,야외테라스,상비약','인천공항과 인접해 있는 동북아 최고의 복합 리조트','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천시 중구','영종해안남로321번길 186',22382,'37.4376655','126.4537921',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'paradise2.jpg',300000,320000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'paradise3.jpg',350000,380000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'풀빌라',4,'paradise4.jpg',500000,550000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'호텔/리조트','한화 리조트-용인','1588-2299',110,'#바베큐#관광명소#글램핑','hanhwa_yongin1.jpg','주차가능,객실금연,이벤트가능,트윈베드,게임기,파티가능,상비약','서울에서 1시간 반이면 도착 할 수 있는 편리한 접근성이 강점인 리조트','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 용인시 천인구 남사면','봉무로153번길 79 한화리조트',17119,'37.1316122','127.1419606',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드',2,'hanhwa_yongin2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'디럭스',2,'hanhwa_yongin2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위트',4,'hanhwa_yongin3.jpg',200000,220000,0,0,lodge_no_seq.currval);


--펜션
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','경주 펜션 55번가','010-5152-5541',20,'#야놀자팬션#개쩜#완전멋져#팍씨','f55thstreet_01.jpg','주차가능,객실금연,야외테라스','내집같은 편안한 환경을 제공함','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경북 경주시 천북면','천강로 194',38035,'35.907854','129.2763133',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'P1',2,'f55thstreet_05.jpg',228000,228000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C3',2,'f55thstreet_06.jpg',136500,136500,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C2',2,'f55thstreet_07.jpg',136500,136500,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','올댓워터풀빌라','031-581-3888',10,'#야놀자팬션#개쩜#완전멋져#팍씨','allthatwater_01.jpg','주차가능,객실금연,트윈베드','고급스러운 분위기에서 편안한 휴가를 즐길 수 있음','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 가평군 가평읍','산유리 105-9',12429,'37.7472321','127.51',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'빌라화이트',10,'allthatwater_02.jpg',550000, 550000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'풀사이드1',2,'allthatwater_03.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'풀사이드2',2,'allthatwater_01.jpg',150000,150000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','고성 아미가 펜션','033-632-5564',40,'#야놀자팬션#개쩜#완전멋져#팍씨','amiga_01.jpg','주차가능,객실금연,트윈베드,파티가능','해수욕장 바로 앞에 있어 쾌적한 휴가를 즐길 수 있음','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('강원도 고성군 토성면','봉포리 291-6',24764,'38.2548413','128.5596892',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스파3호',2,'amiga_02.jpg',109000,109000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스파4호',2,'amiga_03.jpg',109000,109000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','어떤날 펜션','010-9417-5557',4,'#야놀자팬션#개쩜#완전멋져#팍씨','anyday.jpg','주차가능,객실금연,야외테라스','도심에서 벗어나 자연친화적인 펜션','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('충청북도 단양군 가곡면','사평리 115-5',27021,'37.0092006','128.2918122',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'봄바람',2,'anyday_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'별채',4,'anyday_03.jpg',200000,200000,0,0,lodge_no_seq.currval);





insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','비치캠프 펜션','033-5641-2587',40,'#야놀자팬션#개쩜#완전멋져#팍씨','beachcamp_01.jpg','주차가능,조식가능,객실금연','기본적인 세면도구, 수건, 드라이기등이 구비되어 좋다.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('강원도 춘천시 남면','한덕리 367-22',24469,'37.6827089','127.6193365',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'대형룸',8,'beachcamp_02.jpg',100000,100000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','종여울 펜션','031-767-0240',1,'#야놀자팬션#개쩜#완전멋져#팍씨','bell_01.jpg','주차가능','세상에 참고 할 만한 후기 없는 숙소','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 광주시 남종면','산수로 2576-102',12706,'37.5241667','127.3576575',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'종여울1',8,'bell_02.jpg',200000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'종여울2',8,'bell_03.jpg',200000,200000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','포레스트문 펜션','010-9012-2995',4,'#야놀자팬션#개쩜#완전멋져#팍씨','forest.jpg','주차가능,객실금연,야외테라스','남녀노소 구분없이 수영장을 맘껏 이용 할 수 있음.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('강원도 춘천시 서면','월송리 381-15',24460,'37.9255977','127.6715392',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'A동',2,'forest_03.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'B동',2,'forest_03.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C동(애견동반)',2,'forest_02.jpg',170000,170000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','아일랜드 펜션','031-355-3447',20,'#야놀자팬션#개쩜#완전멋져#팍씨','ireland_01.jpg','주차가능,객실금연,야외테라스','이름처럼 바다와 가까운 펜션','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 화성시 서신면','해안길 409',18553,'37.1769029','126.6199783',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'그린 2층',2,'ireland_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'블루 2층',2,'ireland_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'퍼플 2층',2,'ireland_03.jpg',150000,150000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','장원 펜션','042-484-8528',5,'#야놀자팬션#개쩜#완전멋져#팍씨','jangwon_01.jpg','주차가능,객실금연,야외테라스','내집같이 편안한 객실','최저가보상,몰카예방,현장적립.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('충남 공주시 반포면','구모동길 67',32626,'36.362575','127.2543362',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'101호',4,'jangwon_02.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201호',5,'jangwon_03.jpg',130000,130000,0,0,lodge_no_seq.currval);





insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','미뇽의숲 펜션','010-4758-1275',10,'#야놀자팬션#개쩜#완전멋져#팍씨','minyong.jpg','주차가능,객실금연','가평 청정지역에 자리잡은 깨끗한 펜션','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 가평군 북면','백둔로 214',12406,'37.9009613','127.4802571',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'아름다운추억',2,'minyong_01.jpg',49000,49000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'둘이함께',2,'minyong_02.jpg',49000,49000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'추억만들기',8,'minyong_03.jpg',159000,159000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','문리버 펜션','070-4666-7143',10,'#야놀자팬션#개쩜#완전멋져#팍씨','moonriver_01.jpg','주차가능,객실금연,파티가능','해발 700m의 산중턱에 자리하고 있는 친환경 통나무 펜션','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('전북 무주군 무풍면','구천동로 289-4',55563,'35.8815128','127.8192844',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'꽃하나',4,'moonriver_02.jpg',95000,95000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'별하나',4,'moonriver_03.jpg',95000,95000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'별둘',4,'moonriver_04.jpg',105000,105000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','해나 펜션','031-581-7709',16,'#야놀자팬션#개쩜#완전멋져#팍씨','haena.jpg','주차가능,객실금연,트윈베드','다양한 객실이 준비되어 있어 여행스타일에 맞게 편히 쉴 수 있음','최저가보상,몰카예방,현장적립.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 가평군 가평읍','당목가일길 482-29',12410,'37.8707301','127.5626603',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'화성 201',2,'haena_04.jpg',69000,69000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'목성 102',6,'haena_02.jpg',139000,139000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'화성 101',6,'haena_03.jpg',140000,140000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','파라디소 펜션','031-581-6660',5,'#야놀자팬션#개쩜#완전멋져#팍씨','paradiso.jpg','주차가능,객실금연,상비약','다른건 모르겠고 홈페이지가 구려서 참고를 못함','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 가평군 복면','도대리 490-1',12401,'37.9642055','127.4633537',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'아만떼',2,'paradiso_03.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'마지아',2,'paradiso_02.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'알리',2,'paradiso_01.jpg',99000,99000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','레드 펜션','010-5582-5755',7,'#야놀자팬션#개쩜#완전멋져#팍씨','red.jpg','주차가능,객실금연,야외테라스','빨갓 맛 궁금해 Honey~ 깨물면 점점 녹아든 스트로베리 그 맛~!','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천 중구','왕산로 71',22383,'37.4631929','126.3638987',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'모던2',2,'red_02.jpg',100000,100000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'모던4',2,'red_03.jpg',120000,120000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','문경 힐하우스 펜션','010-9531-1799',7,'#야놀자팬션#개쩜#완전멋져#팍씨','hillhouse_01.jpg','주차가능,객실금연,야외테라스','힐하우스 힐하우스 공기가 좋은 힐하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경북 문경시 농암면','청화로 581-4',37003,'36.563361','127.9660608',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싸릿잎새',4,'hillhouse_02.jpg',102000,102000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'초록망고',7,'hillhouse_04.jpg',178500,178500,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'들꽃향기',8,'hillhouse_03.jpg',187000,187000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','리버마운틴 펜션','031-5231-5555',10,'#야놀자팬션#개쩜#완전멋져#팍씨','rivermountain_01.jpg','주차가능,객실금연,트윈베드,야외테라스','이건 뭘 쓰지...','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 가평군 북면','제령리 291-3',12405,'37.8941478','127.5281619',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'포크',2,'rivermountain_02.jpg',79000,79000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'인디',2,'rivermountain_03.jpg',89000,89000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'재즈',2,'rivermountain_04.jpg',89000,89000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','태양하우스 펜션','055-328-6921',4,'#야놀자팬션#개쩜#완전멋져#팍씨','sunhouse_01.jpg','주차가능,객실금연,무료세탁','이건 뭐 홈페이지도 없고 후기도 없고...','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경남 김해시 상동면','장척로 440-26',50805,'35.286478','128.9144185',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201호',2,'sunhouse_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'202호',2,'sunhouse_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'205호',4,'sunhouse_03.jpg',250000,250000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','씨엘 펜션','031-581-1032',9,'#야놀자팬션#개쩜#완전멋져#팍씨','cl.jpg','주차가능,객실금연,무료영화','사방에 산들이 병풍처럼 둘러 쌓여있어 자연친화적인 펜션','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 가평군 가평읍','하색리 778-27',12424,'37.8150955','127.465456',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'이슬별',2,'cl_01.jpg',80000,80000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'낭만별',2,'cl_02.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'은하수',2,'cl_03.jpg',60000,60000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'펜션/풀빌라','유앤아이 펜션','010-2212-8954',14,'#야놀자팬션#개쩜#완전멋져#팍씨','youandi_01.jpg','주차가능,객실금연','너와 나만의 사랑 이야기','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기 가평군 북면','백둔로467번길 65-35',12406,'37.8989521','127.4510431',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'러브러브',2,'youandi_02.jpg',39000,39000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스위티',2,'youandi_03.jpg',59000,59000,0,0,lodge_no_seq.currval);


--게하

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','24게스트하우스 청량리점','070-8801-4008',4,'#내집처럼#편안한#남의집#뀨','t24.jpg','주차가능,객실금연,무료세탁','오픈한지 얼마안된 깨끗한 게스트 하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울 동대문구','회기로27길 18',12444,'37.5908694','127.0559786',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'t24_02.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸',2,'t24_01.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트리플룸',3,'t24_03.jpg',60000,60000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','벙커 게스트하우스','010-3234-7309',5,'#내집처럼#편안한#남의집#뀨','bunker.jpg','주차가능,객실금연,파티가능','확실이 이름값을 하는 안전한 게스트하우스','벙커는 안전하다.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인전시 남동구','간석동 167-11',21544,'37.463921','126.7084934',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인 남성 도미토리',1,'bunker_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인 여성 도미토리',1,'bunker_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2인 도미토리',1,'bunker_02.jpg',25000,25000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','코러스 게스트하우스','010-3813-4015',6,'#내집처럼#편안한#남의집#뀨','chorus_01.jpg','주차가능,객실금연','한국에 있는 곳인데 영어로 되어 있어서 해석불가ㅋ','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천시 중구','화랑목로 100번길 75-202호',22361,'37.4946039','126.4959652',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸',2,'chorus_04.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸',2,'chorus_03.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'6인 혼성 도미토리',1,'chorus_02.jpg',25000,25000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','다산 하우스','010-6821-5028',9,'#내집처럼#편안한#남의집#뀨','dasan_01.jpg','주차가능,객실금연,상비약','으악 홈페이지가 없어요~~근데 후기보면 깨끗하다고 함.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 강서구','공항동 34-37',17623,'37.5605665','126.80993',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'3인 혼성 도미토리',1,'dasan_02.jpg',15000,15000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인 여자 도미토리',1,'dasan_03.jpg',15000,15000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인 남자 도미토리',1,'dasan_01.jpg',15000,15000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','드림인서울 게스트하우스','070-7560-8881',9,'#내집처럼#편안한#남의집#뀨','dream.jpg','주차가능,객실금연,상비약','진짜 게스트하우스는 고만고만 한거같음','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 관악구','봉천로12길 32-3 모텔타히티',18753,'37.487104','126.9272214',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'dream_03.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸',2,'dream_02.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸',2,'dream_03.jpg',35000,35000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','친구 게스트하우스','1588-2299',10,'#내집처럼#편안한#남의집#뀨','friend.jpg','주차가능,객실금연,이벤트가능','친구와 함께하면 더 좋은 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','상수동 340-9',14074,'37.545499','126.9198313',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'8인혼성도미',1,'friend_02.jpg',12000,12000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'6인혼성도미',1,'friend_01.jpg',16000,16000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인혼성도미',1,'friend_03.jpg',18000,18000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','게스트하우스 마루','070-8833-0046',20,'#내집처럼#편안한#남의집#뀨','guesthouse_01.jpg','주차가능,객실금연,트위베드','그냥 잠만자러 가기엔 괜찮은곳. 다른건 모름.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울 마포구','독막로7길 27',14047,'37.5455661','126.887',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'guesthouse_02.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2인실',2,'guesthouse_03.jpg',50000,50000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','아이스테이 호스텔','02-776-9988',20,'#내집처럼#편안한#남의집#뀨','istay.jpg','주차가능,객실금연,상비약','여행중인 투숙객을 위한 방.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','토정로 195',14087,'37.5455158','126.9305136',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸1',2,'istay_02.jpg',36000,36000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸2',2,'istay_01.jpg',36000,36000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'패밀리룸',4,'istay_03.jpg',60000,60000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','k-관광호스텔','02-112-1190',50,'#내집처럼#편안한#남의집#뀨','k_01.jpg','주차가능,객실금연','게스트 하우스 입니다.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','신정동 98-1',14080,'37.5596373','126.9460152',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드 싱글',1,'k_02.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'스탠다드 트윈',2,'k_02.jpg',55000,55000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'리버뷰 트리플',3,'k_03.jpg',90000,90000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','몬스터 게스트하우스','070-8987-6888',16,'#내집처럼#편안한#남의집#뀨','monster.jpg','주차가능,객실금연','진짜 게스트하우스 무슨 설명을 써야할지 모르겠다 다 중복이네..','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울 종로구','보문로9길 9',13111,'37.5784186','127.0201516',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸',2,'monster_03.jpg',40000,40000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'패밀리룸',4,'monster_02.jpg',65000,65000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸(미니)',2,'monster_01.jpg',40000,40000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','모닝 게스트하우스','010-5270-4300',10,'#내집처럼#편안한#남의집#뀨','morning_01.jpg','주차가능,객실금연,파티가능','펜션 못지않은 내 집 같은 편안한 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('경기도 가평군 상면','수목원로 376',12448,'37.7483475','127.3526368',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'모닝실 하나',1,'morning_01.jpg',25000,25000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'모닝실 둘',2,'morning_02.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'모닝실 셋',2,'morning_03.jpg',50000,50000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','이태원 N게스트하우스','02-749-4566',31,'#내집처럼#편안한#남의집#뀨','n.jpg','주차가능,객실금연','이태원 프리덤~ 저 찬란한 불빛! 워어어~','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 용산구','녹사평대로26가길 24-4',14391,'37.5323732','126.99',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'여성4인도미',1,'n_01.jpg',16900,16900,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'혼성6인도미',1,'n_02.jpg',15900,15900,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'n_03.jpg',28000,28000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','나루 호스텔','010-9150-9562',24,'#내집처럼#편안한#남의집#뀨','naru.jpg','객실금연','마포구 공덕공에 위치한 깨끗하고 이쁜 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','공덕동 242-45',14211,'37.547406','126.9526525',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'naru_02.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'트윈룸',2,'naru_03.jpg',40000,40000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸',2,'naru_01.jpg',40000,40000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','OK호스텔','010-6782-4222',50,'#내집처럼#편안한#남의집#뀨','ok.png','객실금연','오피스텔형 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천 중구','월미로 195',22302,'37.4774627','126.5990565',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'단체룸',2,'ok_02.jpg',200000,200000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','아웃백 게스트하우스','010-8073-8211',30,'#내집처럼#편안한#남의집#뀨','outback.png','주차가능','전형적인 오피스텔형 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('인천 부평구','주부토로 12',21393,'37.4962352','126.7216963',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인여성도미',1,'outback_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4인남성도미',1,'outback_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'더블룸',2,'outback_01.jpg',40000,40000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','롬바드 게스트하우스','02-555-5858',15,'#내집처럼#편안한#남의집#뀨','lombard.png','주차가능,객실금연','시설이 좋아보이는 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','동교로16길 17',14029,'37.5541422','126.9135463',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'lombard_01.jpg',65000,65000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'코지 2인실',2,'lombard_03.jpg',58000,58000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'10인실 도미토리 전용공간 단체룸',10,'lombard_02.jpg',230000,230000,0, 0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','플렌티 게스트하우스','070-8285-0246',5,'#내집처럼#편안한#남의집#뀨','plenty.jpg','주차가능','주택을 개조해 만든 게스트하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구','포은로2나길 46',14026,'37.5503137','126.9076199',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'205호',1,'plenty_02.jpg',25000,25000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201호',2,'plenty_01.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'103호',4,'plenty_03.jpg',100000,100000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','둥글하우스','010-4262-8641',2,'#내집처럼#편안한#남의집#뀨','round.jpg','객실금연,이벤트가능,파티가능','한옥을 체험 할 수 있습니다.','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울 관악구','남부순환로247가길 22 1층',18801,'37.4773296','126.9632326',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2번방 2인',2,'round_02.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'1번방 2인',2,'round_03.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2번방 4인',4,'round_02.jpg',60000,60000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','우주하우스 게스트하우스','010-6542-2120',6,'#내집처럼#편안한#남의집#뀨','space.jpg','객실금연','깨끗한 게스트 하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 성북구','동소문로 21-20',12833,'37.5904362','127.0057723',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'여성6인도미토리',1,'space_02.jpg',29000,29000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'남성4인도미토리',1,'space_01.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'싱글룸',1,'space_03.jpg',55000,55000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'게스트하우스','유자 게스트하우스','010-6670-3120',5,'#내집처럼#편안한#남의집#뀨','yuza.jpg','객실금연','유자색 게스트 하우스','최저가보상,몰카예방,현장적립');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('서울시 마포구 서교동','독막로3길 52',14047,'37.5503692','126.9157703',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2인실',2,'yuza_04.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'3인실',3,'yuza_02.jpg',57000,57000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'옥탑방',4,'yuza_03.jpg',90000,90000,0,0,lodge_no_seq.currval);
