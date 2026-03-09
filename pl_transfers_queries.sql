-- ================================================
-- Premier League Transfer Analytics (2015/16 - 2025/26)
-- Data Source: Transfermarkt via Kaggle
-- ================================================


-- ================================================
-- SECTION 1: DATABASE SCHEMA
-- ================================================

CREATE TABLE competitions (
    competition_id           VARCHAR(10) PRIMARY KEY,
    name                     VARCHAR(100),
    country_name             VARCHAR(100),
    is_major_national_league BOOLEAN
);

CREATE TABLE clubs (
    club_id                 INT PRIMARY KEY,
    club_code               VARCHAR(100),
    name                    VARCHAR(100),
    domestic_competition_id VARCHAR(10) REFERENCES competitions(competition_id),
    squad_size              INT,
    average_age             DECIMAL(4,1),
    stadium_name            VARCHAR(100),
    stadium_seats           INT,
    last_season             INT
);

CREATE TABLE players (
    player_id                            INT PRIMARY KEY,
    first_name                           VARCHAR(100),
    last_name                            VARCHAR(100),
    name                                 VARCHAR(100),
    last_season                          INT,
    current_club_id                      INT,
    country_of_birth                     VARCHAR(100),
    country_of_citizenship               VARCHAR(100),
    date_of_birth                        DATE,
    sub_position                         VARCHAR(100),
    position                             VARCHAR(100),
    current_club_domestic_competition_id VARCHAR(10),
    current_club_name                    VARCHAR(100),
    market_value_in_eur                  BIGINT,
    highest_market_value_in_eur          BIGINT
);

CREATE TABLE transfers (
    transfer_id         SERIAL PRIMARY KEY,
    player_id           INT,
    transfer_date       DATE,
    transfer_season     VARCHAR(10),
    from_club_id        INT,
    to_club_id          INT,
    from_club_name      VARCHAR(100),
    to_club_name        VARCHAR(100),
    transfer_fee        DECIMAL(20,2),
    market_value_in_eur DECIMAL(20,2)
);

CREATE TABLE player_valuations (
    valuation_id                        SERIAL PRIMARY KEY,
    player_id                           INT,
    date                                DATE,
    market_value_in_eur                 BIGINT,
    current_club_id                     INT,
    current_club_name                   VARCHAR(100),
    player_club_domestic_competition_id VARCHAR(10)
);


-- ================================================
-- SECTION 2: ANALYSIS QUERIES
-- ================================================

-- Question 1: Which Premier League clubs got the best value
-- from transfers between 2015/16 and 2023/24?
-- Note: Capped at 23/24 to allow sufficient time for player
-- market values to change meaningfully after transfer.
-- 24/25 and 25/26 transfers are too recent to evaluate.

-- 1a. Best value individual transfers
SELECT
    p.name,
    t.to_club_name,
    t.transfer_season,
    t.transfer_fee,
    t.market_value_in_eur AS value_at_transfer,
    p.market_value_in_eur AS current_value,
    p.market_value_in_eur - t.transfer_fee AS value_change
FROM transfers t
JOIN players p ON t.player_id = p.player_id
WHERE t.transfer_fee > 0
AND t.transfer_season <= '23/24'
ORDER BY value_change DESC
LIMIT 15;

-- 1b. Best value clubs overall (average value change per transfer)
SELECT
    t.to_club_name,
    COUNT(t.transfer_id) AS total_transfers,
    ROUND(AVG(t.transfer_fee), 2) AS avg_fee_paid,
    ROUND(AVG(p.market_value_in_eur), 2) AS avg_current_value,
    ROUND(AVG(p.market_value_in_eur - t.transfer_fee), 2) AS avg_value_change
FROM transfers t
JOIN players p ON t.player_id = p.player_id
WHERE t.transfer_fee > 0
AND t.transfer_season <= '23/24'
GROUP BY t.to_club_name
ORDER BY avg_value_change DESC;

-- Question 2: Which leagues are riskiest to buy from?
-- Minimum 10 transfers required for reliable sample size.
-- Capped at 23/24 for same reasons as Question 1.
-- Note: 219 transfers excluded due to selling clubs not present
-- in the clubs dataset (reserve teams, lower league clubs etc.)

SELECT
    CASE c.name
        WHEN 'superligaen' THEN 'Danish Superliga'
        WHEN 'super-league-1' THEN 'Greek Super League'
        WHEN 'jupiler-pro-league' THEN 'Belgian Pro League'
        WHEN 'scottish-premiership' THEN 'Scottish Premiership'
        WHEN 'ligue-1' THEN 'Ligue 1 (France)'
        WHEN 'super-lig' THEN 'Turkish Super Lig'
        WHEN 'eredivisie' THEN 'Eredivisie (Netherlands)'
        WHEN 'premier-league' THEN 'Premier League (England)'
        WHEN 'bundesliga' THEN 'Bundesliga (Germany)'
        WHEN 'serie-a' THEN 'Serie A (Italy)'
        WHEN 'liga-portugal-bwin' THEN 'Primeira Liga (Portugal)'
        WHEN 'laliga' THEN 'La Liga (Spain)'
        ELSE c.name
    END AS source_league,
    COUNT(t.transfer_id) AS total_transfers,
    ROUND(AVG(t.transfer_fee), 2) AS avg_fee_paid,
    ROUND(AVG(p.market_value_in_eur), 2) AS avg_current_value,
    ROUND(AVG(p.market_value_in_eur - t.transfer_fee), 2) AS avg_value_change
FROM transfers t
JOIN players p ON t.player_id = p.player_id
JOIN clubs fc ON t.from_club_id = fc.club_id
JOIN competitions c ON fc.domestic_competition_id = c.competition_id
WHERE t.transfer_fee > 0
AND t.transfer_season <= '23/24'
GROUP BY c.name
HAVING COUNT(t.transfer_id) >= 10
ORDER BY avg_value_change DESC;

-- Question 3: Young prospects vs prime age — which age group 
-- returns better value?
-- Player age calculated at time of transfer, not current age.
-- Capped at 23/24 for same reasons as Questions 1 and 2.

SELECT
    CASE
        WHEN DATE_PART('year', AGE(t.transfer_date, p.date_of_birth)) BETWEEN 15 AND 20 THEN '15-20 (Young Prospect)'
        WHEN DATE_PART('year', AGE(t.transfer_date, p.date_of_birth)) BETWEEN 21 AND 24 THEN '21-24 (Emerging)'
        WHEN DATE_PART('year', AGE(t.transfer_date, p.date_of_birth)) BETWEEN 25 AND 28 THEN '25-28 (Prime)'
        WHEN DATE_PART('year', AGE(t.transfer_date, p.date_of_birth)) BETWEEN 29 AND 32 THEN '29-32 (Experienced)'
        WHEN DATE_PART('year', AGE(t.transfer_date, p.date_of_birth)) >= 33 THEN '33+ (Veteran)'
    END AS age_group,
    COUNT(t.transfer_id) AS total_transfers,
    ROUND(AVG(t.transfer_fee), 2) AS avg_fee_paid,
    ROUND(AVG(p.market_value_in_eur), 2) AS avg_current_value,
    ROUND(AVG(p.market_value_in_eur - t.transfer_fee), 2) AS avg_value_change
FROM transfers t
JOIN players p ON t.player_id = p.player_id
WHERE t.transfer_fee > 0
AND t.transfer_season <= '23/24'
AND p.date_of_birth IS NOT NULL
GROUP BY age_group
ORDER BY avg_value_change DESC;

-- Question 4: Which club made the best and worst signing between 2015/16 and 2023/24?
-- Results show each club's highest and lowest value transfer side by side.

WITH ranked_transfers AS (
    SELECT
        p.name,
        t.to_club_name,
        t.transfer_season,
        t.transfer_fee,
        p.market_value_in_eur AS current_value,
        p.market_value_in_eur - t.transfer_fee AS value_change,
        RANK() OVER (
            PARTITION BY t.to_club_name 
            ORDER BY p.market_value_in_eur - t.transfer_fee DESC
        ) AS best_rank,
        RANK() OVER (
            PARTITION BY t.to_club_name 
            ORDER BY p.market_value_in_eur - t.transfer_fee ASC
        ) AS worst_rank
    FROM transfers t
    JOIN players p ON t.player_id = p.player_id
    WHERE t.transfer_fee > 0
    AND t.transfer_season <= '23/24'
)
SELECT
    to_club_name,
    MAX(CASE WHEN best_rank = 1 THEN name END) AS best_signing,
    MAX(CASE WHEN best_rank = 1 THEN value_change END) AS best_value_change,
    MAX(CASE WHEN worst_rank = 1 THEN name END) AS worst_signing,
    MAX(CASE WHEN worst_rank = 1 THEN value_change END) AS worst_value_change
FROM ranked_transfers
GROUP BY to_club_name
ORDER BY to_club_name;