use bookstore;

insert into customer values('cs123', '김철수', 25, '서울시 서초구', '123', '0', '0');
insert into customer values('ghpark', '박기현', 42, '경기도 화성', '4455', '0', '0');
insert into customer values('lh002', '이영희', 19, '서울시 강동구', '789789', '0', '0');

insert into manager values('lgc01','이기철',30,'root');

insert into books values(9788972756194,'나미야 잡화점의 기적', '히가시노 게이고', '현대문학','해외도서',12000, 0, 0, 0,'./img/나미야 잡화점의 기적.jpg',null);
insert into books values(9788965707592,'사랑하게 해줘서, 고마워', '김재식', '쌤앤파커스','국내도서',9800, 0, 0, 0,'./img/사랑하게 해줘서, 고마워.jpg',null);
insert into books values(9788954654319,'쾌락독서','문유석','문학동네','국내도서',10200,0,0,0,'./img/쾌락독서.jpg',null);
insert into books values(9791160560381,'말이 칼이 될 때','홍성수','어크로스','국내도서',9500,0,0,0,'./img/말이칼이될때.jpg',null);


insert into buying values(9788972756194, 'cs123', 1, 20210423, 1, 12000, null,null,null,'배송준비',null);