import 'package:flutter/material.dart';
import 'package:pertemuan_11/models/wisata.dart';
import 'package:pertemuan_11/data/wisata_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Wisata> _allWisata = wisataList;
  List<Wisata> _filteredWisata = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredWisata = _allWisata;
  }

  void _filterWisata(String query) {
    setState(() {
      _searchQuery = query;

      if (query.isEmpty) {
        _filteredWisata = _allWisata;
      } else {
        _filteredWisata = _allWisata.where((wisata) {
          final name = wisata.name.toLowerCase();
          final input = query.toLowerCase();
          return name.contains(input);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pencarian Wisata')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterWisata,
                decoration: const InputDecoration(
                  hintText: 'Cari wisata ...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredWisata.isEmpty && _searchQuery.isNotEmpty
                ? const Center(child: Text('Wisata tidak ditemukan.'))
                : ListView.builder(
                    itemCount: _filteredWisata.length,
                    itemBuilder: (context, index) {
                      final wisata = _filteredWisata[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  wisata.imageAsset,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    wisata.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(wisata.location),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
