import 'dart:html' as html;

import 'models/models.dart';

abstract class PizzaRepo {
  Future<List<Pizza>> getPizzas();

  Future<String> sendImage(html.File file);
}
