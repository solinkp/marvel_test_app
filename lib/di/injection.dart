import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:marvel_test/di/injection.config.dart';
import 'package:marvel_test/utils/dio_interceptor.dart';

//* Get instance of GetIt.
final locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configure() async => $initGetIt(locator);

@module
abstract class RegisterModule {
  //* Register Dio module
  @lazySingleton
  Dio get client {
    final options = BaseOptions(
      sendTimeout: const Duration(seconds: 60),
    );
    Dio dio = Dio(options)..addInterceptors();
    return dio;
  }
}
