import 'package:flutter/material.dart';
import 'package:parcial1/src/bloc/nota_bloc.dart';
import 'package:parcial1/src/bloc/provider.dart';

class NotaPage extends StatefulWidget {
  @override
  _NotaPageState createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage> {

  final formKey = GlobalKey<FormState>();
  final estilotexto = new TextStyle(fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    
    double _corte1 = 0;
    double _conte2 = 0;
    double _corte3 = 0;
    double _notaFinal = 0;
    
    final List info = ModalRoute.of(context).settings.arguments;
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nota ' + info[0] ),
      ),
      body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.all(10.0),
           child: Form(
             key: formKey,
             child: Column(
               children: <Widget>[
                 SizedBox(height: 10.0,),
                 _quiz('Quiz', bloc, ),
                 Divider(),
                 SizedBox(height: 10.0,),
                 _talleres('Talleres', bloc),
                 Divider(),
                  SizedBox(height: 10.0,),
                 _parcialTeorico('Parcial Teorico', bloc),
                 Divider(),
                 SizedBox(height: 10.0,),
                 _parcialPractico('Parcial Practico', bloc),
                  SizedBox(height: 10.0,),
                  Divider(),
                  _crearBoton(bloc, context),
               ],
             ),
           ),
         ),
      ),
    );
  }

  Widget _quiz( String tipo, NotaBloc bloc) {
    return Column(
      children: <Widget>[
        Text('Quiz', style: estilotexto,),
        SizedBox(height: 10.0,),
        _calificacion(tipo, bloc),
        SizedBox(height: 15.0,),
        _porcentaje(tipo, bloc)
      ],
    ); 
  }

  Widget _talleres(String tipo, NotaBloc bloc) {
    return Column(
      children: <Widget>[
        Text('Talleres', style: estilotexto,),
        SizedBox(height: 10.0,),
        _calificacion(tipo, bloc),
        SizedBox(height: 15.0,),
        _porcentaje(tipo, bloc)
      ],
    ); 
  }

  Widget _parcialTeorico( String tipo, NotaBloc bloc) {
    return Column(
      children: <Widget>[
        Text('Parcial Teorico', style: estilotexto,),
        SizedBox(height: 10.0,),
        _calificacion(tipo, bloc),
        SizedBox(height: 15.0,),
        _porcentaje(tipo, bloc)
      ],
    ); 
  }

  Widget _parcialPractico( String tipo, NotaBloc bloc) {
    return Column(
      children: <Widget>[
        Text('Parcial Practico', style: estilotexto,),
        SizedBox(height: 10.0,),
        _calificacion(tipo, bloc),
        SizedBox(height: 15.0,),
        _porcentaje(tipo, bloc)
      ],
    ); 
  }

  Widget _calificacion(String tipo, NotaBloc bloc) { 
    
    return StreamBuilder(
      stream: bloc.notaStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextField(
          keyboardType: TextInputType.numberWithOptions(decimal:true),
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Nota del $tipo',
            labelText: 'Nota del $tipo',
            errorText: snapshot.error,
            suffixIcon: Icon(Icons.assignment, color: Colors.blue),
            icon: Icon(Icons.border_color, color: Colors.blue,) 
          ),
          onChanged: bloc.changeNota,
        );
      },
    );
    
  }
  
  Widget _porcentaje(String tipo, NotaBloc bloc) {

     return StreamBuilder(
      stream: bloc.porcentajeStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return TextFormField(
          keyboardType: TextInputType.numberWithOptions(decimal:true),
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Porcentaje',
            labelText: 'porcentaje de $tipo',
            errorText: snapshot.error,
            suffixIcon: Icon(Icons.assignment, color: Colors.blue),
            icon: Icon(Icons.border_color, color: Colors.blue,) 
          ),
          onChanged: bloc.changePromedio,
        );
      },
    );
  }

  Widget _crearBoton(NotaBloc bloc, BuildContext context ){
    
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical:15.0 ),
            child: Text('Guardar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: (){},
        );
      },
    );
    
  }

}