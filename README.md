# Kuis Praktikum Pemrograman Aplikasi Mobile - Aplikasi Pokemon

Aplikasi mobile berbasis Flutter untuk menampilkan katalog dan informasi Pokemon, dilengkapi dengan sistem otentikasi login dengan validasi NIM, navigasi BottomNavigationBar, daftar Pokemon dengan ListView, halaman profil interaktif pengganti avatar, dan halaman detail informasi atribut lengkap.

---

## 👤 Identitas Mahasiswa
- **Nama**: Fajar Sidiq Hariyanto
- **NIM**: 124240183
- **Program Studi**: Sistem Informasi
- **Plug**: SI-D
- **Mata Kuliah**: Praktikum Pemrograman Aplikasi Mobile

---

## 🔐 Ketentuan Kredensial Login
Sesuai dengan ketentuan soal kuis:
- **Username**: Bebas (nama pengguna / tidak boleh kosong, contoh: `alfin`)
- **Password**: `124240183` (NIM mahasiswa)

---

## 📱 Fitur & Ketentuan Kuis

### 1. Halaman Login [15 pts] (`lib/screens/login_screen.dart`)
- [x] Login menggunakan **Username** dan **Password** dengan ketentuan password adalah NIM (`124240183`).
- [x] Ketika login berhasil, menampilkan **SnackBar berwarna hijau** dengan pesan yang sesuai dan berpindah ke halaman utama.
- [x] Ketika login gagal, menampilkan **SnackBar berwarna merah** dengan pesan yang sesuai.

### 2. Halaman Beranda (Pokemon List) [30 pts] (`lib/screens/home_screen.dart`)
- [x] Menampilkan data Pokemon menggunakan **`ListView.builder()`**.
- [x] Data yang ditampilkan: **Gambar Pokemon**, **Nama**, dan **Types**.
- [x] Setiap item list data dapat diklik menuju **Halaman Detail Pokemon**.

### 3. Halaman Profil [25 pts] (`lib/screens/profile_screen.dart`)
- [x] Menampilkan foto profil default menggunakan link karakter *Victor*:
  `https://archives.bulbagarden.net/media/upload/1/1f/Sword_Shield_Victor.png`
- [x] Menampilkan **Username** yang sedang login saat ini.
- [x] Menampilkan kalimat sumpah kejujuran:
  > *"Saya bersumpah mengerjakan soal kuis ini dengan cara yang jujur dan tidak curang dengan cara apapun"*
- [x] 2 tombol bergambar (wrap dengan `GestureDetector`) untuk mengubah gambar profil:
  - Tombol Male Character (*Victor*)
  - Tombol Female Character (*Gloria*)
- [x] Tombol Logout dengan dialog konfirmasi untuk kembali ke halaman Login.

### 4. Halaman Detail Pokemon [25 pts] (`lib/screens/detail_screen.dart`)
- [x] Menampilkan semua data/atribut/property yang ada pada data dummy:
  - Gambar utama Pokemon
  - Nama Pokemon
  - Types Pokemon
  - ID Pokemon
  - Ability
  - Height
  - Weight
- [x] Tombol **"Kembali"** di bagian bawah dan tombol back AppBar untuk kembali ke Home.

### 5. Lain-lain [5 pts] (`lib/screens/main_navigation_screen.dart`)
- [x] Menggunakan **`BottomNavigationBar`** untuk navigasi antara tab **Home** dan **Profile**.
- [x] Desain dan skema warna oranye sesuai contoh tampilan soal.

---

## 📁 Struktur Folder Proyek

```
lib/
├── data/
│   └── pokemon_data.dart         # Data dummy list 20 Pokemon
├── models/
│   └── pokemon.dart              # Model data kelas Pokemon
├── screens/
│   ├── login_screen.dart         # Halaman Login & validasi NIM
│   ├── main_navigation_screen.dart # Navigasi BottomNavigationBar (Home & Profile)
│   ├── home_screen.dart          # Halaman Beranda (ListView daftar Pokemon)
│   ├── profile_screen.dart       # Halaman Profil, ganti avatar & logout
│   └── detail_screen.dart        # Halaman Detail atribut Pokemon & tombol Kembali
└── main.dart                     # Konfigurasi aplikasi & tema Material 3 Oranye
```
