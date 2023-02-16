class NiveisModel {
  int? id;
  String? nivel;

  NiveisModel({this.id, this.nivel});

  NiveisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nivel = json['nivel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nivel'] = this.nivel;
    return data;
  }
}
