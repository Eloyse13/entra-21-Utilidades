/**
 * AUTENTICAÇÃO E CADASTRO USANDO FIEBASE
 */
class UsuarioModel{

  final String unid;
  final String nome;
  final String email;

  UsuarioModel({required this.unid, required this.nome, required this.email});

  Map>String, dynamic> toMap(){
    return{
      'unid': unid,
      'nome': nome,
      'email': email,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map){
    return UsuarioModel(
      unid: map['unid'], 
      nome: map['nome'],
      email: map['email'],
      );
  }
}