class Costume {
  final String? name;
  final List<dynamic>? tags;
  final String? assetId;
  final int? bitmapResolution;
  final String? dataFormat;
  final String? md5ext;
  final int? rotationCenterX;
  final int? rotationCenterY;

  Costume(
      {this.name, this.tags, this.assetId, this.bitmapResolution, this.dataFormat, this.md5ext, this.rotationCenterX, this.rotationCenterY});

  factory Costume.fromJson(dynamic json) {
    return Costume(
      name: json["name"],
      tags: json["tags"],
      assetId: json["assetId"],
      bitmapResolution: json["bitmapResolution"],
      dataFormat: json["dataFormat"],
      md5ext: json["md5ext"],
      rotationCenterX: json["rotationCenterX"],
      rotationCenterY: json["rotationCenterY"]
    );
  }
}