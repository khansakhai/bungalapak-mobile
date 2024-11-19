# Bungalapak Mobile
Proyek Flutter untuk tugas mata kuliah Pemrograman Berbasis Platform Ganjil 2024/2025. Dibuat oleh Khansa Khairunisa - 2306153462.

### Daftar Isi

- [Tugas 7 - Elemen Dasar Flutter](#tugas-7)
- [Tugas 8 - Flutter Navigation, Layouts, Forms, and Input Elements](#tugas-8)

---

## Tugas 7
Pada tugas ini, akan dilakukan implementasi dari elemen-elemen dasar Flutter.

### Langkah Implementasi Checklist

<details>
<summary><b>Membuat sebuah program Flutter baru</b></summary>

1. Pertama, untuk membuat proyek Flutter baru, saya menjalankan perintah berikut pada terminal.
    ```
    flutter create bungalapak_mobile
    ```
2. Kemudian, saya membuat berkas baru bernama `menu.dart` pada direktori `bungalapak_mobile/lib` dan menambahkan baris berikut.
    ```dart
    import 'package:flutter/material.dart';
    ```
3. Pada berkas `main.dart` yang ada pada `bungalapak_mobile/lib`, saya memindahkan class berikut ke berkas menu.dart.
    ```dart
    class MyHomePage ... {
    ...
    }
    ```
    Selain itu, saya menghapus class berikut yang ada pada `main.dart`.
    ```dart
    class _MyHomePageState ... {
    ...
    }
    ```
    Selanjutnya, saya menambahkan baris berikut di bagian atas.
    ```dart
    import 'package:bungalapak_mobile/menu.dart';
    ```
4. Masih pada berkas yang saya, yaitu `main.dart`, saya membuat tema warna aplikasi menjadi pink dengan kode berikut.
    ```dart
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
    ).copyWith(secondary: Colors.pink[100]),
    ```
    Kemudian, saya juga mengubah potongan kode `const MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage(),`
5. Untuk mengubah sifat *widget* dari *stateful* menjadi *stateless*, saya memodifikasi berkas `menu.dart` dengan beberapa hal. Pertama, saya menghapus isi dari `class MyHomePage ...` hingga menjadi kosong. Kemudian, saya mengganti `... extends StatefulWidget` menjadi `... extends StatelessWidget` pada class `MyHomePage`. Saya menambahkan `MyHomePage({super.key});` sebagai constructor dari class `MyHomePage` dan juga menambahkan Widget build sehingga kode class `MyHomePage` pada `menu.dart` menjadi seperti berikut ini.
    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold();
        }
    }
    ```
    Dengan begitu, `MyHomePage` sudah saya ubah menjadi stateless widget.
6. Untuk membuat card yang berisi NPM, Nama, dan Kelas, saya mendeklarasikan tiga variabel bertipe string pada class `MyHomePage` di berkas `menu.dart`.
    ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({super.key});
        final String npm = '2306152462';
        final String name = 'Khansa Khairunisa';
        final String className = 'PBP C';
        ...
    }
    ```
7. Saya membuat class baru bernama `InfoCard` pada berkas `menu.dart` untuk membuat card yang akan menampilkan informasi tadi (NPM, Nama, dan Kelas) dan mengisi class tersebut dengan kode berikut.
    ```dart
    class InfoCard extends StatelessWidget {

        final String title; 
        final String content;

        const InfoCard({super.key, required this.title, required this.content});

        @override
        Widget build(BuildContext context) {
            return Card(
                elevation: 2.0,
                child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        children: [
                            Text(
                                title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            Text(content),
                        ],
                    ),
                ),
            );
        }
    }
    ```
</details>

<details>
<summary><b>Membuat tiga tombol sederhana dengan ikon dan teks</b></summary>

8. Pertama, saya membuat class baru bernama `ItemHomepage` pada berkas `menu.dart` dan mengisinya dengan atribut-atribut dari tombol yang ingin saya buat (name, icon, dan color).
    ```dart
    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;

        ItemHomepage(this.name, this.icon, this.color);
    }
    ```
9. Setelah itu, saya mendefinisikan setiap tombol yang saya buat. 
    ```dart
    class MyHomePage extends StatelessWidget {
        ...

        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart, Colors.yellow.shade400),
            ItemHomepage("Tambah Produk", Icons.add, Colors.green.shade400),
            ItemHomepage("Logout", Icons.logout, Colors.red.shade800),
        ];
        ...
    }
    ```
10. Kemudian, saya membuat class baru bernama `ItemCard` untuk menampilkan tombol-tombol yang sudah saya definisikan tadi. 
    ```dart
    class ItemCard extends StatelessWidget {
        final ItemHomepage item; 
        
        const ItemCard(this.item, {super.key}); 

        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                borderRadius: BorderRadius.circular(12),
                
                child: InkWell(
                    onTap: () {
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                            );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        item.icon,
                                        color: Colors.white,
                                        size: 30.0,
                                    ),
                                    const Padding(padding: EdgeInsets.all(3)),
                                    Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white),
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            );
        }
    }
    ```
11. Untuk mengintegrasikan InfoCard dan ItemCard agar dapat ditampilkan di MyHomePage, saya menambahkan kode berikut pada bagian `Widget build()` pada class `MyHomePage` di berkas `menu.dart`.
    ```dart
    class MyHomePage extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text(
                        'Bungalapak',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    InfoCard(title: 'NPM', content: npm),
                                    InfoCard(title: 'Name', content: name),
                                    InfoCard(title: 'Class', content: className),
                                ],
                            ),

                            const SizedBox(height: 16.0),

                            Center(
                                child: Column(

                                    children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 16.0),
                                            child: Text(
                                                'Welcome to Bungalapak',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                ),
                                            ),
                                        ),

                                        GridView.count(
                                            primary: true,
                                            padding: const EdgeInsets.all(20),
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            crossAxisCount: 3,
                                            shrinkWrap: true,
                                            children: items.map((ItemHomepage item) {
                                                return ItemCard(item);
                                            }).toList(),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            );
        }
    }
    ```
12. Selanjutnya saya menjalankan `flutter analyze` untuk mengecek fungsionalitas aplikasi dan `flutter run` untuk menjalankan aplikasi.
</details>

<details>
<summary><b>Mengimplementasikan warna-warna yang berbeda untuk setiap tombol</b></summary>

Untuk mengimplementasikan ini, di berkas `menu.dart`, saya menambahkan atribut `color` pada class `ItemHomepage`, menambakan color untuk setiap tombol, dan menggunakan item.color sebagai color yang akan digunakan untuk membuat tombol. Sehingga, setiap tombol nantinya akan menampilkan warna yang sesuai dengan warna yang mereka miliki. 

```dart
class MyHomePage extends StatelessWidget {
    ...
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart, Colors.yellow.shade400),
        ItemHomepage("Tambah Produk", Icons.add, Colors.green.shade400),
        ItemHomepage("Logout", Icons.logout, Colors.red.shade800),
    ];
    ...
}
...
class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color; // bagian ini

    ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
    ...
    @override
    Widget build(BuildContext context) {
        return Material(
            color: item.color, // bagian ini
            ...
        )
    }
}
```

</details>

<details>
<summary><b>Memunculkan Snackbar ketika tombol ditekan</b></summary>

Fungsionalitas ini didefinisikan pada widget `ItemCard` yang mendefinisikan setiap tombol pada aplikasi. Pada child dari `Material` yang di-return dari fungsi Widget, didefinisikan properti `onTap` yang akan memunculkan Snackbar ketika tombol ditekan. 

```dart
class ItemCard extends StatelessWidget {
    ...
    @override
    Widget build(BuildContext context) {
        return Material(
            ...
            child: InkWell(
                onTap: () {
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                        );
                },
                ...
            )
        )
    }
}
```

</details>

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Dalam Flutter, terdapat dua jenis widget utama, yaitu Stateless dan Stateful. Stateless widget merupakan widget yang bersifat statis, di mana widget ini tidak memerlukan pengelolaan state (keadaan), artinya, widget tidak berubah setelah dibuat. Contohnya, seperti icon dan text yang tidak berubah. Sedangkan, Stateful widget merupakan widget yang bersifat dinamis, di mana widget ini dapat mengubah state selama masa pakainya, artinya, widget ini dapat diperbarui kapan pun berdasarkan *user actions* atau ketika terjadi perubahan data. Contohnya, seperti checkbox yang memungkinkan pengguna untuk menandai atau menghilangkan tanda dari sebuah item. 

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya
- `MaterialApp` : Widget utama yang mewadahi widget lain pada aplikasi
- `Scaffold` : Widget yang menyediakan struktur dasar untuk layar aplikasi (seperti kerangka)
- `AppBar` : Widget yang mendefinisikan bar di bagian atas aplikasi
- `Padding` : Memberikan padding/ruang kosong di sekitar child widget untuk memberikan ruang antar elemen dalam UI
- `Column` : Mengatur child widget secara vertikal
- `Row` : Mengatur child widget secara horizontal
- `SizedBox` : Widget yang berupa box dan digunakan untuk memberikan ruang kosong
- `Text` : Widget yang menampilkan string teks di UI
- `GridView.count` : Widget untuk membuat grid dengan jumlah kolom yang tetap
- `ItemCard` : Widget untuk mendefinisikan setiap tombol
- `Container` : Widget untuk memodifikasi tampilan, seperti wanra, border, shadow, dll.
- `Icon` : Widget yang menampilkan ikon untuk memberikan petunjuk visual
- `Material` : Widget dasar yang mengimplementasikan efek visual
- `InkWell` : Widget yang merespons sentuhan pada Material widget
- `SnackBar` : Menampilkan pesan sementara di bagian bawah layar
- `TextStyle` : Widget untuk menetukan styling pada elemen teks (widget teks), seperti font, ukuran, dll.

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Dalam Flutter, `setState()` digunakan untuk memperbarui atau memodifikasi nilai dari state dalam `StatefulWidget`. Fungsi ini memberi tahu FLutter bahwa data telah berubah dan UI perlu di-render ulang untuk menampilkan perubahan tersebut. Variabel yang terdampak oleh pemanggilan `setState()` adalah variabel state lokal yang nilainya diubah dalam blok `setState()`. Hal ini mencakup segala variabel yang terlibat langsung dalam pembentukan output UI, seperti nilai counter, status checkbox, atau string yang ditampilkan. Perubahan pada variabel-variabel ini memastikan bahwa UI terupdate sesuai dengan data terkini. 

### Jelaskan perbedaan antara `const` dengan `final`.
Dalam pemrograman `Dart`, `const` dan `final` digunakan untuk mendeklarasikan variabel yang nilainya tidak dapat diubah setelah diinisialisasi. Variabel `final` hanya dapat diinisialisasi sekali dan tidak harus diinisialisasi saat dideklarasi. Artinya, nilai dari variabel ini dapat ditentukan saat program sudah berjalan, yang berarti nilai ini dapat diambil dari hasil komputasi atau kondisi yang baru diketahui selama program dijalankan. Sedangkan, variabel `const` harus diinisialisasi dengan nilai konstan yang diketahui pada waktu kompilasi dan tidak dapat diubah setelahnya. Artinya, nilai harus sudah jelas dan tidak berubah sebelum kode dijalankan.

## Tugas 8
Pada tugas ini, akan dilakukan implementasi dari Flutter navigation, layouts, forms, dan input elements

### Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Di Flutter, `const` digunakan untuk mendefinisikan nilai atau objek yang tidak akan berubah selama eksekusi aplikasi (statis), yang meningkatkan efisiensi aplikasi dengan mengurangi pembuatan objek yang serupa secara berulang pada setiap build, sehingga mempercepat Waktu rendering. `const` sangat berguna dalam definisi properti widget yang stateless, seperti konfigurasi UI yang tetap, atau nilai konstan lainnya yang diketahui saat kompilasi dan tidak berubah selama aplikasi berjalan. Namun, `const` sebaiknya tidak digunakan ketika nilai objek dapat berubah, seperti bergantung pada input atau hasil komputasi (dinamis) karena hal ini akan menghilangkan fleksibilitas yang dibutuhkan untuk mengubah nilai tersebut. 

### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Di Flutter, `Column` adalah widget layout yang mengatur child widget secara vertikal dari atas ke bawah (seperti form atau daftar), sedangkan `Row` mengatur child widget secara horizontal dari kiri ke kanan (seperti tombol pada navbar atau toolbar). Kedua widget ini mendukung properti seperti `mainAxisAlignment` (mengatur penjajaran sepanjang sumbu utama) dan `crossAxisAlignment` (untuk sumbu lintang).
- **Contoh implementasi `Column`**

    ```dart
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Text('Line 1'),
            Text('Line 2'),
            Text('Line 3'),
        ],
    )
    ```
- **Contoh implementasi `Row`**

    ```dart
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Icon(Icons.home),
            Icon(Icons.business),
            Icon(Icons.school),
        ],
    )
    ```

### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas kali ini, elemen input yang saya gunakan pada halaman form adalah sebagai berikut.
- `TextFormField` : untuk menerima input dari user. Pada tugas ini, mencakup name (field teks untuk meng-input  nama produk), price (field numerik untuk meng-input harga produk), dan description (field teks untuk meng-input deskripsi produk).
- `ElevatedButton` : untuk memproses input dari `TextFormField` dari user. Pada tugas ini, berupa tombol yang digunakan untuk menampilkan pop-up atau dialog box sebagai tanda sukses melakukan input pada form.

Namun, terdapat beberapa elemen input Flutter lain yang tidak saya gunakan pada tugas ini, yaitu:
- `DropdownButton` : untuk memilih dari sebuah daftar item yang disediakan.
- `Checkbox` : untuk membuat pilihan yang dapat dicentang (di-check).
- `Radio Button` : untuk memilih satu opsi dari beberapa pilihan.
- `Slider` : untuk memilih nilai dari range yang ditentukan dengan cara digeser
- `Date & Time Pickers` : untuk memilih tanggal atau waktu

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Dalam aplikasi Flutter saya, tema diatur secara global melalui `ThemeData` pada `MaterialApp`, memungkinkan pengaturan warna dan tipografi yang konsisten di seluruh aplikasi. Ya, saya mengimplementasikan tema pada aplikasi tema, di mana saya menggunakan `ColorScheme.fromSwatch()` dengan `primarySwatch: Colors.pink` dan `secondary: Colors.pink[100]`, serta `useMaterial3: true` untuk memanfaatkan fitur desain Material terbaru. Hal ini memastikan bahwa semua komponen UI memiliki tampilan yang seragam, mendukung konsistensi visual, dan memudahkan dalam mengelola perubahan tema nantinya. 

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Navigasi dalam aplikasi saya diatur menggunakan `Navigator` untuk berpindah antar halaman menggunakan `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()` melalui penggunaan `Drawer`, sehingga memudahkan user untuk mengakses setiap halaman pada aplikasi.
- `Navigator.push()` : digunakan untuk menambahkan halaman baru ke tumpukan navigasi
- `Navigator.pushReplacement()` : digunakan dari `LeftDrawer` untuk beralih ke halaman seperti `MyHomePage` atau `ItemFormPage` dengan menggantikan halaman saat ini dan tanpa menyimpannya di stack navigasi. 
- `Navigator.pop()` : digunakan untuk kembali ke halaman sebelumnya

## Tugas 9
Pada tugas ini, akan dilakukan implementasi dari integrasi layanan web Django dengan aplikasi Flutter.

### Langkah Implementasi Checklist

<details>
<summary><b>Memastikan deployment proyek tugas Django telah berjalan dengan baik</b></summary>
</details>

<details>
<summary><b>Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter</b></summary>
</details>

<details>
<summary><b>Membuat halaman login pada proyek tugas Flutter</b></summary>
</details>

<details>
<summary><b>Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter</b></summary>
</details>

<details>
<summary><b>Membuat model kustom sesuai dengan proyek aplikasi Django</b></summary>
</details>

<details>
<summary><b>Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah dideploy</b></summary>
</details>

<details>
<summary><b>Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.</b></summary>
</details>

<details>
<summary><b>Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login</b></summary>
</details>

### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.