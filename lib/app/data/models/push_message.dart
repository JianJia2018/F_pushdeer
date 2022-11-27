class PushMessage {
  List<String>? result;

  PushMessage({this.result});

  PushMessage.fromJson(Map<String, dynamic> json) {
    result = json["result"] == null ? null : List<String>.from(json["result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (result != null) {
      _data["result"] = result;
    }
    return _data;
  }
}
