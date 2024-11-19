class ApiModel {
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strTeamShort;
  final String strDescriptionEN;

  ApiModel({
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strTeamShort,
    required this.strDescriptionEN
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        strStadium: json['strStadium'],
        strTeam: json['strTeam'],
        strBadge: json['strBadge'],
        strTeamShort: json['strTeamShort'],
        strDescriptionEN: json['strDescriptionEN']
    );
  }
}