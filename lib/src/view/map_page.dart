import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:health_check/src/service/mapa_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapService mapService = MapService();
  List<MapCase> allCases = [];

  final LatLng _center = const LatLng(-21.5944, -48.8121);

  @override
  void initState() {
    super.initState();
    loadCases();
  }

  Future<void> loadCases() async {
    try {
      final cases = await mapService.fetchCases();
      /*print('Casos recebidos: ${cases.length}');
      for (var c in cases) {
        print('ID: ${c.id}, lat: ${c.latitude}, lng: ${c.longitude}');
      }*/
      setState(() {
        allCases = cases;
      });
    } catch (e) {
      print('Erro ao carregar casos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF63B3C3), // #63b3c3
                Color(0xFF1F5076), // #1f5076
              ],
            ),
          ),

          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/home');
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.background,
                size: 40,
              ),
            ),
            title: Center(
              child: Text(
                'MAPA DE CASOS',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(initialCenter: _center, initialZoom: 13),
        children: [
          // Camada de tiles do Geoapify
          TileLayer(
            urlTemplate:
                'https://maps.geoapify.com/v1/tile/dark-matter/{z}/{x}/{y}.png?apiKey=9ddf24376acc4b098bfe7c1515e311d5',
            userAgentPackageName: 'com.example.app',
          ),

          // Camada de marcadores dos casos
          MarkerLayer(
            markers:
                allCases.map((c) {
                  return Marker(
                    point: LatLng(c.latitude, c.longitude),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_on, color: Colors.red, size: 36),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
