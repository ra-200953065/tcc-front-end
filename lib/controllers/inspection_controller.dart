import 'package:tcc/controllers/base_controller.dart';
import '../helpers/enum_http_status_code.dart';
import '../models/api_response.dart';
import '../models/inspection_model.dart';
import '../repositories/repository.dart';

class InspectionController extends BaseController {
  final _repository = Repository();

  /*
  |--------------------------------------------------------------------------
  | Get All Inspections
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<List<InspectionModel>>> xXXXXXgetAll() async {
    final repositoryData = await _repository.get('/inspection');

    final responseData = handleResponse(repositoryData);

    List<InspectionModel> inspections = [];

    if (responseData['code'] == EnumHttpStatusCode.success) {
      for (var item in responseData['data']['inspections']) {
        inspections.add(InspectionModel.fromJson(item));
      }
    }

    return ApiResponse<List<InspectionModel>>(
      code: responseData['code'],
      message: responseData['message'],
      data: inspections,
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Get Inspections by Date and User
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<List<InspectionModel>>> getInspections(
    int userId,
    String initDate,
    String endDate,
  ) async {
    final repositoryData =
        await _repository.get('/inspection/$userId/$initDate/$endDate');

    final responseData = handleResponse(repositoryData);

    List<InspectionModel> inspections = [];

    if (responseData['code'] == EnumHttpStatusCode.success) {
      for (var item in responseData['data']['inspections']) {
        inspections.add(InspectionModel.fromJson(item));
      }
    }

    return ApiResponse<List<InspectionModel>>(
      code: responseData['code'],
      message: responseData['message'],
      data: inspections,
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Store Inspection
  |--------------------------------------------------------------------------
  */

  Future<ApiResponse<Map<String, dynamic>>> store(
    Map<String, dynamic> data,
  ) async {
    final repositoryData = await _repository.post('/inspection', data);

    final responseData = handleResponse(repositoryData);

    return ApiResponse(
      code: responseData['code'],
      message: responseData['message'],
    );
  }
}
