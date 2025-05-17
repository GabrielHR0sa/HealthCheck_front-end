import 'package:flutter/material.dart';

class GripePage extends StatefulWidget {
  const GripePage({super.key});

  @override
  State<GripePage> createState() => _GripePageState();
}

class _GripePageState extends State<GripePage> {
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
                Navigator.of(context).popAndPushNamed('/alert');
              },
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
            ),
            title: Center(
              child: Text('GRIPE', style: TextStyle(color: Colors.white)),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: altura * 0.15,
              width: largura * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF63B3C3),
              ),
              child: Center(
                child: Text(
                  'Usar lenços descartáveis para limpar o nariz',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: altura * 0.15,
              width: largura * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF63B3C3),
              ),
              child: Center(
                child: Text(
                  'Cobrir o nariz e a boca ao espirrar',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: altura * 0.15,
              width: largura * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF63B3C3),
              ),
              child: Center(
                child: Text(
                  'Evitar tocar os olhos e o nariz',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(height: altura * 0.15, width: largura * 0.8),
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
            icon:  Icon(
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