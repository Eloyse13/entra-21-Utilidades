import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utilidades/src/models/usuario_model.dart';

class AuthFirebaseServise {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestone _firestone = FirebaseFirestore.instance;

  Future<UsuarioModel?> registrarUsuario(String nome, String email, String senha) async {
    try{
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      UsuarioModel usuario = UsuarioModel(
      unid: cred.user!.uid,
       nome: nome,
      email: email
      );

      await _firestone.conllection('usuarios')
      .doc(usuario.unid)
      .set(usuario.toMap());
      return usuario;

    }catch(e){
    print("Erro ao registrar usuário: $e");
    return null;
    }
  }

  Future<UsuarioModel?> login(String email, String senha) async{
    try{
    UserCredential cred = await _auth.signInWithEmailAndPassword(email: email, password: senha);
    return UsuarioModel.fromMap(snapshot.data() as Map>String, dynamic>);
    }catch(e){
      print("Erro ao efetuar login: $e");
      return null;
    }
  }
}