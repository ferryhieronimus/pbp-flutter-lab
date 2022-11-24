<details>
    <summary>Tugas 7: Elemen Dasar Flutter
</summary>
<br>

# Tugas 7: Elemen Dasar Flutter

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

*Stateless widget* merupakan widget yang static. *Stateless widget* bersifat final, artinya tidak berubah dan memiliki tampilan tetap ketika ada interaksi dari user. 

*Statelful widget* merupakan widget yang dinamis. Sebuah *stateful widget* bisa berubah ketika ada interaksi dari user. Misalnya, sebuah *button* yang berubah textnya ketika ditekan. Checkbox, Radio, Slider, InkWell, Form, adalah beberapa contoh *stateful widget*.

[Sumber](https://docs.flutter.dev/development/ui/interactive)

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Column Widget : sebuah widget untuk menampilkan *children*-nya secara horizontal
- Row Widget : sebuah widget untuk menampilkan *children*-nya secara vertikal
- FloatingActionButton : sebuah button berbentuk lingkaran. Pada app ini ada dua FloatingActionButton, yaitu untuk increment dan decrement
- Visibility : sebuah widget yang memiliki kemampuan untuk menampilkan atau menyembunyikan *children*-nya
- Icon : sebuah widget yang menggambarkan suatu *icon*
- Text : sebuah widget untuk menampilkan teks
- Padding : sebuah widget untuk padding

##  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` digunakan untuk mengubah suatu tampilan pada UI. Ketika status dari *stateful widget* berubah, `setState()` akan me-*rebuild* *widget* tersebut dan *descendantnya*.  Jika ada perubahan variabel,tetapi tidak ada pemanggilan setState(), maka *framework* mungkin saja tidak akan me-*rebuild* *widget* tersebut dan tampilannya tidak berubah.

[Sumber](https://stackoverflow.com/questions/51283077/when-do-i-use-setstate-in-flutter)

##  Jelaskan perbedaan antara const dengan final.

Untuk `const`, nilai dari *value*-nya harus diketahui pada *compile-time*, sedangkan untuk `final`, nilai dari *value*-nya harus diketahui pada *run-time*. Nilai dari keduanya tidak dapat diubah setelah diinisiasi

[Sumber](https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart)

##  Jelaskan bagaimana cara kamu mengimplementasikan tugas kali ini.

1. Buat app flutter baru dengan menjalankan `flutter create counter_7`
2. Masuk ke direktori app baru tersebut. Fokus utamanya ada di `lib/main.dart`
3. Tambahkan variabel berikut pada class _MyHomePageState
    ```
    int _counter = 0;
    String _ganjilgenap = 'GENAP';
    MaterialColor _color = Colors.red;
    ```
4. Tambahkan beberapa fungsi baru sebagai berikut:
    1. fungsi untuk *decrement counter*
        ```
        void _decrementCounter() {
            setState(() {
            _counter--;
            if (_counter % 2 == 0) {
                _ganjilgenap = "GENAP";
                _color = Colors.red;
            } else {
                _ganjilgenap = "GANJIL";
                _color = Colors.blue;
            }
          });
        }
        ```
    2. fungsi untuk *increment counter*
        ```
        void _incrementCounter() {
            setState(() {
            _counter++;
            if (_counter % 2 == 0) {
                _ganjilgenap = "GENAP";
                _color = Colors.red;
            } else {
                _ganjilgenap = "GANJIL";
                _color = Colors.blue;
            }
          });
        }
        ```
5. Tambahkan teks untuk "GANJIL/GENAP" dan teks untuk menunjukkan counter
    ```
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Text(
            '$_ganjilgenap',
            style: TextStyle(
            color: _color,
            )
        ),
        Text(
        '$_counter',
        style: Theme.of(context).textTheme.headline4,
        ),
    ],
    ```
6. Tambahkan child baru pada floatingActionButton
    ```
    floatingActionButton: Padding(
    padding: EdgeInsets.only(left: 30),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Visibility(
            visible: _counter != 0,
            child: FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            ),
        ),
        FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
        ),
        ],
    ),
    )
    ```
</details>

<details>
<summary>Tugas 8: Flutter Form
</summary>
<br>

# Tugas 8: Flutter Form

## Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement`

`Navigator.push` digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.

`Navigator.pushReplacement` digunakan untuk menukar rute sekarang dengan rute yang ingin ditampilkan. Halaman baru akan menggantikan halaman sebelumnya.

[Sumber](https://belajarflutter.com/memahami-navigasi-routing-di-flutter/)

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Column Widget : sebuah widget untuk menampilkan *children*-nya secara horizontal
- Row Widget : sebuah widget untuk menampilkan *children*-nya secara vertikal
- Icon : sebuah widget yang menggambarkan suatu *icon*
- Text : sebuah widget untuk menampilkan teks
- Padding : sebuah widget untuk padding
- DropdownButton: sebuah widget untuk user memilih opsi dalam bentuk dropdown
- ListTile: sebuah widget untuk membentuk sebuah list dan terdapat juga widget widget didalamnya.

[Sumber](http://www.barajacoding.or.id/list-tile-in-flutter/)

##  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).

- onPressed: akan dieksekusi ketika user menekan objek tersebut
- onTap: akan dieksekusi ketika user menyentuh layar
- onDoubleTap: akan dieksekusi ketika user menyentuh layar dua kali dalam waktu yang singkat
- onLongPress: akan dieksekusi ketika user menekan layar dalam rentang waktu
- onChanged: akan dieksekusi ketika user mengubah *fields*

[Sumber1](https://api.flutter.dev/flutter/material/RawChip/onPressed.html) | [Sumber2](https://blog.logrocket.com/handling-gestures-flutter-gesturedetector/)

##   Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.   

Halaman dalam aplikasi flutter ibarat "stack". Halaman yang ditampilkan sekarang merupakan halaman yang berada pada top of stack. Jika ingin pindah ke halaman baru, flutter akan menambahkan halaman tersebut pada stack. Jika menekan tombol 'back', halaman yang paling atas akan di-pop. Namun, flutter bisa mem-pop halaman yang sekarang dan menambahkan halaman baru. 

##  Jelaskan bagaimana cara kamu mengimplementasikan tugas kali ini.

1. Buat app dart baru bernama `drawer.dart`. Isi dengan kode berikut. `drawer.dart` berfungsi sebagai hamburger menu. Untuk menggunakannya, tambahkan `drawer: const DrawerApp()` pada tiap app.
    ```
    class DrawerApp extends StatelessWidget {
    const DrawerApp({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(

        );
    }
    }
    ```
2. Tambahkan kode berikut pada `drawer.dart`
    ```
    return Drawer(
        ...
        child: Column(
                    children: [
                    // Menambahkan clickable menu
                    ListTile(
                        title: const Text('counter_7'),
                        onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage(title: 'counter_7')),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Tambah Budget'),
                        onTap: () {
                        // Route menu ke halaman tambah budget
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TambahBudgetPage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Data Budget'),
                        onTap: () {
                        // Route menu ke halaman data budget
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DataBudgetPage()),
                        );
                        },
                    ),
                    ],
                ),
            ...
        )
    ```
3. Buat file baru bernama `tambah_budget`. Isi dengan kode berikut:
    ```
    class TambahBudgetPage extends StatefulWidget {
    const TambahBudgetPage({super.key});

    @override
    State<TambahBudgetPage> createState() => _TambahBudgetPageState();
    }

    class _TambahBudgetPageState extends State<TambahBudgetPage> {
    final _formKey = GlobalKey<FormState>();
    String? _judul;
    String? jenisBudget;
    int? nominal;
    List<String> listJenisBudget = ['Pemasukan', 'Pengeluaran'];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Form Budget'),
        ),
        drawer: const DrawerApp(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                children: [
                    Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Judul",
                        labelText: "Judul",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                        setState(() {
                            _judul = value!;
                        });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Nominal",
                        labelText: "Nominal",
                        // Menambahkan circular border agar lebih rapih
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                        setState(() {
                            if (value != '') {
                            nominal = int.parse(value!);
                            }
                        });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                        setState(() {
                            if (value != '') {
                            nominal = int.parse(value!);
                            }
                        });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                        value: jenisBudget,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: listJenisBudget.map((String items) {
                            return DropdownMenuItem(
                            value: items,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(items),
                            ),
                            );
                        }).toList(),
                        onChanged: (String? newValue) {
                            setState(() {
                            jenisBudget = newValue!;
                            });
                        },
                        hint: Container(
                            width: 200, //and here
                            child: const Text(
                            "Pilih Jenis",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                            ),
                        ),
                        ),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(15.0),
                        ),
                        onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            ListBudget.listBudget.add(
                            Budget(judul: _judul!, nominal: nominal!, jenisBudget: jenisBudget!)
                            );
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const DataBudgetPage()),
                            );
                        }
                        },
                        child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
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
4. Buat file baru bernama `data_budget`. Isi dengan kode berikut:
    ```
    class DataBudgetPage extends StatefulWidget {
    const DataBudgetPage({super.key});

    @override
    State<DataBudgetPage> createState() => _DataBudgetState();
    }

    class _DataBudgetState extends State<DataBudgetPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Data Budget'),
        ),
        drawer: const DrawerApp(),
        body: Center(
            child: ListView.builder(
                itemCount: ListBudget.listBudget.length,
                itemBuilder: ((context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Material(
                        elevation: 3.0,
                        shadowColor: Colors.grey,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                            title: Text(ListBudget.listBudget[index].judul),
                            subtitle: Text(ListBudget.listBudget[index].nominal.toString()),
                            trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    Text(ListBudget.listBudget[index].jenisBudget),
                                ]),
                            ),
                        )),
                    ),
                );
                }),
            )),
        );
    }
    }
    ```
</details>

<details>
    <summary>Tugas 9: Integrasi Web Service pada Flutter
</summary>
<br>

# Tugas 9: Integrasi Web Service pada Flutter

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Serializing JSON bisa dilakukan dengan dua cara, yaitu secara inline dan dengan membuat class model. Berikut adalah contoh meng-serialize JSON dengan inline:
```
Map<String, dynamic> user = jsonDecode(jsonString);

print('Howdy, ${user['name']}!');
print('We sent the verification link to ${user['email']}.');
```
`jsonDecode()` mengembalikan Map<String, dynamic>. Dengan demikian, kita tidak mengetahui valuenya sampai runtime. Kita kehilangan fitur type-safety. Padahal type-safety merupakan fitur dari sebuah statically-typed language, seperti Dart. Kode kita akan menjadi lebih mudah error

[Sumber](https://docs.flutter.dev/cookbook/networking/fetch-data)

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

- Column Widget : sebuah widget untuk menampilkan *children*-nya secara horizontal
- Row Widget : sebuah widget untuk menampilkan *children*-nya secara vertikal
- Text : sebuah widget untuk menampilkan teks
- Padding : sebuah widget untuk padding
- Container: widget "wrapper" yang bisa menambahkan padding, margin, dan posisi
- FutureBuilder: widget yang membangun dirinya sendiri berdasarkan interaksi terkini dari Future
- ListView: widget yang dapat di-scroll
- GestureDetector: widget untuk mendeteksi gestur

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.

Pertama, kita tambahkan terlebih dahulu `package` http. `Package` ini berfungsi agar kita bisa fetch data ke internet. Setelah itu, kita membuat request kepada network. Fungsi dibawah ini meng-fetch data menggunakan method http.get().
```
Future<http.Response> namaMethod() {
  return http.get(Uri.parse('https://tugaspbpferry.herokuapp.com/mywatchlist/json/'));
}
```
Method diatas mengembalikan `Future` yang mengandung `response`. Setelah itu, kita buat class dari Objek yang diinginkan dari data JSON. Kemudian, kita convert `http.Response` menjadi objek.  Kita bisa meng-fetch data dengan memanggil fungsi fetch yang kita buat dan menyimpannya ke dalam suatu variabel. Hasil dari function tersebut berupa `Future`. Terakhir, kita tampilkan data dengan menggunakan `FutureBuilder`.

[Sumber](https://docs.flutter.dev/cookbook/networking/fetch-data)

##  Jelaskan bagaimana cara kamu mengimplementasikan tugas kali ini.

1. Buat folder (package) widget, page, model, dan function
2. Pindahkan drawer.dart ke widget, lalu `data_budget.dart` dan `tambah_budget.dart` ke page, dan `budget.dart` ke model
3. Buat file baru bernama `mywatchlist_page.dart`. File ini berfungsi untuk menampilkan list dari mywatchlist
4. Tambahkan kode berikut ke `mywatchlist_page.dart`:
    ```
    class _MyWatchListPage extends State<MyWatchListPage> {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            appBar: AppBar(
            title: const Text('My Watch List'),
            ),
            drawer: const DrawerApp(),
            body: FutureBuilder(
                future: fetchToDo(),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return Column(
                        children: const [
                        Text(
                            "Tidak ada watch list :(",
                            style: TextStyle(
                                fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index)=> Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                border: Border.all(
                                    color: snapshot.data![index].fields.watched ? Colors.green : Colors.red,
                                    width: 3
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0
                                )
                                ]
                            ),
                            child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchListDetailPage(
                                        title:
                                        snapshot.data![index].fields.title,
                                        watched:
                                        snapshot.data![index].fields.watched,
                                        rating:
                                        snapshot.data![index].fields.rating,
                                        releasedDate: snapshot.data![index].fields.releaseDate.toString(),
                                        review:
                                        snapshot.data![index].fields.review,
                                    ))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Container(
                                    child: Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                ),
                                const SizedBox(height: 10),
                                ],
                            ),
                            ),
                        )
                    );
                    }
                }
                }
            )
        );
    }
    }
    ```
5. Buat file baru bernama `mywatchlist_detail.dart`. File ini berfungsi untuk menampilkan detail dari movies
6. Tambahkan kode berikut ke `mywatchlist_detail.dart`
    ```
   class WatchListDetailPage extends StatelessWidget {
    final String title;
    final bool watched;
    final double rating;
    final String releasedDate;
    final String review;

    const WatchListDetailPage(
        {Key? key,
            required this.title,
            required this.watched,
            required this.rating,
            required this.releasedDate,
            required this.review})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text(
                'My Watch List',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
                ),
            ),
            ),
            drawer: const DrawerApp(),
            body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
                ),
                const SizedBox(
                    height: 32.0,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                    children: [
                        Text(
                        "Status: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(
                        watched ? "watched" : "not watched",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black),
                        ),
                    ],
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                    children: [
                        Text(
                            "Released Date: ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(
                        releasedDate,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black),
                        ),
                    ],
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                    children: [
                        Text(
                        "Rating: " ,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        Text(
                        rating.toString() + "/5",
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                        ),
                    ],
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                    "Review: " + review,
                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                ),
                const Spacer(),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                        Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                        );
                    },
                    child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                    ),
                    ),
                )
                ],
            ),
            )
        );
    }
    }
    ```
7. Masuk ke folder model. Buat file baru bernama `mywatchlist.dart`
8. Copy isi https://tugaspbpferry.herokuapp.com/mywatchlist/json/ dan masukkan ke https://app.quicktype.io/. Masukkan kodenya ke `mywatchlist.dart`.
</details>