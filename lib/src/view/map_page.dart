import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_check/src/service/mapa_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};
  final MapService mapService = MapService();

  final LatLng _center = const LatLng(-21.5944, -48.8121); // Centro inicial (Itápolis?)

  @override
  void initState() {
    super.initState();
    loadCases();
  }

  Future<void> loadCases() async {
    try {
      final cases = await mapService.fetchCases();
      setState(() {
        for (var c in cases) {
          _markers.add(
            Marker(
              markerId: MarkerId(c.id.toString()),
              position: LatLng(c.latitude, c.longitude),
              infoWindow: InfoWindow(
                title: c.disease,
                snippet: c.city,
              ),
            ),
          );
        }
      });
    } catch (e) {
      print('Erro ao carregar casos: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casos no Mapa'),
        backgroundColor: const Color(0xFF1F5076),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
        markers: _markers,
      ),
    );
  }
}
