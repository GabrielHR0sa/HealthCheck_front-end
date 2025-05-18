import 'package:flutter/material.dart';

// Importa a lista sicknessL de onde ela estiver
import 'package:health_check/src/model/sicknessList.dart';

class RecommendationsPage extends StatelessWidget {
  final int codsic;

  const RecommendationsPage({super.key, required this.codsic});

  @override
  Widget build(BuildContext context) {
    // Procura a doença pelo codsic
    final Map<String, dynamic> selectedDisease = sicknessL.firstWhere(
      (item) => item['codsic'] == codsic,
      orElse: () => <String, dynamic>{},
    );

    final List<String> recommendations = List<String>.from(
      selectedDisease['recomendacoes'] ?? [],
    );

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
                Navigator.of(context).popAndPushNamed('/advice');
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.background,
                size: 40,
              ),
            ),
            title: Center(
              child: Text(
                '${selectedDisease['dessic']}',
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
        child: Column(
          children: [
            Container(
              width: largura,
              height: altura * 0.015,
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
            ),
            SizedBox(height: altura * 0.05),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 12,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF63B3C3),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Color.fromARGB(255, 56, 113, 193),
                            size: 24,
                          ),
                          title: Text(
                            recommendations[index],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
