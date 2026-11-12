import 'package:flutter/material.dart';
import '../services/campus_service.dart';
import '../widgets/section_header.dart';
import '../widgets/info_card.dart';
import 'facility_detail_screen.dart';
import 'event_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CampusData> _campusDataFuture;

  @override
  void initState() {
    super.initState();
    _campusDataFuture = CampusService.loadCampusData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Civitas Campus Info'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<CampusData>(
        future: _campusDataFuture,
        builder: (context, snapshot) {
          // 1. Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Memuat data informasi kampus...'),
                ],
              ),
            );
          }

          // 2. Error State
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text('Gagal memuat data: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _campusDataFuture = CampusService.loadCampusData();
                      });
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          // 3. Success State
          if (snapshot.hasData) {
            final facilities = snapshot.data!.facilities;
            final events = snapshot.data!.events;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Sambutan
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang Civitas Kampus! 👋',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Temukan informasi fasilitas dan agenda kegiatan kampus secara terpadu.',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  // Section 1: Direktori Fasilitas Kampus
                  SectionHeader(
                    title: 'Fasilitas Kampus',
                    onSeeAllPressed: () {},
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      itemCount: facilities.length,
                      itemBuilder: (context, index) {
                        final facility = facilities[index];
                        return SizedBox(
                          width: 260,
                          child: InfoCard(
                            title: facility.name,
                            subtitle: facility.location,
                            category: facility.category,
                            imageUrl: facility.imageUrl,
                            onTap: () {
                              // Named Routes dengan Data Passing
                              Navigator.pushNamed(
                                context,
                                FacilityDetailScreen.routeName,
                                arguments: facility,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Section 2: Event & Agenda Kampus
                  SectionHeader(
                    title: 'Event & Agenda Mendatang',
                    onSeeAllPressed: () {},
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return InfoCard(
                        title: event.title,
                        subtitle: '${event.date} • ${event.location}',
                        category: event.category,
                        imageUrl: event.imageUrl,
                        onTap: () {
                          // Named Routes dengan Data Passing
                          Navigator.pushNamed(
                            context,
                            EventDetailScreen.routeName,
                            arguments: event,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          }

          return const Center(child: Text('Tidak ada data tersedia.'));
        },
      ),
    );
  }
}