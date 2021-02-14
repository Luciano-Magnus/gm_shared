

class ApiUrl{
  static const _ip = '192.168.2.131';
  static const _baseUrl = 'http://$_ip/tcc/public';

  static const urlPost = '$_baseUrl/insert-user';
  static const urlGetLogin = '$_baseUrl/get-login';

  //region Publicações
  static const urlGetPublications = '$_baseUrl/get-publications';
  //endregion
}