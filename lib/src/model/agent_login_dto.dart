class AgentLoginDTO {
  final String email;
  final String password;

  AgentLoginDTO({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
