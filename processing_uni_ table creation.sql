-- uni_index table creation --
CREATE TABLE uni_index AS
SELECT
	    institution
FROM rankings_2025;

-- Add uni_id column --

-- Creating indexes, disabling and re-enabling safe update--
SET @counter = 0;

SET SQL_SAFE_UPDATES = 0;

UPDATE uni_index
SET uni_id = (@counter := @counter + 1);

SET SQL_SAFE_UPDATES = 1;

-- Make uni_id PK and NN --

-- uni_location table creation --
CREATE TABLE uni_location AS
SELECT
	uni_id,
    country,
    region
FROM rankings_2025_source
	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- uni_desc_2025 creation --
CREATE TABLE uni_desc_2025 AS
SELECT
	uni_id,
    size,
    focus,
    research,
    `status`
FROM rankings_2025_source
	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;

-- uni_rank creation --
CREATE TABLE uni_rank AS
SELECT
	uni_id,
    2025_rank_display
FROM rankings_2025_source
	LEFT JOIN uni_index ON rankings_2025_source.institution = uni_index.institution;