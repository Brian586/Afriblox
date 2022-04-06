class Backdrop {
  final String? name;
  final String? md5;
  final String? type;
  final List<dynamic>? tags;
  final List<dynamic>? info;

  Backdrop({this.name, this.md5, this.type, this.tags, this.info,});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "md5": md5,
      "type": type,
      "tags": tags,
      "info": info
    };
  }

  factory Backdrop.fromJson(dynamic json) {
    return Backdrop(
      name: json["name"],
      md5: json["md5"],
      type: json["type"],
      tags: json["tags"],
      info: json["info"],
    );
  }
}