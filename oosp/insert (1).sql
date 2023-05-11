use oos;

insert into customer values('kkh1234', '김근형', '경기도 부천시', '010-7897-7897', 'kkh1234', 'kkh@gmail.com', 100000, 2);
insert into customer values('kcs1234', '김철수', '경기도 오산시', '010-1254-1234', 'kcs1234', 'kcs@gmail.com', 200000, 4);
insert into customer values('kjg1234', '김짱구', '경기도 안양시', '010-5467-5798', 'kjg1234', 'kjg@gmail.com', 300000, 6);
insert into customer values('kyr1234', '김유리', '경기도 안산시', '010-4235-4785', 'kyr1234', 'kyr@gmail.com', 400000, 8);
insert into customer values('ksb1234', '김수빈', '경기도 시흥시', '010-2345-5675', 'ksb1234', 'ksb@gmail.com', 500000, 10);

insert into buying values(1, '2023-04-28', 50000, 'kkh1234', 0, '배송준비중', '없음', 5);
insert into buying values(2, '2023-04-26', 60000, 'kcs1234', 0, '배송중', '없음', 5);
insert into buying values(3, '2023-04-24', 70000, 'kjg1234', 0, '배송완료', '별로에요', 1);
insert into buying values(4, '2023-04-28', 80000, 'kyr1234', 0, '배송준비중', '없음', 5);
insert into buying values(5, '2023-04-22', 90000, 'ksb1234', 0, '배송완료', '안좋아요', 1);

insert into cancel values(3,'별로에요','2023-04-28', '2023-04-24', 70000, 'kjg1234', 0);
insert into cancel values(5,'안좋아요','2023-04-28', '2023-04-22', 90000, 'ksb1234', 0);




insert into company values('애플', '미국', '031-1234-1234');
insert into company values('삼성', '서울', '031-7894-1789');
insert into company values('LG', '판교', '031-5615-5155');
insert into company values('ASUS', '마곡', '031-7777-7777');
insert into company values('Unity', '중국', '031-8888-8888');

insert into product values(111, '아이폰13', '애플', 150000, 0, 0, 0, 0, 100);
insert into product values(112, '갤럭시z플립', '삼성', 120000, 0, 0, 0, 0, 200);
insert into product values(113, '에어팟', '애플', 50000, 0, 0, 0, 0, 150);
insert into product values(114, '갤럭시버즈', '삼성', 40000, 0, 0, 0, 0, 250);
insert into product values(115, '그램', 'LG', 800000, 0, 0, 0, 0, 1);