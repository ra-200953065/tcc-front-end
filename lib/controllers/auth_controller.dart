import 'package:tcc/controllers/base_controller.dart';
import 'package:tcc/helpers/enum_http_status_code.dart';
import '../repositories/repository.dart';
import '../models/api_response.dart';
import '../models/user_model.dart';
import 'package:get/get.dart';
import '../providers/auth_provider.dart';

class AuthController extends BaseController {
  final _authProvider = Get.put(AuthProvider());
  final _repository = Repository();

  /*
  |--------------------------------------------------------------------------
  | Validate Token
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<Map<String, dynamic>>> validateToken() async {
    await _authProvider.init();

    if (_authProvider.userToken == '') {
      return ApiResponse<Map<String, dynamic>>(
        code: EnumHttpStatusCode.gotoLogin,
        message: '',
      );
    }

    final repositoryData = await _repository.get('/auth/validate-token');

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.setData(
        userId: responseData['data']['user']['id'],
        userName: responseData['data']['user']['name'],
        userEmail: responseData['data']['user']['email'],
        userIsAdmin: responseData['data']['user']['is_admin'],
        userToken: _authProvider.userToken,
      );
    }

    if (responseData['code'] == EnumHttpStatusCode.gotoLogin ||
        responseData['code'] == EnumHttpStatusCode.gotoResetPassword) {
      _authProvider.clearData();
    }

    return ApiResponse<Map<String, dynamic>>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Login
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<UserModel>> login(String email, String pass) async {
    Map<String, dynamic> body = {'email': email, 'password': pass};

    final repositoryData = await _repository.post('/auth/login', body);

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.setData(
        userId: responseData['data']['user']['id'],
        userName: responseData['data']['user']['name'],
        userEmail: responseData['data']['user']['email'],
        userIsAdmin: responseData['data']['user']['is_admin'],
        userToken: responseData['data']['token'],
      );

      return ApiResponse<UserModel>(
        code: responseData['code'],
        message: responseData['message'],
        data: UserModel.fromJson(responseData['data']['user']),
      );
    }

    return ApiResponse<UserModel>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Forgot Password
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<UserModel>> forgotPassword(String email) async {
    Map<String, dynamic> body = {'email': email};

    final repositoryData =
        await _repository.post('/auth/forgot-password', body);

    final responseData = handleResponse(repositoryData);

    return ApiResponse<UserModel>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Reset Password
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<UserModel>> resetPassword(
    String email,
    String currentPassword,
    String newPassword,
    String newPasswordConfirmation,
  ) async {
    Map<String, dynamic> body = {
      'email': email,
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };

    final repositoryData = await _repository.post('/auth/reset-password', body);

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.setData(
        userId: responseData['data']['user']['id'],
        userName: responseData['data']['user']['name'],
        userEmail: responseData['data']['user']['email'],
        userIsAdmin: responseData['data']['user']['is_admin'],
        userToken: responseData['data']['token'],
      );

      UserModel user = UserModel(
        id: responseData['data']['user']['id'],
        name: responseData['data']['user']['name'],
        email: responseData['data']['user']['email'],
        isAdmin: responseData['data']['user']['is_admin'],
      );

      return ApiResponse<UserModel>(
        code: responseData['code'],
        message: responseData['message'],
        data: user,
      );
    }

    return ApiResponse<UserModel>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Change Password
  |--------------------------------------------------------------------------
  */

  Future<ApiResponse<Map<String, dynamic>>> changePassword(
    String currentPassword,
    String newPassword,
    String newPasswordConfirmation,
  ) async {
    Map<String, dynamic> body = {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };

    final repositoryData = await _repository.post(
      '/auth/change-password',
      body,
    );

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.setData(
        userId: responseData['data']['user']['id'],
        userName: responseData['data']['user']['name'],
        userEmail: responseData['data']['user']['email'],
        userIsAdmin: responseData['data']['user']['is_admin'],
        userToken: responseData['data']['token'],
      );
    }

    if (responseData['code'] == EnumHttpStatusCode.success) {
      responseData['message'] = 'Senha alterada com sucesso.';
    }

    return ApiResponse<Map<String, dynamic>>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Change Profile
  |--------------------------------------------------------------------------
  */

  Future<ApiResponse<Map<String, dynamic>>> changeProfile(
    String name,
    String email,
  ) async {
    Map<String, dynamic> body = {'name': name, 'email': email};

    final repositoryData = await _repository.post('/auth/change-profile', body);

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.userName = name;
      _authProvider.userEmail = email;
    }

    if (responseData['code'] == EnumHttpStatusCode.success) {
      responseData['message'] = 'Perifil alterado com sucesso.';
    }

    return ApiResponse<Map<String, dynamic>>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }

  /*
  |--------------------------------------------------------------------------
  | Logout
  |--------------------------------------------------------------------------
  */
  Future<ApiResponse<Map<String, dynamic>>> logout() async {
    final repositoryData = await _repository.post('/auth/logout', {});

    final responseData = handleResponse(repositoryData);

    if (responseData['code'] == EnumHttpStatusCode.success) {
      _authProvider.clearData();
    }

    return ApiResponse<Map<String, dynamic>>(
      code: responseData['code'],
      message: responseData['message'],
    );
  }
}
