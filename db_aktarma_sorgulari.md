<h3>İl</h3>
INSERT INTO [Test].[dbo].[Provinces](Name)
SELECT list.il
FROM [Test].[dbo].[pk_list] as list group by list.il order by list.il

<h3>İlçe</h3>
INSERT INTO [Test].[dbo].[Districts](Name, ProvinceId)
SELECT list.ilce, p.Id
FROM [Test].[dbo].[pk_list] as list
inner join [Test].[dbo].[Provinces] as p on p.Name = list.il
group by list.ilce, p.Id order by p.Id, list.ilce

<h3>Semt/Bucak/Belde</h3>
INSERT INTO [Test].[dbo].[Towns](Name, DistrictId)
SELECT list.semt_bucak_belde, d.Id
FROM [Test].[dbo].[pk_list] as list
inner join [Test].[dbo].[Districts] as d on d.Name = list.ilce
group by list.semt_bucak_belde, d.Id order by d.Id, list.semt_bucak_belde

<h3>Mahalle</h3>
INSERT INTO [Test].[dbo].[Neighborhoods](Name, TownId)
SELECT list.mahalle, t.Id
FROM [Test].[dbo].[pk_list] as list
inner join [Test].[dbo].[Towns] as t on t.Name = list.semt_bucak_belde
group by list.mahalle, t.Id order by t.Id, list.mahalle

<h3>Posta Kodları</h3>
INSERT INTO [Test].[dbo].[PostalCodes](Code, NeighborhoodId)
SELECT list.pk, n.Id
FROM [Test].[dbo].[pk_list] as list
inner join [Test].[dbo].[Neighborhoods] as n on n.Name = list.mahalle
group by list.pk, n.Id order by n.Id, list.pk
