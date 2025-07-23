import 'package:flutter/material.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView> {
  bool _loading = false;

  void _abrirCadastro(){
Navigator.push(
  context, 
  MaterialPageRoute(builder: (_) => const FirebaseLoginView())
  );
 }

 void _login() async{

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Login com firebase")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            key: _formKey,
            children: [
              if(_erro!, null)...{
                Text(_erro, style:  TextStyle(color: Colors.red)),
                SizedBox(height: 10)
              }
           TextFormField(
            decoration: InputDecoration(labelText: "E-mail"),
            validator: (value) =>
            value == null || value.isEmpty ? "Informe o e-mail" : null,
           ),
           TextFormField(
            decoration: InputDecoration(labelText: "Senha"),
            validator: (value) =>
            value == null || value.length < 6 ? "Senha inválida" : null,
           ),
           SizedBox(height: 20,),
           //botão ou loading
           _loading ? const CircularProgressIndicator() :
           ElevatedButton(onPressed: child: Text("Entrar")),
           TextButton(
            onPressed: _abrirCadastro,
            child: const Text("Não tem conta ? Cadastre-se")
            )
            ],
          ),
          )
        ),
    );  
  }
}