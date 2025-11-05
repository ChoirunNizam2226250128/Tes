import 'package:flutter/material.dart';
import 'package:pertemuan_11/data/wisata_data.dart';
import 'package:pertemuan_11/models/wisata.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wisata Indonesia',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 kolom
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          Wisata wisata = wisataList[index];
          return ItemCard(wisata: wisata);
        },
      ),
    );
  }
}
