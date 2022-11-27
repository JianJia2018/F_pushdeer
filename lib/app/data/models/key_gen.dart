
class KeyGen {
  List<Keys>? keys;

  KeyGen({this.keys});

  KeyGen.fromJson(Map<String, dynamic> json) {
    keys = json["keys"] == null ? null : (json["keys"] as List).map((e) => Keys.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(keys != null) {
      _data["keys"] = keys?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Keys {
  int? id;
  String? uid;
  String? key;

  Keys({this.id, this.uid, this.key});

  Keys.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    uid = json["uid"];
    key = json["key"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["uid"] = uid;
    _data["key"] = key;
    return _data;
  }
}