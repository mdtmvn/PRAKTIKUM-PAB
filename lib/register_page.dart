import 'package:flutter/material.dart';
import 'pin_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaController = TextEditingController();
  final nbiController = TextEditingController();
  final emailController = TextEditingController();
  final alamatController = TextEditingController();
  final instagramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 400,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),

              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Image.asset("images/gambar.jpg", width: 200, height: 200),

                  const SizedBox(height: 10),

                  const Text(
                    "WELCOME",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),

                  const Text(
                    "Praktikum PAB 2026",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 30),

                  buildTextField(
                    controller: namaController,
                    hint: "Masukan Nama",
                  ),

                  const SizedBox(height: 15),

                  buildTextField(
                    controller: nbiController,
                    hint: "Masukan NBI",
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 15),

                  buildTextField(
                    controller: emailController,
                    hint: "Masukan Email",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 15),

                  buildTextField(
                    controller: alamatController,
                    hint: "Masukan Alamat",
                  ),

                  const SizedBox(height: 15),

                  buildTextField(
                    controller: instagramController,
                    hint: "Masukan Akun Instagram",
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 60,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const PinPage()),
                        );
                      },

                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: Colors.grey.shade100,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
