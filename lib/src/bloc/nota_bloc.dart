import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:parcial1/src/bloc/validaciones_bloc.dart';

class NotaBloc with Validaciones{

  final _notaController = BehaviorSubject<String>();
  final _porcentajeController = BehaviorSubject<String>();

  Stream<String> get notaStream    => _notaController.stream.transform(validarNota);
  Stream<String> get porcentajeStream    => _porcentajeController.stream.transform(validarPromedio);

  Stream<bool> get formValidStream =>
        CombineLatestStream.combine2(notaStream, porcentajeStream, (e, p) => true);

  Function(String) get changeNota    => _notaController.sink.add;
  Function(String) get changePromedio => _porcentajeController.sink.add;

  String get email => _notaController.value;
  String get password => _porcentajeController.value;

  dispose(){
    _notaController?.close();
    _porcentajeController?.close();
  }

}