import 'package:basiccom/core/error/failures.dart';
import 'package:basiccom/src/customisation/data/models/app_parameters_model.dart';
import 'package:basiccom/src/customisation/domain/entities/app_parameters.dart';
import 'package:hive_flutter/adapters.dart';

abstract class CustomisationLocalDataSource {

  Future<bool> initAppParameters();
  Future<AppParametersModel> getAppParameters();
  Future<bool> setAppParameters(AppParameters parameters);
  Future<bool> setHighContrast(bool highContrast);
  Future<bool> clearAppParameters();
  bool get isAppParametersSet;
  AppParameters get appParameters;

}

class HiveCustomisationLocalDataSourceImpl implements CustomisationLocalDataSource {

  HiveCustomisationLocalDataSourceImpl() {
    Hive.initFlutter();
    Hive.openBox('appParameters');
  }

    @override
  Future<bool> initAppParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('appParameters');
      box.put(0, AppParametersModel.empty.toJson());
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<AppParametersModel> getAppParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('appParameters');
      
      return AppParametersModel.fromJson(box.getAt(0));
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<bool> setHighContrast(bool highContrast) async {
    try {
      Box<dynamic> box = await Hive.openBox('appParameters');
      final parameters = AppParametersModel.fromJson(box.getAt(0)).copyWith(highContrast: highContrast);
      box.put(0, parameters);
      return true;
    } catch (error) {
      print(error.toString());
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  Future<bool> setAppParameters(AppParameters parameters) async {
    try {
      Box<dynamic> box = await Hive.openBox('appParameters');
      box.put(0, AppParametersModel.fromEntity(parameters).toJson());
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

    @override
  Future<bool> clearAppParameters() async {
    try {
      Box<dynamic> box = await Hive.openBox('appParameters');
      box.clear();
      return true;
    } catch (error) {
      throw LocalFailure(message: error.toString());
    }
  }

  @override
  bool get isAppParametersSet => Hive.box('appParameters').isNotEmpty;

  @override
  AppParameters get appParameters => Hive.box('appParameters').isNotEmpty ? AppParametersModel.fromJson(Hive.box('appParameters').getAt(0)) : AppParametersModel.empty;

}
