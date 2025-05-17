import 'package:flutter/material.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({super.key});

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
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
              child: Text('COVID', style: TextStyle(color: Colors.white)),
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
                  'Utilizar máscara em ambientes fechados',
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
                  'Lavagem e higienização frequente das mãos',
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
                  'Evitar contato próximo com outras pessoas',
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
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/home');
          },
          backgroundColor: Color.fromARGB(255, 127, 181, 192),
          shape: const CircleBorder(), // garante que fique redondo
          child: const Icon(
            Icons.home,
            size: 40, // ícone maior
            color: Color(0xFF1A9AB4),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}