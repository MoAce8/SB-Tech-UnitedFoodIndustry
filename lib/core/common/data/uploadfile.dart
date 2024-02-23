


import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:unitedfoodindustery/core/common/data/local_preference.dart';
import 'package:unitedfoodindustery/core/common/data/models/file_upload_model.dart';
import 'package:unitedfoodindustery/core/constants/urls.dart';
import 'package:unitedfoodindustery/core/utiles/di.dart';
import 'package:unitedfoodindustery/core/utiles/network_client.dart';

class UploadRepository {
  final _localPreferences = locator<LocalPreferences>();

  Future<Either<String, String>> uploadFile(
      String folderName, File file) async {
    final fileEntity = FileUploadEntity(file: file, folderName: folderName);
    final userId = _localPreferences.id;
    if (userId == null) {
      return const Left('مشكله في رفع الملف');
    }
    final queryParameters = {
      'tagName': folderName,
      'userId': userId,
    };
    Uri uri =
    Uri.parse(Urls.UPLOAD_FILE).replace(queryParameters: queryParameters);
    final response = await NetworkClient.uploadFile(uri: uri, fileUpload: fileEntity);
    return response.fold(
          (left) => Left(left.message),
          (right) => Right(right),
    );
  }
}