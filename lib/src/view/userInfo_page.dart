import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_check/src/widget/dialogs.dart';
bool viewPass = false;

TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController login = TextEditingController();

_clearFields() {
  user.clear();
  login.clear();
  pass.clear();
}

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
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
                Navigator.of(context).popAndPushNamed('/account');
              },
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.background,  size: 40),
            ),
            title: Center(
              child: Text('EDITAR INFORMAÇÕES', style: Theme.of(context).textTheme.titleLarge,),
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
              Container(
                width: largura * 1,
                height: altura * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFF63B3C3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: user,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(
                            CupertinoIcons.person_alt,
                            color: Color.fromARGB(255, 56, 113, 193),
                          ),
                          hintText: 'Usuário',
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: login,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 56, 113, 193),
                      ),
                      hintText: 'Login',
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            viewPass = !viewPass;
                          });
                        },
                        icon: Icon(
                          viewPass
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 56, 113, 193),
                      ),
                      hintText: 'Senha',
                    ),
                    obscureText: !viewPass,
                  ),
                ),
                SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: largura * 0.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(
                                255,
                                56,
                                113,
                                193,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () async {
                              Dialogs.information(
                                context,
                                'Dados salvos',
                                'Usuário: ${user.text}' +
                                    '\n' +
                                    'Login:${login.text}' +
                                    '\n' +
                                    'Senha:${pass.text}',
                              );
                              _clearFields();
                            },
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animate().fadeIn(
                  curve: Curves.easeOut,
                  duration: 800.ms,
                  delay: 100.ms,
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