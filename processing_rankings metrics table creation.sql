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