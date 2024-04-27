import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Bantuan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.withOpacity(0.8), Colors.white],
            stops: [0.5, 0.9],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Panduan Penggunaan Aplikasi:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Setelah berhasil login, terdapat 5 menu utama yang dapat anda pilih. Daftar anggota merupakan sosok admin. Pada menu bil prima anda dapat mengecek nilai bilangan yang termasuk prima. Pada hitung segitiga anda dapat menghitung luas dan keliling. Terdapat juga list situs rekomendasi yang bisa anda tambahkan ke daftar favorit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Pada bottom navigation terdapat juga opsi untuk akses menu yang diinginkan.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Pada aplikasi stopwatch, Anda dapat memulai, menghentikan, dan mengatur waktu stopwatch.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '4.  Anda dapat juga menambahkan atau menghapus daftar/situs favorit sesuai keinginan anda.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
