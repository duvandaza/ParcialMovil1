import 'package:flutter/material.dart';
import 'package:parcial1/src/bloc/provider.dart';
import 'package:parcial1/src/page/agregar_page.dart';

import 'package:parcial1/src/page/home_page.dart';
import 'package:parcial1/src/page/nota_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home' : ( BuildContext context ) => HomePage(),
          'agregar' : ( BuildContext context ) => AgregarPage(),
          'nota' : ( BuildContext context  ) => NotaPage(),
        },
      ),
    );
  }
}