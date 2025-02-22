USE university_rankings_v2;

-- Create table for ar_score
CREATE TABLE ar_score AS 
SELECT uni_id, ar_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for ar_rank
CREATE TABLE ar_rank AS 
SELECT uni_id, ar_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for er_score
CREATE TABLE er_score AS 
SELECT uni_id, er_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for er_rank
CREATE TABLE er_rank AS 
SELECT uni_id, er_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for fsr_score
CREATE TABLE fsr_score AS 
SELECT uni_id, fsr_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for fsr_rank
CREATE TABLE fsr_rank AS 
SELECT uni_id, fsr_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for cpf_score
CREATE TABLE cpf_score AS 
SELECT uni_id, cpf_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for cpf_rank
CREATE TABLE cpf_rank AS 
SELECT uni_id, cpf_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for ifr_score
CREATE TABLE ifr_score AS 
SELECT uni_id, ifr_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for ifr_rank
CREATE TABLE ifr_rank AS 
SELECT uni_id, ifr_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for isr_score
CREATE TABLE isr_score AS 
SELECT uni_id, isr_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for isr_rank
CREATE TABLE isr_rank AS 
SELECT uni_id, isr_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for irn_score
CREATE TABLE irn_score AS 
SELECT uni_id, irn_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for irn_rank
CREATE TABLE irn_rank AS 
SELECT uni_id, irn_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for ger_score
CREATE TABLE ger_score AS 
SELECT uni_id, ger_score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for ger_rank
CREATE TABLE ger_rank AS 
SELECT uni_id, ger_rank 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for SUS_SCORE
CREATE TABLE SUS_SCORE AS 
SELECT uni_id, SUS_SCORE 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for SUS_RANK
CREATE TABLE SUS_RANK AS 
SELECT uni_id, SUS_RANK 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for Overall_Score
CREATE TABLE Overall_Score AS 
SELECT uni_id, Overall_Score 
FROM rankings_2025_source 	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- Create table for 2025 rankings --
CREATE TABLE rankings_2025 (
	`2025_rank_display` VARCHAR(20),
    
    institution VARCHAR(100),
    location_code VARCHAR(50),
    location VARCHAR(50),
    
    size VARCHAR(10),
    focus VARCHAR(10),
    research VARCHAR(10),
	`status` VARCHAR(10),

    ar_score VARCHAR(10),
    ar_rank VARCHAR(10),
    
    er_score VARCHAR(10),
    er_rank VARCHAR(10),
    
    fsr_score VARCHAR(10),
    fsr_rank VARCHAR(10),
    
    cpf_score VARCHAR(10),
    cpf_rank VARCHAR(10),
    
    ifr_score VARCHAR(10),
    ifr_rank VARCHAR(10),
    
    isr_score VARCHAR(10),
    isr_rank VARCHAR(10),

    irn_score VARCHAR(10),
    irn_rank VARCHAR(10),
    
    ger_score VARCHAR(10),
    ger_rank VARCHAR(10),
    
    sus_score VARCHAR(10),
    sus_rank VARCHAR(10),
    overall_score VARCHAR(10)
);


-- Remove operators (e.g., +,-,= --
UPDATE rankings_2025
SET 
    ar_score = REGEXP_REPLACE(ar_score, '[^0-9]', ''),
    ar_rank = REGEXP_REPLACE(ar_rank, '[^0-9]', ''),
    er_score = REGEXP_REPLACE(er_score, '[^0-9]', ''),
    er_rank = REGEXP_REPLACE(er_rank, '[^0-9]', ''),
    fsr_score = REGEXP_REPLACE(fsr_score, '[^0-9]', ''),
    fsr_rank = REGEXP_REPLACE(fsr_rank, '[^0-9]', ''),
    cpf_score = REGEXP_REPLACE(cpf_score, '[^0-9]', ''),
    cpf_rank = REGEXP_REPLACE(cpf_rank, '[^0-9]', ''),
    ifr_score = REGEXP_REPLACE(ifr_score, '[^0-9]', ''),
    ifr_rank = REGEXP_REPLACE(ifr_rank, '[^0-9]', ''),
    isr_score = REGEXP_REPLACE(isr_score, '[^0-9]', ''),
    isr_rank = REGEXP_REPLACE(isr_rank, '[^0-9]', ''),
    irn_score = REGEXP_REPLACE(irn_score, '[^0-9]', ''),
    irn_rank = REGEXP_REPLACE(irn_rank, '[^0-9]', ''),
    ger_score = REGEXP_REPLACE(ger_score, '[^0-9]', ''),
    ger_rank = REGEXP_REPLACE(ger_rank, '[^0-9]', ''),
    sus_score = REGEXP_REPLACE(sus_score, '[^0-9]', ''),
    sus_rank = REGEXP_REPLACE(sus_rank, '[^0-9]', ''),
    overall_score = REGEXP_REPLACE(overall_score, '[^0-9]', '')
WHERE uni_id BETWEEN 1 and 1503
    ;
 
 
-- Remove space-- 
UPDATE rankings_2025
SET 
    ar_score = REPLACE(ar_score, ' ', ''),
    ar_rank = REPLACE(ar_rank, ' ', ''),
    er_score = REPLACE(er_score, ' ', ''),
    er_rank = REPLACE(er_rank, ' ', ''),
    fsr_score = REPLACE(fsr_score, ' ', ''),
    fsr_rank = REPLACE(fsr_rank, ' ', ''),
    cpf_score = REPLACE(cpf_score, ' ', ''),
    cpf_rank = REPLACE(cpf_rank, ' ', ''),
    ifr_score = REPLACE(ifr_score, ' ', ''),
    ifr_rank = REPLACE(ifr_rank, ' ', ''),
    isr_score = REPLACE(isr_score, ' ', ''),
    isr_rank = REPLACE(isr_rank, ' ', ''),
    irn_score = REPLACE(irn_score, ' ', ''),
    irn_rank = REPLACE(irn_rank, ' ', ''),
    ger_score = REPLACE(ger_score, ' ', ''),
    ger_rank = REPLACE(ger_rank, ' ', ''),
    sus_score = REPLACE(sus_score, ' ', ''),
    sus_rank = REPLACE(sus_rank, ' ', ''),
    overall_score = REPLACE(overall_score, ' ', '')
    ;

-- Change blanks to NULL--
UPDATE rankings_2025
SET 
    ar_score = NULLIF(ar_score, ''),
    ar_rank = NULLIF(ar_rank, ''),
    er_score = NULLIF(er_score, ''),
    er_rank = NULLIF(er_rank, ''),
    fsr_score = NULLIF(fsr_score, ''),
    fsr_rank = NULLIF(fsr_rank, ''),
    cpf_score = NULLIF(cpf_score, ''),
    cpf_rank = NULLIF(cpf_rank, ''),
    ifr_score = NULLIF(ifr_score, ''),
    ifr_rank = NULLIF(ifr_rank, ''),
    isr_score = NULLIF(isr_score, ''),
    isr_rank = NULLIF(isr_rank, ''),
    irn_score = NULLIF(irn_score, ''),
    irn_rank = NULLIF(irn_rank, ''),
    ger_score = NULLIF(ger_score, ''),
    ger_rank = NULLIF(ger_rank, ''),
    SUS_SCORE = NULLIF(SUS_SCORE, ''),
    SUS_RANK = NULLIF(SUS_RANK, ''),
    Overall_Score = NULLIF(Overall_Score, '')
    ;

-- Troubleshooting: changing overall score '-' to NULL--

UPDATE rankings_2025
SET overall_score = NULL
WHERE overall_score = '-';

-- Change to FLOAT--
ALTER TABLE rankings_2025
MODIFY COLUMN ar_score FLOAT,
MODIFY COLUMN ar_rank FLOAT,
MODIFY COLUMN er_score FLOAT,
MODIFY COLUMN er_rank FLOAT,
MODIFY COLUMN fsr_score FLOAT,
MODIFY COLUMN fsr_rank FLOAT,
MODIFY COLUMN cpf_score FLOAT,
MODIFY COLUMN cpf_rank FLOAT,
MODIFY COLUMN ifr_score FLOAT,
MODIFY COLUMN ifr_rank FLOAT,
MODIFY COLUMN isr_score FLOAT,
MODIFY COLUMN isr_rank FLOAT,
MODIFY COLUMN irn_score FLOAT,
MODIFY COLUMN irn_rank FLOAT,
MODIFY COLUMN ger_score FLOAT,
MODIFY COLUMN ger_rank FLOAT,
MODIFY COLUMN sus_score FLOAT,
MODIFY COLUMN sus_rank FLOAT,
MODIFY COLUMN overall_score FLOAT;

-- Rename table to rankings_2025_source--
RENAME TABLE rankings_2025 TO rankings_2025_source;

ALTER TABLE rankings_2025_source
RENAME COLUMN location TO region;

ALTER TABLE rankings_2025_source
RENAME COLUMN location_code TO country;

ALTER TABLE `university_rankings_v2`.`ar_rank` 
CHANGE COLUMN `2025` `2025_ar_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`ar_score` 
CHANGE COLUMN `2025` `2025_ar_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`cpf_rank` 
CHANGE COLUMN `2025` `2025_cpf_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`cpf_score` 
CHANGE COLUMN `2025` `2025_cpf_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`er_rank` 
CHANGE COLUMN `2025` `2025_er_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`er_score` 
CHANGE COLUMN `2025` `2025_er_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`fsr_rank` 
CHANGE COLUMN `2025` `2025_fsr_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`fsr_score` 
CHANGE COLUMN `2025` `2025_fsr_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`ger_rank` 
CHANGE COLUMN `2025` `2025_ger_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`ger_score` 
CHANGE COLUMN `2025` `2025_ger_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`ifr_rank` 
CHANGE COLUMN `2025` `2025_ifr_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`ifr_score` 
CHANGE COLUMN `2025` `2025_ifr_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`irn_rank` 
CHANGE COLUMN `2025` `2025_irn_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`irn_score` 
CHANGE COLUMN `2025` `2025_irn_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`isr_rank` 
CHANGE COLUMN `2025` `2025_isr_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`isr_score` 
CHANGE COLUMN `2025` `2025_isr_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`overall_score` 
CHANGE COLUMN `2025` `2025_overall_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`sus_rank` 
CHANGE COLUMN `2025` `2025_sus_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`sus_score` 
CHANGE COLUMN `2025` `2025_sus_score` FLOAT NULL DEFAULT NULL;

ALTER TABLE uni_rank
CHANGE COLUMN `2025` `2025_uni_rank` VARCHAR(20);

-- Rename incorrect table names, ger to eo  --

ALTER TABLE `university_rankings_v2`.`ger_rank` 
RENAME TO  `university_rankings_v2`.`eo_rank` ;

ALTER TABLE `university_rankings_v2`.`ger_score` 
RENAME TO  `university_rankings_v2`.`eo_score` ;

-- Rename incorrect table columns, 2025_ger to 2025_eo  --

ALTER TABLE `university_rankings_v2`.`eo_rank` 
CHANGE COLUMN `2025_ger_rank` `2025_eo_rank` FLOAT NULL DEFAULT NULL;

ALTER TABLE `university_rankings_v2`.`eo_score` 
CHANGE COLUMN `2025_ger_score` `2025_eo_score` FLOAT NULL DEFAULT NULL;

/* Renamed column to 2025, 2024 to be added*/

ALTER TABLE ar_score RENAME COLUMN ar_score TO `2025`;
ALTER TABLE ar_rank RENAME COLUMN ar_rank TO `2025`;
ALTER TABLE er_score RENAME COLUMN er_score TO `2025`;
ALTER TABLE er_rank RENAME COLUMN er_rank TO `2025`;
ALTER TABLE fsr_score RENAME COLUMN fsr_score TO `2025`;
ALTER TABLE fsr_rank RENAME COLUMN fsr_rank TO `2025`;
ALTER TABLE cpf_score RENAME COLUMN cpf_score TO `2025`;
ALTER TABLE cpf_rank RENAME COLUMN cpf_rank TO `2025`;
ALTER TABLE ifr_score RENAME COLUMN ifr_score TO `2025`;
ALTER TABLE ifr_rank RENAME COLUMN ifr_rank TO `2025`;
ALTER TABLE isr_score RENAME COLUMN isr_score TO `2025`;
ALTER TABLE isr_rank RENAME COLUMN isr_rank TO `2025`;
ALTER TABLE irn_score RENAME COLUMN irn_score TO `2025`;
ALTER TABLE irn_rank RENAME COLUMN irn_rank TO `2025`;
ALTER TABLE ger_score RENAME COLUMN ger_score TO `2025`;
ALTER TABLE ger_rank RENAME COLUMN ger_rank TO `2025`;
ALTER TABLE sus_score RENAME COLUMN sus_score TO `2025`;
ALTER TABLE sus_rank RENAME COLUMN sus_rank TO `2025`;
ALTER TABLE overall_score RENAME COLUMN overall_score TO `2025`;
ALTER TABLE uni_rank RENAME COLUMN `2025_rank_display` TO `2025`;

/** Add primary key **/

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

UPDATE `uni_rank`
SET `2025` = REPLACE(`2025`, '+', '')
WHERE `2025` LIKE '%+%'AND
uni_id BETWEEN 1 and 1503;


