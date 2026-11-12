import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../widgets/custom_gradient_button.dart';

class EventDetailScreen extends StatelessWidget {
  
  static const String routeName = '/event-detail';

const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca object data parameter passing
    final event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              event.imageUrl,
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
                      event.category,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.calendar_today, color: Colors.indigo),
                    title: const Text('Tanggal pelaksanaan'),
                    subtitle: Text(event.date),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.place, color: Colors.indigo),
                    title: const Text('Tempat'),
                    subtitle: Text(event.location),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person, color: Colors.indigo),
                    title: const Text('Pembicara / Pemateri'),
                    subtitle: Text(event.speaker),
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Detail Kegiatan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
                  ),
                  const SizedBox(height: 32),
                  CustomGradientButton(
                    text: 'Daftar Kegiatan Ini',
                    icon: Icons.assignment_turned_in,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pendaftaran untuk ${event.title} berhasil!')),
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