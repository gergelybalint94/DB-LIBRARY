CREATE DEFINER=`root`@`localhost` TRIGGER `library`.`when new loan update in-stock and reservation if case`
AFTER INSERT ON `library`.`loan`
FOR EACH ROW
BEGIN
DECLARE memberHadReservation TINYINT(1);
DECLARE isbn VARCHAR(17);
IF NEW.return_date IS NOT NULL
THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot add row: Cannot create a loan with a return date, return date should be updated when the loan is returned';
          END IF;
SET isbn = (SELECT `book`.`ISBN` FROM `book` WHERE `book`.`unique_book_id`=NEW.unique_book_id);
SET memberHadReservation = (SELECT reservation_id FROM reservation WHERE reservation.ISBN = isbn AND `reservation`.`members_cpr`=new.members_cpr);
IF memberHadReservation IS NOT NULL THEN
	UPDATE `books` SET reservations=reservations-1 WHERE `books`.`ISBN`=isbn;
	DELETE FROM `reservation` WHERE `reservation`.`reservation_id` = memberHadReservation;
END IF;
UPDATE `books` SET `in-stock`=`in-stock`-1 WHERE `books`.`ISBN`=isbn;
END