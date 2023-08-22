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
SELECT c.id AS ��, c.[name] AS ���, r.[name] AS �������������, r.id AS ��_�������������, r.[level] AS �������_�����������, (SELECT COUNT(id) FROM collaborators WHERE subdivision_id = r.id) AS ����������_�����������
FROM Recursive r
JOIN collaborators c 
ON c.subdivision_id = r.id 
WHERE c.age < 40 
AND LEN(c.[name]) > 11
AND r.id != 100055
AND r.id != 100059
ORDER BY r.[level] ASC



