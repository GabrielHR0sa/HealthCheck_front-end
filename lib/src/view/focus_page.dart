import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_check/src/model/gravities.dart';
import 'package:health_check/src/model/sickness.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

List<Map<String, dynamic>> GraL = gravities;
List<Map<String, dynamic>> SicL = sickness;

TextEditingController selSic = TextEditingController();
TextEditingController selRua = TextEditingController();
TextEditingController selNum = TextEditingController();
TextEditingController selCom = TextEditingController();
TextEditingController selBai = TextEditingController();
TextEditingController selCid = TextEditingController();
TextEditingController selEst = TextEditingController();
TextEditingController selCep = TextEditingController();

_clearFields() {
  selSic.clear();
  selRua.clear();
  selNum.clear();
  selCom.clear();
  selBai.clear();
  selCid.clear();
  selEst.clear();
  selCep.clear();
}

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  final FocusNode _focusDate = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _clearFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    final ValueNotifier<String> _graNotifier = ValueNotifier<String>(
      GraL.first.toString(),
    );
    final ValueNotifier<String> _sicNotifier = ValueNotifier<String>(
      GraL.first.toString(),
    );
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
                'NOVO FOCO',
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
                    SizedBox(height: 20),
                    DropDownSic(notifierSic: _sicNotifier),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              controller: selRua,
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Rua',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16), // espaço entre os campos
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: selNum,
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Nº',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: selCom,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Complemento',
                        ),
                      ),
                    ),SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              controller: selCid,
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Cidade',
                              ),
                            ),
                          ),
                          const SizedBox(width: 16), // espaço entre os campos
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              controller: selEst,
                              decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Estado',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        controller: selCep,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Cep',
                        ),
                      ),
                    ),SizedBox(height: 20),
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

class DropDownSic extends StatefulWidget {
  final ValueNotifier<String> notifierSic; // Adicione um ValueNotifier
  const DropDownSic({super.key, required this.notifierSic});

  @override
  State<DropDownSic> createState() => _DropDownSicState();
}

class _DropDownSicState extends State<DropDownSic> {
  @override
  Widget build(BuildContext context) {
    final largura = MediaQuery.of(context).size.width;

    // Verifica se AtvL está vazio, caso contrário, exibe a mensagem padrão
    final List<Map<String, dynamic>> dropdownItems = SicL;

    return ValueListenableBuilder<String>(
      valueListenable: widget.notifierSic, // Use o ValueNotifier
      builder: (context, selectedSic, child) {
        return DropdownMenu<String>(
          width: largura * 0.82,
          initialSelection: SicL[0]['dessic'],
          onSelected: (String? value) {
            // Atualiza o ValueNotifier e o controller SelNiv com o valor de codniv
            Map<String, dynamic> selectedItem = dropdownItems.firstWhere(
              (item) => item['dessic'] == value,
            );
            widget.notifierSic.value =
                value!; // Atualiza o ValueNotifier com o valor exibido (desniv)
            selSic.text =
                selectedItem['codsic']
                    .toString(); // Atualiza o SelNiv com o valor de codniv
          },
          dropdownMenuEntries:
              dropdownItems.map<DropdownMenuEntry<String>>((
                Map<String, dynamic> item,
              ) {
                // Exibe 'desniv' no menu, mas o valor selecionado será 'codniv'
                String displayValue = item['dessic'] as String;
                return DropdownMenuEntry<String>(
                  value: displayValue,
                  label: displayValue,
                );
              }).toList(),
          menuHeight: 400,
          inputDecorationTheme: InputDecorationTheme(filled: true),
        );
      },
    );
  }
}
