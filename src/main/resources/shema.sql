-- -----------------------------------------------------
-- Table `wiki`.`t_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki`.`t_role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))


-- -----------------------------------------------------
-- Table `wiki`.`t_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki`.`t_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `password_confirm` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`))

-- -----------------------------------------------------
-- Table `wiki`.`user_x_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki`.`user_x_role` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `id_user` BIGINT(20) NOT NULL,
  `id_role` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`id_user` ASC) VISIBLE,
  INDEX `role_idx` (`id_role` ASC) VISIBLE,
  CONSTRAINT `role`
    FOREIGN KEY (`id_role`)
    REFERENCES `wiki`.`t_role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user`
    FOREIGN KEY (`id_user`)
    REFERENCES `wiki`.`t_user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)