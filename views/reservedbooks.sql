CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `reservedbooks` AS
    SELECT 
        `members`.`first_name` AS `first_name`,
        `members`.`last_name` AS `last_name`,
        `members`.`cpr` AS `cpr`,
        `books`.`ISBN` AS `ISBN`,
        `books`.`title` AS `title`,
        `reservation`.`res_date` AS `res_date`,
        `reservation`.`ISBN` AS `Expr1`
    FROM
        ((`books`
        JOIN `reservation` ON ((`books`.`ISBN` = `reservation`.`ISBN`)))
        JOIN `members` ON ((`reservation`.`members_cpr` = `members`.`cpr`)))
    WHERE
        (`reservation`.`res_date` IS NOT NULL)