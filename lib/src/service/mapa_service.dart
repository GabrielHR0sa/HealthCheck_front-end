import 'package:dio/dio.dart';
import 'package:health_check/src/dio_client.dart';

class MapService {
  final Dio _dio = DioClient.dio;

  Future<List<MapCase>> fetchCases() async {
    try {
      final response = await _dio.get('map/cases');
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
