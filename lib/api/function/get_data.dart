import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:consumer_app/model/entities/users.dart';

Future<String> getValue() async {
  await Future.delayed(const Duration(seconds: 3));

  return 'Woolha';
}
