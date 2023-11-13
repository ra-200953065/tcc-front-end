class UserRestrictModel {
  int id;
  String name;

  UserRestrictModel({
    required this.id,
    required this.name,
  });

  factory UserRestrictModel.fromJson(Map<String, dynamic> item) {
    return UserRestrictModel(
      id: item['id'],
      name: item['name'] ?? '<Usuário novo>',
    );
  }
}
