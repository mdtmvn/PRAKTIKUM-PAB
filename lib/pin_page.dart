import 'package:flutter/material.dart';
import 'main_menu.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text(
                "Enter your PIN",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const Text(
                "Please enter your pin that you have created",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 40),

              const Icon(Icons.lock_outline, color: Colors.red, size: 80),

              const SizedBox(height: 40),

              SizedBox(
                width: 250,

                child: TextField(
                  controller: pinController,

                  obscureText: true,

                  textAlign: TextAlign.center,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: 120,
                height: 60,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  onPressed: () {
                    if (pinController.text == "1234") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainMenu()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("PIN Salah")),
                      );
                    }
                  },

                  child: const Icon(Icons.lock_open, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
