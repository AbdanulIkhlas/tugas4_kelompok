import 'package:flutter/material.dart';

class PrimaPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PrimaPage> {
    final _controller = TextEditingController();
  String _prima = '';

  void _cekPrima() {
    double n;
    try {
      n = double.parse(_controller.text);
    } catch (e) {
      setState(() {
        _prima = 'Input tidak valid';
      });
      return;
    }

    if (n <= 0 || n.truncate() != n) {
      setState(() {
        _prima = 'Input harus bilangan bulat positif';
      });
      return;
    }

    if (n <= 1) {
      setState(() {
        _prima = '${n.toInt()} bukan bilangan prima';
      });
      return;
    }

    bool prima = true;
    for (int i = 2; i <= n / 2; i++) {
      if (n % i == 0) {
        prima = false;
        break;
      }
    }
    setState(() {
      _prima =
          '${n.toInt()} ${prima ? 'adalah bilangan prima' : 'bukan bilangan prima'}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Bilangan Prima",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.withOpacity(0.8), Colors.white],
          ),
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Masukkan bilangan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: _cekPrima,
                    child: Text('Cek Bilangan Prima'),
                  ),
                  SizedBox(height: 20),
                  Text(_prima),
                ],
              ),
            ),
          ),
      )
    );
  }
}
