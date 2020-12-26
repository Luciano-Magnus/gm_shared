class LoginModel {
  List<Users> users;

  LoginModel({this.users});

  LoginModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String nameUser;
  String passwordUser;
  String platformUser;

  Users({ this.nameUser, this.passwordUser, this.platformUser});

  Users.fromJson(Map<String, dynamic> json) {
    nameUser = json['name_user'];
    passwordUser = json['password_user'];
    platformUser = json['platform_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_user'] = this.nameUser;
    data['password_user'] = this.passwordUser;
    data['platform_user'] = this.platformUser;
    return data;
  }
}
