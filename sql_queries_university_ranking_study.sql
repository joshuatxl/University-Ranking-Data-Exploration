USE university_rankings_v2;

-- 1. Create VIEW for uni rank, ar score, and country for top 500 uni rank --

CREATE VIEW unirank_arscore_country_top500 AS 
SELECT
uni_index.uni_id,
institution,
country,
`2025_uni_rank`,
`2025_ar_score`
FROM uni_index
	LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
    LEFT JOIN ar_score ON uni_index.uni_id = ar_score.uni_id
    LEFT JOIN uni_location ON uni_index.uni_id = uni_location.uni_id
LIMIT 500;


-- 2. Create VIEW for categorising top 500 uni rank, used subquery here  --

CREATE VIEW unirank_categorisation_top500 AS
SELECT *
FROM (
    SELECT
		uni_index.uni_id,
        institution,
        country,
        region,
        `2025_uni_rank`,
        CASE
            WHEN `2025_uni_rank` <= 50 THEN '1-50'
            WHEN `2025_uni_rank` > 50 AND `2025_uni_rank` <= 100 THEN '51-100'
            WHEN `2025_uni_rank` > 100 AND `2025_uni_rank` <= 200 THEN '101-200'
            WHEN `2025_uni_rank` > 200 AND `2025_uni_rank` <= 300 THEN '201-300'
            WHEN `2025_uni_rank` > 300 AND `2025_uni_rank` <= 400 THEN '301-400'
            WHEN `2025_uni_rank` > 400 AND `2025_uni_rank` <= 500 THEN '401-500'
        END AS `2025_uni_rank_categorisation`
    FROM uni_index
        LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
		LEFT JOIN uni_location ON uni_index.uni_id = uni_location.uni_id
) AS subquery
WHERE `2025_uni_rank_categorisation` IS NOT NULL;

-- 3. Create VIEW for median rank of universities by country --
WITH country_categorisation_table AS (
    SELECT 
        uni_location.country,
        `2025_overall_score`,
        ROW_NUMBER() OVER (PARTITION BY uni_location.country ORDER BY `2025_overall_score`) AS row_num,
        COUNT(*) OVER (PARTITION BY uni_location.country) AS total_rows
    FROM uni_index
    LEFT JOIN overall_score ON uni_index.uni_id = overall_score.uni_id
    LEFT JOIN uni_location ON uni_index.uni_id = uni_location.uni_id
    WHERE `2025_overall_score` IS NOT NULL
)
SELECT country, 
       AVG(`2025_overall_score`) AS median_overall_score
FROM country_categorisation_table
WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))
GROUP BY country;   


-- 4. Create VIEW for international engagement (ie) used subquery here--
-- international faculty ratio (ifr) international research (irn), international student ratio (isr)--

CREATE VIEW ie_score_top500_ie AS
SELECT
uni_id,
institution,
`2025_ifr_score`,
`2025_irn_score`,
`2025_isr_score`,
ROUND(`avg_ie_score`, 1) AS avg_ie_score_ranked
FROM (
SELECT
uni_index.uni_id,
institution, 
`2025_ifr_score`,
`2025_irn_score`,
`2025_isr_score`,
((`2025_ifr_score` + `2025_irn_score` +`2025_isr_score`) / 3) AS avg_ie_score
FROM uni_index
	LEFT JOIN ifr_score ON uni_index.uni_id = ifr_score.uni_id
	LEFT JOIN irn_score ON uni_index.uni_id = irn_score.uni_id
	LEFT JOIN isr_score ON uni_index.uni_id = isr_score.uni_id
) AS subquery
 ORDER BY avg_ie_score_ranked DESC
LIMIT 500;

-- 5. Create VIEW for graduate employability (emp) --
-- employer outcomes (eo) and reputation among employers (er)

CREATE VIEW emp_score_top500_emp AS
SELECT 
uni_id,
institution,
`2025_eo_score`,
`2025_er_score`,
ROUND(`emp_score`,1) AS emp_score_rounded
FROM (
SELECT 
uni_index.uni_id,
institution,
`2025_eo_score`,
`2025_er_score`,
((`2025_eo_score` + `2025_er_score`) / 2) AS emp_score
FROM uni_index
	LEFT JOIN eo_score ON uni_index.uni_id = eo_score.uni_id
	LEFT JOIN er_score ON uni_index.uni_id = er_score.uni_id
) AS subquery
ORDER BY emp_score_rounded DESC
LIMIT 500;

-- 6. Create VIEW for academic research (ares) -- 

CREATE VIEW ares_score_top500_ares AS 
SELECT
uni_id,
institution,
`2025_ar_score`,
`2025_cpf_score`,
ROUND(`ares_score`,1) AS ares_score_rounded
FROM(
SELECT
uni_index.uni_id,
institution,
`2025_ar_score`,
`2025_cpf_score`,
((`2025_ar_score` + `2025_cpf_score`) / 2) AS ares_score
FROM uni_index
	LEFT JOIN ar_score ON uni_index.uni_id = ar_score.uni_id
	LEFT JOIN cpf_score ON uni_index.uni_id = cpf_score.uni_id
) AS subquery
ORDER BY ares_score_rounded DESC
LIMIT 500;

-- 7. Create VIEW for summary of metrics and scores top500 for regression analysis-- 
-- No nulls --

CREATE VIEW summary_top500_overall_score AS
SELECT 
uni_index.uni_id,
institution,
country,
region,
`2025_ar_score`,
`2025_cpf_score`,
`2025_eo_score`,
`2025_er_score`,
`2025_fsr_score`,
`2025_ifr_score`,
`2025_irn_score`,
`2025_isr_score`,
`2025_sus_score`,
`2025_overall_score`
FROM uni_index
	LEFT JOIN ar_score ON uni_index.uni_id = ar_score.uni_id
	LEFT JOIN cpf_score ON uni_index.uni_id = cpf_score.uni_id
	LEFT JOIN eo_score ON uni_index.uni_id = eo_score.uni_id
    LEFT JOIN er_score ON uni_index.uni_id = er_score.uni_id
    LEFT JOIN fsr_score ON uni_index.uni_id = fsr_score.uni_id
    LEFT JOIN ifr_score ON uni_index.uni_id = ifr_score.uni_id
    LEFT JOIN irn_score ON uni_index.uni_id = irn_score.uni_id
    LEFT JOIN isr_score ON uni_index.uni_id = isr_score.uni_id
    LEFT JOIN sus_score ON uni_index.uni_id = sus_score.uni_id
    LEFT JOIN overall_score ON uni_index.uni_id = overall_score.uni_id
    LEFT JOIN uni_location ON uni_index.uni_id = uni_location.uni_id
WHERE
`2025_ar_score` IS NOT NULL AND 
`2025_cpf_score` IS NOT NULL AND
`2025_eo_score` IS NOT NULL AND
`2025_er_score` IS NOT NULL AND
`2025_fsr_score` IS NOT NULL AND
`2025_ifr_score` IS NOT NULL AND
`2025_irn_score` IS NOT NULL AND
`2025_isr_score` IS NOT NULL AND
`2025_sus_score` IS NOT NULL AND
`2025_overall_score` IS NOT NULL
ORDER BY `2025_overall_score` DESC
LIMIT 500;

-- 8. Create VIEW for summary_within_top100 -- 

CREATE VIEW summary_within_top100 AS
WITH top_100_rank AS
(
    SELECT 
        uni_index.uni_id,
        institution,
        (CASE WHEN `2025_ar_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_ar_rank,
        (CASE WHEN `2025_cpf_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_cpf_rank,
        (CASE WHEN `2025_er_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_er_rank,
        (CASE WHEN `2025_fsr_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_fsr_rank,
        (CASE WHEN `2025_eo_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_eo_rank,
        (CASE WHEN `2025_ifr_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_ifr_rank,
        (CASE WHEN `2025_irn_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_irn_rank,
        (CASE WHEN `2025_isr_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_isr_rank,
        (CASE WHEN `2025_sus_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_sus_rank,
        (CASE WHEN `2025_uni_rank` <= 100 THEN 1 ELSE 0 END) AS top_100_uni_rank
    FROM uni_index
    LEFT JOIN ar_rank ON uni_index.uni_id = ar_rank.uni_id
    LEFT JOIN cpf_rank ON uni_index.uni_id = cpf_rank.uni_id
    LEFT JOIN er_rank ON uni_index.uni_id = er_rank.uni_id
    LEFT JOIN fsr_rank ON uni_index.uni_id = fsr_rank.uni_id
    LEFT JOIN eo_rank ON uni_index.uni_id = eo_rank.uni_id
    LEFT JOIN ifr_rank ON uni_index.uni_id = ifr_rank.uni_id
    LEFT JOIN irn_rank ON uni_index.uni_id = irn_rank.uni_id
    LEFT JOIN isr_rank ON uni_index.uni_id = isr_rank.uni_id
    LEFT JOIN sus_rank ON uni_index.uni_id = sus_rank.uni_id
    LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
) 
SELECT 
    top_100_rank.*,
    SUM(
        top_100_ar_rank + 
        top_100_cpf_rank + 
        top_100_er_rank + 
        top_100_fsr_rank + 
        top_100_eo_rank + 
        top_100_ifr_rank + 
        top_100_irn_rank + 
        top_100_isr_rank + 
        top_100_sus_rank + 
        top_100_uni_rank
    ) AS top_100_rank_sum,
    `2025_overall_score`
FROM top_100_rank
LEFT JOIN overall_score ON top_100_rank.uni_id = overall_score.uni_id
GROUP BY top_100_rank.uni_id, `2025_overall_score`
LIMIT 500;

-- 9. Create VIEW for summary_top500_overall_rank -- 

CREATE VIEW summary_top500_overall_rank AS
SELECT 
uni_index.uni_id,
institution,
country,
region,
`2025_ar_rank`,
`2025_cpf_rank`,
`2025_eo_rank`,
`2025_er_rank`,
`2025_fsr_rank`,
`2025_ifr_rank`,
`2025_irn_rank`,
`2025_isr_rank`,
`2025_sus_rank`,
`2025_uni_rank`
FROM uni_index
	LEFT JOIN ar_rank ON uni_index.uni_id = ar_rank.uni_id
	LEFT JOIN cpf_rank ON uni_index.uni_id = cpf_rank.uni_id
	LEFT JOIN eo_rank ON uni_index.uni_id = eo_rank.uni_id
    LEFT JOIN er_rank ON uni_index.uni_id = er_rank.uni_id
    LEFT JOIN fsr_rank ON uni_index.uni_id = fsr_rank.uni_id
    LEFT JOIN ifr_rank ON uni_index.uni_id = ifr_rank.uni_id
    LEFT JOIN irn_rank ON uni_index.uni_id = irn_rank.uni_id
    LEFT JOIN isr_rank ON uni_index.uni_id = isr_rank.uni_id
    LEFT JOIN sus_rank ON uni_index.uni_id = sus_rank.uni_id
    LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
    LEFT JOIN uni_location ON uni_index.uni_id = uni_location.uni_id
WHERE
`2025_ar_rank` IS NOT NULL AND 
`2025_cpf_rank` IS NOT NULL AND
`2025_eo_rank` IS NOT NULL AND
`2025_er_rank` IS NOT NULL AND
`2025_fsr_rank` IS NOT NULL AND
`2025_ifr_rank` IS NOT NULL AND
`2025_irn_rank` IS NOT NULL AND
`2025_isr_rank` IS NOT NULL AND
`2025_sus_rank` IS NOT NULL AND
`2025_uni_rank` IS NOT NULL
LIMIT 500;

-- 10 Create VIEW for categorising universities based on strengths in score --
-- CREATE VIEW ares_emp_categorisation AS -- 

WITH ares_emp_subquery AS
(
SELECT 
uni_id,
institution,
CASE WHEN ares_score > emp_score THEN 1 ELSE 0 END AS ares_emp_categorisation
FROM 
(
SELECT
uni_index.uni_id,
uni_index.institution,
(`2025_ar_score` + `2025_cpf_score` + `2025_irn_score`) / 3 AS ares_score,
(`2025_ar_score` + `2025_cpf_score`) / 2 AS emp_score
FROM uni_index
	LEFT JOIN ar_score ON uni_index.uni_id = ar_score.uni_id
	LEFT JOIN cpf_score ON uni_index.uni_id = cpf_score.uni_id
    LEFT JOIN irn_score ON uni_index.uni_id = irn_score.uni_id
	LEFT JOIN eo_score ON uni_index.uni_id = eo_score.uni_id
    LEFT JOIN er_score ON uni_index.uni_id = er_score.uni_id) AS subquery
)
SELECT
uni_id,
institution,
CASE
	WHEN ares_emp_categorisation = 1 THEN 'ares focus' 
    WHEN ares_emp_categorisation = 0 THEN 'emp focus'
END AS ares_emp_categorisation
FROM ares_emp_subquery;

-- 11. Create VIEW for universities where academic reputation (ar) and citations per faculty (cpf) rankings are higher than overall university rank among top500--
-- Note: regression analysis findings: academic reputation (ar) and citations per faculty (cpf) has the strongest influence on rank --

CREATE VIEW ar_cpf_higher_than_unirank_top500 AS
SELECT
*
FROM
(
SELECT 
uni_index.uni_id,
institution,
`2025_uni_rank`,
CASE WHEN `2025_ar_rank` < `2025_uni_rank` THEN 1 ELSE 0 END AS ar_rank_higher,
CASE WHEN `2025_cpf_rank` < `2025_uni_rank` THEN 1 ELSE 0 END AS cpf_rank_higher
FROM uni_index
	LEFT JOIN ar_rank ON uni_index.uni_id = ar_rank.uni_id
	LEFT JOIN cpf_rank ON uni_index.uni_id = cpf_rank.uni_id
	LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
LIMIT 500
) AS subquery
WHERE
	ar_rank_higher != 0 OR cpf_rank_higher != 0;

-- 12. Create VIEW for employment outcomes rank (eo), academic reputation rank (ar), and uni rank among top 100 universities --
-- For correlation table  on Python--

CREATE VIEW eo_ar_uni_rank_corr_table AS
SELECT
uni_index.uni_id,
institution
`2025_ar_rank`,
`2025_eo_rank`,
`2025_uni_rank`
FROM uni_index
	LEFT JOIN eo_rank ON uni_index.uni_id = eo_rank.uni_id
	LEFT JOIN ar_rank ON uni_index.uni_id = ar_rank.uni_id
	LEFT JOIN uni_rank ON uni_index.uni_id = uni_rank.uni_id
LIMIT 500;