class DeviceReg {
  int? code;
  Content? content;

  DeviceReg({this.code, this.content});

  DeviceReg.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    content =
        json["content"] == null ? null : Content.fromJson(json["content"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    if (content != null) {
      _data["content"] = content?.toJson();
    }
    return _data;
  }
}

class Content {
  List<Devices>? devices;

  Content({this.devices});

  Content.fromJson(Map<String, dynamic> json) {
    devices = json["devices"] == null
        ? null
        : (json["devices"] as List).map((e) => Devices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (devices != null) {
      _data["devices"] = devices?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Devices {
  int? id;
  String? uid;
  String? name;
  String? type;
  String? deviceId;
  int? isClip;

  Devices(
      {this.id, this.uid, this.name, this.type, this.deviceId, this.isClip});

  Devices.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    uid = json["uid"];
    name = json["name"];
    type = json["type"];
    deviceId = json["device_id"];
    isClip = json["is_clip"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["uid"] = uid;
    _data["name"] = name;
    _data["type"] = type;
    _data["device_id"] = deviceId;
    _data["is_clip"] = isClip;
    return _data;
  }
}
