// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_check/src/model/agent_login_dto.dart';
import 'package:health_check/src/model/agent_register_dto.dart';
import 'package:health_check/src/service/agent_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isExpanded = true;
bool viewPass = false;

TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();
TextEditingController login = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController email = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final service = AuthService();
  //final serviceU = UserService();

  @override
  void initState() {
    setState(() {
      isExpanded = true;
      viewPass = false;
    });
    super.initState();
  }

  limparCampos() {
    setState(() {
      user.clear();
      pass.clear();
      login.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    final agentService = AgentService();

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: altura * 1,
            width: largura * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 200, 249, 219), // #C8F9DB
                  Color.fromARGB(255, 154, 193, 251), // #9AC1FB
                ],
              ),
            ),

            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 350)
                    .animate()
                    .fadeIn(curve: Curves.easeInOut, duration: 700.ms)
                    .slide(
                      curve: Curves.easeInOut,
                      duration: 800.ms,
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                    ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Health',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 56, 113, 193),
                        ),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Check',
                        style: TextStyle(
                          fontSize: 28,
                          color: const Color.fromARGB(255, 54, 171, 156),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: largura * 1,
            height: isExpanded ? altura * 0.4 : altura * 0.6,
            decoration: BoxDecoration(
              color: Color(0xFF63B3C3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isExpanded
                    ? Container()
                    : Padding(
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
                isExpanded
                    ? Container()
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: city,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: Color.fromARGB(255, 56, 113, 193),
                          ),
                          hintText: 'Cidade',
                        ),
                      ),
                    ),
                isExpanded
                    ? Container()
                    : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 56, 113, 193),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                    ),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isExpanded
                        ? Row(
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
                                  try {
                                    final loginDTO = AgentLoginDTO(
                                      email: login.text.toUpperCase().trim(),
                                      password: pass.text.toUpperCase().trim(),
                                    );

                                    SharedPreferences _sharedPreferences =
                                        await SharedPreferences.getInstance();

                                    // Faz login via API
                                    final response = await agentService.login(
                                      loginDTO,
                                    );

                                    // Salva name e id do agente no SharedPreferences
                                    await _sharedPreferences.setString(
                                      'AGENT_NAME',
                                      response.name,
                                    );
                                    await _sharedPreferences.setInt(
                                      'AGENT_ID',
                                      response.id,
                                    );

                                    // Exibir sucesso
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Bem-vindo, ${response.name}!',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );

                                    Navigator.popAndPushNamed(context, '/home');
                                  } catch (e) {
                                    // Exibir erro
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.toString()),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },

                                child: const Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/config');
                              },
                              icon: Icon(
                                Icons.settings,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                        : Row(
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
                                  try {
                                    final registerDTO = AgentRegisterDTO(
                                      name: user.text.toUpperCase().trim(),
                                      login: login.text.toUpperCase().trim(),
                                      password: pass.text.toUpperCase().trim(),
                                      city: city.text.toUpperCase().trim(),
                                      email: email.text.toUpperCase().trim(),
                                    );
                            
                                    final response = await agentService.register(
                                      registerDTO,
                                    );
                            
                                    // Exibir sucesso
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Agente ${response.name} cadastrado com sucesso!',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                            
                                    user.clear();
                                    login.clear();
                                    pass.clear();
                                    city.clear();
                                    email.clear();
                                  } catch (e) {
                                    // Exibir erro
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(e.toString()),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                            
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/config');
                              },
                              icon: Icon(
                                Icons.settings,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isExpanded
                        ? Text(
                          'Não possui conta?',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                        : Text(
                          'Já possui conta?',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                    TextButton(
                      onPressed: () {
                        limparCampos();
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child:
                          isExpanded
                              ? const Text(
                                'Criar Conta',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 56, 113, 193),
                                  //decoration: TextDecoration.underline,
                                ),
                              )
                              : const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 56, 113, 193),
                                  //decoration: TextDecoration.underline,
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
    );
  }
}
