import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _selected = false;
String userNAME = '';
String userID = '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

_readSelect() async {
  /*
  função para salvar o estado do icone que troca o tema
  toda vez que o aplicativo inicia, seu valor é igual ao 
  valor do tema em questão. Sem ele o botão inicia false sempre,
  mesmo seu tema sendo outro.
*/

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? message = await prefs.getBool('select');

  if (message == false) {
    _selected = false;
  } else if (message == true) {
    _selected = true;
  } else {
    _selected = false;
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _readSelect();
    _loadLoginUserInfo();
    super.initState();
  }

  Future<void> _loadLoginUserInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? agent_name = prefs.getString('AGENT_NAME');
  int? agent_id = prefs.getInt('AGENT_ID'); 

  setState(() {
    userNAME = agent_name ?? 'Visitante';
    userID = agent_id?.toString() ?? '1';
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
                Navigator.of(context).popAndPushNamed('/login');
              },
              icon: Icon(
                Icons.output_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 40,
              ),
            ),
            backgroundColor: Colors.transparent, // importante!
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selected = !_selected;
                      if (_selected == false) {
                        ThemeController.of(context).setTheme('light');
                        prefs.setBool('select', false);
                      } else {
                        ThemeController.of(context).setTheme('dark');
                        prefs.setBool('select', true);
                      }
                    });
                  },
                  child:
                      _selected
                          ? Icon(
                            CupertinoIcons.lightbulb_slash_fill,
                            color: Theme.of(context).colorScheme.background,
                            size: 35,
                          )
                          : Icon(
                            CupertinoIcons.lightbulb_fill,
                            color: Theme.of(context).colorScheme.background,
                            size: 35,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: largura * 1,
            height: altura * 0.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF63B3C3), // #63b3c3
                  Color(0xFF1F5076), // #1f5076
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),

            child: Center(
              child: Container(
                width: largura * 0.9,
                height: altura * 0.17,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF1A9AB4),
                      Color.fromARGB(255, 171, 184, 194),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Navigator.of(context).popAndPushNamed('/account');
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Theme.of(context).colorScheme.onBackground,
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF1A9AB4),
                          size: 85,
                        ),
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Bem Vindo!',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'AGENTE: ',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextSpan(
                            text: userNAME,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: altura * 0.12,
                      width: 500,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF63B3C3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/focus');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.location_on, size: 70),
                            Text(
                              'FOCOS',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    duration: 1500.ms,
                  ),
                  Center(
                    child: Container(
                      height: altura * 0.12,
                      width: 500,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF63B3C3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/search');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.manage_search_sharp, size: 70),
                            Text(
                              'CONSULTAR',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    duration: 1500.ms,
                  ),
                  Center(
                    child: Container(
                      height: altura * 0.12,
                      width: 500,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF63B3C3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/map');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.map_outlined, size: 70),
                            Text(
                              'MAPA',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    duration: 1500.ms,
                  ),
                  Center(
                    child: Container(
                      height: altura * 0.12,
                      width: 500,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF63B3C3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/advice');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit_note_sharp, size: 70),
                            Text(
                              'RECOMENDAÇÕES',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    duration: 1500.ms,
                  ),

                  Center(
                    child: Container(
                      height: altura * 0.12,
                      width: 500,
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF63B3C3),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/alert');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.warning_amber_rounded, size: 70),
                            Text(
                              'ALERTAS',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    curve: Curves.easeInOut,
                    duration: 1500.ms,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      /*floatingActionButton: SizedBox(
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
    );
  }
}

class ThemeController extends ChangeNotifier {
  static const themePrefKey = 'theme';

  ThemeController(this._prefs) {
    // carrega a preferência do tema na inicialização
    _currentTheme = _prefs.getString(themePrefKey) ?? 'light';
  }

  final SharedPreferences _prefs;
  late String _currentTheme;

  // pega o tema atual
  String get currentTheme => _currentTheme;

  void setTheme(String theme) {
    _currentTheme = theme;

    // avisa o app que o tema mudou
    notifyListeners();

    // salva o novo tema na memória
    _prefs.setString(themePrefKey, theme);
  }

  // pega o controle de tema de qualquer parte do código
  static ThemeController of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeControllerProvider>()
            as ThemeControllerProvider;
    return provider.controller;
  }
}

// provê o controle de tema de qualquer parte do código
class ThemeControllerProvider extends InheritedWidget {
  const ThemeControllerProvider({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeController controller;

  @override
  bool updateShouldNotify(ThemeControllerProvider old) =>
      controller != old.controller;
}
