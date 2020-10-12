import 'dart:async';

class Validaciones{

  final validarNota = StreamTransformer<String, String>.fromHandlers(

    handleData: ( nota, sink ){
      
      if(nota.isEmpty){
        return null;
      }else{
        double por = double.parse(nota);
        if(por <= 5 && por >= 0 ){
          sink.add(nota);
        }else{
          sink.addError('valor entre 0 a 5');
        }
      }
      
    }
  );

  final validarPromedio = StreamTransformer<String, String>.fromHandlers(

    handleData: ( promedio, sink ){
      
      if(promedio.isEmpty){
        return null;
      }else{
        double pro = double.parse(promedio);
        if(pro <= 100 && pro > 0 ){
          sink.add(promedio);
        }else{
          sink.addError('valor entre 0.1 a 100');
        }
      }
      
    }
  );
}