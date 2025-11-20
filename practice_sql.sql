CREATE TABLE match(
	team VARCHAR(50)
);

INSERT INTO match VALUES ('India'),('Pakistan'),('Austrila'),('New Zealand'),('England');

SELECT * FROM match

WITH CTE AS(
	SELECT *, ROW_NUMBER() OVER(ORDER BY team) AS id
	FROM match
)

SELECT q1.team AS "Team A", q2.team AS "Team B" FROM CTE AS q1
JOIN CTE AS q2
ON q1.team <> q2.team
WHERE q1.id < q2.id