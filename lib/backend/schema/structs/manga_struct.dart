// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MangaStruct extends BaseStruct {
  MangaStruct({
    String? capa,
    String? nome,
    String? capitulo,
    String? link,
    bool? favorito,
  })  : _capa = capa,
        _nome = nome,
        _capitulo = capitulo,
        _link = link,
        _favorito = favorito;

  // "capa" field.
  String? _capa;
  String get capa => _capa ?? '';
  set capa(String? val) => _capa = val;
  bool hasCapa() => _capa != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "Capitulo" field.
  String? _capitulo;
  String get capitulo => _capitulo ?? '';
  set capitulo(String? val) => _capitulo = val;
  bool hasCapitulo() => _capitulo != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "favorito" field.
  bool? _favorito;
  bool get favorito => _favorito ?? false;
  set favorito(bool? val) => _favorito = val;
  bool hasFavorito() => _favorito != null;

  static MangaStruct fromMap(Map<String, dynamic> data) => MangaStruct(
        capa: data['capa'] as String?,
        nome: data['Nome'] as String?,
        capitulo: data['Capitulo'] as String?,
        link: data['link'] as String?,
        favorito: data['favorito'] as bool?,
      );

  static MangaStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MangaStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'capa': _capa,
        'Nome': _nome,
        'Capitulo': _capitulo,
        'link': _link,
        'favorito': _favorito,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'capa': serializeParam(
          _capa,
          ParamType.String,
        ),
        'Nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'Capitulo': serializeParam(
          _capitulo,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'favorito': serializeParam(
          _favorito,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MangaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MangaStruct(
        capa: deserializeParam(
          data['capa'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['Nome'],
          ParamType.String,
          false,
        ),
        capitulo: deserializeParam(
          data['Capitulo'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        favorito: deserializeParam(
          data['favorito'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MangaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MangaStruct &&
        capa == other.capa &&
        nome == other.nome &&
        capitulo == other.capitulo &&
        link == other.link &&
        favorito == other.favorito;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([capa, nome, capitulo, link, favorito]);
}

MangaStruct createMangaStruct({
  String? capa,
  String? nome,
  String? capitulo,
  String? link,
  bool? favorito,
}) =>
    MangaStruct(
      capa: capa,
      nome: nome,
      capitulo: capitulo,
      link: link,
      favorito: favorito,
    );
