import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
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
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
            ),
            title: Center(
              child: Text(
                'ALERTAS',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: altura * 0.15,
                width: 500,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF63B3C3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/dengue');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.health_and_safety, size: 70),
                      Text(
                        'DENGUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: altura * 0.15,
                width: 500,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF63B3C3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/gripe');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.health_and_safety, size: 70),
                      Text(
                        'GRIPE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: altura * 0.15,
                width: 500,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xFF63B3C3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/covid');
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.health_and_safety, size: 70),
                      Text(
                        'COVID-19',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
