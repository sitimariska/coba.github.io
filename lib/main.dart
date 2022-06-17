import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1915026017_SITI MARISKA SARI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int angka = 0;
  TextEditingController controllerDepan = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  String namaDepan = "", namaAlamat = "";
  bool? nilaiCheckbox = false;
  List<String> nike = ["nike hitam", "nike putih", "nike merah", "nike gold"];
  List<String> ukuran = ["37 cm", "38 cm", "39 cm", "40 cm"];
  String nikeGroup = "";
  String ukuranGroup = "";

  @override
  void initState() {
    controllerAlamat.text = "";
    controllerDepan.text = "";
  }

  @override
  void dispose() {
    controllerAlamat.dispose();
    controllerDepan.dispose();
    super.dispose();
  }

  void hapusValue() {
    controllerDepan.text = "";
    controllerAlamat.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("1915026017_SITI MARISKA SARI"),
        ),
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Column(children: [
              TextField(
                controller: controllerDepan,
                decoration: InputDecoration(
                  hintText: "Masukkan nama",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controllerAlamat,
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "Masukkan alamat",
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Checkbox(
                value: nilaiCheckbox,
                onChanged: (value) {
                  setState(() {
                    nilaiCheckbox = value;
                  });
                },
              ),
              Text("Pilih Jenis : "),
              for (var item in nike)
                Row(
                  children: [
                    Radio(
                        value: item,
                        groupValue: nikeGroup,
                        onChanged: (newValue) {
                          setState(() {
                            nikeGroup = newValue.toString();
                          });
                        }),
                    Text(item),
                  ],
                ),
              Text("Pilih Ukuran : "),
              for (var item in ukuran)
                Row(
                  children: [
                    Radio(
                        value: item,
                        groupValue: ukuranGroup,
                        onChanged: (newValue) {
                          setState(() {
                            ukuranGroup = newValue.toString();
                          });
                        }),
                    Text(item),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    namaDepan = controllerDepan.text;
                    namaAlamat = controllerAlamat.text;
                    hapusValue();
                  });
                },
                child: Text(
                  "Order Sekarang",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
              ),
              Text("Nama : $namaDepan"),
              Text("Alamat : $namaAlamat"),
              Text("Hasil Checkbox : $nilaiCheckbox"),
              Text("Ukuran : $ukuranGroup"),
              Text("Orderan : $nikeGroup"),
            ]),
          ],
        ));
  }
}
