class AlunosModel {
  final String id;
  final String nome;
  final int idade;
  final String turma;

  AlunosModel({
    required this.id,
    required this.nome,
    required this.idade,
    required this.turma
  });

  Fuctory AlunosModel.fromFireStore(Map<String, dynamic> data, String documento) {
    return AlunosModel(
     id: documentId,
    nome: nome, 
    idade: idade, 
    turma: turma
    )
  }
}
