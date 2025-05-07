# E-Ticaret Veri Analizi Projesi | SQL & Power BI

![d1](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh1.jpg)

![d2](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh2.jpg)

![d3](https://raw.githubusercontent.com/bakiylc/E-Ticaret-Projesi/refs/heads/main/dsh3.jpg)


## 🚀 Genel Bakış
**E-Ticaret Veri Analizi Projesi’ne hoş geldiniz!**
Bu projede, bir E-Ticaret şirketine ait veri kümesini Power BI kullanarak analiz ediyor ve müşteri davranışları, satış kanalı karşılaştırmaları ve temel performans göstergeleri (KPI’lar) gibi alanlarda anlamlı içgörüler elde ediyoruz.

Bu analiz sayesinde, cinsiyet ve yaş gruplarına göre müşteri demografisi, en çok satın alınan ürünler, aylık ve yıllık sipariş sayıları ile siparişlerin geldiği platformların yüzdelik dağılımı gibi temel metrikler ortaya çıkarılıyor.

Nihai hedef; daha iyi iş planlaması, satış odaklı kararlar ve hedeflenmiş müşteri stratejileri için uygulanabilir içgörüler sunmaktır.



## 📊 Veri Kümesine Genel Bakış
Veri kümesi, müşteriler ve onların verdiği siparişlerle ilgili önemli bilgileri içermektedir. Ürün bilgileri, siparişin verildiği şehir ve sipariş tutarı gibi birçok alanı kapsamaktadır. İşte veri sütunlarının kısa bir özeti:

### Customers Tablosu Bilgileri
- **CustomerID**: Her müşteri için benzersiz kimlik numarası

- **CustomerName**: Müşterinin adı ve soyadı

- **City**: Müşterinin yaşadığı şehir

- **Country**: Müşterinin yaşadığı ülke

- **Gender**: Müşterinin cinsiyeti

- **Age**: Müşterinin yaşı

- **Age_Group**: Müşterilerin yaş gruplarına göre sınıflandırılması (ör. 25-30 yaş, 45-50 yaş)


### Orders Tablosu Bilgileri
- **OrderID**: Her sipariş için benzersiz kimlik numarası
- **CustomerID**: Siparişi veren müşterinin ID’si
- **OrderDate**: Siparişin verildiği tarih
- **Total Amount**: Siparişin toplam tutarı
- **OrderType**: Siparişin verildiği platform türü

### Order_Details Tablosu Bilgileri
- **OrderID**: Her sipariş için benzersiz kimlik numarası
- **ProductID**: Siparişi verilen ürünün kimlik numarası
- **Quantity**: Sipariş edilen ürün adedi
- **UnitPrice**: Ürünün birim fiyatı


### Products Tablosu Bilgileri
- **ProductID**: Her ürün için benzersiz kimlik numarası
- **ProductName**: Ürünün adı
- **Category**: Ürün kategorisi (ör. Giyim, Elektronik, Aksesuar)
- **UnitPrice**: Ürünün birim fiyatı




## 💡  Temel İçgörüler ve Raporlar

### 1. **Cinsiyete Göre Ortalama Ürün Satın Alma**
Bu rapor, müşterilerin cinsiyetine göre satın aldığı ürünleri segmentlere ayırarak cinsiyete göre sipariş dağılımı hakkında daha derinlemesine bilgi sağlar.

**2. Kategoriye Göre Sipariş Sayısı**
Bu görselleştirme, hangi kategorilerin daha çok sattığını anlamamıza yardımcı olur. Böylece kötü satış performansı gösteren ürünler belirlenip satış stratejileri geliştirilebilir.

**3. Müşteri Sadakat Sınıflandırması ve Toplam Gelir**
Bu rapor, müşteri sadakat sınıflarına göre toplam geliri gösterir. Sadık ve sadık olmayan müşteriler arasında gelir dağılımının belirlenmesi açısından kritik öneme sahiptir.

**4. Sipariş Sayısı ve Şehirler Arasındaki Korelasyon**
Bu analiz, müşterilerin yaşadığı şehir ile verdikleri sipariş sayısı arasında anlamlı bir ilişki olup olmadığını inceler. Şirketin bölgesel satış stratejileri açısından faydalı olur.

**5. Müşteri Yaş Dağılımı**
Hangi yaş grubundan kaç müşterimiz olduğunu gösterir. Bu sayede şirketin hedef müşteri profili belirlenebilir ve yeni ürün satışları ile kampanyalar stratejik olarak planlanabilir.



## ⚙️ **Kullanılan DAX Ölçümleri ve Fonksiyonlar**
Bu projede analizlerin büyük bir kısmı SQL kullanılarak yapılmıştır. Bazı hesaplamalar ise DAX ile gerçekleştirilmiştir.
SQL ile yapılan analizleri görmek için depo içerisindeki "Analiz.sql" dosyasını inceleyebilirsiniz.



## **🎯 Öne Çıkan Sonuçlar**
Bu proje, satış dağılımı, aylık satış trendleri ve bölgelere göre sipariş sayısı gibi kritik müşteri ve satış metriklerini ortaya koymaktadır.
Ürünler ve şehirlerle ilişkilendirilen gelir ve satış metrikleri sayesinde müşteri profilleri daha iyi anlaşılır.
Şirketin yüksek değerli müşterilere ve sık sipariş veren müşteri segmentlerine odaklanmasını sağlar.



## **🚀 Bu Proje Nasıl Kullanılır?**
Depoyu klonlayın veya indirin.
"E-Commerce Dashboard.pbix" dosyasını Power BI Desktop ile açın.
Bu projede oluşturulan çeşitli panoları ve raporları keşfedin.
Gerekirse analizi kişiselleştirin, yeni veriler ekleyin veya mevcut görselleştirmeleri ve DAX hesaplamalarını kendi ihtiyaçlarınıza göre düzenleyin.



