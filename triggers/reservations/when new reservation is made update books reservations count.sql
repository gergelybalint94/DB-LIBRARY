CREATE DEFINER=`root`@`localhost` TRIGGER `library`.`when new reservation is made update books reservations count`
AFTER INSERT ON `library`.`reservation`
FOR EACH ROW
BEGIN
UPDATE `books` SET  reservations = reservations + 1       
WHERE ISBN = NEW.ISBN; 
END