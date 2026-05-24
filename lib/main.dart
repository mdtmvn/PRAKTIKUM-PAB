import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Container(
          width: 250,
          height: 550,

          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // TEXT ATAS
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "PRAKTIKUM PAB 2026",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 40),

              // NBI
              Text(
                "1462300121",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 20),

              // GAMBAR
              Image.asset(
                'images/sigma.jpeg',
                width: 150,
                height: 150,
              ),

              SizedBox(height: 20),

              // NAMA
              Text(
                "I Made Ahmad Bagus\nFirmansyah",
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50),

              // BUTTON
              ElevatedButton(
                onPressed: () {
                  print("Tombol ditekan");
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,

                  minimumSize: Size(140, 50),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                child: Text(
                  "Masuk",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}