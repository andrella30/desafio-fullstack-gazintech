import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'package:web/src/niveis/models/nivel_model.dart';
import 'package:web/src/niveis/view/widgets/dialog_input_nivel_widget.dart';
import 'package:web/src/niveis/view/widgets/nivel_card_widget.dart';
import 'package:web/src/widgets/nodata_message_widget.dart';

class NiveisPage extends StatefulWidget {
  const NiveisPage({super.key});

  @override
  State<NiveisPage> createState() => _NiveisPageState();
}

class _NiveisPageState extends State<NiveisPage> {
  final controller = GetIt.I.get<NiveisController>();
  final NiveisModel niveisModel = NiveisModel();

  @override
  void initState() {
    controller.getNiveis();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(30),
        child: DialogInputNivel(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Observer(
            builder: (context) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.black87,
                child: controller.niveis.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                          child: NoDataMessage(
                            message: "Não existem níveis para serem mostrados!",
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.94,
                            child: Observer(
                              builder: (context) {
                                return ListView.builder(
                                  itemCount: controller.niveis.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: constraints.maxHeight * 0.05,
                                        left: constraints.maxWidth * 0.2,
                                        right: constraints.maxWidth * 0.2,
                                      ),
                                      child: NivelCardWidget(
                                        niveisModel: controller.niveis[index],
                                        constraints: constraints,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
