import 'package:dio/dio.dart';

class MapService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.13:8080/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<MapCase>> fetchCases() async {
    try {
      final response = await dio.get('map/cases');
      List data = response.data;

      return data.map((json) => MapCase.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

class MapCase {
  final int id;
  final String disease;
  final String city;
  final double latitude;
  final double longitude;

  MapCase({
    required this.id,
    required this.disease,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  factory MapCase.fromJson(Map<String, dynamic> json) {
    return MapCase(
      id: json['id'],
      disease: json['disease'],
      city: json['city'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
