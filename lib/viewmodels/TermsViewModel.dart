import 'package:flutter/material.dart';

import '../data/TermsRepository.dart';
import '../models/termsModel.dart';


class TermsViewModel
    extends ChangeNotifier {

  final TermsRepository repository;

  TermsViewModel(this.repository);

  List<Term> terms = [];

  List<Term> filteredTerms = [];

  bool isLoading = false;

  Future<void> loadTerms() async {

    isLoading = true;
    notifyListeners();

    terms =
    await repository.getTerms();

    filteredTerms = terms;

    isLoading = false;
    notifyListeners();
  }

  void search(String value) {

    filteredTerms = terms.where((term) {

      return term.word
          .toLowerCase()
          .contains(
        value.toLowerCase(),
      );

    }).toList();

    notifyListeners();
  }
}