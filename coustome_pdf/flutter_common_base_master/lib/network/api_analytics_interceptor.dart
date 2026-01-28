import 'package:dio/dio.dart';


///partha paul
///api_analytics_interceptor
///22/12/25

class ApiAnalyticsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // FirebaseAnalytics.instance.logEvent(
    //   name: 'api_request',
    //   parameters: {
    //     'url': options.path,
    //     'method': options.method,
    //   },
    // );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // FirebaseAnalytics.instance.logEvent(
    //   name: 'api_success',
    //   parameters: {
    //     'url': response.requestOptions.path,
    //     'status_code': response.statusCode??'505',
    //   },
    // );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // FirebaseAnalytics.instance.logEvent(
    //   name: 'api_error',
    //   parameters: {
    //     'url': err.requestOptions.path,
    //     'error': err.message??'',
    //   },
    // );

    // Log to Crashlytics (non-fatal)
    // FirebaseCrashlytics.instance.recordError(
    //   err,
    //   err.stackTrace,
    //   fatal: false,
    //   information: ['API Error'],
    // );

    super.onError(err, handler);
  }
}
