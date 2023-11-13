class UserModel {
  int id;
  String name;
  String email;
  bool isAdmin;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> item) {
    return UserModel(
      id: item['id'],
      name: item['name'] ?? '<Usuário novo>',
      email: item['email'],
      isAdmin: item['is_admin'],
    );
  }
}
