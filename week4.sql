-- UNION 키워드
SELECT * FROM sample71_a
UNION
SELECT * FROM sample71_b;

-- 열 별명 지정해 UNION 이후 정렬
SELECT a AS c FROM sample71_a
UNION
SELECT b AS c FROM sample71_b ORDER BY c;

-- UNION ALL
SELECT * FROM sample71_a
UNION ALL
SELECT * FROM sample71_b;

-- 교차결합으로 곱집합 구하기
SELECT * FROM sample72_x, sample72_y;

-- 상품 테이블 작성
CREATE TABLE 상품(
  상품코드 CHAR(4) NOT NULL, 
  상품명 VARCHAR(30),
  메이커명 VARCHAR(30),
  가격 INTEGER,
  상품분류 VARCHAR(30),
  PRIMARY KEY (상품코드)
  );

--재고수 테이블 작성
CREATE TABLE 재고수(
  상품코드 CHAR(4),
  입고날짜 DATE,
  재고수 INTEGER
);

-- 상품 테이블과 재고수 테이블 교차결합
SELECT * FROM 상품, 재고수;

-- 상품코드가 같은 행 검색 
SELECT * FROM 상품, 재고수 WHERE 상품.상품코드 = 재고수.상품코드;

-- 검색할 행, 반환할 열 제한
SELECT 상품.상품명, 재고수.재고수 FROM 상품, 재고수 WHERE 상품.상품코드 = 재고수.상품코드 AND 상품.상품분류 = '식료품';

-- 메이커 테이블 작성
CREATE TABLE 메이커(
  메이커코드 CHAR(4) NOT NULL,
  메이커명 VARCHAR(30),
  PRIMARY KEY (메이커코드)
);

-- 상품 테이블과 메이커 테이블 내부결합
SELECT S.상품명, M.메이커명 FROM 상품2 S INNER JOIN 메이커 M ON S.메이커코드 = M.메이커코드;

-- 상품 테이블 자기결합
SELECT S1.상품명, S2.상품명 FROM 상품 S1 INNER JOIN 상품 S2 ON S1.상품코드 = S2.상품코드;
