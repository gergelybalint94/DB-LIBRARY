CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `booksloaned` AS
    SELECT 
        `members`.`first_name` AS `first_name`,
        `members`.`last_name` AS `last_name`,
        `members`.`cpr` AS `cpr`,
        `loan`.`due_date` AS `due_date`,
        `loan`.`return_date` AS `return_date`,
        `loan`.`fee` AS `fee`,
        `books`.`ISBN` AS `ISBN`,
        `books`.`title` AS `title`
    FROM
        (`members`
        LEFT JOIN (`loan`
        LEFT JOIN (`book`
        JOIN `books` ON ((`book`.`ISBN` = `books`.`ISBN`))) ON ((`book`.`unique_book_id` = `loan`.`unique_book_id`))) ON ((`loan`.`members_cpr` = `members`.`cpr`)))