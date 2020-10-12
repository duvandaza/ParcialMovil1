import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Notas registradas'),
     ),
     body: ListView(
       padding: EdgeInsets.all(10.0),
       children: <Widget>[
        _card(),
        SizedBox(height: 20.0,)
       ]
     ),
     floatingActionButton: _crearBoton(context),
    );
  }

  Widget _card() {
   return Card(
      elevation: 30.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assignment_ind, color: Colors.blue, size: 50.0, ),
            title: Text('Duvan Andres Daza'),
            subtitle: Text('Progamacion movil'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('eliminar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('editar'),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: ()=> Navigator.pushNamed(context, 'agregar'),
    );

  }
}