import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:web/src/desenvolvedores/controllers/desenvolvedores_controller.dart';
import 'package:web/src/desenvolvedores/view/desenvolvedores_page.dart';
import 'package:web/src/home/controller/home_controller.dart';
import 'package:web/src/niveis/controller/niveis_controller.dart';
import 'dart:html' as html if (kIsWeb) "";

import 'package:web/src/niveis/view/niveis_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final controllerNives = GetIt.I.get<NiveisController>();
  final controllerDesenv = GetIt.I.get<DesenvolvedoresController>();

    final controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
   controllerNives.getNiveis();
   controllerDesenv.getDesenvolvedores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Observer(
            builder: (context) {
              return TextButton(
              child: const Text("GAZIN - TECH", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
              onPressed: () {
                  controller.changeHomeBtn();
                  if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.easeInOut,
                        
                      );
                      html.window.history.pushState(null, '', '/');
                    }
                  },
              );
            },
          )
        ),
        actions: [
            Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Observer(
                  builder: (context) {
                    return ElevatedButton(
                
                    style: ElevatedButton.styleFrom(
                      elevation: 0.1,
                      backgroundColor: controller.btnNivelAcionado ? Colors.black26 : Colors.blueGrey,
                    ),
                    child: const Text('Níveis', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                    onPressed: () {
                          controller.changeNivelBtn();
                          if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 1),
                                curve: Curves.easeInOut,
                                
                              );
                              html.window.history.pushState(null, '', '/niveis');
                          }
                      }, 
                    );
                  },
                )
              ),
            


        Padding(
          padding: const EdgeInsets.only(right: 200),
          child: Observer(builder: (context) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.1,
                backgroundColor: controller.btnDesenvAcionado ? Colors.black26 : Colors.blueGrey,
              ),
              child: const Text('Desenvolvedores',  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
              onPressed: () {
              
              controller.changeDesenvBtn();
              if (_pageController.hasClients) {
          
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.easeInOut,
                );
                html.window.history.pushState(null, '', '/desenvolvedores');
                }
              }, 
            );
          },
        ),
      ),

        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          LayoutBuilder( 
            builder: (context, constraints) {
            return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.black87,
                child:  Column(
                  children:
                  const [
                     Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text("Teste FullStack Gazin-Tech", style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold,),),
                    )
                  ]
                ),
          );

          
          }),

          const NiveisPage(),
          const DesenvolvedoresPage()

        ],
      ),
    );
  }
}