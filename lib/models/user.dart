import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.idUser,
    this.nama,
    this.jenisKelamin,
    this.idParent,
  });

  String idUser;
  String nama;
  String jenisKelamin;
  String idParent;

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json["ID_user"],
    nama: json["nama"],
    jenisKelamin: json["jenis_kelamin"],
    idParent: json["ID_parent"],
  );

  Map<String, dynamic> toJson() => {
    "ID_user": idUser,
    "nama": nama,
    "jenis_kelamin": jenisKelamin,
    "ID_parent": idParent,
  };
}
class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}