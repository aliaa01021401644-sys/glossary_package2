import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/termsModel.dart';


class TermsRepository {

  Future<List<Term>> getTerms() async {

    String data =
    await rootBundle.loadString(
      'assets/data/Terms.json',
    );

    final jsonResult =
    json.decode(data);

    return (jsonResult['terms'] as List)
        .map((e) => Term.fromJson(e))
        .toList();
  }
}