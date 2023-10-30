import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Manga = prefs
              .getStringList('ff_Manga')
              ?.map((x) {
                try {
                  return MangaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Manga;
    });
    _safeInit(() {
      _NomeUsuario = prefs.getString('ff_NomeUsuario') ?? _NomeUsuario;
    });
    _safeInit(() {
      _PerfilFoto = prefs.getString('ff_PerfilFoto') ?? _PerfilFoto;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<MangaStruct> _Manga = [];
  List<MangaStruct> get Manga => _Manga;
  set Manga(List<MangaStruct> _value) {
    _Manga = _value;
    prefs.setStringList('ff_Manga', _value.map((x) => x.serialize()).toList());
  }

  void addToManga(MangaStruct _value) {
    _Manga.add(_value);
    prefs.setStringList('ff_Manga', _Manga.map((x) => x.serialize()).toList());
  }

  void removeFromManga(MangaStruct _value) {
    _Manga.remove(_value);
    prefs.setStringList('ff_Manga', _Manga.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromManga(int _index) {
    _Manga.removeAt(_index);
    prefs.setStringList('ff_Manga', _Manga.map((x) => x.serialize()).toList());
  }

  void updateMangaAtIndex(
    int _index,
    MangaStruct Function(MangaStruct) updateFn,
  ) {
    _Manga[_index] = updateFn(_Manga[_index]);
    prefs.setStringList('ff_Manga', _Manga.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInManga(int _index, MangaStruct _value) {
    _Manga.insert(_index, _value);
    prefs.setStringList('ff_Manga', _Manga.map((x) => x.serialize()).toList());
  }

  String _NomeUsuario = '';
  String get NomeUsuario => _NomeUsuario;
  set NomeUsuario(String _value) {
    _NomeUsuario = _value;
    prefs.setString('ff_NomeUsuario', _value);
  }

  String _Teste = '';
  String get Teste => _Teste;
  set Teste(String _value) {
    _Teste = _value;
  }

  String _PerfilFoto = '';
  String get PerfilFoto => _PerfilFoto;
  set PerfilFoto(String _value) {
    _PerfilFoto = _value;
    prefs.setString('ff_PerfilFoto', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
