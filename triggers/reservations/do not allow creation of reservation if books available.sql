CREATE DEFINER=`root`@`localhost` TRIGGER `library`.`do not allow creation of reservation if books available`
BEFORE INSERT ON `library`.`reservation`
FOR EACH ROW
BEGIN
DECLARE numberOfBooks int;
DECLARE mt VARCHAR(100);
SET numberOfBooks = (SELECT `in-stock`
					FROM            books
					WHERE        (books.ISBN = new.isbn));
IF numberOfBooks>0 
THEN
set mt = CONCAT('Cannot add or update row: There are ',numberOfBooks, ' books available');
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = mt;
          END IF;
END