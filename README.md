# Bungalapak Mobile
Proyek Flutter untuk tugas mata kuliah Pemrograman Berbasis Platform Ganjil 2024/2025. Dibuat oleh Khansa Khairunisa - 2306153462.

### Daftar Isi

- [Tugas 7 - Elemen Dasar Flutter](#tugas-7)

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
- `MaterialApp` : 
- `Scaffold` : 
- `AppBar` : 
- `Padding` : 
- `Column` : 
- `Row` : 
- `SizedBox` : 
- `Text` : 
- `GridView.count` : 
- `Card` : 
- `Container` : 
- `Icon` : 
- `Material` : 
- `InkWell` : 
- `SnackBar` : 
- `TextStyle` : 

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Dalam Flutter, `setState()` digunakan untuk memperbarui atau memodifikasi nilai dari state dalam `StatefulWidget`. Fungsi ini memberi tahu FLutter bahwa data telah berubah dan UI perlu di-render ulang untuk menampilkan perubahan tersebut. Variabel yang terdampak oleh pemanggilan `setState()` adalah variabel state lokal yang nilainya diubah dalam blok `setState()`. Hal ini mencakup segala variabel yang terlibat langsung dalam pembentukan output UI, seperti nilai counter, status checkbox, atau string yang ditampilkan. Perubahan pada variabel-variabel ini memastikan bahwa UI terupdate sesuai dengan data terkini. 

### Jelaskan perbedaan antara `const` dengan `final`.
Dalam pemrograman `Dart`, `const` dan `final` digunakan untuk mendeklarasikan variabel yang nilainya tidak dapat diubah setelah diinisialisasi. Variabel `final` hanya dapat diinisialisasi sekali dan tidak harus diinisialisasi saat dideklarasi. Artinya, nilai dari variabel ini dapat ditentukan saat program sudah berjalan, yang berarti nilai ini dapat diambil dari hasil komputasi atau kondisi yang baru diketahui selama program dijalankan. Sedangkan, variabel `const` harus diinisialisasi dengan nilai konstan yang diketahui pada waktu kompilasi dan tidak dapat diubah setelahnya. Artinya, nilai harus sudah jelas dan tidak berubah sebelum kode dijalankan.