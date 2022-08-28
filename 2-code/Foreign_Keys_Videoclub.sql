ALTER TABLE `videoclub`.`filmactor` ADD INDEX `actor_fk_idx` (`actor_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`filmactor` ADD CONSTRAINT `actor_fk` FOREIGN KEY (`actor_id`) REFERENCES `videoclub`.`actor` (`actor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `videoclub`.`filmactor` ADD INDEX `film_fk_idx` (`film_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`filmactor` ADD CONSTRAINT `film_fk` FOREIGN KEY (`film_id`) REFERENCES `videoclub`.`film` (`film_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `videoclub`.`film` ADD INDEX `category_fk_idx` (`category_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`film` ADD CONSTRAINT `category_fk` FOREIGN KEY (`category_id`) REFERENCES `videoclub`.`category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `videoclub`.`film` ADD INDEX `language_fk_idx` (`language_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`film` ADD CONSTRAINT `language_fk` FOREIGN KEY (`language_id`) REFERENCES `videoclub`.`language` (`language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `videoclub`.`inventory` ADD INDEX `inventory_fk_idx` (`film_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`inventory` ADD CONSTRAINT `inventory_fk` FOREIGN KEY (`film_id`) REFERENCES `videoclub`.`film` (`film_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `videoclub`.`rental` ADD INDEX `rental_fk_idx` (`inventory_id` ASC) VISIBLE; ; ALTER TABLE `videoclub`.`rental` ADD CONSTRAINT `rental_fk` FOREIGN KEY (`inventory_id`) REFERENCES `videoclub`.`inventory` (`inventory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;