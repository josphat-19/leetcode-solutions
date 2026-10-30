# Write your MySQL query statement below
WITH ConsecutiveLogs AS (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LAG(num, 2) OVER (ORDER BY id) AS prev_num2
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM ConsecutiveLogs
WHERE num = prev_num
  AND num = prev_num2;
