import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/desenvolvedores/view/widgets/developers_card_widget.dart';
import 'package:web/src/desenvolvedores/view/widgets/dialog_input_desenvolvedores.dart';
import 'package:web/src/widgets/nodata_message_widget.dart';

class DesenvolvedoresPage extends StatefulWidget {
  const DesenvolvedoresPage({super.key});

  @override
  State<DesenvolvedoresPage> createState() => _DesenvolvedoresPageState();
}

class _DesenvolvedoresPageState extends State<DesenvolvedoresPage> {
  final controller = GetIt.I.get<DesenvolvedoresController>();
  @override
  void initState() {
    controller.getDesenvolvedores();
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
        child: DialogInputDesenvolvedores(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Observer(
            builder: (context) {
              return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: Colors.black87,
                  child: controller.desenvolvedores.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                            child: NoDataMessage(
                              message:
                                  "Não existem desenvolvedores para serem mostrados!",
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
                                    itemCount:
                                        controller.desenvolvedores.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                          top: constraints.maxHeight * 0.05,
                                          left: constraints.maxWidth * 0.2,
                                          right: constraints.maxWidth * 0.2,
                                        ),
                                        child: DevelopersCardWidget(
                                          constraints: constraints,
                                          developersModel:
                                              controller.desenvolvedores[index],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ));
            },
          );
        },
      ),
    );
  }
}
