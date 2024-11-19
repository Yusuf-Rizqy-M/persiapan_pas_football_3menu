class ModelBola {
  final int? id;
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String? strTeamShort;
  final String? strDescriptionEN;
  final bool isCompleted; // Menambahkan isCompleted jika ingin tetap menggunakannya

  ModelBola({
    this.id,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    this.strTeamShort,
    this.strDescriptionEN,
    this.isCompleted = false, // Default jika tidak diberi nilai
  });

  // Konversi ke Map untuk database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'strTeam': strTeam,
      'strStadium': strStadium,
      'strBadge': strBadge,
      'strTeamShort': strTeamShort,
      'strDescriptionEN': strDescriptionEN,
      'isCompleted': isCompleted ? 1 : 0, // Menyimpan isCompleted dalam bentuk integer (1 atau 0)
    };
  }

  // Konversi dari Map dari database
  factory ModelBola.fromMap(Map<String, dynamic> map) {
    return ModelBola(
      id: map['id'] as int?,
      strTeam: map['strTeam'] as String,
      strStadium: map['strStadium'] as String,
      strBadge: map['strBadge'] as String,
      strTeamShort: map['strTeamShort'] as String,
      strDescriptionEN: map['strDescriptionEN'] as String,
      isCompleted: map['isCompleted'] == 1, // Mengembalikan boolean
    );
  }
}