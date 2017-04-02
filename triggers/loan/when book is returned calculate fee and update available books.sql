CREATE DEFINER=`root`@`localhost` TRIGGER `library`.`when book is returned calculate fee and update available books`
BEFORE UPDATE ON `library`.`loan`
FOR EACH ROW
BEGIN
DECLARE isbn VARCHAR(17);
DECLARE lateDays INT;

IF NEW.return_date IS NOT NULL THEN
	SET isbn = (SELECT `book`.`ISBN` FROM `book` WHERE `book`.`unique_book_id`=NEW.unique_book_id);
	UPDATE `books` 
SET 
    `in-stock` = `in-stock` + 1 WHERE `books`.`ISBN`=isbn;
	
	SET lateDays = DATEDIFF(new.return_date,new.due_date);	
	IF lateDays > 0 THEN
		SET NEW.fee= lateDays*5;
	END IF;    
END IF;    
END