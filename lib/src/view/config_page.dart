import 'package:flutter/material.dart';
import 'package:health_check/src/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController _ipInputController = TextEditingController();

bool loadingIn = false;
bool loadingEx = false;
bool changeSt = false;
var newIP;
var saved = false;

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
    _ValidateIp();
    loadingIn = false;
    loadingEx = false;
  }

  saveIP() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('IP', _ipInputController.text);

  // Atualizar o DioClient em runtime
  DioClient.updateIp(_ipInputController.text);

  // Notificar que salvou
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('IP atualizado!'),
      backgroundColor: Colors.green,
    ),
  );
}


  _ValidateIp() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (_sharedPreferences.getString('IP') != null) {
      var label = await _sharedPreferences.getString('IP');
      _ipInputController.text = '$label';
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
                Color(0xFF63B3C3), // #63b3c3
                Color(0xFF1F5076), // #1f5076
              ],
            ),
          ),

          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.background,
                size: 40,
              ),
            ),
            title: Center(
              child: Text(
                'CONFIGURAÇÃO',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            actions: [Container(width: 50)],
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: largura * 1,
                  height: altura * 0.015,
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
                ),
              ),
              SizedBox(height: altura * 0.1),
            Center(
              child: Container(
                height: altura * 0.30,
                width: 700,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).textTheme.bodySmall!.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        height: 30,
                        child: Text(
                          'IP E PORTA',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '000.000.0.0/0000',
                          ),
                          controller: _ipInputController,
                        ),
                      ),
                      SizedBox(
                        height: altura * 0.05,
                        width: largura * 0.5,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                    255,
                                    56,
                                    113,
                                    193,
                                  ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            // ignore: unused_local_variable
                            SharedPreferences _sharedPreferences =
                                await SharedPreferences.getInstance();

                            saveIP();
                          },
                          child:  Text(
                            'Salvar',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
      
    ));
  }
}
