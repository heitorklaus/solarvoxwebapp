// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_eng_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsEngineeringModel on _ProjectsEngineeringModel, Store {
  final _$idAtom = Atom(name: '_ProjectsEngineeringModel.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$imagem_equipamentoAtom =
      Atom(name: '_ProjectsEngineeringModel.imagem_equipamento');

  @override
  String get imagem_equipamento {
    _$imagem_equipamentoAtom.reportRead();
    return super.imagem_equipamento;
  }

  @override
  set imagem_equipamento(String value) {
    _$imagem_equipamentoAtom.reportWrite(value, super.imagem_equipamento, () {
      super.imagem_equipamento = value;
    });
  }

  final _$nome_equipamento_geradorAtom =
      Atom(name: '_ProjectsEngineeringModel.nome_equipamento_gerador');

  @override
  String get nome_equipamento_gerador {
    _$nome_equipamento_geradorAtom.reportRead();
    return super.nome_equipamento_gerador;
  }

  @override
  set nome_equipamento_gerador(String value) {
    _$nome_equipamento_geradorAtom
        .reportWrite(value, super.nome_equipamento_gerador, () {
      super.nome_equipamento_gerador = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
imagem_equipamento: ${imagem_equipamento},
nome_equipamento_gerador: ${nome_equipamento_gerador}
    ''';
  }
}
