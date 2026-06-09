class Term {

final String word;

final String definition;

Term({
  required this.word,
  required this.definition,
});
factory Term.fromJson(
Map<String, dynamic> json) {

return Term(
word: json['word'],
definition: json['definition'],
);
}
}