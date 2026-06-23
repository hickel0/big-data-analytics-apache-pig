# CSC1109 – Assignment 2 Group K
## NBA Hybrid Recommender System Using Pig, SparkML & PySpark  
**Authors:** Brian Cafferty -- Alex Davis -- Lee Hickey  


## 1. Project Overview

Our project develops a hybrid recommender system that identifies NBA teams that are most similar to one another based on:

- **Collaborative Filtering (CF):** similarity in team performance against the same opponents using a cosine similarity matrix between teams.
- **Content-Based Filtering (CB):** similarity in team statistics such as points, winning margins, rebounds, assists, etc. Completed using a cosine similarity matrix between the team's statistical profile. 
- **Hybrid Score:** weighted combination of CF and CB.

The system uses traditional NBA team box score data (1996–2025) and is implemented in a distributed environment using:

- **Apache Pig** for data cleaning  
- **Apache Spark / PySpark** for transformations  
- **SparkML** for vectorisation & cosine similarity  
- **HDFS** for distributed storage  

Our goal is to understand *“who plays like who?”* by blending result-based similarity and tactical similarity into one recommender.  


## 2. Datasets

We use **team_traditional.csv** and **traditional.csv** from the NBA Team Traditional Box Score dataset (Kaggle).  

`Team dataset` details:
- **70,850 rows**
- **30 seasons (1996/97 - 2024/25)** 
- 35,000 games 
- Unique identifiers: `gameid`, `teamid` 
- Key statistical features:
  - Game outcome: `PTS`, `+/-`, `win`, `home/away` 
  - Tactical metrics: `REB`, `AST`, `TOV`, `STL`, `FTM`, `3PM`, `FGA`, efficiency metrics (`FG%`, `3P%`, `FT%`)

`Player dataset` details:
- **758,000 rows**
- **30 seasons (1996/97 - 2024/25)**
- Unique identifiers: `gameid`, `playerid`
- Key statistical features:
  - Game outcome: `PTS`, `+/-`, `win`, `home/away`, `type`
  - Tactical metrics: `REB`, `AST`, `TOV`, `STL`, `FTM`, `3PM`, `FGA`, efficiency metrics (`FG%`, `3P%`, `FT%`)


Data quality issues discovered included:
- Missing TeamIDs 
- Missing or invalid PTS
- Incorrect data types

These were handled through our Pig cleaning pipeline. 


## 3. Technologies Used

| Technology | Purpose |
|-----------|---------|
| **Apache Pig** | Cleaning data, removing NULLs, enforcing schema |
| **Apache Spark / PySpark** | Large-scale transformations & matrix construction |
| **SparkML** | VectorAssembler + cosine similarity computations |
| **HDFS** | Distributed storage of raw + cleaned data |
| **Matplotlib** | Visualising similarity matrices (heatmaps, tables) |
| **Docker (CSC1109 Sandbox)** | Execution environment |


## 4. Repository Structure

```text
.
├── .ipynb_checkpoints/
│   └── TeamAnalysis-checkpoint.ipynb
│
├── Data/
│   ├── .gitkeep
│   ├── team_traditional.csv
│   └── traditional.csv
│
├── outputs/
│   ├── clean/
│   │   ├── .ipynb_checkpoints/
│   │   ├── _SUCCESS
│   │   ├── _SUCCESS.crc
│   │   ├── part-m-00000
│   │   └── part-m-00000.crc
│   │
│   ├── team_summary/
│   │   ├── .ipynb_checkpoints/
│   │   ├── _SUCCESS
│   │   ├── _SUCCESS.crc
│   │   ├── part-r-00000
│   │   └── part-r-00000.crc
│   │
│   ├── .gitkeep
│   │
│   └── team_joined/
│       ├── .gitkeep
│       ├── _SUCCESS
│       └── part-r-00000
│
├── Visualisations/
│   ├── .gitkeep
│   │
│   ├── Combined_Analysis/
│   │   ├── .gitkeep
│   │   ├── Best_-_Chicago_Opponents.png
│   │   ├── Heatmap_-_Team_vs_Opponent.png
│   │   ├── MJ_Points_vs_Team.png
│   │   ├── Plus_Minus_-_MJ.png
│   │   └── Point_Diff_vs_Win_Rate.png
│   │
│   └── Teams_Analysis/
│       ├── .gitkeep
│       ├── Boston-Profile_Radar.png
│       ├── Hybrid_Score_vs_Win_Rate.png
│       ├── Temporal_-_Point_per_Season.png
│       └── Top10-Hybrid_Teams.png
│
├── Combined_Analysis.html
├── combined_processing.pig
├── README.md
├── team_processing.pig
├── TeamAnalysis.html
└── TeamAnalysis.ipynb