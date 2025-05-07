--Soru 1: Toplam sipariþ sayýsýný ve toplam satýþ tutarýný bulun.
select 
	COUNT(*) as SiparisSayisi,
	SUM(TotalAmount) as ToplamTutar 
from orders 

--Soru 2: Her kategorideki ürün sayýsýný listeleyin.
select 
	count(ProductID) as urunsayisi , 
	category 
from products
group by category
order by 1

--Soru 3: En yüksek toplam satýþa sahip 5 þehri bulun.
select TOP 5
	SUM(o.TotalAmount) as toplam_tutar,
	c.City as Sehir
from customers c 
INNER JOIN orders o ON c.CustomerID = o.CustomerID
Group by c.City
Order by 1 DESC

--Soru 4: 2024 yýlýnda verilen sipariþ sayýsýný bulun.
select DATEPART(Year,OrderDate) as Yýl,
COUNT(DISTINCT OrderID) as SiparisSayisi
from Orders
Where DATEPART(Year,OrderDate) = 2024
Group by DATEPART(Year,OrderDate)



--Soru 5: En pahalý 5 ürünü listeleyin.
SELECT TOP 5
      ProductName,
      UnitPrice
  FROM Products
  ORDER BY UnitPrice DESC;

--Soru 6: Her þehirdeki müþteri sayýsýný bulun.
select 
	COUNT(CustomerID) as MusteriSayisi , 
	City 
from customers 
Group by City
Order by 1 desc

--Soru 7: Elektronik kategorisindeki toplam satýþ tutarýný hesaplayýn.
select 
	SUM(od.Quantity * od.UnitPrice)  as ToplamTutar,
	p.Category
from Order_Details od
INNER JOIN products p ON p.ProductID = od.ProductID
Where p.category = 'Elektronik'
Group by p.Category

--Soru 8: En az 100 sipariþ veren müþterileri listeleyin.
Select 
	COUNT(o.OrderID) as SiparisSayisi,
	c.CustomerID,
	c.CustomerName
from Orders o 
INNER JOIN customers c ON o.CustomerID = c.CustomerID
Group by c.CustomerID,c.CustomerName
HAVING COUNT(o.OrderID) >= 100

--Soru 9: Ortalama sepet tutarýný hesaplayýn.
select AVG(TotalAmount) as OrtalamaAlisverisTutari from orders

--Soru 10: Haftanýn hangi günlerinde en çok sipariþ verilmiþ?
select 
	DATENAME(DW,OrderDate) as Gunler ,
	Count(DISTINCT OrderID) as SiparisSayisi
from orders
Group by DATENAME(DW,OrderDate)
  ORDER BY SiparisSayisi DESC;

--Soru 11: Her kategoride en çok satýlan ürünü bulun.
WITH CTE AS (
select 
SUM(od.Quantity) as SatilanUrunAdeti , 
od.ProductID,
p.Category,
ROW_NUMBER() OVER (PARTITION BY p.Category ORDER BY SUM(od.Quantity) DESC) AS Sýra
from Order_Details od 
INNER JOIN products p ON od.ProductID = p.ProductID
Group by od.ProductID, p.Category
)

Select * from CTE 
where Sýra = 1
order by 1 desc

--Soru 12: 2024’te her ayýn toplam satýþýný ve bir önceki aya göre büyüme oranýný hesaplayýn.
WITH CTE AS (
    SELECT 
          YEAR(OrderDate) AS Yil,
          MONTH(OrderDate) AS Ay,
          SUM(TotalAmount) AS ToplamSatis
      FROM Orders
      WHERE YEAR(OrderDate) = 2024
      GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)

Select * ,
LAG(ToplamSatis) OVER(ORDER BY Yil,Ay) as BirOncekiAySatis ,
CASE 
          WHEN LAG(ToplamSatis) OVER (ORDER BY Yil, Ay) IS NOT NULL 
          THEN ((ToplamSatis - LAG(ToplamSatis) OVER (ORDER BY Yil, Ay)) / LAG(ToplamSatis) OVER (ORDER BY Yil, Ay)) * 100 
          ELSE NULL 
      END AS BuyumeOrani
From CTE 
Order by 2

--Soru 13: Ortalama sipariþ tutarýndan yüksek olan sipariþlerin sayýsýný bulun.
WITH CTE AS (
Select 
AVG(TotalAmount) as OrtalamaSiparisTutari
from Orders
)

Select 
	COUNT(DISTINCT o.ORDERID) as SiparisSayisi 
From Orders o 
CROSS JOIN CTE 
Where o.TotalAmount >= CTE.OrtalamaSiparisTutari

--Soru 14: Her müþterinin son sipariþ tarihini ve toplam harcama miktarýný listeleyin.
SELECT 
      c.CustomerID,
      c.CustomerName,
      MAX(o.OrderDate) AS SonSiparisTarihi,
      SUM(o.TotalAmount) AS ToplamHarcama
  FROM Orders o
  JOIN Customers c ON o.CustomerID = c.CustomerID
  GROUP BY c.CustomerID, c.CustomerName
  ORDER BY ToplamHarcama DESC;

--Soru 15: En çok satýlan 5 ürünü toplam adet ve gelir bazýnda sýralayýn.
Select TOP 5
	SUM(od.Quantity * od.UnitPrice) as ToplamTutar , 
	SUM(od.Quantity) as SatilanToplamAdet , 
	od.ProductID , 
	pd.ProductName, 
	pd.Category
from order_details od INNER JOIN products pd ON pd.ProductID = od.ProductID
Group by od.ProductID , pd.ProductName , pd.Category
Order by ToplamTutar DESC , SatilanToplamAdet DESC

--Soru 16: Her þehirdeki ortalama sepet tutarýný hesaplayýn.
Select 
	c.city,
	AVG(o.totalamount) as OrtalamaTutar
from customers c 
INNER JOIN orders o ON c.CustomerID = o.CustomerID
Group by c.city

--Soru 17: Hiç sipariþ vermeyen müþterileri listeleyin.
SELECT 
      c.CustomerID,
      c.CustomerName
  FROM Customers c
  LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
  WHERE o.OrderID IS NULL;

--Soru 18: 2024’te en az 10 sipariþ veren müþterilerin toplam harcamasýný hesaplayýn.
SELECT 
      c.CustomerID,
      c.CustomerName,
	  YEAR(o.orderdate) as yýl,
	  SUM(o.TotalAmount) as ToplamHarcama,
	  Count(DISTINCT o.OrderID) as SiparisSayisi
  FROM Customers c
 LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
 Group by c.customerID, c.customername , YEAR(o.orderdate)
 HAVING Count(DISTINCT o.OrderID) >= 10 and YEAR(o.orderdate) = 2024
 ORDER BY ToplamHarcama DESC;

--Soru 19: Her kategorideki ortalama ürün fiyatýný hesaplayýn.
SELECT 
      Category,
      AVG(UnitPrice) AS OrtalamaFiyat
  FROM Products
  GROUP BY Category
  ORDER BY OrtalamaFiyat DESC;

--Soru 20: Sipariþlerin % kaçý tek ürün içeriyor?
WITH OrderItemCount AS (
    SELECT 
        OrderID,
        COUNT(ProductID) AS UrunSayisi
    FROM Order_Details
    GROUP BY OrderID
)
SELECT 
    ROUND((COUNT(CASE WHEN UrunSayisi = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS TekUrunOrani
FROM OrderItemCount;


-- 2. Yol: 
WITH CTE AS (
SELECT 
        OrderID,
        COUNT(ProductID) AS UrunSayisi
FROM Order_Details
GROUP BY OrderID
HAVING COUNT(ProductID) = 1
) , 
CTE2 AS (
SELECT 
        OrderID,
        COUNT(ProductID) AS UrunSayisi
FROM Order_Details
GROUP BY OrderID
)

Select 
CONVERT(decimal,COUNT(c1.UrunSayisi)) / Convert(decimal,COUNT(c2.UrunSayisi)) * 100
from CTE c1 RIGHT JOIN CTE2 c2 ON 
c1.OrderID = c2.OrderID

--Soru 21: RFM Tablosunu Oluþturup RFM analizi ile en deðerli 100 müþteriyi bulun.
-- 1. Adým RFM Tablosunu Oluþturalým:
SELECT 
    c.CustomerID, 
    c.CustomerName,
    DATEDIFF(day, MAX(o.OrderDate), GETDATE()) AS Recency,
    COUNT(DISTINCT o.OrderID) AS Frequency,
    SUM(o.TotalAmount) AS Monetary,
    NULL AS Recency_Score,
    NULL AS Frequency_Score,
    NULL AS Monetary_Score
INTO RFM
FROM Orders o 
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

-- Recency_score , Frequency_Score , Monetary_Score deðerlerini hesaplayalým:
-- Recency_Score Deðerini Hesaplayalým

WITH CTE_Score AS (
    SELECT
        CustomerID,
        NTILE(5) OVER (ORDER BY Recency DESC) AS Score
    FROM RFM
)
UPDATE RFM
SET Recency_Score = CTE_Score.Score
FROM RFM
INNER JOIN CTE_Score ON RFM.CustomerID = CTE_Score.CustomerID;

--Frequency_Score Deðerini Hesaplayalým.
WITH FrequencyCTE as (
Select CustomerID , 
NTILE(5) OVER(ORDER BY Frequency DESC) as Score
From RFM
)

UPDATE RFM SET Frequency_Score = FrequencyCTE.Score
FROM RFM
INNER JOIN FrequencyCTE ON RFM.CustomerID = FrequencyCTE.CustomerID;

--Monetary_Score Deðerini Hesaplayalým.
WITH Monetary_CTE as (
Select CustomerID,
NTILE(5) OVER(Order By Monetary DESC) as Score 
FROM RFM
)
UPDATE RFM SET Monetary_Score = Monetary_CTE.Score 
FROM RFM
INNER JOIN Monetary_CTE ON RFM.CustomerID = Monetary_CTE.CustomerID

-- RF_Score Deðerini Hesaplayalým
ALTER TABLE RFM ADD RF_Score as
CONVERT(Varchar,Recency_Score) + CONVERT(Varchar,Frequency_Score)

-- RFM_Score Deðerini Hesaplayalým
ALTER TABLE RFM ADD RFM_Score as
CONVERT(Varchar,Recency_Score) + CONVERT(Varchar,Frequency_Score) + Convert(Varchar,Monetary_Score)

-- Müþteri Segmentasyonu Yapalým Elde Ettiðimiz Skorlarýn Anlamlý Hale Gelmesi Ýçin : 

-- Segment Sütununu Oluþturalým:
ALTER TABLE RFM ADD Segment Varchar(50)

--Hibernating sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT='Hibernating' 
WHERE RECENCY_SCORE LIKE '[1-2]%' AND FREQUENCY_SCORE LIKE '[1-2]%'

--at Risk sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT='At Risk' 
WHERE RECENCY_SCORE LIKE'[1-2]%' AND FREQUENCY_SCORE LIKE '[3-4]%'

-- Can't Loose sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='cant_loose'
WHERE RECENCY_SCORE LIKE '[1-2]%' AND FREQUENCY_SCORE LIKE '[5]%'

-- About to Sleep sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='about_to_sleep'
WHERE RECENCY_SCORE LIKE '[3]%' AND FREQUENCY_SCORE LIKE '[1-2]%'

-- Need Attention sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='need_attention'
WHERE RECENCY_SCORE LIKE '[3]%' AND FREQUENCY_SCORE LIKE '[3]%'

-- Loyal Customers sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='loyal_customers'
WHERE RECENCY_SCORE LIKE '[3-4]%' AND FREQUENCY_SCORE LIKE '[4-5]%'

-- Promising sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='promising'
WHERE RECENCY_SCORE LIKE '[4]%' AND FREQUENCY_SCORE LIKE '[1]%'

-- New Customers sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='new_customers'
WHERE RECENCY_SCORE LIKE '[5]%' AND FREQUENCY_SCORE LIKE '[1]%'

-- Potential Loyalist sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='potential_loyalists'
WHERE RECENCY_SCORE LIKE '[4-5]%' AND FREQUENCY_SCORE LIKE '[2-3]%'

-- Champions sýnýfýnýn oluþturulmasý
UPDATE RFM SET SEGMENT ='champions'
WHERE RECENCY_SCORE LIKE '[5]%' AND FREQUENCY_SCORE LIKE '[4-5]%'



-- 2. Adým En deðerli 100 Müþteriyi Listeleyelim:
SELECT TOP 100 
    CustomerID,
    CustomerName,
    Recency,
    Frequency,
    Monetary,
    Recency_Score,
    Frequency_Score,
    Monetary_Score,
    RFM_Score, 
	Segment
FROM RFM
ORDER BY RFM_Score DESC;


--Soru 22: Birlikte satýn alýnan ürün çiftlerini ve destek oranýný hesaplayýn.
WITH CTE AS (
select
	od1.OrderID,
	pd1.ProductName AS Product1,
	pd2.ProductName AS Product2
from Order_Details od1 
INNER JOIN Order_Details od2 ON od1.OrderID = od2.OrderID AND od1.ProductID < od2.ProductID
INNER JOIN Products pd1 ON pd1.ProductID = od1.ProductID
INNER JOIN Products pd2 ON pd2.ProductID = od2.ProductID
)

select top 10 
Product1,
Product2,
COUNT(*) As BirlikteSatinAlinmaSayisi , 
(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT OrderID) FROM Orders)) AS DestekOrani
FROM CTE
Group by Product1, Product2
Order by BirlikteSatinAlinmaSayisi DESC

--Soru 23: Müþteri kohort analizi ile ilk sipariþten sonraki aylarda aktif müþteri sayýsýný bulun.

With FirstOrders as (
Select 
CustomerID ,
MIN(OrderDate) as ILKSIPARISTARIHI 
from orders 
Group by CustomerID
),
	Cohorts as (
				Select
					fo.customerID,
					YEAR(fo.ILKSIPARISTARIHI) as CohortYear,
					MONTH(fo.ILKSIPARISTARIHI) as CohortMonth,
					DATEDIFF(Month, fo.ILKSIPARISTARIHI , o.OrderDate) as SiparisFarkiIlkTarihten
				From FirstOrders fo
				INNER JOIN Orders o ON fo.CustomerID = o.CustomerID
				)

Select 
	CohortYear,
	CohortMonth,
	SiparisFarkiIlkTarihten,
	Count(DISTINCT CustomerID) as AktifMusteriler
From Cohorts
Group by CohortYear,CohortMonth,SiparisFarkiIlkTarihten
Order by CohortYear,CohortMonth,SiparisFarkiIlkTarihten

--Soru 24: Son 6 ayda sipariþ vermeyen müþterilerin (churn riski) toplam harcama geçmiþini bulun.
select 
	c.CustomerID,
	c.CustomerName,
	MAX(o.orderdate) as SonSiparisTarihi,
	DATEDIFF(Day, MAX(o.orderdate), GETDATE()) as SiparissizGecenGunFarki,
	SUM(o.TotalAmount) as ToplamHarcama
from customers c 
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
Group by c.CustomerID, c.CustomerName
HAVING DATEDIFF(DAY, MAX(o.OrderDate), GETDATE()) > 180 OR MAX(o.OrderDate) IS NULL
ORDER BY SiparissizGecenGunFarki ASC;

--Soru 25: Her kategorideki satýþlarýn toplam satýþ içindeki payýný hesaplayýn.
WITH CategorySales AS (
      SELECT 
          p.Category,
          SUM(od.Quantity * od.UnitPrice) AS ToplamSatis
      FROM Order_Details od
      JOIN Products p ON od.ProductID = p.ProductID
      GROUP BY p.Category
  )
  SELECT 
      Category,
      ToplamSatis,
      (ToplamSatis * 100.0 / SUM(ToplamSatis) OVER ()) AS SatisPayi
  FROM CategorySales
  ORDER BY SatisPayi DESC;

--Soru 26: Müþterilerin ilk ve son sipariþleri arasýndaki süre farkýný hesaplayýn.
WITH CustomerOrders AS (
      SELECT 
          CustomerID,
          MIN(OrderDate) AS IlkSiparis,
          MAX(OrderDate) AS SonSiparis
      FROM Orders
      GROUP BY CustomerID
  )
  SELECT 
      c.CustomerID,
      c.CustomerName,
      co.IlkSiparis,
      co.SonSiparis,
      DATEDIFF(DAY, co.IlkSiparis, co.SonSiparis) AS AktifGunSayisi
  FROM CustomerOrders co
  JOIN Customers c ON co.CustomerID = c.CustomerID
  ORDER BY AktifGunSayisi DESC;

--Soru 27: Her müþterinin en sýk satýn aldýðý ürün kategorisini bulun.
WITH CustomerCategory AS (
      SELECT 
          c.CustomerID,
          c.CustomerName,
          p.Category,
          SUM(od.Quantity) AS ToplamAdet
          --ROW_NUMBER() OVER (PARTITION BY c.CustomerID ORDER BY SUM(od.Quantity) DESC) AS Sýra
      FROM Order_Details od
      JOIN Products p ON od.ProductID = p.ProductID
      JOIN Orders o ON od.OrderID = o.OrderID
      JOIN Customers c ON o.CustomerID = c.CustomerID
      GROUP BY c.CustomerID, c.CustomerName, p.Category
  )
  SELECT 
      CustomerID,
      CustomerName,
      Category,
      ToplamAdet
  FROM CustomerCategory
  WHERE Sýra = 1
  ORDER BY ToplamAdet DESC;
--Soru 28: Satýþlarýn %80’ini oluþturan ürünleri (Pareto analizi) bulun.
WITH ProductSales AS (
      SELECT 
          p.ProductName,
          SUM(od.Quantity * od.UnitPrice) AS ToplamGelir,
          SUM(SUM(od.Quantity * od.UnitPrice)) OVER () AS ToplamSatis
      FROM Order_Details od
      JOIN Products p ON od.ProductID = p.ProductID
      GROUP BY p.ProductName
  ),
  CumulativeSales AS (
      SELECT 
          ProductName,
          ToplamGelir,
          ToplamSatis,
          SUM(ToplamGelir) OVER (ORDER BY ToplamGelir DESC ROWS UNBOUNDED PRECEDING) AS KümülatifGelir
      FROM ProductSales
  )
  SELECT 
      ProductName,
      ToplamGelir,
      (KümülatifGelir * 100.0 / ToplamSatis) AS KümülatifPay
  FROM CumulativeSales
  WHERE KümülatifGelir <= 0.8 * ToplamSatis
  ORDER BY ToplamGelir DESC;
--Soru 29: Her þehirdeki müþterilerin ortalama sipariþ sýklýðýný hesaplayýn.
WITH CustomerOrders AS (
      SELECT 
          c.City,
          c.CustomerID,
          COUNT(DISTINCT o.OrderID) AS SiparisSayisi
      FROM Orders o
      JOIN Customers c ON o.CustomerID = c.CustomerID
      GROUP BY c.City, c.CustomerID
  )
  SELECT 
      City,
      AVG(1.0 * SiparisSayisi) AS OrtalamaSiparisFrekansi
  FROM CustomerOrders
  GROUP BY City
  ORDER BY OrtalamaSiparisFrekansi DESC;
--Soru 30: Black Friday (2024 Kasým) döneminde en çok satýlan ürünleri ve önceki aya göre artýþ oranýný bulun.
WITH ProductSales AS (
      SELECT 
          p.ProductName,
          SUM(CASE WHEN o.OrderDate BETWEEN '2024-11-01' AND '2024-11-30' THEN od.Quantity ELSE 0 END) AS KasimAdet,
          SUM(CASE WHEN o.OrderDate BETWEEN '2024-10-01' AND '2024-10-31' THEN od.Quantity ELSE 0 END) AS EkimAdet
      FROM Order_Details od
      JOIN Orders o ON od.OrderID = o.OrderID
      JOIN Products p ON od.ProductID = p.ProductID
      GROUP BY p.ProductName
  )
  SELECT TOP 10
      ProductName,
      KasimAdet,
      EkimAdet,
      CASE 
          WHEN EkimAdet > 0 
          THEN ((KasimAdet - EkimAdet) * 100.0 / EkimAdet) 
          ELSE NULL 
      END AS ArtisOrani
  FROM ProductSales
  WHERE KasimAdet > 0
  ORDER BY KasimAdet DESC;
