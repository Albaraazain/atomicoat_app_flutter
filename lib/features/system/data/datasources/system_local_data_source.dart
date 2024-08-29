import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/system_model.dart';
import '../models/system_operation_model.dart';

abstract class SystemLocalDataSource {
  Future<SystemModel> getLastKnownSystemStatus();
  Future<void> cacheSystemStatus(SystemModel systemModel);
  Future<List<SystemOperationModel>> getLastKnownOperationHistory();
  Future<void> cacheOperationHistory(List<SystemOperationModel> history);
}

const CACHED_SYSTEM_STATUS = 'CACHED_SYSTEM_STATUS';
const CACHED_OPERATION_HISTORY = 'CACHED_OPERATION_HISTORY';

class SystemLocalDataSourceImpl implements SystemLocalDataSource {
  final SharedPreferences sharedPreferences;

  SystemLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<SystemModel> getLastKnownSystemStatus() {
    final jsonString = sharedPreferences.getString(CACHED_SYSTEM_STATUS);
    if (jsonString != null) {
      return Future.value(SystemModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheSystemStatus(SystemModel systemModel) {
    return sharedPreferences.setString(
      CACHED_SYSTEM_STATUS,
      json.encode(systemModel.toJson()),
    );
  }

  @override
  Future<List<SystemOperationModel>> getLastKnownOperationHistory() {
    final jsonString = sharedPreferences.getString(CACHED_OPERATION_HISTORY);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return Future.value(
        jsonList.map((json) => SystemOperationModel.fromJson(json)).toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheOperationHistory(List<SystemOperationModel> history) {
    return sharedPreferences.setString(
      CACHED_OPERATION_HISTORY,
      json.encode(history.map((operation) => operation.toJson()).toList()),
    );
  }
}