import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String name) async {
  return rootBundle.loadString('assets/json/$name.json');
}
