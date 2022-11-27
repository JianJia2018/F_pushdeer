class MessageList {
  List<Messages>? messages;

  MessageList({this.messages});

  MessageList.fromJson(Map<String, dynamic> json) {
    messages = json["messages"] == null
        ? null
        : (json["messages"] as List).map((e) => Messages.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (messages != null) {
      _data["messages"] = messages?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Messages {
  int? id;
  String? uid;
  String? text;
  String? desp;
  String? type;
  String? createdAt;

  Messages(
      {this.id, this.uid, this.text, this.desp, this.type, this.createdAt});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    uid = json["uid"];
    text = json["text"];
    desp = json["desp"];
    type = json["type"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["uid"] = uid;
    _data["text"] = text;
    _data["desp"] = desp;
    _data["type"] = type;
    _data["created_at"] = createdAt;
    return _data;
  }
}
