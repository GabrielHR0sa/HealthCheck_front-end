import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_check/src/model/sicknessList.dart';
import 'package:health_check/src/view/recomendation_page.dart';

List<Map<String, dynamic>> SickL = sicknessL;

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  List<Map<String, dynamic>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = SickL; // Começa com tudo
  }

  void _filterSearch(String query) {
    final results =
        SickL.where((item) {
          final name = item['dessic'].toString().toLowerCase();
          return name.contains(query.toLowerCase());
        }).toList();

    setState(() {
      filteredList = results;
    });
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
                'RECOMENDAÇÕES',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: largura,
                height: altura * 0.12,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF63B3C3), Color(0xFF1F5076)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 30,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: _filterSearch,
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: Theme.of(context).textTheme.headlineMedium,
                        hintText: 'Pesquisar doença...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: altura * 0.02),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: Card(
                      color: Color(0xFF1A9AB4),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(
                          Icons.sick,
                          color: Color.fromARGB(255, 56, 113, 193),
                          size: 30,
                        ),
                        title: Text(
                          item['dessic'],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => RecommendationsPage(
                                    codsic: item['codsic'],
                                  ),
                            ),
                          );
                        },
                      ),
                    ).animate().fadeIn(
                      curve: Curves.easeInOut,
                      duration: 1000.ms,
                    ),
                  );
                },
              ),
            ),
          ],
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
