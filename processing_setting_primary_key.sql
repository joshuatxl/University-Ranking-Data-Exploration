USE university_rankings_v2;

ALTER TABLE `university_rankings_v2`.`ar_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`ar_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`cpf_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`cpf_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`er_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`er_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`fsr_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`fsr_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`ger_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`ger_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`ifr_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`ifr_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`irn_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`irn_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`isr_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`isr_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`overall_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`sus_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`sus_score`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`uni_desc_2025`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`uni_index`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`uni_location`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

ALTER TABLE `university_rankings_v2`.`uni_rank`
CHANGE COLUMN `uni_id` `uni_id` INT NOT NULL ,
ADD PRIMARY KEY (`uni_id`);

USE university_rankings_v2;

UPDATE `uni_rank`
SET `2025` = REPLACE(`2025`, '+', '')
WHERE `2025` LIKE '%+%'AND
uni_id BETWEEN 1 and 1503;
