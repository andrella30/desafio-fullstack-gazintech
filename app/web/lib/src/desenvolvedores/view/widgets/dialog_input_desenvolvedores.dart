import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'package:web/src/niveis/models/nivel_model.dart';

class DialogInputDesenvolvedores extends StatefulWidget {
  const DialogInputDesenvolvedores({super.key});

  @override
  State<DialogInputDesenvolvedores> createState() =>
      _DialogInputDesenvolvedoresState();
}

class _DialogInputDesenvolvedoresState
    extends State<DialogInputDesenvolvedores> {
  final GlobalKey<FormState> _form = GlobalKey();
  final controller = GetIt.I.get<DesenvolvedoresController>();
  final niveisController = GetIt.I.get<NiveisController>();
  final DesenvolvedoresModel desenvolvedoresModel = DesenvolvedoresModel();

  var nomeController = TextEditingController();
  var idadeController = TextEditingController();
  var hobbyController = TextEditingController();
  var dataNascimentoController = TextEditingController();
  var sexoController = TextEditingController();
  var dataController = TextEditingController();
  var nivelController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  var sexo = [
    'M',
    'F',
  ];

  List<NiveisModel> listNiveis = [];
  List<String> nameNiveis = [];

  @override
  void initState() {
    niveisController.getNiveis();
    controller.getDesenvolvedores();
    super.initState();
  }

  String dropdownvalue = 'M';
  String dropdownIdNiveis = '';
  Future showSecond(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    controller.postResponse,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return LayoutBuilder(builder: (context, constraints) {
          return FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              listNiveis = niveisController.niveis;

              if (listNiveis.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Observer(
                      builder: (context) =>
                          Text("Necesário cadastrar um nível"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              } else {
                if (nameNiveis.isEmpty) {
                  for (var element in listNiveis) {
                    nameNiveis.add(element.nivel!);
                  }
                  dropdownIdNiveis = nameNiveis[0];
                }
                setState(() {});
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Cadastrar um novo Nível"),
                    content: Form(
                      key: _form,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          height: constraints.maxHeight * 0.4,
                          width: constraints.maxWidth * 0.3,
                          //color: Colors.red,
                          child: SingleChildScrollView(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'Nome'),
                                  controller: nomeController,
                                  validator: (value) => _validadeInput(value),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.28,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.08,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              labelText: 'Idade'),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          controller: idadeController,
                                          validator: (value) =>
                                              _validadeInput(value),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Sexo",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              height: 35,
                                              width: 50,
                                              child: DropdownButtonFormField(
                                                value: dropdownvalue,
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items:
                                                    sexo.map((String? items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child:
                                                        Text(items.toString()),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownvalue =
                                                        newValue! as String;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 40, left: 30),
                                        child: SizedBox(
                                          height: 100,
                                          width: 200,
                                          child: TextFormField(
                                            validator: (value) =>
                                                _validadeInput(value),
                                            controller: dateinput,
                                            decoration: const InputDecoration(
                                                icon:
                                                    Icon(Icons.calendar_today),
                                                labelText: "Data Nascimento"),
                                            readOnly: true,
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2101));

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(pickedDate);

                                                setState(() {
                                                  dateinput.text =
                                                      formattedDate;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.30,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: constraints.maxWidth * 0.1,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              labelText: 'Hobby'),
                                          controller: hobbyController,
                                          validator: (value) =>
                                              _validadeInput(value),
                                        ),
                                      ),
                                      Container(
                                        width: constraints.maxWidth * 0.15,
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Níveis",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SizedBox(
                                                height: 60,
                                                width: 180,
                                                child: DropdownButtonFormField(
                                                  value: dropdownIdNiveis,
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                  items: nameNiveis
                                                      .map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Row(
                                                        children: [
                                                          Text(items),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownIdNiveis =
                                                          newValue!.toString();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: const Text('Voltar'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Observer(
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: const Text('Salvar'),
                                  onPressed: () async {
                                    setState(() async {
                                      if (_form.currentState!.validate()) {
                                        desenvolvedoresModel.nome =
                                            nomeController.text;
                                        desenvolvedoresModel.idade =
                                            int.parse(idadeController.text);
                                        desenvolvedoresModel.hobby =
                                            hobbyController.text;
                                        desenvolvedoresModel.sexo =
                                            dropdownvalue;
                                        desenvolvedoresModel.dataNascimento =
                                            dateinput.text;
                                        desenvolvedoresModel.nivelId =
                                            await niveisController
                                                .getNivelIdByName(
                                                    dropdownIdNiveis);
                                        controller
                                            .postData(desenvolvedoresModel);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                        // ignore: use_build_context_synchronously
                                        showSecond(context);
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            },
            child: const Icon(Icons.add),
          );
        });
      },
    );
  }
}

_validadeInput(value) {
  if (value.isEmpty) {
    return 'Não é possível inserir texto em branco';
  }

  return null;
}
