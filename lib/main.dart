import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: const Color(0xFF18233A),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF18233A),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      home: const MainPage(),
    );
  }
}

//////////////////////////////////////////////////////////
// MAIN PAGE + NAVBAR
//////////////////////////////////////////////////////////

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [HomePage(), BookPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF18233A),

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        currentIndex: selectedIndex,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Book"),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////
// HOME PAGE
//////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(title: const Text("Ruang Baca Digital")),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "images/perpusanjay.jpg",
                  width: 320,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 25),

              kategoriButton("Fiksi & Novel"),
              kategoriButton("Teknologi & IT"),
              kategoriButton("Sains & Matematika"),
              kategoriButton("Sejarah Dunia"),
            ],
          ),
        ),
      ),
    );
  }

  Widget kategoriButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: SizedBox(
        width: 260,
        height: 50,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF18233A),
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(text),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////
// BOOK PAGE
//////////////////////////////////////////////////////////

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(title: const Text("Detail Buku")),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 8,
            shadowColor: Colors.black26,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  Image.asset("images/coverbuku.jpeg", width: 180),

                  const SizedBox(height: 20),

                  const Text(
                    "Apa Arti Dari Semua Ini?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text("Adrian Wijaya", style: TextStyle(fontSize: 18)),

                  const SizedBox(height: 20),

                  const Text(
                    'Pernahkah Anda menghentikan rutinitas Anda sejenak, memandang ke luar jendela, dan bertanya dalam hati: "Untuk apa semua ini?"',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: const [
                      Chip(label: Text("1001 Halaman")),

                      Chip(label: Text("Indonesia")),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: 180,
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

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Buku berhasil dipinjam"),
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
  }
}

//////////////////////////////////////////////////////////
// PROFILE PAGE
//////////////////////////////////////////////////////////

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // HEADER ATAS
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

          infoTile(Icons.email_outlined, "mdtmvn@gmail.com"),

          infoTile(Icons.location_on_outlined, "Surabaya"),

          infoTile(Icons.person_outline, "@mdtmvn"),

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
