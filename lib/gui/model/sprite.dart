class Sprite {
  final String? name;
  final List<dynamic>? tags;
  final bool? isStage;
  final Map? variables;
  final List<dynamic>? costumes;
  final List<dynamic>? sounds;
  final Map? blocks;

  Sprite(
      {this.name, this.tags, this.isStage, this.variables, this.costumes, this.sounds, this.blocks});

  factory Sprite.fromJson(dynamic json) {
    return Sprite(
      name: json["name"],
      tags: json["tags"],
      isStage: json["isStage"],
      variables: json["variables"],
      costumes: json["costumes"],
      sounds: json["sounds"],
      blocks: json["blocks"]
    );
  }
}