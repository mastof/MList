import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Wellcome_page
  {
    'vqizucaj': {
      'pt': 'Bem-vindo!',
      'en': 'Welcome!',
    },
    'd8qzylpm': {
      'pt': 'Como deseja ser chamado?',
      'en': 'What do you want to be called?',
    },
    'dzbgw13b': {
      'pt': 'Continuar',
      'en': 'Continue',
    },
    'dn4e4h2m': {
      'pt': 'Favoritos',
      'en': 'Favorites',
    },
    'diy719ez': {
      'pt': 'Recentes',
      'en': 'Recent',
    },
    '8xxuuwq2': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Settings
  {
    'xvvwxxja': {
      'pt': 'Switch to Dark Mode',
      'en': 'Switch to Dark Mode',
    },
    'ev03g6eo': {
      'pt': 'Trocar tema ',
      'en': 'Change theme',
    },
    's84tmoxv': {
      'pt': 'Configurações da COnta',
      'en': 'Account configurations',
    },
    'bznlznaw': {
      'pt': 'Alterar Foto',
      'en': 'Change Photo',
    },
    'srscuya5': {
      'pt': 'Alterar nome',
      'en': 'Change name',
    },
    '8jt21f3y': {
      'pt': 'Aplicativo desenvolvido por\nMastof\n\n\nV. 1.0',
      'en': 'Application developed by\nMastof\n\n\nV.1.0',
    },
    'hxcq1z42': {
      'pt': '__',
      'en': '__',
    },
  },
  // manga
  {
    'q2d3pubw': {
      'pt': 'Todos',
      'en': 'All',
    },
    'iltim9so': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // MangaFocus
  {
    '5y3p4t4d': {
      'pt': 'Editar',
      'en': 'To edit',
    },
    'tfhvhn77': {
      'pt': 'Compartilhe esse mangá!',
      'en': 'Share this manga!',
    },
    'rrjpjdao': {
      'pt': 'Apagar',
      'en': 'To switch off',
    },
    'pmbaali2': {
      'pt': 'Capitulo: ',
      'en': 'Chapter:',
    },
    'ltj2rqq0': {
      'pt': 'Ler',
      'en': 'To read',
    },
    'rj0d5ur8': {
      'pt': 'Description',
      'en': 'Description',
    },
    '5jsqmsne': {
      'pt':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'en':
          'Not only will beauty save the world more seriously. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    '81mzk4mb': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Perfil
  {
    '9g8nr9pv': {
      'pt': 'Olá,',
      'en': 'Hello,',
    },
  },
  // Editname
  {
    'n6fanvi4': {
      'pt': 'Digite seu novo Nick',
      'en': 'Enter your new nickname',
    },
  },
  // LinkImagePerfil
  {
    '25v60hc5': {
      'pt': 'Digite o Link da imagem',
      'en': 'Enter image link',
    },
  },
  // Search
  {
    'spiww4r8': {
      'pt': 'Search...',
      'en': 'Search...',
    },
  },
  // Edit
  {
    'bf46j8zf': {
      'pt': 'Editar',
      'en': 'To edit',
    },
    '4s3sq5vz': {
      'pt': 'Edite as informações desejadas abaixo',
      'en': 'Edit the desired information below',
    },
    'nu9i2i36': {
      'pt': 'Adicione o Link da nova capa',
      'en': 'Add the new cover link',
    },
    'whfc665v': {
      'pt': 'Favorito',
      'en': 'Favorite',
    },
    'rhrzisbc': {
      'pt': 'Concluir',
      'en': 'Conclude',
    },
  },
  // Criar
  {
    'iusuh2b9': {
      'pt': 'Criar',
      'en': 'To create',
    },
    'x8k5aob2': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'jms01bqw': {
      'pt': 'Capitulo',
      'en': 'Chapter',
    },
    'rqwohbs4': {
      'pt': 'Link Manga',
      'en': 'Manga Link',
    },
    'qujgwnx0': {
      'pt': 'Adicione o Link da nova capa',
      'en': 'Add the new cover link',
    },
    '3p7lveca': {
      'pt': 'Favorito',
      'en': 'Favorite',
    },
    '837fq3za': {
      'pt': 'Concluir',
      'en': 'Conclude',
    },
  },
  // EmptyList
  {
    'uco41y08': {
      'pt': 'Você não tem nenhum mangá',
      'en': 'You don\'t have any manga',
    },
    'wfpwf0iq': {
      'pt':
          'Que tal adicionar um agora mesmo? É super simples! basta clicar no botão abaixo!',
      'en':
          'How about adding one right now? It\'s super simple! just click the button below!',
    },
    '3swd1ywl': {
      'pt': 'Criar',
      'en': 'To create',
    },
  },
  // Miscellaneous
  {
    '89z0jeoo': {
      'pt': '',
      'en': '',
    },
    '5ta7md9p': {
      'pt': '',
      'en': '',
    },
    '9picffcg': {
      'pt': '',
      'en': '',
    },
    'eue453a7': {
      'pt': '',
      'en': '',
    },
    'lf0rti6l': {
      'pt': '',
      'en': '',
    },
    'zgf8cqno': {
      'pt': '',
      'en': '',
    },
    'dcfzeqtg': {
      'pt': '',
      'en': '',
    },
    'ffjz3yi9': {
      'pt': '',
      'en': '',
    },
    'tbj7ne2o': {
      'pt': '',
      'en': '',
    },
    '5l75qez9': {
      'pt': '',
      'en': '',
    },
    'dsq2iyry': {
      'pt': '',
      'en': '',
    },
    '1mzyqoai': {
      'pt': '',
      'en': '',
    },
    'u6n2ajvj': {
      'pt': '',
      'en': '',
    },
    'eqhgd8qs': {
      'pt': '',
      'en': '',
    },
    'yj73a6fn': {
      'pt': '',
      'en': '',
    },
    'xe51zl5r': {
      'pt': '',
      'en': '',
    },
    '9qyhhyzh': {
      'pt': '',
      'en': '',
    },
    'e37fjd2z': {
      'pt': '',
      'en': '',
    },
    'raagd3dm': {
      'pt': '',
      'en': '',
    },
    '56ri1ue6': {
      'pt': '',
      'en': '',
    },
    '1jmhyxyv': {
      'pt': '',
      'en': '',
    },
    'tlqt3w59': {
      'pt': '',
      'en': '',
    },
    'w9qkx411': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
