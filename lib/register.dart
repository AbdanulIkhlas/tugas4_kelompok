import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas4_kelompok/login.dart';
import 'package:tugas4_kelompok/main.dart';
import 'package:tugas4_kelompok/model/login_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REGISTER MENU",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade400, Colors.teal.shade200],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DAFTAR AKUN',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Icon(Icons.lock_open, size: 100, color: Colors.white),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: userController,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () async {
                      String user = userController.text;
                      String pass = passController.text;
                      if (user.isNotEmpty && pass.isNotEmpty) {
                        // Buka loginBox
                        var box = Hive.box<LoginModel>(loginBox);
                        // await box.clear(); // hapus semua data di box
                        if (!box.containsKey(user)) {
                          // Tambahkan username and password to Hive
                          var newAkun = LoginModel(username: user, password: pass);
                          await box.put(user, newAkun);
                          // box.add(LoginModel(username: user, password: pass));

                          print("REGISTRATION SUCCESSFUL");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Success'),
                              content: Text('Registration Successful'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Tutup dialog
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          print("REGISTRATION FAILED");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('Username already exists!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                        print(box.keys);
                      } else {
                        print("REGISTRATION SUCCESSFUL");
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Pastikan username dan password tidak kosong !'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Register'),
                  ),
                  SizedBox(height: 20,),
                  Text("Sudah ada akun ?", style: TextStyle(color: Colors.black45),),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  }, child: Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*Step Hive Database
1. tambahkan di yaml
dependencies :
  hive_flutter: ^1.1.0
  hive: ^2.0.4
  path_provider: ^2.0.3
dev_dependencies:
  hive_generator: ^1.1.0
  build_runner: ^2.1.2

2. fungsi main dibuat async + buat variabel global String loginBox = 'loginBox', lalu tambahkan
  await Hive.initFlutter(); //inisialisasi

3. buat file model yang berisi object dari loginBox dan tambahkan
  part 'namafile.g.dart'; sebelum generate adapter

4. jalankan di terminal untuk generate adapter : dart run build_runner build
  jika berhasil muncul file baru .g.dart

5. tambahkan di main :
  Hive.registerAdapter<LoginModel>(namaAdapter());
  await Hive.openBox<LoginModel>(loginBox); //openbox bernama loginBox

6. setelah selesai set up Box , sekarang cara panggil Box di register
  var box = Hive.box<LoginModel>(loginBox); buka box
  // Tambahkan username and password to Hive dengan key user
  var newAkun = LoginModel(username: user, password: pass);
  await box.put(user, newAkun);

7. panggil Box di login
  for (var item in box.values) {
    if (item.username == user && item.password == pass) {


 */