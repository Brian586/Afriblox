class Sound {
  final String? name;
  final String? md5;
  final int? sampleCount;
  final int? rate;
  final String? format;
  final List<dynamic>? tags;

  Sound(
      {this.name, this.md5, this.sampleCount, this.rate, this.format, this.tags});

  factory Sound.fromJson(dynamic json) {
    return Sound(
      name: json["name"],
      md5: json["md5"],
      sampleCount: json[""],
      rate: json["rate"],
      format: json["format"],
      tags: json["tags"]
    );
  }
}