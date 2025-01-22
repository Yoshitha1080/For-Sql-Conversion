SELECT 
    Email,
    COUNT(*) AS DuplicateCount
FROM Users
GROUP BY Email
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;
