// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'projects_eng_model.g.dart';

class ProjectsEngineeringModel extends _ProjectsEngineeringModel
    with _$ProjectsEngineeringModel {
  ProjectsEngineeringModel({
    required int id,
    required String imagem_equipamento,
    required String nome_equipamento_gerador,
  }) : super(
          id: id,
          imagem_equipamento: imagem_equipamento,
          nome_equipamento_gerador: nome_equipamento_gerador,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imagem_equipamento": imagem_equipamento,
      "nome_equipamento_gerador": nome_equipamento_gerador,
    };
  }

  factory ProjectsEngineeringModel.fromJson(Map json) {
    return ProjectsEngineeringModel(
      id: json['id'],
      imagem_equipamento: json['imagem_equipamento'],
      nome_equipamento_gerador: json['nome_equipamento_gerador'],
    );
  }
}

abstract class _ProjectsEngineeringModel with Store {
  @observable
  int id;
  @observable
  String imagem_equipamento;
  @observable
  String nome_equipamento_gerador;

  @observable
  _ProjectsEngineeringModel({
    required this.id,
    required this.imagem_equipamento,
    required this.nome_equipamento_gerador,
  });
}
