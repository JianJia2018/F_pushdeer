class UserInfo {
  int? id;
  String? name;
  String? email;
  String? appleId;
  dynamic wechatId;
  int? level;
  String? createdAt;
  String? updatedAt;
  String? simpleToken;

  UserInfo(
      {this.id,
      this.name,
      this.email,
      this.appleId,
      this.wechatId,
      this.level,
      this.createdAt,
      this.updatedAt,
      this.simpleToken});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    appleId = json["apple_id"];
    wechatId = json["wechat_id"];
    level = json["level"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    simpleToken = json["simple_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["apple_id"] = appleId;
    _data["wechat_id"] = wechatId;
    _data["level"] = level;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["simple_token"] = simpleToken;
    return _data;
  }
}
