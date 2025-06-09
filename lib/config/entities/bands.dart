class Band {
  final String id;
  final String nomen;
  int numerusVotum;

  Band({
    required this.id,
    required this.nomen,
    required this.numerusVotum,
  });

factory Band.fromMap(Map<String, dynamic> obj) => Band(
    id: obj['id'] as String,
    nomen: obj['nomen'] as String,
    numerusVotum: obj['numerusVotum'] as int,
);

Band copyWith({
    String? id,
    String? nomen,
    int? numerusVotum,
  }) {
    return Band(
      id: id ?? this.id,
      nomen: nomen ?? this.nomen,
      numerusVotum: numerusVotum ?? this.numerusVotum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomen': nomen,
      'numerusVotum': numerusVotum,
    };
  }

}