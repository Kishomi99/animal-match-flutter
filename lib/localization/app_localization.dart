import 'package:get/get.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "title": "GRAB! DROP! PRACTICE!",
          "back": "Play Again",
          "win": "You Win!",
          "next": "Next",
        }
      };
}
