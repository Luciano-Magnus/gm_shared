class PublicationsModel {
  String idPublication;
  String photoPublication;
  String descriptionPublication;
  String likesPublication;
  String idUser;

  PublicationsModel(
      {this.idPublication,
        this.photoPublication,
        this.descriptionPublication,
        this.likesPublication,
        this.idUser});

  PublicationsModel.fromJson(Map<String, dynamic> json) {
    idPublication = json['id_publication'];
    photoPublication = json['photo_publication'];
    descriptionPublication = json['description_publication'];
    likesPublication = json['likes_publication'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_publication'] = this.idPublication;
    data['photo_publication'] = this.photoPublication;
    data['description_publication'] = this.descriptionPublication;
    data['likes_publication'] = this.likesPublication;
    data['id_user'] = this.idUser;
    return data;
  }
}