import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utilidades/firebase_options.dart';
import 'package:utilidades/src/app/app_widget.dart';
import 'package:utilidades/src/views/counter_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
   runApp(AppWidget());

  /*
    riverpod - é um biblioteca de gerenciamento de estado desenvolvida por Remi Rousselet (criador do provider). ele foi criado para corrigir limitações do provider e oferecer uma abordagem mais robusca, segura e flexível.

    vantagens
    - seguro em tempo de compilação: detecta erros mais cedo
    - não depende de BuildContext
    - testável e modular
    - suporte nativo para providers assíncronos, como FutureProvider e StreamProvider

    ------------------------------

    BLoC - Business Logic Component
    é um padrão de arquitetura que separa a lógica de negócios da interface de usuário usando streams.
    Ele foi criado pelo Google para facilitar o reuso da lógica em vários widgets.

    vantagens
    - muito usado em apps corporativos
    - força uma aquitetura bem definida
    - baseado em streams (fluxo de dados)

    conceitos principais
    - event: entrada enviada pelo usuário
    - state: saída do bloco
    - bloc: recebe eventos e emite estados

    para usar precisamos instalar o pacote flutter_bloc

    bloc + cubit

  cubit é  uma versão mais simples e direta do bloc, sem eventos, você apenas chama métodos e emite estados diretamente
    
   */

  runApp(myApp());

}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_)  => CounterCubit(),
        child: CounterPage(),
        ),
    );
  }

}


