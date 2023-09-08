use test;
#Displaying full_name of players
select  full_name from fifa_cleaned;
#Selecting records from database who have potential greater than 90
select full_name, potential
FROM fifa_cleaned
WHERE potential>90;
#Selecting the players from body_type
SELECT body_type, COUNT(*)
FROM fifa_cleaned
GROUP BY body_type;
#Average wage per club team
SELECT club_team, AVG(wage_euro)
FROM fifa_cleaned
GROUP BY club_team;
#selecting distinct club teams
SELECT distinct(club_team) FROM fifa_cleaned;
#Selecting average height per club team
SELECT club_team, AVG(height_cm)
FROM fifa_cleaned
GROUP BY club_team;