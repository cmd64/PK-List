# PK-List
Kullanılan dosya 08_06_2017.xlsx

İller için dbo.Provinces.Table.sql dosyasını çalıştırın.<br />
İlçeler için dbo.Districts.Table.sql dosyasını çalıştırın.

<a href="http://postakodu.ptt.gov.tr/Dosyalar/pk_list.zip" target="_blank">Güncel Posta Kodu Özet Tablosunu indirmek için tıklayınız.</a>

<h3>Güncel Excel'den MSSQL Sunucusuna Aktarma İşlemleri</h3>
<ol>
<li>Excel kitaplığını <b>tablo</b> formatına çevirin. <b>İlk satır başlık olarak kullanılsın</b> seçeneği seçili olsun.
</li><li><b>Microsoft SQL Server Management Studio</b>'dan veritabanı oluşturun ve oluşturduğunuz veritabanına sağ tıklayıp <b>Tasks > Import Data</b> tıklayın.
</li><li><b>Welcome to SQL Server Import and Export Wizard</b> penceresinde <b>Next</b> butonuna tıklayın.
</li><li><b>Choose a Data Source</b> penceresinde 
<ol>
<li><b>Data source: Microsoft Excel</b> seçin.
</li><li><b>Excel file path</b> bölümünde <b>Browse</b> butonuna tıklayarak dosyayı seçin.
</li><li><b>First row has column names</b> seçeneği seçili olsun.
</li><li><b>Next</b> butonuna tıklayın.</li>
</ol>
</li><li><b>Choose a Destination</b> penceresinde 
<ol>
<li><b>Destination SQL Server Native Client 11.0</b> seçin.
</li><li><b>Authentication</b> kısmından kullandığınız kimlik yönetimini seçin genellikle <b>Use Windows Authentication</b> kullanılır. </li><li><b>Database</b> bölümünden oluşturduğunuz veritabanını seçin (Listede gözükmüyorsa <b>Refresh</b> butonuna tıklayın). 
</li><li><b>Next</b> butonuna tıklayın.</li>
</ol>
</li><li><b>Specify Table Copy or Query</b> penceresinden <b>Copyy data from one or more tables or views</b> seçin <b>Next</b> tıklayın.
</li><li><b>Select Source Tables and Views</b> penceresinden <b>Edit Mappings...</b> butonuna tıklayın.
<ol>
<li><b>Column Mappings</b> penceresinden <b>Source</b> ve <b>Destination</b> bölümlerini doldurun. <b>Source</b> bölümü Excel tablo başlık adları <b>Destination</b> bölümü SQL tablosundaki kolon adlarıdır.
<table>
  <thead>
    <tr>
      <th>Source</th>
      <th>Destination</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>il</td>
      <td>il</td>
    </tr>
    <tr>
      <td>ilçe</td>
      <td>ilce</td>
    </tr>
    <tr>
      <td>semt_bucak_belde</td>
      <td>semt_bucak_belde</td>
    </tr>
    <tr>
      <td>Mahalle</td>
      <td>mahalle</td>
    </tr>
    <tr>
      <td>PK</td>
      <td>pk</td>
    </tr>
  </tboy>
</table>
</li>
</ol>
</li><li><b>Save and Run Package</b> penceresinden <b>Run immediately</b> seçeneğini seçin <b>Finish>></b> butonuna tıklayın.</li>
