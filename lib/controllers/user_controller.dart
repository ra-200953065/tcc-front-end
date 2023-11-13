import 'package:get/get.dart';
import 'package:tcc/controllers/base_controller.dart';
import 'package:tcc/models/user_restrict_model.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import 'package:tcc/providers/auth_provider.dart';
import 'package:tcc/repositories/repository.dart';
import 'package:tcc/models/api_response.dart';
import 'package:tcc/models/user_model.dart';

class UserController extends BaseController {
  final _repository = Repository();

  /*
  |--------------------------------------------------------------------------
  | Get All Users
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<List<UserModel>>> getAll() async {
    final repositoryData = await _repository.get('/user');

    final responseData = handleResponse(repositoryData);

    List<UserModel> users = [];

    if (responseData['code'] == EnumHttpStatusCode.success) {
      for (var item in responseData['data']['users']) {
        users.add(UserModel.fromJson(item));
      }
    }

    return ApiResponse<List<UserModel>>(
      code: responseData['code'],
      message: responseData['message'],
      data: users,
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Get All Users
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<List<UserRestrictModel>>> getRestrictList() async {
    final repositoryData = await _repository.get('/user/list/restrict');

    final responseData = handleResponse(repositoryData);

    List<UserRestrictModel> users = [];

    if (responseData['code'] == EnumHttpStatusCode.success) {
      for (var item in responseData['data']['users']) {
        users.add(UserRestrictModel.fromJson(item));
      }
    }

    return ApiResponse<List<UserRestrictModel>>(
      code: responseData['code'],
      message: responseData['message'],
      data: users,
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Store User
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<Map<String, dynamic>>> store(
    String name,
    String email,
    bool isAdmin,
  ) async {
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'is_admin': isAdmin
    };

    final repositoryData = await _repository.post('/user', body);

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      responseData['message'] = 'Registro inserido com sucesso.';
    }

    return ApiResponse(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Update User
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<Map<String, dynamic>>> update(
    int id,
    String name,
    String email,
    bool isAdmin,
  ) async {
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'is_admin': isAdmin,
    };

    final repositoryData = await _repository.put('/user/$id', body);

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      final authProvider = Get.put(AuthProvider());

      if (responseData['data']['user']['id'] == authProvider.userId) {
        authProvider.userName = responseData['data']['user']['name'];
        authProvider.userEmail = responseData['data']['user']['email'];
        authProvider.userIsAdmin = responseData['data']['user']['is_admin'];
      }

      responseData['message'] = 'Registro atualizado com sucesso.';
    }

    return ApiResponse(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Delete User
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<Map<String, dynamic>>> delete(int id) async {
    final repositoryData = await _repository.delete('/user/$id');

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      responseData['message'] = 'Registro excluído com sucesso.';
    }

    return ApiResponse(
      code: responseData['code'],
      message: responseData['message'],
    );
  }
}
