import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:marvel_test/utils/interceptor/network_interceptor.dart';

extension DioInterceptors on Dio {
  void addInterceptors() async {
    final loggerInterceptor = PrettyDioLogger(responseBody: false);
    final networkInterceptor = NetworkInterceptor();

    interceptors.addAll([loggerInterceptor, networkInterceptor]);
  }
}
