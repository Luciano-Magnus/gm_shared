import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LoginModel {
  List<Users> users;

  LoginModel({this.users});

  LoginModel.fromJson(Map<String, dynamic> json, String dir) {
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v, dir));
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
  String idUser;
  String nameUser;
  String passwordUser;
  String platformUser;
  File photoUser;
  String favoriteGameUser;
  String descriptionUser;
  String scoreUser;

  Users({
    this.idUser,
    this.nameUser,
    this.passwordUser,
    this.platformUser,
    this.photoUser,
    this.favoriteGameUser,
    this.descriptionUser,
    this.scoreUser,
  });

  Users.fromJson(Map<String, dynamic> json, String dir) {
    String imageTemporary = '';
    idUser = json['id_user'];
    nameUser = json['name_user'];
    passwordUser = json['password_user'];
    platformUser = json['platform_user'];
    imageTemporary = json['photo_user'];

    File arquivo = File('$dir/photo.png');
    arquivo.writeAsBytesSync(base64Decode(imageTemporary));
    photoUser = arquivo;
    favoriteGameUser = json['favorite_game_user'];
    descriptionUser = json['description_user'];
    scoreUser = json['score_user'];
  }

  Future<String> dir()async{
    Directory directory = await getTemporaryDirectory();
    return directory.path;
  }

  Map<String, dynamic> toJson() {
    var imageBytes = this.photoUser.readAsBytesSync();
    String imageBase64 = base64Encode(imageBytes);

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_game_user'] = this.favoriteGameUser;
    data['description_user'] = this.descriptionUser;
    data['id_user'] = this.idUser;
    data['name_user'] = this.nameUser;
    data['password_user'] = this.passwordUser;
    data['platform_user'] = this.platformUser;
    data['photo_user'] = imageBase64;

    return data;
  }
}
