import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

import 'package:marvel_test/res/constants/global_key.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var md5Hash = md5
        .convert(utf8.encode(
          '$timestamp$privateApiKey$publicApiKey',
        ))
        .toString();

    options.queryParameters.addAll({
      'apikey': publicApiKey,
      'hash': md5Hash,
      'ts': timestamp,
    });
    handler.next(options);
  }
}
