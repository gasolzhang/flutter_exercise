class BaseModel {
  String code;
  String message;
  Map<String, dynamic> data;

  BaseModel.fromMap(Map<String, dynamic> map) {
    this.code = map['code'];
    this.message = map['message'];
    this.data = map['data'];
  }
}
