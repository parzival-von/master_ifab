class Band {
  String id;
  String nomen;
  int numerusVotum;

  Band({
    required this.id,
    required this.nomen,
    required this.numerusVotum,
  });

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
    id: obj['id'],
    nomen: obj['nomen'],
    numerusVotum: obj['numerusVotum'],
  );
}