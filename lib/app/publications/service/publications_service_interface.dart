import 'package:gm_shared/app/publications/Model/publications_model.dart';

abstract class IPublicationsService{
  Future<List<Publications>> getPublications();
}