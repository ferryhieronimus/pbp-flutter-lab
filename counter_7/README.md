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