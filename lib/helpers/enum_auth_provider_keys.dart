enum AuthProviderKeys {
  userId('user_id'),
  userName('user_name'),
  userEmail('user_email'),
  userIsAdmin('user_is_admin'),
  userToken('user_token');

  final String value;

  const AuthProviderKeys(this.value);
}
