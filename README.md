# 🧩 Pipeline dan Anlysis Retail Data

Proyek ini menunjukkan implementasi pipeline ETL (Extract, Transform, Load) untuk membangun **data warehouse** dari data transaksi retail menggunakan Python dan SQL. Pipeline mengambil data dari tabel-tabel OLTP seperti `orders`, `order_items`, `products`, `customers`, dan lainnya, lalu mengubahnya menjadi skema dimensional (star schema) serta membuat dashboard dan melakukan analysis terhadap data.

## 📁 Struktur Proyek

- `etl.ipynb` — Notebook Jupyter yang berisi skrip ETL untuk:
  - Membuat tabel-tabel dimensi dan fakta (`dim_customers`, `dim_products`, `product_sales`, dll)
  - Melakukan transformasi data dengan perintah SQL
  - Memasukkan data hasil transformasi ke dalam data warehouse

## 🏗️ Skema Data Warehouse

Proyek ini membentuk skema data warehouse sebagai berikut:

**Tabel Fakta:**
- `product_sales`: Menyimpan data transaksi penjualan (jumlah, harga, diskon, tanggal, dll)

**Tabel Dimensi:**
- `dim_customers`: Informasi pelanggan
- `dim_products`: Informasi produk beserta kategorinya
- `dim_suppliers`: Informasi supplier
- `dim_login_attempts`: Data percobaan login pelanggan
- `orders`: Status dan informasi order (opsional)


## 🚀 Gambaran Umum Dashboard

Berikut adalah tampilan visual dari dashboard:
* Tableau public access -> ![Tableau Public](https://public.tableau.com/app/profile/adrian.saputra/viz/retailanalysis_17509125657330/Dashboard1?publish=yes) <br>
![Retail Dashboard Feb 2023](retail_dashboard.png?width=300)

---

## 🎯 Tujuan Dashboard

* Memberikan ringkasan cepat tentang metrik operasional utama (Supplier, Customer, Product, Transaction).
* Memvisualisasikan tren penjualan harian untuk mengidentifikasi pola dan anomali.
* Menampilkan distribusi kuantitas produk yang terjual berdasarkan kategori.
* Mengidentifikasi pelanggan dengan kontribusi penjualan tertinggi.

---

## 📈 Metrik & Insight Utama

### 1. **Ringkasan Metrik Top-Level**

* **Total Supplier:** 157
* **Total Customer:** 10,000
* **Total Product:** 234
* **Total Transaction:** 237

**Insight:**
* Rasio transaksi terhadap jumlah pelanggan sangat rendah (237 transaksi dari 10.000 pelanggan), menunjukkan potensi besar untuk meningkatkan penjualan

### 2. **Total Sales by Day**

Visualisasi tren penjualan harian menunjukkan fluktuasi yang signifikan dengan beberapa puncak (terutama sekitar hari ke-2, ke-13, dan ke-20) dan periode penjualan yang rendah.

**Insight:**
* Puncak penjualan yang jelas terlihat pada tanggal 13 Februari, menunjukkan adanya faktor pendorong penjualan pada hari tersebut (misalnya, promosi khusus, *event*, atau *payday*).
* Periode penjualan yang lesu juga terlihat jelas, mengindikasikan perlunya analisis lebih lanjut untuk memahami penyebabnya.

### 3. **Total Quantity by Category**

* **Top Category:** Food (10,746 unit)
* **Bottom Category (dari yang terlihat):** Otomotive (2,457 unit)

**Insight:**
* Kategori **Food** mendominasi volume penjualan secara signifikan, menunjukkan permintaan yang tinggi atau strategi bisnis yang berfokus pada kategori ini.

### 4. **Total Sales by Customer**

Menampilkan 10 pelanggan teratas berdasarkan nilai penjualan.

* **Pelanggan Teratas:** Cotton Salad Rustic (Rp 9,374,000)
* **Pelanggan Terendah di Top 10:** Granite Mouse Used (Rp 2,250,000)

**Insight:**
* Penjualan cenderung terkonsentrasi pada sejumlah kecil pelanggan *high-value*, seperti "Cotton Salad Rustic", yang berkontribusi besar terhadap total pendapatan. Ini menunjukkan pentingnya manajemen hubungan pelanggan (CRM) untuk segmen ini.

---

## 💡 Rekomendasi & Langkah Selanjutnya

Berdasarkan insight dari dashboard ini, berikut beberapa rekomendasi:
* Manfaatkan dominasi kategori "Food" dengan memperluas variasi produk atau menjalankan promosi khusus.
* Evaluasi kategori berkinerja rendah (misalnya, Otomotive, Furniture). Pertimbangkan apakah perlu penyesuaian inventaris, strategi harga, atau upaya pemasaran yang lebih intensif untuk kategori ini.
* Buat program loyalitas atau penghargaan khusus untuk pelanggan teratas (misalnya, "Cotton Salad Rustic") untuk mempertahankan pelanggan.

## 🛠️ Teknologi yang Digunakan


- Python 3.13
- PostgreSQL
- Library `psycopg2` untuk koneksi database
- Tableau

---

## 📝 Catatan

* Data dalam dashboard ini adalah untuk bulan Februari 2023.
* Analisis ini didasarkan pada data yang divisualisasikan; insight lebih lanjut mungkin dapat digali dengan akses ke data mentah dan analisis yang lebih mendalam.
