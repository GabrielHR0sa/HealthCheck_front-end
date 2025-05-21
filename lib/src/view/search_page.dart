import 'package:flutter/material.dart';
import 'package:health_check/src/model/case_search_request_dto.dart';
import 'package:health_check/src/service/case_service.dart';

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
      final searchDTO = CaseSearchRequestDTO(
        city: cityController.text.toUpperCase().trim(),
        neighborhood:
            neighborhoodController.text.isNotEmpty
                ? neighborhoodController.text.toUpperCase().trim()
                : null,
        disease:
            diseaseController.text.isNotEmpty ? diseaseController.text.toUpperCase().trim() : null,
      );

      final response = await CaseService().searchCases(searchDTO);

      setState(() {
        searchResults = response.data['cases'] ?? [];
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
              colors: [Color(0xFF63B3C3), Color(0xFF1F5076)],
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
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: largura * 1,
                    height: altura * 0.4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF63B3C3), // #63b3c3
                          Color(0xFF1F5076), // #1f5076
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 5,
                            ),
                            child: TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: 'Cidade',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 5,
                            ),
                            child: TextFormField(
                              controller: neighborhoodController,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: 'Bairro',
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 5,
                            ),
                            child: TextFormField(
                              controller: diseaseController,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: 'Doença',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 5,
                            ),
                            child: SizedBox(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: altura * 0.5,
                  child:
                      searchResults.isEmpty
                          ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search_off,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Nenhum caso encontrado',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              final item = searchResults[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 5,
                                ),
                                child: Card(
                                  color: Color(0xFF1A9AB4),
                                  elevation: 4,

                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.sick,
                                      color: Color.fromARGB(255, 56, 113, 193),
                                      size: 30,
                                    ),
                                    title: Text(
                                      item['disease'],
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    subtitle: Text(
                                      '${item['city']}, ${item['neighborhood']}',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                ),
              ],
            ),
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
