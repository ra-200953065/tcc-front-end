import 'package:tcc/helpers/enum_http_status_code.dart';

abstract class BaseController {
  Map<String, dynamic> handleResponse(Map<String, dynamic> data) {
    Map<String, dynamic> response = {
      'code': EnumHttpStatusCode.start,
      'message': '',
      'data': null,
    };

    switch (data['statusCode']) {
      case 200:
      case 201:
        response['code'] = EnumHttpStatusCode.success;
        response['data'] = data['body'];
        break;
      case 401:
        response['code'] = EnumHttpStatusCode.gotoLogin;
        response['message'] = data['body']['message'];
        break;
      case 408:
        response['code'] = EnumHttpStatusCode.timeout;
        break;
      case 423:
        response['code'] = EnumHttpStatusCode.gotoResetPassword;
        response['message'] = data['body']['message'];
        break;
      default: // 403 | 404 | 422 | 500
        response['code'] = EnumHttpStatusCode.message;
        response['message'] = data['body']['message'];
    }

    return response;
  }
}
