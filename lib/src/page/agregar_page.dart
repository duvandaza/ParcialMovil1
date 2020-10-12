import 'package:flutter/material.dart';

class AgregarPage extends StatefulWidget {

  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Agregar Nota'),
       ),
       body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.all(10.0),
           child: Form(
             key: formKey,
             child: Column(
               children: <Widget>[
                 SizedBox(height: 10.0,),
                 _crearNombre(),
                 Divider(),
                 SizedBox(height: 10.0,),
                 _crearMateria(),
                 SizedBox(height: 10.0,),
                 Divider(),
                 _corte('Primer Corte', '1', context ),
                  Divider(),
                 _corte('Segundo Corte', '2', context),
                  Divider(),
                 _corte('Tercer Corte', '3', context),
                 Divider(),
               ],
             ),
           ),
         ),
       ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'campo requerido',
        suffixIcon: Icon(Icons.accessibility, color: Colors.blue),
        icon: Icon(Icons.account_circle, color: Colors.blue) 
      ),
      validator: (value){
        if(value.length < 3 ){
          return 'Ingrese el nombre';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearMateria() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre de la materia',
        labelText: 'materia',
        helperText: 'campo requerido',
        suffixIcon: Icon(Icons.assignment, color: Colors.blue),
        icon: Icon(Icons.border_color, color: Colors.blue, ) 
      ),
      validator: (value){
        if(value.length < 3 ){
          return 'Ingrese el nombre de la materia';
        }else{
          return null;
        }
      },
    );
  }

  Widget _corte(String nombre, String corte, BuildContext context) {
    return ListTile(
      leading: Icon(Icons.note_add, color: Colors.blue, size: 35.0 ),
      title: Text(nombre),
      onTap: () => Navigator.pushNamed(context, 'nota', arguments: [nombre, corte],),
    );
  }

  
  
  
}