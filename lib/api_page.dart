import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  final TextEditingController searchController = TextEditingController();

  String query = "harry potter";

  Future<List<dynamic>> getBooks() async {
    final response = await http.get(
      Uri.parse("https://openlibrary.org/search.json?q=$query&limit=20"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["docs"];
    } else {
      throw Exception("Gagal mengambil data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0F7),

      appBar: AppBar(
        title: const Text("Open Library API"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F0F7),
      ),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),

                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,

                        decoration: InputDecoration(
                          hintText: "Cari buku...",

                          filled: true,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),

                      onPressed: () {
                        setState(() {
                          query = searchController.text.trim().isEmpty
                              ? "harry potter"
                              : searchController.text;
                        });
                      },

                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: getBooks(),

                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(child: Text("Gagal mengambil data"));
                    }

                    final books = snapshot.data ?? [];

                    if (books.isEmpty) {
                      return const Center(child: Text("Buku tidak ditemukan"));
                    }

                    return ListView.builder(
                      itemCount: books.length,

                      itemBuilder: (context, index) {
                        final book = books[index];

                        String title = book["title"] ?? "No Title";

                        String author = book["author_name"] != null
                            ? book["author_name"][0]
                            : "Unknown Author";

                        String year = book["first_publish_year"] != null
                            ? book["first_publish_year"].toString()
                            : "-";

                        int? coverId = book["cover_i"];

                        return Card(
                          elevation: 3,

                          margin: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 8,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),

                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),

                            leading: coverId != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),

                                    child: Image.network(
                                      "https://covers.openlibrary.org/b/id/$coverId-M.jpg",
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Icons.book, size: 50),

                            title: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            subtitle: Text("$author\nTahun: $year"),

                            isThreeLine: true,

                            trailing: const Icon(Icons.arrow_forward_ios),

                            onTap: () {
                              showDialog(
                                context: context,

                                builder: (_) => AlertDialog(
                                  title: Text(title),

                                  content: Text(
                                    "Penulis : $author\n\nTahun Terbit : $year",
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },

                                      child: const Text("Tutup"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
