class PublicationsModel {
  List<Publications> publications;

  PublicationsModel({this.publications});

  PublicationsModel.fromJson(Map<String, dynamic> json) {
    if (json['publications'] != null) {
      publications = new List<Publications>();
      json['publications'].forEach((v) {
        publications.add(new Publications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.publications != null) {
      data['publications'] = this.publications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Publications {
  String idPublication;
  String photoPublication;
  String descriptionPublication;
  String likesPublication;
  String idUser;
  String dataHoraCriado;
  bool isLike;

  Publications({
    this.idPublication,
    this.photoPublication,
    this.descriptionPublication,
    this.likesPublication,
    this.idUser,
    this.dataHoraCriado,
    this.isLike = false,
  });

  Publications.fromJson(Map<String, dynamic> json) {
    idPublication = json['id_publication'];
    photoPublication = json['photo_publication'];
    descriptionPublication = json['description_publication'];
    likesPublication = json['likes_publication'];
    idUser = json['id_user'];
    dataHoraCriado = json['data_hora_criado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_publication'] = this.idPublication;
    data['photo_publication'] = this.photoPublication;
    data['description_publication'] = this.descriptionPublication;
    data['likes_publication'] = this.likesPublication;
    data['id_user'] = this.idUser;
    data['data_hora_criado'] = this.dataHoraCriado;
    return data;
  }
}
