import 'package:flutter/material.dart';
import 'package:pertemuan_11/models/wisata.dart';

class DetailScreen extends StatelessWidget {
  final Wisata wisata;
  const DetailScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              wisata.imageAsset,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                wisata.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 2.0, bottom: 16.0),
              child: Text(
                wisata.location,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Divider(color: Colors.grey),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: const Row(
                children: [
                  Icon(Icons.star_half, color: Colors.orange),
                  SizedBox(width: 8.0),
                  Text('4.5',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oxygen')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text('Open Everyday',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oxygen')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: const Row(
                children: [
                  Icon(Icons.monetization_on, color: Colors.green),
                  SizedBox(width: 8.0),
                  Text('Free',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oxygen')),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                wisata.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
