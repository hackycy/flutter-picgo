import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_picgo/api/github_api.dart';
import 'package:flutter_picgo/model/github_config.dart';
import 'package:flutter_picgo/resources/pb_type_keys.dart';
import 'package:flutter_picgo/resources/table_name_keys.dart';
import 'package:flutter_picgo/utils/sql.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

var dio = new Dio(BaseOptions(
    connectTimeout: 30000, headers: optHeader, baseUrl: GithubApi.BASE_URL));

class GithubNetUtils {
  static Future get(String url, {Map<String, dynamic> params}) async {
    // 拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        var token = await oAuth();
        options.headers["Authorization"] = 'Token $token';
      },
    ));
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    // if (response.statusCode != 200) {
    //   dio.reject(response.data["message"] ?? '未知异常');
    // }
    return response.data;
  }

  static Future post(String url, Map<String, dynamic> data) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        var token = await oAuth();
        options.headers["Authorization"] = 'Token $token';
      },
    ));
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  static Future put(String url, Map<String, dynamic> data) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        var token = await oAuth();
        options.headers["Authorization"] = 'Token $token';
      },
    ));
    Response response = await dio.put(url, data: data);
    return response.data;
  }

  /// 获取配置中的Token
  static Future oAuth() async {
    try {
      var sql = Sql.setTable(TABLE_NAME_PBSETTING);
      var pbsettingRow =
          (await sql.getBySql('type = ?', [PBTypeKeys.github]))?.first;
      if (pbsettingRow != null &&
          pbsettingRow["config"] != null &&
          pbsettingRow["config"] != '') {
        GithubConfig config =
            GithubConfig.fromJson(json.decode(pbsettingRow["config"]));
        if (config != null && config.token != null && config.token != '') {
          return config.token;
        }
      }
    } catch (e) {}
  }
}