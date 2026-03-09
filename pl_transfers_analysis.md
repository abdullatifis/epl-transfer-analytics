# Premier League Transfer Analytics (2015/16 - 2025/26)
**Data Source:** Transfermarkt  
**Database:** PostgreSQL  
**Tool:** SQL  

---

## Question 1: Which Premier League clubs got the best value from transfers between 2015/16 and 2023/24?

### Methodology
Value change is calculated by comparing the transfer fee paid against 
the player's current market value. Only transfers with a recorded fee 
are included. Analysis is capped at 2023/24 to allow sufficient time 
for player values to change meaningfully. 24/25 and 25/26 transfers 
are too recent to evaluate fairly.

---

### 1a. Top 15 Individual Transfers by Value Growth

| Player | Club | Season | Fee Paid (€) | Value at Transfer (€) | Current Value (€) | Value Change (€) |
|--------|------|---------|-------------|----------------------|------------------|-----------------|
| Erling Haaland | Man City | 22/23 | 60,000,000 | 150,000,000 | 200,000,000 | +140,000,000 |
| Michael Olise | Crystal Palace | 21/22 | 9,300,000 | 15,000,000 | 130,000,000 | +120,700,000 |
| Moises Caicedo | Brighton | 20/21 | 28,200,000 | 5,000,000 | 110,000,000 | +81,800,000 |
| Julian Alvarez | Man City | 21/22 | 21,400,000 | 20,000,000 | 100,000,000 | +78,600,000 |
| Alexis Mac Allister | Brighton | 18/19 | 8,000,000 | 5,000,000 | 85,000,000 | +77,000,000 |
| Cole Palmer | Chelsea | 23/24 | 47,000,000 | 18,000,000 | 120,000,000 | +73,000,000 |
| Viktor Gyokeres | Brighton | 17/18 | 1,000,000 | 500,000 | 70,000,000 | +69,000,000 |
| Morgan Rogers | Middlesbrough | 23/24 | 1,200,000 | 1,800,000 | 70,000,000 | +68,800,000 |
| Bryan Mbeumo | Brentford | 19/20 | 6,500,000 | 3,500,000 | 75,000,000 | +68,500,000 |
| Raphinha | Leeds | 20/21 | 18,600,000 | 16,000,000 | 80,000,000 | +61,400,000 |
| Morgan Rogers | Aston Villa | 23/24 | 9,400,000 | 2,800,000 | 70,000,000 | +60,600,000 |
| William Saliba | Arsenal | 19/20 | 30,000,000 | 12,000,000 | 90,000,000 | +60,000,000 |
| Antoine Semenyo | Bournemouth | 22/23 | 10,250,000 | 3,000,000 | 65,000,000 | +54,750,000 |
| Joao Pedro | Watford | 19/20 | 11,500,000 | 20,000,000 | 65,000,000 | +53,500,000 |
| Ryan Gravenberch | Liverpool | 23/24 | 40,000,000 | 30,000,000 | 90,000,000 | +50,000,000 |

---

### 1b. All Clubs Ranked by Average Value Change Per Transfer

| Club | Transfers | Avg Fee Paid (€) | Avg Current Value (€) | Avg Value Change (€) |
|------|-----------|-----------------|----------------------|---------------------|
| Brighton | 42 | 9,863,809 | 20,653,571 | +10,789,761 |
| Brentford | 34 | 6,425,882 | 15,316,911 | +8,891,029 |
| Crystal Palace | 28 | 12,336,428 | 18,967,857 | +6,631,428 |
| Wigan | 6 | 1,365,833 | 5,716,666 | +4,350,833 |
| Ipswich | 10 | 986,200 | 4,785,000 | +3,798,800 |
| Sunderland | 19 | 2,224,368 | 5,584,210 | +3,359,842 |
| Middlesbrough | 13 | 5,176,923 | 8,234,615 | +3,057,692 |
| Norwich | 17 | 5,066,470 | 7,361,764 | +2,295,294 |
| Bournemouth | 31 | 14,256,129 | 16,500,000 | +2,243,870 |
| Fulham | 27 | 9,626,666 | 11,790,740 | +2,164,074 |
| Nott'm Forest | 33 | 10,179,848 | 11,680,303 | +1,500,454 |
| Luton | 10 | 2,835,000 | 4,165,000 | +1,330,000 |
| Swansea | 19 | 2,746,210 | 2,597,368 | -148,842 |
| Burnley | 39 | 7,478,205 | 7,107,692 | -370,512 |
| Watford | 29 | 8,350,000 | 7,950,862 | -399,137 |
| Nottm Forest | 5 | 4,084,000 | 3,635,000 | -449,000 |
| Leeds | 28 | 12,250,000 | 11,607,142 | -642,857 |
| Newcastle | 39 | 19,677,179 | 18,782,051 | -895,128 |
| Hull City | 16 | 3,005,937 | 2,082,500 | -923,437 |
| QPR | 5 | 1,914,000 | 450,000 | -1,464,000 |
| Cardiff | 6 | 3,913,333 | 2,266,666 | -1,646,666 |
| Wolves | 46 | 13,652,956 | 11,726,086 | -1,926,869 |
| Sheff Utd | 24 | 8,422,083 | 5,735,416 | -2,686,666 |
| Liverpool | 27 | 31,137,037 | 27,918,518 | -3,218,518 |
| Reading | 5 | 4,160,000 | 520,000 | -3,640,000 |
| Huddersfield | 12 | 4,863,750 | 795,833 | -4,067,916 |
| Aston Villa | 43 | 15,338,372 | 10,616,279 | -4,722,093 |
| Stoke City | 10 | 8,127,000 | 3,062,500 | -5,064,500 |
| Southampton | 36 | 12,904,444 | 7,661,111 | -5,243,333 |
| Everton | 34 | 18,726,176 | 12,398,529 | -6,327,647 |
| Tottenham | 36 | 26,858,333 | 20,030,555 | -6,827,777 |
| Arsenal | 39 | 28,935,897 | 21,735,897 | -7,200,000 |
| West Brom | 8 | 9,848,750 | 2,075,000 | -7,773,750 |
| Leicester | 36 | 16,334,444 | 7,226,388 | -9,108,055 |
| Man City | 50 | 31,830,400 | 22,612,000 | -9,218,400 |
| West Ham | 42 | 18,248,809 | 9,017,857 | -9,230,952 |
| Chelsea | 50 | 40,731,000 | 21,862,000 | -18,869,000 |
| Man Utd | 30 | 48,962,333 | 14,840,000 | -34,122,333 |

---

### Key Findings
- Brighton and Brentford consistently outperform the market through 
data driven recruitment, buying young undervalued players and 
developing them significantly
- Crystal Palace are an underrated success story — Michael Olise 
signed for €9.3m grew to €130m in value before being sold to Bayern Munich
- Morgan Rogers is the most interesting case — Middlesbrough bought 
him for €1.2m, sold to Aston Villa for €9.4m, who then saw him grow 
to €70m. Two clubs extracted value from the same player
- Man United are the worst value club in the league, averaging a €34m 
loss in value per transfer over this period
- Chelsea despite being the biggest spenders lose €18m per player on 
average — Cole Palmer is a rare exception to their recruitment failures
- Smaller clubs like Ipswich, Bournemouth and Fulham consistently punch 
above their weight in recruitment

---

## Question 2: Which leagues are riskiest to buy from?

### Methodology
Transfers are grouped by the league of the selling club.
Only leagues with 10 or more transfers are included for reliability.
Analysis capped at 2023/24 season.

**Data limitation:** 219 transfers (approx. 30%) are excluded because 
their selling club was not present in the clubs dataset. These include 
reserve teams, lower league clubs, and clubs from leagues outside the 
dataset scope. Results should be interpreted with this in mind.

### Rankings by Average Value Change Per Transfer

| Source League | Transfers | Avg Fee Paid (€) | Avg Current Value (€) | Avg Value Change (€) |
|--------------|-----------|-----------------|----------------------|---------------------|
| Danish Superliga | 13 | 6,357,692 | 11,676,923 | +5,319,230 |
| Greek Super League | 10 | 7,522,000 | 7,707,500 | +185,500 |
| Belgian Pro League | 41 | 8,337,073 | 7,502,439 | -834,634 |
| Scottish Premiership | 19 | 6,875,684 | 6,034,210 | -841,473 |
| Ligue 1 (France) | 101 | 18,123,465 | 14,739,108 | -3,384,356 |
| Turkish Super Lig | 11 | 7,049,090 | 2,822,727 | -4,226,363 |
| Eredivisie (Netherlands) | 44 | 19,001,136 | 14,599,431 | -4,401,704 |
| Premier League (England) | 288 | 18,532,614 | 12,159,097 | -6,373,517 |
| Bundesliga (Germany) | 72 | 26,536,805 | 18,845,833 | -7,690,972 |
| Serie A (Italy) | 55 | 26,244,363 | 16,850,000 | -9,394,363 |
| Primeira Liga (Portugal) | 35 | 26,853,971 | 17,106,428 | -9,747,542 |
| La Liga (Spain) | 68 | 23,945,588 | 13,259,191 | -10,686,397 |

### Key Findings
- **Danish Superliga is the best value source league** — 13 transfers 
averaging +€5.3m value growth per player. Clubs buying from Denmark 
are consistently finding undervalued talent at low fees
- **La Liga is the riskiest major league** — average loss of €10.7m per 
player across 68 transfers. Spanish league players are bought at 
premium prices and rarely maintain that value in England
- **Primeira Liga (Portugal) is surprisingly risky** — despite producing 
many Premier League stars, clubs are on average overpaying by €9.7m 
per transfer
- **Ligue 1 offers the best value among the top 5 European leagues** — 
101 transfers with an average loss of just €3.4m, significantly better 
than Spain, Italy, Portugal or Germany
- **Turkish Super Lig is a warning** — average fee of €7m dropping to 
current value of €2.8m suggests players from Turkey struggle to 
adapt or maintain form in the Premier League
- **Domestic transfers are high volume but poor value** — 288 Premier 
League to Premier League transfers averaging a €6.4m loss, suggesting 
clubs consistently overpay when buying from each other

---

## Question 3: Young prospects vs prime age — which age group returns better value?

### Methodology
Player age is calculated at the exact date of transfer, not current age.
Transfers grouped into five age brackets. Analysis capped at 2023/24.

### Rankings by Age Group

| Age Group | Transfers | Avg Fee Paid (€) | Avg Current Value (€) | Avg Value Change (€) |
|-----------|-----------|-----------------|----------------------|---------------------|
| 15-20 (Young Prospect) | 198 | 11,665,858 | 18,642,676 | +6,976,818 |
| 21-24 (Emerging) | 449 | 18,938,211 | 15,990,690 | -2,947,521 |
| 29-32 (Experienced) | 66 | 10,778,666 | 2,973,484 | -7,805,181 |
| 33+ (Veteran) | 6 | 9,716,666 | 966,666 | -8,750,000 |
| 25-28 (Prime) | 264 | 17,727,121 | 6,538,257 | -11,188,863 |

### Key Findings
- **Young prospects (15-20) are the best value by a wide margin** — 
average gain of +€6.9m per player. Buying young and developing 
players is clearly the most effective transfer strategy
- **Prime age (25-28) is surprisingly the worst value** — average loss 
of €11.2m per player, even worse than veterans. Clubs are massively 
overpaying for players deemed to be at peak age
- **Emerging players (21-24) are the safest middle ground** — small 
average loss of €2.9m across 449 transfers, the highest volume 
bracket and relatively low risk
- **Veterans are an almost guaranteed loss** — 33+ players averaging 
a €8.75m loss. Buying older players on high fees is consistently 
poor business
- **This directly explains Brighton and Brentford's success** from 
Question 1 — both clubs predominantly target the 15-20 and 21-24 
age brackets rather than expensive prime age players
- **Clubs chasing immediate success** by buying 25-28 year old stars 
are paying the highest fees for the worst long term value returns

---

## Question 4: Best and Worst Signing Per Club

### Methodology
For each club, every transfer is ranked by value change from highest 
to lowest and lowest to highest. The best and worst ranked signing 
per club is then extracted and displayed side by side. Analysis 
capped at 2023/24.

### Results

| Club | Best Signing | Value Change (€) | Worst Signing | Value Change (€) |
|------|-------------|-----------------|--------------|-----------------|
| Arsenal | William Saliba | +60,000,000 | Nicolas Pepe | -74,000,000 |
| Aston Villa | Morgan Rogers | +60,600,000 | Danny Ings | -25,900,000 |
| Bournemouth | Antoine Semenyo | +54,750,000 | Jefferson Lerma | -22,500,000 |
| Brentford | Bryan Mbeumo | +68,500,000 | Mark Flekken | -5,000,000 |
| Brighton | Moises Caicedo | +81,800,000 | Alireza Jahanbakhsh | -21,700,000 |
| Burnley | Nathan Collins | +21,000,000 | Wout Weghorst | -14,000,000 |
| Chelsea | Cole Palmer | +73,000,000 | Romelu Lukaku | -98,000,000 |
| Crystal Palace | Michael Olise | +120,700,000 | Mamadou Sakho | -27,400,000 |
| Everton | Jarrad Branthwaite | +43,900,000 | Gylfi Sigurdsson | -48,650,000 |
| Fulham | Antonee Robinson | +27,900,000 | Ivan Cavaleiro | -9,800,000 |
| Leeds | Raphinha | +61,400,000 | Brenden Aaronson | -17,840,000 |
| Leicester | Mads Hermansen | +5,960,000 | Islam Slimani | -30,600,000 |
| Liverpool | Ryan Gravenberch | +50,000,000 | Virgil van Dijk | -66,650,000 |
| Man City | Erling Haaland | +140,000,000 | Jack Grealish | -92,500,000 |
| Man Utd | Amad Diallo | +28,700,000 | Paul Pogba | -100,000,000 |
| Middlesbrough | Morgan Rogers | +68,800,000 | Britt Assombalonga | -16,100,000 |
| Newcastle | Ivan Toney | +49,640,000 | Chris Wood | -22,000,000 |
| Nott'm Forest | Murillo | +43,000,000 | Ibrahim Sangare | -13,000,000 |
| Sheff Utd | Anel Ahmedhodzic | +11,500,000 | Rhian Brewster | -23,000,000 |
| Southampton | Tino Livramento | +13,800,000 | Danny Ings | -21,600,000 |
| Sunderland | Jobe Bellingham | +23,250,000 | Wahbi Khazri | -11,200,000 |
| Tottenham | Micky van de Ven | +25,000,000 | Tanguy Ndombele | -59,000,000 |
| Watford | Joao Pedro | +53,500,000 | Andre Gray | -19,100,000 |
| West Ham | Jarrod Bowen | +13,700,000 | Sebastien Haller | -48,000,000 |
| Wolves | Pedro Neto | +42,100,000 | Raul Jimenez | -34,000,000 |

### Key Findings
- **Paul Pogba is the worst value signing in the entire dataset** — 
Man United's €100m loss on a player who never fulfilled his 
potential stands as the defining example of poor recruitment
- **Romelu Lukaku cost Chelsea €98m in value** — bought twice by 
the club and flopped both times, epitomising their recruitment 
problems throughout this period
- **Jack Grealish's €92.5m loss is misleading in isolation** — 
Man City won multiple titles with him in the squad, but purely 
on market value terms he has been a poor investment
- **Virgil van Dijk's €66m loss should be treated with caution** — 
his current value reflects his age rather than his impact, 
widely considered one of the best defenders of his generation
- **Michael Olise remains the best value signing** — Crystal 
Palace's €120.7m gain from a €9.3m signing is extraordinary 
regardless of his subsequent move to Bayern Munich
- **Morgan Rogers is the most interesting story** — both 
Middlesbrough and Aston Villa extracted exceptional value 
from the same player at different stages of his development

---

## Overall Conclusions

Across all four questions the data points to a clear transfer 
strategy that works in the Premier League:

1. **Buy young** — prospects aged 15-24 return significantly better 
value than prime age or experienced players
2. **Target undervalued leagues** — Danish Superliga and Belgian Pro 
League offer better value than the traditional hunting grounds of 
Spain, Portugal and Italy
3. **Avoid overpaying for established names** — clubs like Man United 
and Chelsea consistently lose value by buying prime age stars from 
top leagues at premium fees
4. **Brighton and Brentford are the blueprint** — their data driven 
approach of buying young players from undervalued markets is 
vindicated entirely by this analysis
5. **Recruitment consistency matters as much as individual signings** — 
Brighton's gap between best and worst signing is far narrower than 
clubs like Man United and Chelsea, suggesting a more disciplined 
and consistent recruitment process
6. **The biggest flops belong to the biggest spenders** — the worst 
value signings in the dataset are concentrated at Chelsea, Man United, 
Tottenham and Man City, consistent with the finding that expensive 
prime age transfers carry the highest risk