WITH Recursive (id, parent_id, [name], [level])
AS
(
	SELECT id, parent_id, [name], 0
	FROM subdivisions s
	WHERE s.id = 100051
	UNION ALL
	SELECT s.id, s.parent_id, s.[name], [level] + 1
	FROM subdivisions s
		JOIN Recursive r ON s.parent_id = r.id
)
SELECT c.id AS Ид, c.[name] AS Имя, r.[name] AS Подразделение, r.id AS Ид_подразделения, r.[level] AS Уровень_вложенности, (SELECT COUNT(id) FROM collaborators WHERE subdivision_id = r.id) AS Количество_сотрудников
FROM Recursive r
JOIN collaborators c 
ON c.subdivision_id = r.id 
WHERE c.age < 40 
AND LEN(c.[name]) > 11
AND r.id != 100055
AND r.id != 100059
ORDER BY r.[level] ASC



