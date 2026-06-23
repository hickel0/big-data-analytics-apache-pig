-- Remove previous outputs so script can run repeatedly
fs -rm -r -f /lab/projects/teams/outputs/clean
fs -rm -r -f /lab/projects/teams/outputs/samples
fs -rm -r -f /lab/projects/teams/outputs/team_summary

-- 1. LOAD RAW DATA FROM HDFS
team_raw = LOAD 'team_traditional.csv'
    USING PigStorage(',')
    AS (
        gameid:chararray,
        date:chararray,
        type:chararray,
        teamid:chararray,
        team:chararray,
        home:int,
        away:int,
        MIN:int,
        PTS:int,
        FGM:int,
        FGA:int,
        FG:double,
        TPM:int,
        TPA:int,
        TP:double,
        FTM:int,
        FTA:int,
        FT:double,
        OREB:int,
        DREB:int,
        REB:int,
        AST:int,
        TOV:int,
        STL:int,
        BLK:int,
        PF:int,
        PLUSMINUS:int,
        win:int,
        season:int
    );

-- 2. REMOVE HEADER ROW (if present)
team_noheader = FILTER team_raw BY gameid != 'gameid';

-- 3. REMOVE INVALID ROWS (null teamid or pts)
team_clean = FILTER team_noheader BY 
    (teamid IS NOT NULL) AND (PTS IS NOT NULL);

-- 4. STORE CLEANED DATA FOR SPARK
STORE team_clean INTO 'outputs/clean' USING PigStorage('\t');

-- 5. CREATE SIMPLE ANALYTICS (example)
-- Group by team and compute average points scored
grouped = GROUP team_clean BY team;
team_summary = FOREACH grouped GENERATE
    group AS team,
    AVG(team_clean.PTS) AS avg_pts,
    AVG(team_clean.REB) AS avg_reb,
    AVG(team_clean.AST) AS avg_ast,
    AVG(team_clean.PLUSMINUS) AS avg_plusminus,
    AVG(team_clean.win) AS win_rate;

-- STORE SUMMARY FOR REPORTING
STORE team_summary INTO 'outputs/team_summary' USING PigStorage('\t');

-- OPTIONAL: a small sample for debugging
-- sample = LIMIT team_clean 5;
-- STORE sample INTO '/lab/projects/teams/outputs/samples' USING PigStorage('\t');
