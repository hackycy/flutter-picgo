import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_picgo/api/smms_api.dart';
import 'package:flutter_picgo/model/uploaded.dart';
import 'package:flutter_picgo/resources/pb_type_keys.dart';
import 'package:flutter_picgo/utils/image_upload.dart';
import 'dart:io';
import 'package:flutter_picgo/utils/strategy/image_upload_strategy.dart';
import 'package:flutter_picgo/utils/strings.dart';

class SMMSImageUpload implements ImageUploadStrategy {
  @override
  Future<Uploaded> upload(File file, String renameImage) async {
    FormData formData = FormData.fromMap({
      "smfile": await MultipartFile.fromFile(file.path, filename: renameImage),
    });
    var result = await SMMSApi.upload(formData);
    var resultmap = json.decode(result);
    if (resultmap["success"]) {
      var uploaded = Uploaded(-1, resultmap["data"]["url"], PBTypeKeys.smms,
          info: resultmap["data"]["hash"]);
      await ImageUploadUtils.saveUploadedItem(uploaded);
      return uploaded;
    } else {
      throw new SMMSError(error: resultmap['message']);
    }
  }

  @override
  Future<Uploaded> delete(Uploaded uploaded) async {
    if (!isBlank(uploaded.info)) {
      var result = await SMMSApi.delete(uploaded.info);
      var resultmap = json.decode(result);
      if (resultmap["success"]) {
        return uploaded;
      } else {
        throw new SMMSError(error: resultmap['message']);
      }
    }
    return uploaded;
  }
}

/// SMMSError describes the error info  when request failed.
class SMMSError implements Exception {
  SMMSError({
    this.error,
  });

  dynamic error;

  String get message => (error?.toString() ?? '');

  @override
  String toString() {
    var msg = 'SMMSError $message';
    if (error is Error) {
      msg += '\n${error.stackTrace}';
    }
    return msg;
  }
}
