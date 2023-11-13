import 'package:flutter/material.dart';
import 'package:tcc/models/inspection_model.dart';
import 'package:tcc/views/inspection/inspections_home_view.dart';
import 'package:tcc/views/inspection/inspections_details.dart';
import 'package:tcc/views/inspection/inspections_list_view.dart';
import 'views/profile/profile_home_view.dart';
import 'package:tcc/views/profile/change_password_view.dart';
import 'package:tcc/views/profile/change_profile_view.dart';
import 'views/auth/forgot_password_view.dart';
import 'views/auth/logout_view.dart';
import 'views/auth/reset_password_view.dart';
import 'views/auth/splash_view.dart';
import 'views/user/user_add_adit_view.dart';
import 'views/auth/login_view.dart';
import 'views/home/home_view.dart';
import 'views/user/user_list_view.dart';
import 'views/inspection/components/v_01_inspections_add_top_view.dart';
import 'models/user_model.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> getStaticRoutes() {
    return {
      '/auth/splash': (_) => const SplashView(),
      '/auth/login': (_) => const LoginView(),
      '/auth/forgot-password': (_) => const ForgotPasswordView(),
      '/auth/logout': (_) => const LogoutView(),
      '/home': (_) => const HomeView(),
      '/users': (_) => const UserListView(),
      '/users/add': (_) => const UserAddEditView(pageTitle: 'Novo usuário '),
      '/profile/home': (_) => const ProfileHomeView(),
      '/profile/change-password': (_) => const ChangePasswordView(),
      '/profile/change-profile': (_) => const ChangeProfileView(),
      '/inspections': (_) => const InspectionsHomeView(),
      '/inspections/add': (_) => const V01InspectionsAddTopView(),
    };
  }

  MaterialPageRoute? getDynamicRoutes(RouteSettings settings) {
    if (settings.name == '/auth/reset-password') {
      final args = settings.arguments as Map;

      return MaterialPageRoute(
        builder: (_) => ResetPasswordView(
          email: args['email'],
          password: args['password'],
        ),
      );
    }

    if (settings.name == '/user/edit') {
      final user = settings.arguments as UserModel;

      return MaterialPageRoute(
        builder: (_) => UserAddEditView(
          pageTitle: 'Editar usuário',
          user: user,
        ),
      );
    }

    if (settings.name == '/inspections/list') {
      final item = settings.arguments as Map;

      return MaterialPageRoute(
        builder: (_) => InspectionsListView(
          userId: item['userId'],
          initDate: item['initDate'],
          endDate: item['endDate'],
        ),
      );
    }

    if (settings.name == '/inspections/details') {
      final item = settings.arguments as InspectionModel;

      return MaterialPageRoute(
        builder: (_) => InspectionsDetails(item: item),
      );
    }

    return null;
  }
}
