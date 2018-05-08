CREATE TABLE team(
	num 		number			not null,
	name		varchar(30)		not null,
	gender		varchar(8)		not null,
	phone		varchar(30)		NOT null,
	hobby		varchar(100)	not null,
	skills		varchar(100)	not null,
	zipcode 	varchar(5)		null,
	address1	varchar(300)	null,
	address2	varchar(300)	null,
	info		varchar(500)	null,
	primary key(num)
);
--create(insert)

DROP TABLE team;

INSERT INTO team(num, name, gender, phone, hobby, skills, zipcode, address1, address2, info)
VALUES((SELECT nvl(max(num),0) +1 FROM team), '김상윤', '남자', '010-2345-6788', '영화감상', 'JAVA,JSP', '13401', '서울시 중구', '관철동', '안녕하세요');
INSERT INTO team(num, name, gender, phone, hobby, skills, zipcode, address1, address2, info)
VALUES((SELECT nvl(max(num),0) +1 FROM team), '김현진', '여자', '010-2345-6788', '영화감상', 'JAVA,JSP,R/Python', '13401', '서울시 중구', '관철동', '안녕하세요');
--list
	SELECT num, name, phone, skills, r
	FROM(
		SELECT num, name, phone, skills, rownum r
		FROM(
			SELECT num, name, phone, skills FROM team
			ORDER BY num DESC
			)
		)
	WHERE r>=1 and r<=5
--read(select 하나의 레코드)
SELECT *
FROM TEAM
WHERE num = 3;

--update
UPDATE team
SET phone='010-2223-1321'
	skills='JAVA,JSP,R/Python'
	hobby='영화감상'
WHERE num = '2';

--delete
DELETE FROM TEAM WHERE num = '2';