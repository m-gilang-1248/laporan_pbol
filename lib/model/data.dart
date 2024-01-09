import 'dart:convert';
import 'dart:typed_data';

class Data{
  int? id;
  String? name;
  String? nim;
  String? phone;
  String? address;
  Uint8List? imageBytes;

  Data({this.id, this.name, this.nim, this.phone, this.address, this.imageBytes});

  Map<String, dynamic> toMapWithImage() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['nim'] = nim;
    map['phone'] = phone;
    map['address'] = address;
    map['imageBytes'] = imageBytes != null ? base64Encode(imageBytes!) : null;
    
    return map;
  }

  Data.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.nim = map['nim'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.imageBytes = map['imageBytes'] != null ? base64Decode(map['imageBytes']) : null;
  }
}