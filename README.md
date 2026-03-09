# EPL Transfer Analytics (2015/16 - 2025/26)

This project started in a group chat argument. During the most recent 
summer transfer window, a Liverpool supporting friend of mine was 
defending their record breaking signings while the rest of us weren't 
convinced the money was being spent wisely. That argument led to a 
question — which English Premier League (EPL) clubs actually get the 
best value from their transfers, and does spending big really translate 
to smart business?

This project uses PostgreSQL to analyse a decade of EPL transfer 
activity, uncovering which clubs spend smart, which leagues produce 
the best value players, and whether buying young prospects beats 
chasing prime age stars.

## Data Source
[Transfermarkt dataset via Kaggle](https://www.kaggle.com/datasets/davidcariboo/player-scores?select=transfers.csv)

## Questions Answered
1. **Which clubs got the best value from transfers?**
2. **Which leagues are riskiest to buy players from into the EPL?**
3. **Do young prospects outperform prime age signings?**
4. **Who was each club's best and worst signing?**

## Key Findings
- Brighton and Brentford consistently outperform the market through 
data driven recruitment of young undervalued players
- La Liga is the riskiest league to buy from, averaging a €10.7m loss 
per player
- Young prospects (15-20) return an average gain of €6.9m per player 
while prime age signings (25-28) lose €11.2m on average
- Paul Pogba (Man Utd) and Romelu Lukaku (Chelsea) are the worst value 
signings in the dataset, losing €100m and €98m respectively
- Michael Olise (Crystal Palace, €9.3m → €130m) and Erling Haaland 
(Man City, €60m → €200m) are the standout value signings

## Repository Structure
```
epl-transfer-analytics/
│
├── data/                        # Raw CSV files from Transfermarkt
│   ├── clubs.csv
│   ├── competitions.csv
│   ├── players.csv
│   ├── transfers.csv
│   └── player_valuations.csv
│
├── pl_transfers_queries.sql     # All SQL queries with comments
├── pl_transfers_analysis.md     # Full analysis with results and findings
└── README.md                    
```            


## Tools Used
- **PostgreSQL** — database design and analysis
- **Power BI** — data visualisation (dashboard in progress)



