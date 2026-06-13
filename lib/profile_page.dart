import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,

            children: [
              Container(
                height: 220,

                decoration: const BoxDecoration(
                  color: Color(0xFFE7EEF9),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                ),

                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 70),

                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -50,

                child: Container(
                  padding: const EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,

                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10),
                    ],
                  ),

                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/sigma.jpeg"),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),

          infoTile(Icons.school_outlined, "PAB 2026"),

          infoTile(Icons.badge_outlined, "1462300121"),

          infoTile(Icons.email_outlined, "1462300121@student.untagmania.ac.id"),

          infoTile(Icons.location_on_outlined, "Surabaya"),

          infoTile(Icons.person_outline, "@madebagus"),

          const Spacer(),

          Container(
            height: 120,

            decoration: const BoxDecoration(
              color: Color(0xFFE7EEF9),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(150),
                topRight: Radius.circular(150),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoTile(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),

      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),

      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),

          const SizedBox(width: 25),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
