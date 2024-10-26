import 'package:flutter/cupertino.dart';
import 'package:sprinkle_and_sprout/model/models_model.dart';
import 'package:sprinkle_and_sprout/services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  // String currentModel = "text-davinci-003";
  String currentModel = "ft:gpt-3.5-turbo-0613:personal:noti:81THPC2W";

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];

  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}
