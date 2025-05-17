import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_check/src/dio_client.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();

  List<dynamic> searchResults = [];

  Future<void> searchCases() async {
  try {
    final Map<String, dynamic> queryParams = {
      'city': cityController.text,
    };

    if (neighborhoodController.text.isNotEmpty) {
      queryParams['neighborhood'] = neighborhoodController.text;
    }
    if (diseaseController.text.isNotEmpty) {
      queryParams['disease'] = diseaseController.text;
    }

    final response = await DioClient.dio.get(
      '/cases/search',
      queryParameters: queryParams,
    );

    setState(() {
      searchResults = response.data['cases'] ?? []; // caso não venha 'cases'
    });
  } catch (e) {
    print('Erro ao buscar casos: $e');
    setState(() {
      searchResults = [];
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF63B3C3),
                Color(0xFF1F5076),
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
                'CONSULTAR CASOS',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        labelText: 'Cidade *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: neighborhoodController,
                      decoration: const InputDecoration(
                        labelText: 'Bairro',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: diseaseController,
                      decoration: const InputDecoration(
                        labelText: 'Doença',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: searchCases,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F5076),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Buscar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: altura * 0.5,
                child: searchResults.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.search_off,
                                size: 80, color: Colors.grey),
                            SizedBox(height: 10),
                            Text(
                              'Nenhum caso encontrado',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          final item = searchResults[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Text(item['disease']),
                              subtitle: Text(
                                  '${item['city']}, ${item['neighborhood']}'),
                              trailing: const Icon(Icons.chevron_right),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 90,
        height: 90,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF63B3C3), Color(0xFF1F5076)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
            icon: Icon(
              Icons.home,
              size: 40,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
