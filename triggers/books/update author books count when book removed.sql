CREATE DEFINER=`root`@`localhost` TRIGGER `library`.`update author books count when book removed` AFTER DELETE ON `books` FOR EACH ROW
BEGIN
DECLARE numberOfBooks int;
SET numberOfBooks = (SELECT COUNT(ISBN) FROM books WHERE author_id = Old.author_id);
UPDATE `authors` 
SET 
    number_of_books = numberOfBooks
WHERE
    author_id = Old.author_id;
END