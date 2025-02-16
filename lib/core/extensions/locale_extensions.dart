import 'package:flutter/cupertino.dart';

extension LocaleExtensions on Locale {
  String getNativeLanguageName() {
    switch (languageCode) {
      case "ace":
        return "Acèh";
      case "ach":
        return "Lëb Acoli";
      case "alz":
        return "Alur";
      case "awa":
        return "अवधी";
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
      case "bal":
        return "بلوچی";
      case "ban":
        return "ᬩᬮᬶ";
      case "bbc":
        return "Batak Toba";
      case "bci":
        return "Baoulé";
      case "bem":
        return "Ichibemba";
      case "ber":
        return "ⴰⵎⴰⵣⵉⵖ";
      case "bew":
        return "Betawi";
      case "bho":
        return "भोजपुरी";
      case "bik":
        return "Bikol";
      case "bts":
        return "Batak Simalungun";
      case "btx":
        return "Batak Karo";
      case "bua":
        return "буряад хэлэн";
      case "ceb":
        return "Binisaya";
      case "cgg":
        return "Rukiga";
      case "chk":
        return "Chuukese";
      case "ckb":
        return "سۆرانی";
      case "cnh":
        return "Chinook Jargon";
      case "crh":
        return "Qırımtatarca";
      case "crs":
        return "Seselwa";
      case "cy":
        return "Cymraeg";
      case "din":
        return "Thuɔŋjäŋ";
      case "doi":
        return "डोगरी";
      case "dyu":
        return "Jula";
      case "fa":
        return "فارسی";
      case "fil":
        return "Filipino";
      case "fon":
        return "Fon gbè";
      case "fur":
        return "Furlan";
      case "fy":
        return "Frysk";
      case "gaa":
        return "Ga";
      case "gd":
        return "Gàidhlig";
      case "gom":
        return "कोंकणी";
      case "haw":
        return "ʻŌlelo Hawaiʻi";
      case "hil":
        return "Ilonggo";
      case "hmn":
        return "Hmoob";
      case "hrx":
        return "Hunsrik";
      case "iba":
        return "Iban";
      case "ilo":
        return "Ilokano";
      case "jam":
        return "Patwa";
      case "kac":
        return "Jingpho";
      case "kek":
        return "Q'eqchi'";
      case "kha":
        return "Khasi";
      case "kri":
        return "Krio";
      case "ktu":
        return "Kituba";
      case "lij":
        return "Ligure";
      case "ltg":
        return "Latgaļu";
      case "luo":
        return "Dholuo";
      case "mai":
        return "मैथिली";
      case "mak":
        return "Basa Mangkasara'";
      case "mam":
        return "Mam";
      case "mfe":
        return "Morisyen";
      case "mg":
        return "Malagasy";
      case "mhr":
        return "марий йылме";
      case "mi":
        return "Te Reo Māori";
      case "min":
        return "Bahaso Minang";
      case "mni":
        return "ꯃꯤꯇꯩ ꯂꯣꯟ";
      case "mr":
        return "मराठी";
      case "ms":
        return "Bahasa Melayu";
      case "ne":
        return "नेपाली";
      case "new":
        return "नेपाल भाषा";
      case "nhe":
        return "Nāhuatl";
      case "no":
        return "Norsk";
      case "nso":
        return "Sesotho sa Leboa";
      case "nus":
        return "Thok Naath";
      case "om":
        return "Afaan Oromoo";
      case "or":
        return "ଓଡ଼ିଆ";
      case "pa":
        return "ਪੰਜਾਬੀ";
      case "pag":
        return "Pangasinan";
      case "pam":
        return "Kapampangan";
      case "pap":
        return "Papiamentu";
      case "pl":
        return "Polski";
      case "ps":
        return "پښتو";
      case "pt":
        return "Português";
      case "qu":
        return "Runa Simi";
      case "ro":
        return "Română";
      case "rom":
        return "Romani";
      case "ru":
        return "Русский";
      case "sa":
        return "संस्कृतम्";
      case "sah":
        return "Саха тыла";
      case "sat":
        return "ᱥᱟᱱᱛᱟᱲᱤ";
      case "scn":
        return "Sicilianu";
      case "sd":
        return "سنڌي";
      case "shn":
        return "ၵႂၢမ်းတႆး";
      case "si":
        return "සිංහල";
      case "sk":
        return "Slovenčina";
      case "sl":
        return "Slovenščina";
      case "sm":
        return "Gagana faʻa Sāmoa";
      case "sn":
        return "ChiShona";
      case "so":
        return "Soomaali";
      case "sr":
        return "Српски";
      case "st":
        return "Sesotho";
      case "su":
        return "Basa Sunda";
      case "sus":
        return "Sosoxui";
      case "sv":
        return "Svenska";
      case "sw":
        return "Kiswahili";
      case "szl":
        return "Ślōnskŏ gŏdka";
      case "ta":
        return "தமிழ்";
      case "te":
        return "తెలుగు";
      case "tet":
        return "Tetun";
      case "tg":
        return "Тоҷикӣ";
      case "th":
        return "ไทย";
      case "ti":
        return "ትግርኛ";
      case "tiv":
        return "Tiv";
      case "tk":
        return "Türkmençe";
      case "tl":
        return "Tagalog";
      case "tpi":
        return "Tok Pisin";
      case "tr":
        return "Türkçe";
      case "ts":
        return "Xitsonga";
      case "tt":
        return "Татарча";
      case "tum":
        return "Chitumbuka";
      case "udm":
        return "удмурт кыл";
      case "ug":
        return "ئۇيغۇرچە";
      case "uk":
        return "Українська";
      case "ur":
        return "اردو";
      case "uz":
        return "Oʻzbekcha";
      case "vec":
        return "Vèneto";
      case "vi":
        return "Tiếng Việt";
      case "war":
        return "Winaray";
      case "xh":
        return "isiXhosa";
      case "yi":
        return "ייִדיש";
      case "yo":
        return "Yorùbá";
      case "yua":
        return "Maayaʼ Tʼaan";
      case "yue":
        return "粵語";
      case "zap":
        return "Diidxazá";
      case "zh":
        return "中文";
      case "zu":
        return "isiZulu";
      case "mk":
        return "македонски јазик";
      case "ml":
        return "മലയാളം";
      case "mn":
        return "Монгол";
      case "mt":
        return "Malti";
      case "lmo":
        return "Lombard";
      case "mwr":
        return "मारवाड़ी";
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
        return getLanguageName();
    }
  }

  String getLanguageName() {
    switch (languageCode) {
      case "ace":
        return "Achinese";
      case "ach":
        return "Acoli";
      case "alz":
        return "Alur";
      case "awa":
        return "Awadhi";
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
      case "bal":
        return "Baluchi";
      case "ban":
        return "Balinese";
      case "bbc":
        return "Batak Toba";
      case "bci":
        return "Baoulé";
      case "bem":
        return "Bemba";
      case "ber":
        return "Berber";
      case "bew":
        return "Betawi";
      case "bho":
        return "Bhojpuri";
      case "bik":
        return "Bikol";
      case "bn":
        return "Bengali";
      case "bts":
        return "Batak Simalungun";
      case "btx":
        return "Batak Karo";
      case "bua":
        return "Buriat";
      case "ceb":
        return "Cebuano";
      case "cgg":
        return "Chiga";
      case "chk":
        return "Chuukese";
      case "ckb":
        return "Sorani";
      case "cnh":
        return "Chinook Jargon";
      case "crh":
        return "Crimean Tatar";
      case "crs":
        return "Seselwa Creole French";
      case "cy":
        return "Welsh";
      case "din":
        return "Dinka";
      case "doi":
        return "Dogri";
      case "dyu":
        return "Dyula";
      case "fa":
        return "Persian";
      case "fil":
        return "Filipino";
      case "fon":
        return "Fon";
      case "fur":
        return "Friulian";
      case "fy":
        return "Western Frisian";
      case "gaa":
        return "Ga";
      case "gd":
        return "Gaelic";
      case "gom":
        return "Goan Konkani";
      case "haw":
        return "Hawaiian";
      case "hil":
        return "Hiligaynon";
      case "hmn":
        return "Hmong";
      case "hrx":
        return "Hunsrik";
      case "iba":
        return "Iban";
      case "ilo":
        return "Iloko";
      case "jam":
        return "Jamaican Creole English";
      case "kac":
        return "Kachin";
      case "kek":
        return "Kekchi";
      case "kha":
        return "Khasi";
      case "kri":
        return "Krio";
      case "ktu":
        return "Kituba";
      case "lij":
        return "Ligurian";
      case "ltg":
        return "Latgalian";
      case "luo":
        return "Luo";
      case "mai":
        return "Maithili";
      case "mak":
        return "Makasar";
      case "mam":
        return "Mam";
      case "mfe":
        return "Morisyen";
      case "mg":
        return "Malagasy";
      case "mhr":
        return "Mari";
      case "mi":
        return "Maori";
      case "min":
        return "Minangkabau";
      case "mni":
        return "Manipuri";
      case "mr":
        return "Marathi";
      case "ms":
        return "Malay";
      case "ne":
        return "Nepali";
      case "new":
        return "Newari";
      case "nhe":
        return "Nahuatl";
      case "no":
        return "Norwegian";
      case "nso":
        return "Northern Sotho";
      case "nus":
        return "Nuer";
      case "om":
        return "Oromo";
      case "or":
        return "Oriya";
      case "pa":
        return "Punjabi";
      case "pag":
        return "Pangasinan";
      case "pam":
        return "Pampanga";
      case "pap":
        return "Papiamento";
      case "pl":
        return "Polish";
      case "ps":
        return "Pushto";
      case "pt":
        return "Portuguese";
      case "qu":
        return "Quechua";
      case "ro":
        return "Romanian";
      case "rom":
        return "Romany";
      case "ru":
        return "Russian";
      case "sa":
        return "Sanskrit";
      case "sah":
        return "Yakut";
      case "sat":
        return "Santali";
      case "scn":
        return "Sicilian";
      case "sd":
        return "Sindhi";
      case "shn":
        return "Shan";
      case "si":
        return "Sinhalese";
      case "sk":
        return "Slovak";
      case "sl":
        return "Slovenian";
      case "sm":
        return "Samoan";
      case "sn":
        return "Shona";
      case "so":
        return "Somali";
      case "sr":
        return "Serbian";
      case "st":
        return "Southern Sotho";
      case "su":
        return "Sundanese";
      case "sus":
        return "Susu";
      case "sv":
        return "Swedish";
      case "sw":
        return "Swahili";
      case "szl":
        return "Silesian";
      case "ta":
        return "Tamil";
      case "te":
        return "Telugu";
      case "tet":
        return "Tetum";
      case "tg":
        return "Tajik";
      case "th":
        return "Thai";
      case "ti":
        return "Tigrinya";
      case "tiv":
        return "Tiv";
      case "tk":
        return "Turkmen";
      case "tl":
        return "Tagalog";
      case "tpi":
        return "Tok Pisin";
      case "tr":
        return "Turkish";
      case "ts":
        return "Tsonga";
      case "tt":
        return "Tatar";
      case "tum":
        return "Tumbuka";
      case "udm":
        return "Udmurt";
      case "ug":
        return "Uighur";
      case "uk":
        return "Ukrainian";
      case "ur":
        return "Urdu";
      case "uz":
        return "Uzbek";
      case "vec":
        return "Venetian";
      case "vi":
        return "Vietnamese";
      case "war":
        return "Waray";
      case "xh":
        return "Xhosa";
      case "yi":
        return "Yiddish";
      case "yo":
        return "Yoruba";
      case "yua":
        return "Yucateco";
      case "yue":
        return "Cantonese";
      case "zap":
        return "Zapotec";
      case "zh":
        return "Chinese";
      case "zu":
        return "Zulu";
      case "eu":
        return "Basque";
      case "be":
        return "Belarusian";
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
        return languageCode;
    }
  }
}
