

-- 循环结构
-- 普通while循环
USE test;
DROP TABLE IF EXISTS test;
CREATE TABLE test(
	num INT
);




DROP PROCEDURE IF EXISTS a;
DELIMITER $
CREATE PROCEDURE a(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i <=100 DO
		INSERT INTO test VALUES(i);
		SET i = i+1;
	END WHILE;
END $


DELIMITER ;
CALL a(100);

SELECT * FROM test;
TRUNCATE TABLE test;


-- 带leave的while



DROP PROCEDURE IF EXISTS a;
DELIMITER $
CREATE PROCEDURE a(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	A:WHILE i <=100 DO
		IF i >20 THEN LEAVE A;	
		END IF;
		INSERT INTO test VALUES(i);
		SET i = i+1;
	END WHILE;
END $


DELIMITER ;
CALL a(100);

SELECT * FROM test;
TRUNCATE TABLE test;


-- 带iterate while

DROP PROCEDURE IF EXISTS a;
DELIMITER $
CREATE PROCEDURE a(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 0;
	A:WHILE i <=100 DO
		SET i = i+1;
		IF MOD(i,2) = 1 THEN ITERATE A;
		END IF;
		INSERT INTO test VALUES(i);
		
	END WHILE;
END $


DELIMITER ;
CALL a(10);

SELECT * FROM test;
TRUNCATE TABLE test;