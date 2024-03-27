import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:navasankalp_application/app/data/api/api_error.dart';
import 'package:navasankalp_application/app/utils/constants.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';

// ** Refer this for another example https://gist.github.com/eduardoflorence/b4bca2da5cfb973b9f86ecfa1b9f013a
class ApiConnect extends GetConnect {
  static final ApiConnect instance = ApiConnect._();
  dynamic _reqBody;

  ApiConnect._() {
    baseUrl = EndPoints.baseUrl;
    timeout = EndPoints.timeout;
    _enableLogs();
  }

  String platfromType() {
    late String platfrom;
    if (Platform.isAndroid) {
      platfrom = "Android";
    } else if (Platform.isIOS) {
      platfrom = "IOS";
    } else if (Platform.isLinux) {
      platfrom = "Linux";
    } else if (Platform.isMacOS) {
      platfrom = "MacOS";
    }
    return platfrom;
  }

  void _enableLogs() {
    httpClient.addRequestModifier<dynamic>((request) {
      final pref = Get.find<NavaSankalpPref>();
      _print('************** Request **************');
      _printKV('uri', request.url);
      _printKV('method', request.method);
      _printKV('followRedirects', request.followRedirects);
      request.headers['Authorization'] = 'Bearer ${pref.accessToken.val}';
      request.headers['device_id'] = pref.deviceid.val;
      request.headers['device_token'] = pref.devicetoken.val;
      request.headers['device_type'] = platfromType();
      request.headers.forEach((key, v) => _printKV(' $key', v));
      _print('data:');
      if (_reqBody is Map) {
        _reqBody?.forEach((key, v) => _printKV(' $key', v));
      } else {
        _printAll(_reqBody.toString());
      }
      _print('*************************************');
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      _print('************** Response **************');
      _printKV('uri', response.request!.url);
      _printKV('statusCode', response.statusCode!);
      if (response.headers != null) {
        _print('headers:');
        response.headers?.forEach((key, v) => _printKV(' $key', v));
      }
      _print('Response Text:');
      _printAll(response.bodyString);
      _print('*************************************');
      return response;
    });
  }

  void _print(dynamic printContent) {
    if (kDebugMode) {
      print(printContent);
    }
  }

  void _printKV(String key, Object v) {
    _print('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(_print);
  }
}

extension ResErr<T> on Response<T> {
  X getBody<X>({required Decoder decoder}) {
    if (status.connectionError) {
      throw NoConnectionError();
    }

    if (status.isUnauthorized) {
      throw UnauthorizedError();
    }

    if (status.code == HttpStatus.badRequest) {
      final res = jsonDecode(bodyString!);
      throw ServerResError(res.toString());
    }

    if (status.code == HttpStatus.requestTimeout) {
      throw TimeoutError();
    }

    if (!status.isOk) {
      throw UnknownError();
    }

    try {
      final res = jsonDecode(bodyString!);

      if (res is Map && res['valid'] != null && !res['valid']) {
        throw ServerResError(res['message']);
      }
      return decoder(body!);
    } on TimeoutException catch (e) {
      log(e.toString());
      throw TimeoutError();
    } catch (e) {
      log(e.toString());
      throw UnknownError();
    }
  }
}
