import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utilidades/src/models/alunos_model.dart';

class AlunosController {
  final CollectionReference _collection = FirebaseFirestore.instance.collection('alunos');

  Future<void> adicionarAlunos(AlunosModel aluno){
    return _collection.add(aluno.toMap());
  }

  Future<void> atualizarAluno(AlunoModel aluno){
    return _.doc(aluno.id).update(aluno.toMap());
  }
}