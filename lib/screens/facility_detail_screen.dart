import 'package:flutter/material.dart';
import '../models/facility_model.dart';
import '../widgets/custom_gradient_button.dart';

class FacilityDetailScreen extends StatelessWidget {
  const FacilityDetailScreen({super.key});
  static const String routeName = '/facility-detail';

  @override
  Widget build(BuildContext context) {
    // Membaca object data parameter passing
    final facility = ModalRoute.of(context)!.settings.arguments as Facility;

    return Scaffold(
      appBar: AppBar(
        title: Text(facility.name),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              facility.imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(
                      facility.category,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    facility.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.location_on, color: Colors.blueAccent),
                    title: const Text('Lokasi'),
                    subtitle: Text(facility.location),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.access_time, color: Colors.blueAccent),
                    title: const Text('Jam Operasional'),
                    subtitle: Text(facility.operatingHours),
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    facility.description,
                    style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),
                  CustomGradientButton(
                    text: 'Petunjuk Lokasi',
                    icon: Icons.map,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Membuka rute ke ${facility.name}')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}