import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ruang Baca Digital")),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Image.asset(
              "images/perpusanjay.jpg",
              width: 320,
              height: 180,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            tombol("Fiksi & Novel"),
            tombol("Teknologi & IT"),
            tombol("Sains & Matematika"),
            tombol("Sejarah Dunia"),
          ],
        ),
      ),
    );
  }

  Widget tombol(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),

      child: SizedBox(
        width: 250,

        child: ElevatedButton(onPressed: () {}, child: Text(text)),
      ),
    );
  }
}
