/* İl Ekleme */
INSERT INTO Provinces(Name)
SELECT TOP (SELECT COUNT(*) FROM pk_list) l.il
FROM pk_list AS l
GROUP BY l.il
ORDER BY l.il

/* İlçe Ekleme */
INSERT INTO Districts(Name, ProvinceId)
SELECT TOP (SELECT COUNT(*) FROM pk_list) l.ilce, p.Id
FROM pk_list AS l
INNER JOIN Provinces AS p ON p.Name = l.il
GROUP BY l.ilce, p.Id
ORDER BY p.Id, l.ilce

/* Semt/Bucak/Belde Ekleme */
INSERT INTO Towns(Name, DistrictId, ProvinceId)
SELECT TOP (SELECT COUNT(*) FROM pk_list) l.semt_bucak_belde, d.Id, p.Id
FROM pk_list AS l
INNER JOIN Districts AS d ON d.Name = l.ilce
INNER JOIN Provinces AS p ON p.Name = l.il
GROUP BY l.semt_bucak_belde, d.Id, p.Id
ORDER BY p.Id, d.Id, l.semt_bucak_belde

/* Mahalle Ekleme */
INSERT INTO Neighborhoods(Name, TownId, DistrictId, ProvinceId)
SELECT TOP (SELECT COUNT(*) FROM pk_list) l.mahalle, t.Id, d.Id, p.Id
FROM pk_list AS l
INNER JOIN Towns AS t ON t.Name = l.semt_bucak_belde
INNER JOIN Districts AS d ON d.Name = l.ilce
INNER JOIN Provinces AS p ON p.Name = l.il
GROUP BY l.mahalle, t.Id, d.Id, p.Id
ORDER BY p.Id, d.Id, t.Id, l.mahalle

/* Posta Kodu Ekleme */
INSERT INTO PostCodes(Name, NeighborhoodId, TownId, DistrictId, ProvinceId)
SELECT TOP (SELECT COUNT(*) FROM pk_list) l.pk, n.Id, t.Id, d.Id, p.Id
FROM pk_list AS l
INNER JOIN Neighborhoods AS n ON n.Name = l.mahalle
INNER JOIN Towns AS t ON t.Name = l.semt_bucak_belde
INNER JOIN Districts AS d ON d.Name = l.ilce
INNER JOIN Provinces AS p ON p.Name = l.il
GROUP BY l.pk, n.Id, t.Id, d.Id, p.Id
ORDER BY p.Id, d.Id, t.Id, n.Id, l.pk

/* İl Gösterme */
SELECT p.Name AS Province
FROM Provinces AS p

/* İlçe Gösterme */
SELECT p.Name AS Province, d.Name AS District
FROM Districts AS d
INNER JOIN Provinces AS p ON d.ProvinceId = p.Id;

/* Semt/Bucak/Belde Gösterme */
SELECT p.Name AS Province, d.Name AS District, t.Name AS Town 
FROM Towns AS t
INNER JOIN Districts AS d ON d.Id = t.DistrictId
INNER JOIN Provinces AS p ON p.Id = t.ProvinceId

/* Mahalle Gösterme */
SELECT p.Name AS Province, d.Name AS District, t.Name AS Town, n.Name AS Neighborhood
FROM Neighborhoods AS n
INNER JOIN Towns AS t ON t.Id = n.DistrictId
INNER JOIN Districts AS d ON d.Id = n.DistrictId
INNER JOIN Provinces AS p ON p.Id = n.ProvinceId

/* Posta Kodu Gösterme */
SELECT p.Name AS Province, d.Name AS District, t.Name AS Town, n.Name AS Neighborhood, pk.Name AS PK
FROM PostCodes AS pk
INNER JOIN Neighborhoods AS n ON n.Id = pk.NeighborhoodId
INNER JOIN Towns AS t ON t.Id = pk.DistrictId
INNER JOIN Districts AS d ON d.Id = pk.DistrictId
INNER JOIN Provinces AS p ON p.Id = pk.ProvinceId