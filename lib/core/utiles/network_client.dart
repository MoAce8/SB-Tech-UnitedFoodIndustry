import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:unitedfoodindustery/core/common/data/local_preference.dart';
import 'package:unitedfoodindustery/core/common/data/models/file_upload_model.dart';
import 'package:unitedfoodindustery/core/utiles/di.dart';
import 'package:unitedfoodindustery/core/utiles/service_error.dart';

class NetworkClientA {
  getRequest({
    required String url,
  }) async {
    final uri = Uri.parse(url);
    print("Posting $url");
    print('~~~~~~~~~~~~~~~~~~~~?');
    final headers = ApiUtils.instance.headers;
    return await checkResponse(() => get(uri,headers: headers,));
  }
  getRequestQuery({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    print("))))");
    String queryString = Uri(queryParameters: query).query;
    var requestUrl = Uri.parse(url).replace(queryParameters:query );

    print(requestUrl);
    print("))))");
    final headers = ApiUtils.instance.headers;

    return await checkResponse(() => get(requestUrl,headers: headers,));
  }
  postRequestQuery({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    print("))))");
    var requestUrl = Uri.parse(url).replace(queryParameters:query );
    print(requestUrl);
    final headers = ApiUtils.instance.headers;
    print("Queryyyyy");
    print("))))");
    return await checkResponse(() => post(requestUrl,headers: headers,));
  }
  postRequestQueryBody({
    required String url,
    Map<String, dynamic>? query,
    required Map data,
  }) async {
    var requestUrl = Uri.parse(url).replace(queryParameters:query );
    final body = await compute(encodeJson, data);
    final headers = ApiUtils.instance.headers;
    return await checkResponse(() => post(requestUrl,headers: headers,body: body));
  }
  postRequest(String url, Map data) async {
    print("enterpostrequst");
    final uri = Uri.parse(url);
    final headers = ApiUtils.instance.headers;
    print("Posting $url");
    print(data);
    final body = await compute(encodeJson, data);
    print("Posting $url");
    print("Body: $body");
    return await checkResponse(() => post(uri, headers: headers, body: body));

  }

  Future<Map> checkResponse(Future<Response> Function() apiCall) async {
    try {
      final response = await apiCall();
      print(response.statusCode);
      print('asher');
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
        final decodedBody = await compute(decodeJson, response.body);
        if (decodedBody['isError'] == true) {
          throw decodedBody['message'];
        } else {
          return decodedBody;
        }
      } else {
        throw 'تعذر الإتصال';
      }
    } on SocketException catch (e) {
      print(e);
      throw 'تحقق من اتصالك بالانترنت';
    } on HttpException catch (e) {
      print(e);
      throw 'تعذر الاتصال بالخادم';
    } on FormatException catch (e) {
      print(e);
      throw 'Bad response';
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

///file cost http dio   link get post

class NetworkClient {
  NetworkClient._();

  static Future<Either<ServiceError, Map<String, dynamic>>> getRequest(
      Uri uri) async {
    final headers = ApiUtils.instance.headers;
    try {
      final response = await get(uri, headers: headers);
      final decodedBody = await compute(decodeJson, response.body);
      int statusCode =
      getStatusCodeFromResponse(response.statusCode, decodedBody);
      log('statusCode $statusCode');
      log('response ${response.body}');
      return handleResponse(statusCode, decodedBody);
    } on SocketException {
      return Left(
          ServiceError(RequestError.noInternet, 'لا يمكن الاتصال بالانترنت'));
    } catch (e) {
      log(e.toString());
      return Left(ServiceError(RequestError.unknown, 'تعذر الاتصال'));
    }
  }
  static Future<Either<ServiceError, String>> uploadFile(
      {required Uri uri, required FileUploadEntity fileUpload}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      uri,
    );
    final headers = ApiUtils.instance.headers;

    final multiPartFile = await MultipartFile.fromPath(
      'file',
      fileUpload.file.path,
      contentType: MediaType("file", fileUpload.file.path.split(".").last),
    );
    headers.update('Content-Type', (value) => 'multipart/form-data');
    request.files.add(multiPartFile);
    request.headers.addAll(headers);
    try {
      var response = await request.send();
      final result = await http.Response.fromStream(response);
      print("Soso${result.body}");
      return Right(result.body);
    } on SocketException {
      return Left(
          ServiceError(RequestError.noInternet, 'لا يمكن الاتصال بالانترنت'));
    } catch (e) {
      log(e.toString());
      return Left(ServiceError(RequestError.unknown, 'تعذر الاتصال'));
    }
  }
  static Either<ServiceError, Map<String, dynamic>> handleResponse(
      int statusCode, Map<String, dynamic> decodedBody) {
    if (statusCode == 200) {
      return Right(decodedBody);
    } else if (statusCode == 400 || statusCode == 404) {
      final result = getAuthenticationStatusOnFailure(decodedBody);
      if (result is Map<String, dynamic>) {
        return Right(result);
      }
    }
    return Left(ServiceError.fromDecodedBody(statusCode, decodedBody));
  }

  // Future<Response> uploadFile({required Uri uri,required FileUpload fileUpload})async {
  //   ///MultiPart request
  //   var request = http.MultipartRequest(
  //     'POST', Uri.parse("https://your api url with endpoint"),
  //
  //   );
  //   final headers = ApiUtils.instance.headers;
  //
  //   headers.update('Content-type', (value) => 'multipart/form-data');
  //   request.files.add(
  //     http.MultipartFile(
  //       'file',
  //       fileUpload.file.readAsBytes().asStream(),
  //       fileUpload.file.lengthSync(),
  //     ),
  //   );
  //   request.headers.addAll(headers);
  //   var response = await request.send();
  //   return http.Response.fromStream(response);
  // }

  static Future<Either<ServiceError, Map<String, dynamic>>> postRequest(Uri uri,
      {Map? data}) async {
    try {
      final headers = ApiUtils.instance.headers;
      String body = '';
      if (data != null) {
        body = await compute(encodeJson, data);
      }
      log("body $body");
      final response = await post(uri, headers: headers, body: (body.isNotEmpty ? body : null));

      log('response ${response.request.toString()}');
      log('response ${ response.body}');

      final decodedBody = await compute(decodeJson, response.body);
      int statusCode = getStatusCodeFromResponse(response.statusCode, decodedBody);
      log('statusCode $statusCode');
      log('response ${response.body}');
      return handleResponse(statusCode, decodedBody);
    } on SocketException {
      return Left(
          ServiceError(RequestError.noInternet, 'لا يمكن الاتصال بالانترنت'));
    } catch (e) {
      log(e.toString());
      return Left(ServiceError(RequestError.unknown, 'تعذر الاتصال'));
    }
  }
}
class ApiUtils {
  static final _instance = ApiUtils._();
  static final instance = _instance;

  ApiUtils._();

  Map<String, String> get headers {
    final token = locator<LocalPreferences>().appUser.value?.token;
    return {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
      if(token != null)
        'Authorization': 'Bearer $token',
    };
  }
}

decodeJson(String body) => json.decode(body);
String encodeJson(body) => json.encode(body);