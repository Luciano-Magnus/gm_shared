import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gm_shared/app/publications/Model/publications_model.dart';
import 'package:gm_shared/app/publications/service/publications_service_interface.dart';
import 'package:gm_shared/app/utils/api/api_url.dart';
import 'package:gm_shared/shared/utils/json/json_format.dart';

class PublicationsService implements IPublicationsService{
  @override
  Future<List<Publications>> getPublications() async{
    var response = await Dio().get('${ApiUrl.urlGetPublications}');
    var data = await PublicationsModel.fromJson(jsonDecode(JsonFormat.format(response.data)));

    return data.publications;
  }

}