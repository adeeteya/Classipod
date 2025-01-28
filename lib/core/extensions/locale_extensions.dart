import 'package:flutter/cupertino.dart';

extension LocaleExtensions on Locale {
  String getNativeLanguageName() {
    switch (languageCode) {
      case "ab":
        return "аҧсуа";
      case "aa":
        return "Afaraf";
      case "af":
        return "Afrikaans";
      case "ak":
        return "Akan";
      case "sq":
        return "Shqip";
      case "am":
        return "አማርኛ";
      case "ar":
        return "العربية";
      case "an":
        return "Aragonés";
      case "hy":
        return "Հայերեն";
      case "as":
        return "অসমীয়া";
      case "av":
        return "авар мацӀ, магӀарул мацӀ";
      case "ae":
        return "avesta";
      case "ay":
        return "aymar aru";
      case "az":
        return "azərbaycan dili";
      case "bm":
        return "bamanankan";
      case "ba":
        return "башҡорт теле";
      case "eu":
        return "euskera";
      case "be":
        return "Беларуская";
      case "bn":
        return "বাংলা";
      case "bh":
        return "भोजपुरी";
      case "bi":
        return "Bislama";
      case "bs":
        return "bosanski jezik";
      case "br":
        return "brezhoneg";
      case "bg":
        return "български език";
      case "my":
        return "ဗမာစာ";
      case "ca":
        return "Català";
      case "ch":
        return "Chamoru";
      case "ce":
        return "нохчийн мотт";
      case "ny":
        return "chiCheŵa, chinyanja";
      case "zh":
        return "中文 (Zhōngwén), 汉语, 漢語";
      case "cv":
        return "чӑваш чӗлхи";
      case "kw":
        return "Kernewek";
      case "co":
        return "corsu, lingua corsa";
      case "cr":
        return "ᓀᐦᐃᔭᐍᐏᐣ";
      case "hr":
        return "hrvatski";
      case "cs":
        return "česky, čeština";
      case "da":
        return "dansk";
      case "dv":
        return "ދިވެހި";
      case "nl":
        return "Nederlands, Vlaams";
      case "en":
        return "English";
      case "es":
        return "Español";
      case "eo":
        return "Esperanto";
      case "et":
        return "eesti";
      case "ee":
        return "Eʋegbe";
      case "fo":
        return "føroyskt";
      case "fj":
        return "vosa Vakaviti";
      case "fi":
        return "suomi";
      case "fr":
        return "français";
      case "ff":
        return "Fulfulde";
      case "gl":
        return "Galego";
      case "ka":
        return "ქართული";
      case "de":
        return "Deutsch";
      case "el":
        return "Ελληνικά";
      case "gn":
        return "Avañeẽ";
      case "gu":
        return "ગુજરાતી";
      case "ht":
        return "Kreyòl ayisyen";
      case "ha":
        return "هَوُسَ";
      case "he":
        return "עברית";
      case "hz":
        return "Otjiherero";
      case "hi":
        return "हिंदी";
      case "ho":
        return "Hiri Motu";
      case "hu":
        return "Magyar";
      case "ia":
        return "Interlingua";
      case "id":
        return "Bahasa Indonesia";
      case "ie":
        return "Interlingue";
      case "ga":
        return "Gaeilge";
      case "ig":
        return "Asụsụ Igbo";
      case "ik":
        return "Iñupiaq, Iñupiatun";
      case "io":
        return "Ido";
      case "is":
        return "Íslenska";
      case "it":
        return "Italiano";
      case "iu":
        return "ᐃᓄᒃᑎᑐᑦ";
      case "ja":
        return "日本語 (にほんご／にっぽんご)";
      case "jv":
        return "basa Jawa";
      case "kl":
        return "kalaallisut, kalaallit oqaasii";
      case "kn":
        return "ಕನ್ನಡ";
      case "kr":
        return "Kanuri";
      case "ks":
        return "कश्मीरी, كشميري‎";
      case "kk":
        return "Қазақ тілі";
      case "km":
        return "ភាសាខ្មែរ";
      case "ki":
        return "Gĩkũyũ";
      case "rw":
        return "Ikinyarwanda";
      case "ky":
        return "кыргыз тили";
      case "kv":
        return "коми кыв";
      case "kg":
        return "KiKongo";
      case "ko":
        return "한국어 (韓國語), 조선말 (朝鮮語)";
      case "ku":
        return "Kurdî, كوردی‎";
      case "kj":
        return "Kuanyama";
      case "la":
        return "latine, lingua latina";
      case "lb":
        return "Lëtzebuergesch";
      case "lg":
        return "Luganda";
      case "li":
        return "Limburgs";
      case "ln":
        return "Lingála";
      case "lo":
        return "ພາສາລາວ";
      case "lt":
        return "lietuvių kalba";
      case "lv":
        return "latviešu valoda";
      default:
        return "Unknown Language Code";
    }
  }

  String getLanguageName() {
    switch (languageCode) {
      case "ab":
        return "Abkhazian";
      case "aa":
        return "Afar";
      case "af":
        return "Afrikaans";
      case "ak":
        return "Akan";
      case "sq":
        return "Albanian";
      case "am":
        return "Amharic";
      case "ar":
        return "Arabic";
      case "an":
        return "Aragonese";
      case "hy":
        return "Armenian";
      case "as":
        return "Assamese";
      case "av":
        return "Avaric";
      case "ae":
        return "Avestan";
      case "ay":
        return "Aymara";
      case "az":
        return "Azerbaijani";
      case "bm":
        return "Bambara";
      case "ba":
        return "Bashkir";
      case "eu":
        return "Basque";
      case "be":
        return "Belarusian";
      case "bn":
        return "Bengali";
      case "bh":
        return "Bihari languages";
      case "bi":
        return "Bislama";
      case "bs":
        return "Bosnian";
      case "br":
        return "Breton";
      case "bg":
        return "Bulgarian";
      case "my":
        return "Burmese";
      case "ca":
        return "Catalan; Valencian";
      case "ch":
        return "Chamorro";
      case "ce":
        return "Chechen";
      case "ny":
        return "Chichewa; Chewa; Nyanja";
      case "zh":
        return "Chinese";
      case "cv":
        return "Chuvash";
      case "kw":
        return "Cornish";
      case "co":
        return "Corsican";
      case "cr":
        return "Cree";
      case "hr":
        return "Croatian";
      case "cs":
        return "Czech";
      case "da":
        return "Danish";
      case "dv":
        return "Divehi; Dhivehi; Maldivian";
      case "nl":
        return "Dutch; Flemish";
      case "en":
        return "English";
      case "es":
        return "Spanish";
      case "eo":
        return "Esperanto";
      case "et":
        return "Estonian";
      case "ee":
        return "Ewe";
      case "fo":
        return "Faroese";
      case "fj":
        return "Fijian";
      case "fi":
        return "Finnish";
      case "fr":
        return "French";
      case "ff":
        return "Fulah";
      case "gl":
        return "Galician";
      case "ka":
        return "Georgian";
      case "de":
        return "German";
      case "el":
        return "Greek, Modern (1453–)";
      case "gn":
        return "Guarani";
      case "gu":
        return "Gujarati";
      case "ht":
        return "Haitian; Haitian Creole";
      case "ha":
        return "Hausa";
      case "he":
        return "Hebrew";
      case "hz":
        return "Herero";
      case "hi":
        return "Hindi";
      case "ho":
        return "Hiri Motu";
      case "hu":
        return "Hungarian";
      case "ia":
        return "Interlingua (International Auxiliary Language Association)";
      case "id":
        return "Indonesian";
      case "ie":
        return "Interlingue; Occidental";
      case "ga":
        return "Irish";
      case "ig":
        return "Igbo";
      case "ik":
        return "Inupiaq";
      case "io":
        return "Ido";
      case "is":
        return "Icelandic";
      case "it":
        return "Italian";
      case "iu":
        return "Inuktitut";
      case "ja":
        return "Japanese";
      case "jv":
        return "Javanese";
      case "kl":
        return "Kalaallisut; Greenlandic";
      case "kn":
        return "Kannada";
      case "kr":
        return "Kanuri";
      case "ks":
        return "Kashmiri";
      case "kk":
        return "Kazakh";
      case "km":
        return "Central Khmer";
      case "ki":
        return "Kikuyu; Gikuyu";
      case "rw":
        return "Kinyarwanda";
      case "ky":
        return "Kirghiz; Kyrgyz";
      case "kv":
        return "Komi";
      case "kg":
        return "Kongo";
      case "ko":
        return "Korean";
      case "ku":
        return "Kurdish";
      case "kj":
        return "Kuanyama; Kwanyama";
      case "la":
        return "Latin";
      case "lb":
        return "Luxembourgish; Letzeburgesch";
      case "lg":
        return "Ganda";
      case "li":
        return "Limburgan; Limburger; Limburgish";
      case "ln":
        return "Lingala";
      case "lo":
        return "Lao";
      case "lt":
        return "Lithuanian";
      case "lv":
        return "Latvian";
      default:
        return "Unknown Language Code";
    }
  }
}
