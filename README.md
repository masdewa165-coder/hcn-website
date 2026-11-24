# HCN Website Starter — v1.0

Starter frontend responsif untuk Halal Center Nusantara. Ini adalah prototipe website publik, belum merupakan sistem produksi dan belum terhubung ke database.

## Isi
- `index.html` — homepage dan struktur konten awal
- `styles.css` — desain responsif dengan identitas hijau-oranye HCN
- `app.js` — navigasi mobile, tahun otomatis, demo formulir WhatsApp
- `database/schema.sql` — rancangan awal database PostgreSQL/Supabase

## Menjalankan
Buka `index.html` di browser, atau jalankan server lokal:
`python -m http.server 8000`
lalu buka `http://localhost:8000`.

## Sebelum publikasi
1. Verifikasi nama, legalitas, hubungan kelembagaan, alamat, kontak, dan seluruh klaim layanan.
2. Tetapkan nomor WhatsApp resmi pada `app.js`.
3. Ganti ilustrasi abstrak CSS dengan logo master HCN yang disetujui.
4. Tambahkan halaman profil, berita, layanan, edukasi, kemitraan, dan kebijakan privasi.
5. Hubungkan formulir ke backend dan aktifkan validasi, proteksi spam, audit log, serta persetujuan privasi.
6. Konfigurasikan domain, DNS, HTTPS, backup, dan pemantauan.

## Arsitektur produksi yang disarankan
- Frontend: Next.js + TypeScript
- UI: Tailwind CSS
- Backend/database: Supabase (PostgreSQL, Auth, Storage) atau backend setara
- Hosting: Vercel atau infrastruktur setara
- CMS: role-based admin panel
- Integrasi: WhatsApp Business API (opsional), email transaksional

## Peran pengguna
- Super Admin: konfigurasi seluruh platform
- Admin Pusat: konten, permohonan, pengguna, laporan
- Admin Regional: data wilayah sesuai kewenangan
- Petugas: penanganan tugas yang ditugaskan
- Mitra: profil dan aktivitas kemitraan
- UMKM: profil usaha dan status permohonan
- Publik: akses informasi dan formulir

## Batas kewenangan
Platform HCN adalah sarana informasi dan administrasi. Proses pemeriksaan dan penerbitan sertifikat halal harus dilakukan oleh pihak yang memiliki kewenangan sesuai peraturan. Jangan menampilkan logo/label atau klaim akreditasi tanpa izin dan dasar yang sah.
