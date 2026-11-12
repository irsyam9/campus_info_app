import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/event_model.dart';
import '../models/facility_model.dart';

class CampusData {
  const CampusData({
    required this.facilities,
    required this.events,
  });

  final List<Facility> facilities;
  final List<Event> events;
}

class CampusService {
  static Future<CampusData> loadCampusData() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));

    final String response =
        await rootBundle.loadString('assets/campus_data.json');
    final Map<String, dynamic> data =
        json.decode(response) as Map<String, dynamic>;

    final List<dynamic> facilityList =
        (data['facilities'] as List<dynamic>?) ?? <dynamic>[];
    final List<Facility> facilities = facilityList
        .map((dynamic e) => Facility.fromJson(e as Map<String, dynamic>))
        .toList();

    final List<dynamic> eventList =
        (data['events'] as List<dynamic>?) ?? <dynamic>[];
    final List<Event> events = eventList
        .map((dynamic e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();

    return CampusData(facilities: facilities, events: events);
  }
}