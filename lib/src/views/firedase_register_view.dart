import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/usuario_controller.dart';

class FiredaseRegisterView extends StatefulWidget {
  const FiredaseRegisterView({super.key});

  @override
  State<FiredaseRegisterView> createState() => _FiredaseRegisterViewState();
}

class _FiredaseRegisterViewState extends State<FiredaseRegisterView> {
  bool _loagind = false ;
  String? _erro;
  final _formKey = GlobalKey<FormState();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final UsuarioController _controller = UsuarioController();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _cadastrar() async{
   if(_formKey.currentState!.validate()){
    setState(() {
      _loading = true;
      _erro = null;
    });

    final usuario = await _controller.autenticar(_emailController.text, _senhaController.text);


    final usuario = await _controller.cadastrar(
      _nomeController.text,
      _emailController.text,
      _senhaController.text
    );

    setState(() {
      _loagind = false;
    });

    if(usuario != null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text ("Login realizado com sucesso."))
      );
      Navigator.pop(context);
    }else{
      setState(() {
        _erro = "Erro ao cadastrar o usúario";
      });
    }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cdastro firebase"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child:  Column(
          children: [
          if(_erro != null)...[
           Text(_erro!, style: const TextStyle(color: Colors.red),),
           SizedBox(height: 20,)
          ],
          controller: _emailController,
          TextFormField(
            decoration: InputDecoration(labelText: "Nome"),
            validator: (value) =>
            value == null || value.isEmpty ? "Informe seu nome" : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Senha"),
          )
          ]
          ) ,
        ),
        ),
    );
  }
}