import '../helpers/enum_http_status_code.dart';

class ApiResponse<T> {
  EnumHttpStatusCode code;
  String message;
  T? data;

  ApiResponse({
    this.code = EnumHttpStatusCode.start,
    this.message = '',
    this.data,
  });
}
