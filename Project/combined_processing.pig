fs -rm -f -r -R outputs/team_joined;

-- Load team trad

team_traditional_raw =LOAD 'team_traditional.csv'
    USING PigStorage(',')
    AS (
        gameid:chararray,
        date:chararray,
        type:chararray,
        teamid:chararray,
        team:chararray,
        home:chararray,
        away:chararray,
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

-- Remove header
team_traditional = FILTER team_traditional_raw BY gameid != 'gameid';


--Load Trad

traditional_raw =
    LOAD 'traditional.csv'
    USING PigStorage(',')
    AS (
        gameid:chararray,
        date:chararray,
        type:chararray,
        playerid:chararray,
        player:chararray,
        team:chararray,
        home:chararray,
        away:chararray,
        MIN:int,
        PTS:int,
        FGM:int,
        FGA:int,
        FG_PCT:double,
        TPM:int,
        TPA:int,
        TP_PCT:double,
        FTM:int,
        FTA:int,
        FT_PCT:double,
        OREB:int,
        DREB:int,
        REB:int,
        AST:int,
        STL:int,
        BLK:int,
        TOV:int,
        PF:int,
        PLUS_MINUS:int,
        win:int,
        season:int
    );

-- Remove header
traditional = FILTER traditional_raw BY gameid != 'gameid';

--Join string fields

joined =
    JOIN traditional BY (gameid, team),
         team_traditional BY (gameid, team);

--- LIMIT STORE

-- joined_limit = LIMIT joined 20;
-- DUMP joined_limit;


-- Store

STORE joined INTO 'outputs/team_joined'
    USING PigStorage(',');