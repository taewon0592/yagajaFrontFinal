--���̵����� �����

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

-- �߰���ȸ�����̺�
CREATE TABLE Member
(
   -- ȸ���Ϸù�ȣ
   MEMBER_NO number NOT NULL,
   -- ȸ�����̵�
   ID varchar2(50) NOT NULL,
   -- �н�����
   PASS varchar2(50) NOT NULL,
   -- �г���
   NICKNAME varchar2(30) NOT NULL,
   -- �ڵ�����ȣ
   PHONE varchar2(20) NOT NULL,
   -- ���ϸ���
   M_POINT number DEFAULT 0,
   -- �̸���
   EMAIL varchar2(70) NOT NULL,
   -- ȸ��������
   REGIDATE date DEFAULT sysdate,
   -- ���Ѽ��� : DEFUALT USER
   AUTHORITY varchar2(30) DEFAULT 'user',
   PRIMARY KEY (MEMBER_NO)
);

--member_no_seq ����
create sequence member_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- Ż��ȸ�����̺�
CREATE TABLE LEAVE_MEMBER
(
   -- Ż�����
   LEAVE_REASON varchar2(500),
   -- ���γ���
   LEAVE_REASON2 varchar2(1000),
   -- Ż����
   LEAVE_DATE date DEFAULT sysdate NOT NULL,
   -- ȸ���Ϸù�ȣ
   MEMBER_NO number NOT NULL,
    ID varchar(50) not null,
    authority varchar2(30) not null
);


-- ���ڽü����̺�
CREATE TABLE LODGE
(
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL,
   -- ��������
   LODGE_TYPE varchar2(30) NOT NULL,
   -- ���Ҹ�
   LODGE_NAME varchar2(60) NOT NULL,
   -- ������ȭ��ȣ
   LODGE_TEL varchar2(20) NOT NULL,
   -- ���ҹ氳��
   LODGE_ROOMCOUNT number NOT NULL,
   -- �����±�
   LODGE_TAG varchar2(100),
   -- ���Ҵ�ǥ����
   LODGE_PHOTO varchar2(50) NOT NULL,
   -- �����׸�
   LODGE_THEMA varchar2(3000),
   -- ���Ұ��ܼ���
   LODGE_NOTE varchar2(1000),
   -- ���� Ư¡
    LODGE_FEATURE varchar2(200) not null,
   PRIMARY KEY (LODGE_NO)
);

--lodge_no_seq ����
create sequence lodge_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- ���ڽü��ּ����̺�
CREATE TABLE LODGE_ADDR
(
   -- ���ڽü� �ּ�
   ADDR_COMMON varchar2(200) NOT NULL,
   -- ���ڽü� ���ּ�
   ADDR_DETAIL varchar2(100) NOT NULL,
   -- ���ڽü� �����ȣ
   ADDR_ZIPCODE number NOT NULL,
   -- ���ڽü�����
   ADDR_LAT varchar2(50),
   -- ���ڽü��浵
   ADDR_LONG varchar2(50),
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL
);

-- �������̺�
CREATE TABLE RESERVATION
(
   -- �����ȣ
   RESER_NO number NOT NULL,
   -- �����ڸ�
   RESER_NAME varchar2(50) NOT NULL,
   -- �Խǽð�
   CHECK_IN date NOT NULL,
   -- ��ǽð�
   CHECK_OUT date NOT NULL,
   -- �������޴�����ȣ
   RESER_PHONE varchar2(20) NOT NULL,
   -- �湮���� : CHECK�� ��������
   VISIT_TYPE varchar2(20) NOT NULL,
   -- ��������
   RESER_DATE date DEFAULT SYSDATE NOT NULL,
   -- �������
   CANCLE_DATE date DEFAULT SYSDATE,
   -- ��Ҽ�����
   CANCLE_FEE number DEFAULT 0 NOT NULL,
   -- �������� : CHECK
   RESER_TYPE varchar2(20) NOT NULL,
   -- �������� : CHECK
   PAYMENT_TYPE varchar2(20) NOT NULL,
   -- �����ݾ�
   PAYMENT_PRICE number NOT NULL,
   -- ��Ż�ǰ��ȣ
   AUCTION_NO number NOT NULL,
   -- �ֵ��Ϸù�ȣ
   HOTDEAL_NO number NOT NULL,
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL,
   -- ȸ���Ϸù�ȣ
   MEMBER_NO number NOT NULL,
   PRIMARY KEY (RESER_NO)
);

--RESERVATION_no_seq ����
create sequence reservation_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- �������̺�
CREATE TABLE ROOM
(
   -- �����Ϸù�ȣ
   ROOM_NO number NOT NULL,
   -- ��������
   ROOM_TYPE varchar2(100) NOT NULL,
   -- �����ο�
   ROOM_PERSON number NOT NULL,
   -- ���ǻ���
   ROOM_PHOTO varchar2(1000),
   -- ���߼��ڰ���
   D_SLEEP_PRICE number NOT NULL,
   -- �ָ����ڰ���
   W_SLEEP_PRICE number NOT NULL,
   -- ���ߴ�ǰ���
   D_RENT_PRICE number NOT NULL,
   -- �ָ���ǰ���
   W_RENT_PRICE number NOT NULL,
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL,
   PRIMARY KEY (ROOM_NO)
);

--room_no_seq ����
create sequence room_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- �ֺ��ü����̺�
CREATE TABLE SURROUND
(
   -- �ֺ��ü��Ϸù�ȣ
   SURROUND_NO number NOT NULL,
   -- �ֺ��ü���ȣ��
   SURROUND_NAME varchar2(100) NOT NULL,
   -- �ֺ��ü� ��ȭ��ȣ
   SURROUND_TEL varchar2(20) NOT NULL,
   -- �ֺ��ü� ����
   SURROUND_TYPE varchar2(50) NOT NULL,
   -- �ֺ��ü� �ּ�
   SURROUND_ADDR varchar2(200) NOT NULL,
    -- �ֺ��ü� �ּ�
   SURROUND_DETAIL varchar2(100) NOT NULL,
    -- �ֺ��ü� �ּ�
   SURROUND_ZIPCODE NUMBER NOT NULL,
   -- �ֺ��ü� ����
   SURROUND_LAT varchar2(50),
   -- �ֺ��ü� �浵
   SURROUND_LONG varchar2(50),
   PRIMARY KEY (SURROUND_NO)
);
--SURROUND_no_seq ����
create sequence surround_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- ������̺�
CREATE TABLE AUCTION
(
   -- ��Ż�ǰ��ȣ
   AUCTION_NO number NOT NULL,
   -- ��Ž��۰�
   START_PRICE number NOT NULL,
   -- ��ų�����
   END_PRICE number,
   -- ����ְ�����
   FINAL_BIDDER varchar2(30),
   -- ���������
   TENDER_COUNT number DEFAULT 0,
   -- �����ȸ��
   AUCTION_HITS number DEFAULT 0,
    -- ��� �����ܰ�
    AUCTION_UNIT number NOT NULL,
   -- ��� ���۽ð�
   AUCTION_STIME date NOT NULL,
   -- ��� ����ð�
   AUCTION_ETIME date NOT NULL,
   -- ��� �������
   AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
   -- ���� �Ϸù�ȣ
   LODGE_NO number NOT NULL,
    -- �� �Ϸù�ȣ
    ROOM_NO number NOT NULL,
    -- üũ��
    check_in date not null,
    -- üũ�ƿ�
    check_out date not null,

   PRIMARY KEY (AUCTION_NO)
);

--auction_no_seq ����
create sequence auction_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;
-- �ֵ����̺�
CREATE TABLE HOTDEAL
(
   -- �ֵ��Ϸù�ȣ
   HOTDEAL_NO number NOT NULL,
   -- �ֵ����۽ð�
   HOTDEAL_STIME date NOT NULL,
   -- �ֵ������ð�
   HOTDEAL_ETIME date NOT NULL,
   -- �ֵ�����ݾ�
   HOTDEAL_PRICE number NOT NULL,
   -- �ֵ����Ű��ɼ���
   HOTDEAL_BUY number NOT NULL,
   -- �ֵ��Ǹż���
   HOTDEAL_SELL number DEFAULT 0,
   -- �ֵ��������
   HOTDEAL_DATE date DEFAULT SYSDATE,
   -- �ֵ���������
   HOTDEAL_SDAY date NOT NULL,
   -- �ֵ����������
   HOTDEAL_EDAY date NOT NULL,
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL,
    -- ���Ϸù�ȣ
   ROOM_NO number NOT NULL,
   PRIMARY KEY (HOTDEAL_NO)
);
--hotdeal_no_seq ����
create sequence hotdeal_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- �����������̺�
CREATE TABLE NOTICE
(
   -- ���������Ϸù�ȣ
   NOTICE_NO number NOT NULL,
   -- �������� ����
   NOTICE_TITLE varchar2(100) NOT NULL,
   -- �������� ����
   NOTICE_CONTENTS varchar2(4000) NOT NULL,
   -- �������� �������
   NOTICE_REGIDATE date DEFAULT SYSDATE,
   -- �������� �ۼ���
   NOTICE_NAME varchar2(50) NOT NULL,
   PRIMARY KEY (NOTICE_NO)
);

--notice_no_seq ����
create sequence notice_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

-- �̿��ı����̺�
CREATE TABLE REVIEW
(
   -- �̿��ı��Ϸù�ȣ
   REVIEW_NO number NOT NULL,
   -- �̿��ı�����
   REVIEW_SCORE varchar2(10) NOT NULL,
   -- �̿��ı⳻��
   REVIEW_CONTENTS varchar2(500) NOT NULL,
   -- �̿��ı�÷������
   REVIEW_PHOTO varchar2(1000),
   -- �̿��ı��ۼ�����
   REVIEW_DATE date DEFAULT SYSDATE,
   -- �����Ϸù�ȣ
   LODGE_NO number NOT NULL,
   PRIMARY KEY (REVIEW_NO)
);

--review_no_seq ����
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

--����
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�̾� ��','02-6565-9659',30,'#��������#���̷�#��������#����������','boom.jpg','��������,Ŀ��PC,���Ǳݿ�,�̺�Ʈ����','����԰� �ƴ����� �����ϴ� ����','��������BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���ϱ�','������ 34-7',11220,'37.5235975','126.9435013',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'boom_01.jpg',50000,50000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�1',2,'boom_02.jpg',50000,50000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�2',2,'boom_03.jpg',50000,50000,20000,20000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ĳ��','02-6598-1254',25,'#��������','castle.jpg','��������,Ʈ������','������ ���� �� �� �ִ� ����','����������, ��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ��õ��','�����з�12�� 5 ����ĳ��',18515,'37.478442','126.8871335',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'castle_01.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��Ư��',2,'castle_02.jpg',60000,60000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��',2,'castle_03.jpg',65000,65000,35000,35000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','��� ÿ��','02-6623-7820',35,'#��������#���̷�#���Ͽ�����Ұ���#��������#����������','cello.jpg','��������,���῵ȭ,���ӱ�','��ȭ�� ������ �����ϴ� �е��� ���� �غ�� ����','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���ı�','���̵� 37-3',14605,'37.515807','127.1095807',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'cello_03.jpg',70000,70000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'cello_04.jpg',75000,75000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�ξ⽺��Ʈ',2,'cello_02.jpg',120000,120000,50000,50000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�ϻ� ��� ü��','031-986-4586',30,'#��������#����������','chess_01.jpg','��������,Ŀ��PC','���� ���� ����ϰ� ������� ģ���Ͻ� ����','������ ����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���� ���籸','��ŵ� 714-2',10523,'37.6149236','126.8316115',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'chess_01.jpg',61000,61000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��1',2,'chess_02.jpg',61000,61000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��2',2,'chess_04.jpg',61000,61000,26000,26000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ���','02-5269-7856',31,'#��������','daemyeong.jpg','��������,�̺�Ʈ ����,���῵ȭ','����Ѱ� �⺻�̰� ���ݵ� ������ ����','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ����','���̵� 16-17',13404,'37.6068326','126.9216507',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'daemyeong_01.jpg',40000,40000,20000,20000,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','��� ��','02-935-6541',30,'#��������#��������#����_���𵨸�','dean.jpg','��������,������','���� �Ǹ��� ���� Ŀ�þȸ����ڴ� ��','����������,��������BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� �����','��赿 708-1',13605,'37.6544685','127.0585352',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'dean_01.jpg',85000,85000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�1',2,'dean_02.jpg',90000,90000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�2',2,'dean_03.jpg',90000,90000,35000,35000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','H Avenue-����','02-589-5963',25,'#��������#TOP100#���̷�#�������ڿ�����#��������#����������','h_avenue.jpg','��������,�̺�Ʈ����,�ȸ�����','���� �ʿ���� ����','��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','���ﵿ 678-14',12605,'37.5024315','127.0387326',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'h_avenue_02.jpg',80000,80000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�۷���',2,'h_avenue_01.jpg',400000,400000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','Hotel the Artist-����','02-569-4920',30,'#��������#TOP100#���̷�#��������#����������','hotel_the_artist.jpg','�̺�Ʈ����,�߿��׶�,��������','������ ���� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','���ﵿ 678-13',15505,'37.5023554','127.0384599',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'hotel_the_artist_03.jpg',99000,99000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'hotel_the_artist_01.jpg',110000,110000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����̾�_�̺�Ʈ',2,'hotel_the_artist_02.jpg',120000,120000,50000,50000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ��','02-896-4521',30,'#��������#���̷�#����������','hugh_01.jpg','��������,��Ƽ����','������ ���� ���ϰ� �� �� �ִ� ��','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ��õ��','���굿 973-4',14675,'37.4759904','126.9032239',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�(�̴�)',2,'hugh_02.jpg',58000,58000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2, 'hugh_01.jpg',60000,60000,40000,40000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� �̻级','02-895-2567',25,'#��������#TOP100#��������','isabel.jpg','��������,Ŀ��PC,�̺�Ʈ����','������ �ǳ��� �������� ģ����','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ��õ��','���굿 152-10','19605','37.4716823','126.8974884',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2, 'isabel_01.jpg',80000,80000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',2, 'isabel_01.jpg',100000,100000,40000,40000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���� Ʈ��',2,'isabel_03.jpg',100000,100000,40000,40000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�콺-����','02-784-9632',30,'#��������#���̷�#��������','knox.jpg','��������,��Ƽ����,���῵ȭ,���ӱ�','�׳� ���� �����ϴ�','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','���ﵿ 677-13',10605,'37.5026586','127.0397283',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�', 2,'knox_02.jpg',80000,80000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ ��Ƽ��',2,'knox_03.jpg',300000,300000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ ��Ƽ��(����)',5,'knox_04.jpg',500000,500000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�ŵ��� m7','02-1235-9861',30,'#���Ͽ�����Ұ���#��������','m7.jpg','��������,Ʈ������,���ӱ�','�����е��� ���� ���� ���� �� ��ȸ�� ��Ǫ ����','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���α�','���ε� 44-2',11605,'37.5028578','126.8910834',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'m7_01.jpg',66000,66000,26000,26000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��',2,'m7_02.jpg',76000,76000,31000,31000, lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ����ȣ��','02-8961-7549',28,'#��������','mari.jpg','������,���῵ȭ,���ӱ�','���� ���Ƿ� ���� �����Ӱ� �� �� ����','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ��õ��','���굿 139-19',12705, '37.4791432','126.8887714',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'mari_02.jpg',70000,70000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��',2,'mari_01.jpg',70000,70000,30000,30000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� �����','061-644-5005',30,'#��������#����������','opera.jpg','��������,�̺�Ʈ����,������','���� ����Ƹ���,������,������5�аŸ�','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ������','����1�� 39-17',14625,'34.7198197','127.7477553',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',2,'opera_03.jpg',130000,130000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ��',2,'opera_01.jpg',140000,140000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'opera_04.jpg',70000,70000,20000,20000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ������ī��Ƽ','02-8567-4626',30,'#��������#���̷�#���Ͽ�����Ұ���#��������#����������','orange.jpg','��������,Ŀ��PC,��Ƽ����','��Ƽ�� ����� ���� �� �� �ִ� ��','����������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���빮��','ȫ���� 323-8',17605,'37.5906565','126.9414539',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'orange_01.jpg',75000,75000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�1',2,'orange_03.jpg',75000,75000,25000,25000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ���� ����','02-8932-1452',25,'#��������#���̷�#����������','sanjang.jpg','��������,Ʈ������,���ӱ�','�Ḹ�ڱ� ������','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���α�','������ 262-1',14695,'37.575552','126.9654868',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'sanjang_03.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��Ư��',2,'sanjang_01.jpg',60000,60000,20000,20000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�Ÿ�cs �����̾�','02-8528-8525',35,'#��������#��������','sinlim_cs.jpg','��������,�ȸ�����,��Ƽ����','����Ͻ� ���� ���� ������� Open Event���� ����','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���Ǳ�','�Ÿ��� 1474-11',14605,'37.6085809','126.9299001',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����̾� ����Ʈ',2,'sinlim_cs_01',99000,99000,33000,33000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���丮�� ŷ',2,'sinlim_cs_04',88000,88000,30000,30000,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�Ǵ� �׸�','02-5689-1247',30,'#��������#��������#����������','theme.jpg','��������,���῵ȭ,Ŀ��PC','���γ��� ���� �� ������','����������,��������,��������BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','ȭ�絿 18-11 �Ǵ� �׸�',15008,'37.5477863','127.0668723',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ��',2,'theme_01.jpg',80000,80000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����ҷ�',2,'theme_02.jpg',90000,90000,30000,30000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','���� ��','02-794-5589',35,'#��������#����������','view.jpg','��������,�̺�Ʈ����,��Ƽ����,������','�����ϰ� ���� ������ ����','����������,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ��õ��','�����з�12�� 7 ��������ũ',18515,'37.4642321','126.878492',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'view_04.jpg',55000,55000,20000,20000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ��',2,'view_01.jpg',60000,60000,25000,25000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'����','�¸�(������) W','02-5964-8569',30,'#��������#���Ͽ�����Ұ���#��������#����������','w.jpg','��������,Ŀ��PC,���῵ȭ','��ü������ ������ ����','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� �����','������ 670-8',11849,'37.6183153','127.074564',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ϲݽ�',2,'w_03.jpg',65000,65000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��Ư��',2,'w_02.jpg',70000,70000,25000,25000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ư��',2,'w_01.jpg',75000,75000,25000,25000,lodge_no_seq.currval);


--ȣ��
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','ȫ�� ���κ긯','02-145-8956',50,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','n9brick_01.jpg','��������,���Ǳݿ�','�ְ��� ���񽺸� �ڶ��ϴ� ȣ��','����������,��ī����');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','ȫ�ͷ�5�� 32',14038,'37.553779','126.9183463',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���丮�� ����',2,'n9brick_03.jpg',12000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽� ����',2,'n9brick_02.jpg',137500,137500,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','����Ű�� ��ī�þ�','02-2277-4771',70,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','acacia_01.jpg','��������,���Ǳݿ�','����� �����ο� ������ ���� ��ȣ�ϴ� ���� ���� ���� ����','����������,��ī����,��������BEST100');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� �߱�','������5�� 99',14561,'37.5664456','127.0005068',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����̾� Ʈ��',2,'acacia_03.jpg',88000,88000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���丮�� Ʈ��',2,'acacia_04.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽� ����',2,'acacia_02.jpg',88000,88000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�׷��� �ڹ輭�� ���� Ǯ��','02-2275-1101',413,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','ambassador_01.jpg','��������,���Ǳݿ�,���ἼŹ','��� Ŭ������ ���׸���� ��޽����� ��޴�Ƽ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� �߱�','��ȣ�� 287',14618,'37.5602645','127.000193',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'ambassador_02.jpg',145200,145200,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ �𷰽�',2,'ambassador_04.jpg',170000,170000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�µ���',2,'ambassador_03.jpg',180000,180000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','����Ʈ ������ �Ƹ��� �� ���빮','02-925-7000',190,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','arirang_01.jpg','��������,���Ǳݿ�,�̺�Ʈ����','�ո����� ���ݴ��� ����, ����ϰ� �����ο� �޽��� ��� �� �ִ� ���� ���� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���ϱ�','�Ƹ����� 8',12829,'37.5935481','127.0143813',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���丮�� ����',2,'arirang_03.jpg',88000,88000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���丮�� �𷰽�',2,'arirang_04.jpg',99000,99000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�ƺ�Ʈ�� ȣ��','02-736-1234',136,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','aventree_01.jpg','��������,�̺�Ʈ����,���İ���','����ϸ鼭 �ƴ��� ����, �ְ��� ����� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���α�','�������� 46',13145,'37.5730642','126.9811352',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'aventree_04.jpg',121000,121000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ� Ʈ��',2,'aventree_02.jpg',121000,121000,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�ݾ�Ʈ�� Ŭ�� �� ���� ����','02-2250-8074',100,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','banyantree_01.jpg','��������,������,�Ⱦ�����','�ȶ��� �������� ����� �޽��� ��� �� ����.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� �߱�','����ܷ� 60 ��',14605,'37.5505089','126.9984533',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'banyantree_02.jpg',130000,130000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'banyantree_04.jpg',140000,140000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',2,'banyantree_05.jpg',150000,150000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','����Ʈ������ �����̾� ���ﰡ��','02-710-71111',372,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','best_01.jpg','��������,���Ǳݿ�,��Ƽ����,�̺�Ʈ����','�� ���ǿ��� ������ �߰��� ��� �� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������� 58 ����ȣ��',14168,'37.5407089','126.9462625',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'best_02.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�йи� Ʈ��',3,'best_04.jpg',132000,132000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'best_03.jpg',99000,99000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','���빮 ��Ƽũ����','02-925-0720',110,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','boutique_01.jpg','��������,��Ƽ����,�̺�Ʈ����,���Ǳݿ�,Ʈ������','�������� �������� ������ ��Ƽũ������ ��Ư���� �����ϸ鼭 Ʈ������ ���ǽü��� ����� �޽��� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���빮��','�ջ�� 28',12582,'37.57644','127.0244113',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'boutique_02.jpg',60000,60000,30000,30000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������ ����Ʈ',2,'boutique_04.jpg',70000,70000,35000,35000,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ŀ���͸������ ����Ʈ',2,'boutique_03.jpg',70000,70000,35000,35000,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','īǪġ�� ȣ��','02-2038-9500',198,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','cappuccino_01.jpg','��������,���İ���,Ʈ������,���῵ȭ','����, ����, ������湮�� ������ ���Ƿ� �� �ѻ�� �ѻ������ ������ ��','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������� 155 ȣ�� īǪġ��',16122,'37.506694','127.0293683',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'īǪġ��ŷ',2,'cappuccino_04.jpg',109000,109000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'īǪġ��ŷ(2��ħ��)',2,'cappuccino_03.jpg',130000,130000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','������ ���� ��ť���Ƽ ȣ��','02-2211-2000',269,'#�ְ��Ǽ���#�ְ��Ƕ����#�ְ�޽ü�','dcube_01.jpg','��������,���Ǳݿ�,�̺�Ʈ����,��Ƽ����','������ ȯ������ �ĳ�� �並 ��� �� �ִ� ���� â�� �а� �ƴ��� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���α�','���η� 662 ��ť���Ƽ',18209,'37.5088179','126.8875991',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'dcube_03.jpg',193600,193600,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽� �ڳ�',2,'dcube_04.jpg',217800,217800,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ŭ����',2,'dcube_02.jpg',278300,278300,0,0,lodge_no_seq.currval);

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','���ؼ�','064-799-7090',56,'#�ٺ�ť#�������#�۷���','su_and_su1.jpg','��������,������,Ʈ������','�÷� 16�ڽ��� ��ġ, ���� ������ ǳ��','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���ֽ� �ֿ���','�η���� 60',63047,'33.4741947','126.3564934',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'su_and_su2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'su_and_su3.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'su_and_su4.jpg',200000,220000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','������','064-796-3721',50,'#�ٺ�ť#�������#�۷���','sweden1.jpg','��������,���Ǳݿ�,Ʈ������','���� �ؼ������ ���� 5�аŸ�','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���ֽ� �Ѹ���','����� 100-47',63015,'33.3906913','126.2583395',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'sweden2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'sweden2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'sweden3.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','������ġ','032-934-1688',70,'#�ٺ�ť#�������#�۷���','ever_ritch1.jpg','��������,���ἼŹ,Ʈ������','�ع� 100m���� ��ġ, �پ��� ��å�ڽ�','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ�� ��ȭ�� ��ȭ��','ȭ���� 50���� 43',23037,'37.736095','126.4737713',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'ever_ritch3.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'ever_ritch5.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'ever_ritch2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','���� ��ī�� ����Ʈ','032-745-9000',185,'#�ٺ�ť#�������#�۷���','yeongjong_sky1.jpg','��������,������,���İ���,�Ⱦ�����,�߿��׶�,��Ƽ����','��õ���װ� 15�аŸ� ��ġ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ�� �߱�','�������� 379 ��罺ī�̸���Ʈ',22383,'37.4504717','1263686166',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'yeongjong_sky2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'yeongjong_sky2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'yeongjong_sky2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','������Ʈ','033-332-9797',210,'#�ٺ�ť#�������#�۷���','orient1.jpg','��������,���Ǳݿ�,Ʈ������,�߿��׶�','�ع�700m�� ��ġ, ����� ���� ����Ʈ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('������ ��â�� �����','�±�� 80-56 ����������Ʈ',25306,'37.586904','128.3169473',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'orient2.jpg',17000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'orient3.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'orient2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�÷���','064-799-9511',53,'#�ٺ�ť#�������#�۷���','ollehyo1.jpg','��������,���Ǳݿ�,���ἼŹ,�߿��׶�','������ ��� �� �ִ� ����Ʈ','���� �÷��� �� �ְ��� 7���濡 ��ġ');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ��������','�̾�� 720',63564,'33.2347443','126.4905212',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'ollehyo4.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'ollehyo2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'ollehyo3.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�ϼ����Ѱ�����Ʈ','031-883-1199',167,'#�ٺ�ť#�������#�۷���','ilsung_namhangang1.jpg','��������,���Ǳݿ�,������,�߿��׶�','������ �޽��� ���ϱ� �˸��� ����Ʈ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���ֽ�','�Ÿ��� 5',12636,'37.3011181','127.6485774',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'ilsung_namhangang3.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'ilsung_namhangang2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'ilsung_namhangang2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','���� �ڵ�����','070-4548-2200',150,'#�ٺ�ť#�������#�۷���','jeju_cordelia1.jpg','��������,���Ǳݿ�,�߿��׶�,����','�Ƹ��ٿ� ������ Ǯ���� ����������� ������� ��췯�� ����.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� �������� ������','���ֵ���4120���� 23-20',63639,'33.4590781','126.9081368',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'jeju_cordelia6.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�ѽ�',2,'jeju_cordelia7.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'jeju_cordelia2.jpg',200000,220000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','�Ķ���̽� ��Ƽ','1833-8855',586,'#ī����#��õ����#��ȸ��','paradise1.jpg','��������,���Ǳݿ�,�̺�Ʈ����,���Ļ��,���ἼŹ,Ʈ������,�߿��׶�,�ȸ�����,��Ƽ����,�߿��׶�,����','��õ���װ� ������ �ִ� ���Ͼ� �ְ��� ���� ����Ʈ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ�� �߱�','�����ؾȳ���321���� 186',22382,'37.4376655','126.4537921',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'paradise2.jpg',300000,320000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'paradise3.jpg',350000,380000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ǯ����',4,'paradise4.jpg',500000,550000,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'ȣ��/����Ʈ','��ȭ ����Ʈ-����','1588-2299',110,'#�ٺ�ť#�������#�۷���','hanhwa_yongin1.jpg','��������,���Ǳݿ�,�̺�Ʈ����,Ʈ������,���ӱ�,��Ƽ����,����','���￡�� 1�ð� ���̸� ���� �� �� �ִ� ���� ���ټ��� ������ ����Ʈ','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���ν� õ�α� �����','������153���� 79 ��ȭ����Ʈ',17119,'37.1316122','127.1419606',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ�',2,'hanhwa_yongin2.jpg',170000,190000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�𷰽�',2,'hanhwa_yongin2.jpg',180000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ʈ',4,'hanhwa_yongin3.jpg',200000,220000,0,0,lodge_no_seq.currval);


--���
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���� ��� 55����','010-5152-5541',20,'#�߳����Ҽ�#����#��������#�ž�','f55thstreet_01.jpg','��������,���Ǳݿ�,�߿��׶�','�������� ����� ȯ���� ������','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���ֽ� õ�ϸ�','õ���� 194',38035,'35.907854','129.2763133',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'P1',2,'f55thstreet_05.jpg',228000,228000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C3',2,'f55thstreet_06.jpg',136500,136500,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C2',2,'f55thstreet_07.jpg',136500,136500,0,0,lodge_no_seq.currval);


insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�ô����Ǯ����','031-581-3888',10,'#�߳����Ҽ�#����#��������#�ž�','allthatwater_01.jpg','��������,���Ǳݿ�,Ʈ������','��޽����� �����⿡�� ����� �ް��� ��� �� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���� ������','������ 105-9',12429,'37.7472321','127.51',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����ȭ��Ʈ',10,'allthatwater_02.jpg',550000, 550000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ǯ���̵�1',2,'allthatwater_03.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ǯ���̵�2',2,'allthatwater_01.jpg',150000,150000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�� �ƹ̰� ���','033-632-5564',40,'#�߳����Ҽ�#����#��������#�ž�','amiga_01.jpg','��������,���Ǳݿ�,Ʈ������,��Ƽ����','�ؼ����� �ٷ� �տ� �־� ������ �ް��� ��� �� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('������ ���� �伺��','������ 291-6',24764,'38.2548413','128.5596892',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����3ȣ',2,'amiga_02.jpg',109000,109000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����4ȣ',2,'amiga_03.jpg',109000,109000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','��� ���','010-9417-5557',4,'#�߳����Ҽ�#����#��������#�ž�','anyday.jpg','��������,���Ǳݿ�,�߿��׶�','���ɿ��� ��� �ڿ�ģȭ���� ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��û�ϵ� �ܾ籺 �����','���� 115-5',27021,'37.0092006','128.2918122',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���ٶ�',2,'anyday_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��ä',4,'anyday_03.jpg',200000,200000,0,0,lodge_no_seq.currval);





insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','��ġķ�� ���','033-5641-2587',40,'#�߳����Ҽ�#����#��������#�ž�','beachcamp_01.jpg','��������,���İ���,���Ǳݿ�','�⺻���� ���鵵��, ����, ����̱���� ����Ǿ� ����.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('������ ��õ�� ����','�Ѵ��� 367-22',24469,'37.6827089','127.6193365',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������',8,'beachcamp_02.jpg',100000,100000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','������ ���','031-767-0240',1,'#�߳����Ҽ�#����#��������#�ž�','bell_01.jpg','��������','���� ���� �� ���� �ı� ���� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���ֽ� ������','����� 2576-102',12706,'37.5241667','127.3576575',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������1',8,'bell_02.jpg',200000,200000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������2',8,'bell_03.jpg',200000,200000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','������Ʈ�� ���','010-9012-2995',4,'#�߳����Ҽ�#����#��������#�ž�','forest.jpg','��������,���Ǳݿ�,�߿��׶�','������ ���о��� �������� ���� �̿� �� �� ����.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('������ ��õ�� ����','���۸� 381-15',24460,'37.9255977','127.6715392',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'A��',2,'forest_03.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'B��',2,'forest_03.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'C��(�ְߵ���)',2,'forest_02.jpg',170000,170000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���Ϸ��� ���','031-355-3447',20,'#�߳����Ҽ�#����#��������#�ž�','ireland_01.jpg','��������,���Ǳݿ�,�߿��׶�','�̸�ó�� �ٴٿ� ����� ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ȭ���� ���Ÿ�','�ؾȱ� 409',18553,'37.1769029','126.6199783',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�׸� 2��',2,'ireland_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��� 2��',2,'ireland_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���� 2��',2,'ireland_03.jpg',150000,150000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','��� ���','042-484-8528',5,'#�߳����Ҽ�#����#��������#�ž�','jangwon_01.jpg','��������,���Ǳݿ�,�߿��׶�','�������� ����� ����','����������,��ī����,��������.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('�泲 ���ֽ� ������','���𵿱� 67',32626,'36.362575','127.2543362',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'101ȣ',4,'jangwon_02.jpg',120000,120000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201ȣ',5,'jangwon_03.jpg',130000,130000,0,0,lodge_no_seq.currval);





insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�̴��ǽ� ���','010-4758-1275',10,'#�߳����Ҽ�#����#��������#�ž�','minyong.jpg','��������,���Ǳݿ�','���� û�������� �ڸ����� ������ ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���� �ϸ�','��з� 214',12406,'37.9009613','127.4802571',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ƹ��ٿ��߾�',2,'minyong_01.jpg',49000,49000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����Բ�',2,'minyong_02.jpg',49000,49000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�߾︸���',8,'minyong_03.jpg',159000,159000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','������ ���','070-4666-7143',10,'#�߳����Ҽ�#����#��������#�ž�','moonriver_01.jpg','��������,���Ǳݿ�,��Ƽ����','�ع� 700m�� �����ο� �ڸ��ϰ� �ִ� ģȯ�� �볪�� ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���ֱ� ��ǳ��','��õ���� 289-4',55563,'35.8815128','127.8192844',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���ϳ�',4,'moonriver_02.jpg',95000,95000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���ϳ�',4,'moonriver_03.jpg',95000,95000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����',4,'moonriver_04.jpg',105000,105000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�س� ���','031-581-7709',16,'#�߳����Ҽ�#����#��������#�ž�','haena.jpg','��������,���Ǳݿ�,Ʈ������','�پ��� ������ �غ�Ǿ� �־� ���ེŸ�Ͽ� �°� ���� �� �� ����','����������,��ī����,��������.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���� ������','����ϱ� 482-29',12410,'37.8707301','127.5626603',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'ȭ�� 201',2,'haena_04.jpg',69000,69000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�� 102',6,'haena_02.jpg',139000,139000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'ȭ�� 101',6,'haena_03.jpg',140000,140000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�Ķ��� ���','031-581-6660',5,'#�߳����Ҽ�#����#��������#�ž�','paradiso.jpg','��������,���Ǳݿ�,����','�ٸ��� �𸣰ڰ� Ȩ�������� ������ ���� ����','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���� ����','���븮 490-1',12401,'37.9642055','127.4633537',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�Ƹ���',2,'paradiso_03.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������',2,'paradiso_02.jpg',99000,99000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�˸�',2,'paradiso_01.jpg',99000,99000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���� ���','010-5582-5755',7,'#�߳����Ҽ�#����#��������#�ž�','red.jpg','��������,���Ǳݿ�,�߿��׶�','���� �� �ñ��� Honey~ ������ ���� ��Ƶ� ��Ʈ�κ��� �� ��~!','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ �߱�','�ջ�� 71',22383,'37.4631929','126.3638987',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���2',2,'red_02.jpg',100000,100000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���4',2,'red_03.jpg',120000,120000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���� ���Ͽ콺 ���','010-9531-1799',7,'#�߳����Ҽ�#����#��������#�ž�','hillhouse_01.jpg','��������,���Ǳݿ�,�߿��׶�','���Ͽ콺 ���Ͽ콺 ���Ⱑ ���� ���Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ����� ��ϸ�','ûȭ�� 581-4',37003,'36.563361','127.9660608',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�θ��ٻ�',4,'hillhouse_02.jpg',102000,102000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�ʷϸ���',7,'hillhouse_04.jpg',178500,178500,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������',8,'hillhouse_03.jpg',187000,187000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','��������ƾ ���','031-5231-5555',10,'#�߳����Ҽ�#����#��������#�ž�','rivermountain_01.jpg','��������,���Ǳݿ�,Ʈ������,�߿��׶�','�̰� �� ����...','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���� �ϸ�','���ɸ� 291-3',12405,'37.8941478','127.5281619',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��ũ',2,'rivermountain_02.jpg',79000,79000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�ε�',2,'rivermountain_03.jpg',89000,89000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����',2,'rivermountain_04.jpg',89000,89000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','�¾��Ͽ콺 ���','055-328-6921',4,'#�߳����Ҽ�#����#��������#�ž�','sunhouse_01.jpg','��������,���Ǳݿ�,���ἼŹ','�̰� �� Ȩ�������� ���� �ı⵵ ����...','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('�泲 ���ؽ� �󵿸�','��ô�� 440-26',50805,'35.286478','128.9144185',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201ȣ',2,'sunhouse_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'202ȣ',2,'sunhouse_02.jpg',150000,150000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'205ȣ',4,'sunhouse_03.jpg',250000,250000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���� ���','031-581-1032',9,'#�߳����Ҽ�#����#��������#�ž�','cl.jpg','��������,���Ǳݿ�,���῵ȭ','��濡 ����� ��ǳó�� �ѷ� �׿��־� �ڿ�ģȭ���� ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���� ������','�ϻ��� 778-27',12424,'37.8150955','127.465456',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̽���',2,'cl_01.jpg',80000,80000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������',2,'cl_02.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���ϼ�',2,'cl_03.jpg',60000,60000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'���/Ǯ����','���ؾ��� ���','010-2212-8954',14,'#�߳����Ҽ�#����#��������#�ž�','youandi_01.jpg','��������,���Ǳݿ�','�ʿ� ������ ��� �̾߱�','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��� ���� �ϸ�','��з�467���� 65-35',12406,'37.8989521','127.4510431',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���귯��',2,'youandi_02.jpg',39000,39000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����Ƽ',2,'youandi_03.jpg',59000,59000,0,0,lodge_no_seq.currval);


--����

insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','24�Խ�Ʈ�Ͽ콺 û������','070-8801-4008',4,'#����ó��#�����#������#��','t24.jpg','��������,���Ǳݿ�,���ἼŹ','�������� �󸶾ȵ� ������ �Խ�Ʈ �Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���빮��','ȸ���27�� 18',12444,'37.5908694','127.0559786',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'t24_02.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����',2,'t24_01.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ���÷�',3,'t24_03.jpg',60000,60000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','��Ŀ �Խ�Ʈ�Ͽ콺','010-3234-7309',5,'#����ó��#�����#������#��','bunker.jpg','��������,���Ǳݿ�,��Ƽ����','Ȯ���� �̸����� �ϴ� ������ �Խ�Ʈ�Ͽ콺','��Ŀ�� �����ϴ�.');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('������ ������','������ 167-11',21544,'37.463921','126.7084934',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�� ���� �����丮',1,'bunker_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�� ���� �����丮',1,'bunker_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2�� �����丮',1,'bunker_02.jpg',25000,25000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�ڷ��� �Խ�Ʈ�Ͽ콺','010-3813-4015',6,'#����ó��#�����#������#��','chorus_01.jpg','��������,���Ǳݿ�','�ѱ��� �ִ� ���ε� ����� �Ǿ� �־ �ؼ��Ұ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ�� �߱�','ȭ����� 100���� 75-202ȣ',22361,'37.4946039','126.4959652',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����',2,'chorus_04.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����',2,'chorus_03.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'6�� ȥ�� �����丮',1,'chorus_02.jpg',25000,25000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�ٻ� �Ͽ콺','010-6821-5028',9,'#����ó��#�����#������#��','dasan_01.jpg','��������,���Ǳݿ�,����','���� Ȩ�������� �����~~�ٵ� �ı⺸�� �����ϴٰ� ��.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','���׵� 34-37',17623,'37.5605665','126.80993',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'3�� ȥ�� �����丮',1,'dasan_02.jpg',15000,15000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�� ���� �����丮',1,'dasan_03.jpg',15000,15000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�� ���� �����丮',1,'dasan_01.jpg',15000,15000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�帲�μ��� �Խ�Ʈ�Ͽ콺','070-7560-8881',9,'#����ó��#�����#������#��','dream.jpg','��������,���Ǳݿ�,����','��¥ �Խ�Ʈ�Ͽ콺�� ���� �ѰŰ���','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���Ǳ�','��õ��12�� 32-3 ����Ÿ��Ƽ',18753,'37.487104','126.9272214',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'dream_03.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����',2,'dream_02.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����',2,'dream_03.jpg',35000,35000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','ģ�� �Խ�Ʈ�Ͽ콺','1588-2299',10,'#����ó��#�����#������#��','friend.jpg','��������,���Ǳݿ�,�̺�Ʈ����','ģ���� �Բ��ϸ� �� ���� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','����� 340-9',14074,'37.545499','126.9198313',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'8��ȥ������',1,'friend_02.jpg',12000,12000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'6��ȥ������',1,'friend_01.jpg',16000,16000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4��ȥ������',1,'friend_03.jpg',18000,18000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�Խ�Ʈ�Ͽ콺 ����','070-8833-0046',20,'#����ó��#�����#������#��','guesthouse_01.jpg','��������,���Ǳݿ�,Ʈ������','�׳� �Ḹ�ڷ� ���⿣ ��������. �ٸ��� ��.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ������','������7�� 27',14047,'37.5455661','126.887',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'guesthouse_02.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2�ν�',2,'guesthouse_03.jpg',50000,50000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','���̽����� ȣ����','02-776-9988',20,'#����ó��#�����#������#��','istay.jpg','��������,���Ǳݿ�,����','�������� �������� ���� ��.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������ 195',14087,'37.5455158','126.9305136',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����1',2,'istay_02.jpg',36000,36000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����2',2,'istay_01.jpg',36000,36000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�йи���',4,'istay_03.jpg',60000,60000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','k-����ȣ����','02-112-1190',50,'#����ó��#�����#������#��','k_01.jpg','��������,���Ǳݿ�','�Խ�Ʈ �Ͽ콺 �Դϴ�.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������ 98-1',14080,'37.5596373','126.9460152',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ� �̱�',1,'k_02.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���Ĵٵ� Ʈ��',2,'k_02.jpg',55000,55000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'������ Ʈ����',3,'k_03.jpg',90000,90000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','���� �Խ�Ʈ�Ͽ콺','070-8987-6888',16,'#����ó��#�����#������#��','monster.jpg','��������,���Ǳݿ�','��¥ �Խ�Ʈ�Ͽ콺 ���� ������ ������� �𸣰ڴ� �� �ߺ��̳�..','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���α�','������9�� 9',13111,'37.5784186','127.0201516',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����',2,'monster_03.jpg',40000,40000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�йи���',4,'monster_02.jpg',65000,65000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����(�̴�)',2,'monster_01.jpg',40000,40000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','��� �Խ�Ʈ�Ͽ콺','010-5270-4300',10,'#����ó��#�����#������#��','morning_01.jpg','��������,���Ǳݿ�,��Ƽ����','��� �������� �� �� ���� ����� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��⵵ ���� ���','������� 376',12448,'37.7483475','127.3526368',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��׽� �ϳ�',1,'morning_01.jpg',25000,25000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��׽� ��',2,'morning_02.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��׽� ��',2,'morning_03.jpg',50000,50000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','���¿� N�Խ�Ʈ�Ͽ콺','02-749-4566',31,'#����ó��#�����#������#��','n.jpg','��������,���Ǳݿ�','���¿� ������~ �� ������ �Һ�! �����~','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ��걸','�������26���� 24-4',14391,'37.5323732','126.99',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����4�ε���',1,'n_01.jpg',16900,16900,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'ȥ��6�ε���',1,'n_02.jpg',15900,15900,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'n_03.jpg',28000,28000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','���� ȣ����','010-9150-9562',24,'#����ó��#�����#������#��','naru.jpg','���Ǳݿ�','������ �������� ��ġ�� �����ϰ� �̻� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������ 242-45',14211,'37.547406','126.9526525',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'naru_02.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'Ʈ����',2,'naru_03.jpg',40000,40000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����',2,'naru_01.jpg',40000,40000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','OKȣ����','010-6782-4222',50,'#����ó��#�����#������#��','ok.png','���Ǳݿ�','���ǽ����� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ �߱�','���̷� 195',22302,'37.4774627','126.5990565',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��ü��',2,'ok_02.jpg',200000,200000,0,0,lodge_no_seq.currval);






insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�ƿ��� �Խ�Ʈ�Ͽ콺','010-8073-8211',30,'#����ó��#�����#������#��','outback.png','��������','�������� ���ǽ����� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('��õ ����','�ֺ���� 12',21393,'37.4962352','126.7216963',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�ο�������',1,'outback_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'4�γ�������',1,'outback_02.jpg',20000,20000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�����',2,'outback_01.jpg',40000,40000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�ҹٵ� �Խ�Ʈ�Ͽ콺','02-555-5858',15,'#����ó��#�����#������#��','lombard.png','��������,���Ǳݿ�','�ü��� ���ƺ��̴� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������16�� 17',14029,'37.5541422','126.9135463',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'lombard_01.jpg',65000,65000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'���� 2�ν�',2,'lombard_03.jpg',58000,58000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'10�ν� �����丮 ������� ��ü��',10,'lombard_02.jpg',230000,230000,0, 0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�÷�Ƽ �Խ�Ʈ�Ͽ콺','070-8285-0246',5,'#����ó��#�����#������#��','plenty.jpg','��������','������ ������ ���� �Խ�Ʈ�Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������','������2���� 46',14026,'37.5503137','126.9076199',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'205ȣ',1,'plenty_02.jpg',25000,25000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'201ȣ',2,'plenty_01.jpg',50000,50000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'103ȣ',4,'plenty_03.jpg',100000,100000,0,0,lodge_no_seq.currval);




insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�ձ��Ͽ콺','010-4262-8641',2,'#����ó��#�����#������#��','round.jpg','���Ǳݿ�,�̺�Ʈ����,��Ƽ����','�ѿ��� ü�� �� �� �ֽ��ϴ�.','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('���� ���Ǳ�','���μ�ȯ��247���� 22 1��',18801,'37.4773296','126.9632326',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2���� 2��',2,'round_02.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'1���� 2��',2,'round_03.jpg',45000,45000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2���� 4��',4,'round_02.jpg',60000,60000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','�����Ͽ콺 �Խ�Ʈ�Ͽ콺','010-6542-2120',6,'#����ó��#�����#������#��','space.jpg','���Ǳݿ�','������ �Խ�Ʈ �Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ���ϱ�','���ҹ��� 21-20',12833,'37.5904362','127.0057723',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����6�ε����丮',1,'space_02.jpg',29000,29000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'����4�ε����丮',1,'space_01.jpg',30000,30000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'�̱۷�',1,'space_03.jpg',55000,55000,0,0,lodge_no_seq.currval);



insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) values (lodge_no_seq.nextval,'�Խ�Ʈ�Ͽ콺','���� �Խ�Ʈ�Ͽ콺','010-6670-3120',5,'#����ó��#�����#������#��','yuza.jpg','���Ǳݿ�','���ڻ� �Խ�Ʈ �Ͽ콺','����������,��ī����,��������');
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, addr_lat, addr_long, lodge_no) values('����� ������ ������','������3�� 52',14047,'37.5503692','126.9157703',lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'2�ν�',2,'yuza_04.jpg',35000,35000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'3�ν�',3,'yuza_02.jpg',57000,57000,0,0,lodge_no_seq.currval);
insert into room(room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (room_no_seq.nextval,'��ž��',4,'yuza_03.jpg',90000,90000,0,0,lodge_no_seq.currval);
