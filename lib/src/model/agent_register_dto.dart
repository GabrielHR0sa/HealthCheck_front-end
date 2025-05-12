class AgentRegisterDTO {
  final String name;
  final String login;
  final String password;
  final String city;
  final String email;

  AgentRegisterDTO({
    required this.name,
    required this.login,
    required this.password,
    required this.city,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'login': login,
    'password': password,
    'city': city,
    'email': email,
  };
}
