import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/desenvolvedores/models/desenvolvedores_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'package:web/src/niveis/models/nivel_model.dart';

class ButtonUpdateDesenvolvedores extends StatefulWidget {
  final String title;
  final BoxConstraints constraints;
  final DesenvolvedoresModel desenvolvedoresModel;

  const ButtonUpdateDesenvolvedores(
      {super.key,
      required this.title,
      required this.constraints,
      required this.desenvolvedoresModel});

  @override
  State<ButtonUpdateDesenvolvedores> createState() =>
      _ButtonUpdateDesenvolvedoresState();
}

class _ButtonUpdateDesenvolvedoresState
    extends State<ButtonUpdateDesenvolvedores> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _form = GlobalKey();

    TextEditingController _textFieldController = TextEditingController();

    var nomeFieldController = TextEditingController();
    var idadeController = TextEditingController();
    var hobbyController = TextEditingController();
    var dataNascimentoController = TextEditingController();
    var sexoController = TextEditingController();
    var nivelController = TextEditingController();

    nomeFieldController.text = widget.desenvolvedoresModel.nome!;
    idadeController.text = widget.desenvolvedoresModel.idade.toString();
    hobbyController.text = widget.desenvolvedoresModel.hobby!;
    dataNascimentoController.text =
        widget.desenvolvedoresModel.dataNascimento!.substring(0, 10);
    sexoController.text = widget.desenvolvedoresModel.sexo!;
    nivelController.text = widget.desenvolvedoresModel.nivel!.nivel.toString();

    final controller = GetIt.I.get<DesenvolvedoresController>();
    final niveisController = GetIt.I.get<NiveisController>();

    var sexo = [
      'M',
      'F',
    ];
    List<NiveisModel> listNiveis = [];
    List<String> nameNiveis = [];

    String dropdownvalue = 'M';
    String dropdownIdNiveis = '';
    Future showSecond(BuildContext context) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Observer(
            builder: (context) => Text(controller.updateResponse),
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
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 30),
      child: Container(
        height: widget.constraints.maxHeight * 0.05,
        width: widget.constraints.maxWidth * 0.08,
        child: Observer(
          builder: (context) {
            return Column(
              children: [
                Text("Editar"),
                SizedBox(
                  height: widget.constraints.maxHeight * 0.02,
                  width: widget.constraints.maxWidth * 0.05,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        listNiveis = niveisController.niveis;
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
                            title: const Text("Editar Desenvolvedor"),
                            content: Form(
                                key: _form,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: nomeFieldController,
                                          decoration: const InputDecoration(
                                              labelText: 'Nome'),
                                          validator: (value) =>
                                              _validadeInput(value),
                                        ),
                                        SizedBox(
                                          width: widget.constraints.maxWidth *
                                              0.28,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: widget
                                                        .constraints.maxWidth *
                                                    0.08,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText: 'Idade'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
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
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: SizedBox(
                                                      height: 35,
                                                      width: 50,
                                                      child:
                                                          DropdownButtonFormField(
                                                        value: dropdownvalue,
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down),
                                                        items: sexo.map(
                                                            (String? items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items
                                                                .toString()),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String? newValue) {
                                                          setState(() {
                                                            dropdownvalue =
                                                                newValue!;
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
                                                    controller:
                                                        dataNascimentoController,
                                                    decoration:
                                                        const InputDecoration(
                                                            icon: Icon(Icons
                                                                .calendar_today),
                                                            labelText:
                                                                "Data Nascimento"),
                                                    readOnly: true,
                                                    onTap: () async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1900),
                                                              lastDate:
                                                                  DateTime(
                                                                      2101));

                                                      if (pickedDate != null) {
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(
                                                                    pickedDate);

                                                        setState(() {
                                                          dataNascimentoController
                                                                  .text =
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
                                          width: widget.constraints.maxWidth *
                                              0.30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: widget
                                                        .constraints.maxWidth *
                                                    0.1,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText: 'Hobby'),
                                                  controller: hobbyController,
                                                  validator: (value) =>
                                                      _validadeInput(value),
                                                ),
                                              ),
                                              Container(
                                                width: widget
                                                        .constraints.maxWidth *
                                                    0.15,
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      "Níveis",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: SizedBox(
                                                        height: 60,
                                                        width: 180,
                                                        child:
                                                            DropdownButtonFormField(
                                                          value:
                                                              dropdownIdNiveis,
                                                          icon: const Icon(Icons
                                                              .keyboard_arrow_down),
                                                          items: nameNiveis.map(
                                                              (String items) {
                                                            return DropdownMenuItem(
                                                              value: items,
                                                              child: Row(
                                                                children: [
                                                                  Text(items),
                                                                ],
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              dropdownIdNiveis =
                                                                  newValue!
                                                                      .toString();
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
                                  ),
                                )),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    child: const Text('Voltar'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: ElevatedButton(
                                      child: const Text('Salvar'),
                                      onPressed: () async {
                                        if (_form.currentState!.validate()) {
                                          _form.currentState!.save();

                                          widget.desenvolvedoresModel.nome =
                                              nomeFieldController.text;
                                          widget.desenvolvedoresModel.idade =
                                              int.parse(idadeController.text);
                                          widget.desenvolvedoresModel.hobby =
                                              hobbyController.text;
                                          widget.desenvolvedoresModel.sexo =
                                              dropdownvalue;
                                          widget.desenvolvedoresModel
                                                  .dataNascimento =
                                              dataNascimentoController.text;
                                          widget.desenvolvedoresModel.nivelId =
                                              await niveisController
                                                  .getNivelIdByName(
                                                      dropdownIdNiveis);

                                          controller.updateData(
                                              widget.desenvolvedoresModel);
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                          // ignore: use_build_context_synchronously
                                          showSecond(context);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _validadeInput(value) {
    if (value.isEmpty) {
      return 'Não é possível inserir texto em branco';
    }

    return null;
  }
}
