class BaseResponse {
  int? code;
  dynamic content;
  String? error;

  BaseResponse({this.code, this.content, this.error});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    error = json["error"];
    content = json["content"];
  }

  factory BaseResponse.fromJson2(dynamic json) => BaseResponse(
      code: json["code"], error: json["error"], content: json["content"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["error"] = error;
    if (content != null) {
      _data["content"] = content?.toJson();
    }
    return _data;
  }
}
