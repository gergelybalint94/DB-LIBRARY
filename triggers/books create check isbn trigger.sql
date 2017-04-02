DELIMITER $$
DROP TRIGGER IF EXISTS `books create check isbn trigger` $$
CREATE TRIGGER `books create check isbn trigger` 
BEFORE INSERT ON `books` FOR EACH ROW
     BEGIN
     DECLARE isbn VARCHAR(17);
     DECLARE isbnCheck BOOLEAN;
     DECLARE isbnLen INT DEFAULT 0;
     SET isbn = NEW.ISBN;
	 IF isbn LIKE '%{-}%' THEN
		SET isbn = REPLACE(isbn,"-", "");
	 END IF;
	 Set isbnLen = CHAR_LENGTH(isbn);
     CASE isbnLen      
      WHEN 13 THEN 
      SET isbnCheck = isbn13check(isbn);
      ELSE
        BEGIN
        END;
    END CASE;      
          IF isbnCheck = false
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot add or update row: invalid ISBN';
          END IF;
     END;