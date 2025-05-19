class PhoneTypesModel {
  final int error;
  final String msg;
  final List<PhoneType> data;

  PhoneTypesModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory PhoneTypesModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<PhoneType> phoneTypesList =
    list.map((e) => PhoneType.fromJson(e)).toList();

    return PhoneTypesModel(
      error: json['error'],
      msg: json['msg'],
      data: phoneTypesList,
    );
  }
}

class PhoneType {
  final int id;
  final String name;

  PhoneType({
    required this.id,
    required this.name,
  });

  factory PhoneType.fromJson(Map<String, dynamic> json) {
    return PhoneType(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
