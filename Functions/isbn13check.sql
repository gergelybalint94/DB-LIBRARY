CREATE function `isbn13check` (isbn VARCHAR(13)) 
returns BOOLEAN 
READS SQL DATA
BEGIN 
  DECLARE result BOOL; 
  DECLARE temp LONG; 
  DECLARE sum INTEGER; 
  DECLARE i INTEGER; 
  DECLARE currentchar INTEGER; 
  DECLARE multiplier INTEGER;
  DECLARE checkdigit INTEGER;
  DECLARE lastdigit INTEGER; 
  DECLARE remainder INTEGER;
  SET result = FALSE; 

  IF NOT ( isbn IS NULL OR isbn = ' ' ) THEN 
    IF ( isbn.CONTAINS("-") ) THEN 
      SET isbn = isbn.REPLACE("-", ""); 
    END IF; 
    SET temp = 0; 
    # If the length is not 13 or if it contains any non numeric chars, return false 
    SET temp = cast(isbn AS UNSIGNED ); 
    IF ( Char_length(isbn) != 13 
          OR temp = 0 ) THEN 
      RETURN false; 
    END IF; 
    SET sum = 0; 
    # Comment Source: Wikipedia 
    # The calculation of an ISBN-13 check digit begins with the first 
    # 12 digits of the thirteen-digit ISBN (thus excluding the check digit itself). 
    # Each digit, from left to right, is alternately multiplied by 1 or 3, 
    # then those products are summed modulo 10 to give a value ranging from 0 to 9. 
    # Subtracted from 10, that leaves a result from 1 to 10. A zero (0) replaces a 
    # ten (10), so, in all cases, a single check digit results. 
    SET i = 0; 
    WHILE i < 12 do 
      SET currentchar = cast(substr(isbn, i, 1) AS UNSIGNED); 
      IF ( MOD(i, 2) = 1 ) THEN 
        SET multiplier = 3; 
      ELSE 
        SET multiplier = 1; 
      END IF; 
      SET sum = sum + currentchar * multiplier; 
      SET i = i + 1; 
    END WHILE; 
    SET remainder = MOD(sum, 10); 
    SET checkdigit = 10 - remainder; 
    IF ( checkdigit = 10 ) THEN 
      SET checkdigit = 0; 
    END IF; 
    SET lastdigit = cast(substr(isbn, 12, 1) AS UNSIGNED); 
    SET result = (checkdigit =lastdigit); 
  END IF; 

  RETURN result; 
END;