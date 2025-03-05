class UserDetailsResponse {
  int? error;
  String? msg;
  Data? data;

  UserDetailsResponse({this.error, this.msg, this.data});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Info? info;
  List<Hobbies>? hobbies;
  List<String>? skills;

  Data({this.info, this.hobbies, this.skills});

  Data.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['hobbies'] != null) {
      hobbies = <Hobbies>[];
      json['hobbies'].forEach((v) {
        hobbies!.add(Hobbies.fromJson(v));
      });
    }
    skills = json['skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (hobbies != null) {
      data['hobbies'] = hobbies!.map((v) => v.toJson()).toList();
    }
    data['skills'] = skills;
    return data;
  }
}

class Info {
  String? name;
  String? email;
  String? avatar;
  String? phone;
  String? birthDate;
  String? address;

  Info(
      {this.name,
      this.email,
      this.avatar,
      this.phone,
      this.birthDate,
      this.address});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['birth_date'] = birthDate;
    data['address'] = address;
    return data;
  }
}

class Hobbies {
  String? name;
  String? image;

  Hobbies({this.name, this.image});

  Hobbies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
