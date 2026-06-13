import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(title: const Text("Detail Buku")),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: constraints.maxWidth > 700
                    ? 600
                    : constraints.maxWidth * 0.9,

                margin: const EdgeInsets.all(20),

                child: Card(
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      children: [
                        Image.asset("images/coverbuku.jpeg", height: 250),

                        const SizedBox(height: 20),

                        const Text(
                          "Apa Arti Dari Semua Ini?",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "Adrian Wijaya",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Pernahkah Anda menghentikan rutinitas Anda sejenak, memandang ke luar jendela, dan bertanya dalam hati: "Untuk apa semua ini?"',
                          textAlign: TextAlign.center,

                          style: TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 25),

                        Wrap(
                          alignment: WrapAlignment.center,

                          spacing: 10,

                          children: const [
                            Chip(label: Text("1001 Halaman")),

                            Chip(label: Text("Indonesia")),
                          ],
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: 200,
                          height: 50,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF18233A),
                              foregroundColor: Colors.white,
                            ),

                            onPressed: () {
                              showDialog(
                                context: context,

                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Konfirmasi Pinjam"),

                                    content: const Text(
                                      "Apakah Anda yakin ingin meminjam buku ini?",
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Batal"),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Buku berhasil dipinjam",
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            child: const Text("Pinjam Buku"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
