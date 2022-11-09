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
