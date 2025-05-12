class AgentResponseDTO {
  final int id;
  final String name;
  final String email;

  AgentResponseDTO({
    required this.id,
    required this.name,
    required this.email,
  });

  factory AgentResponseDTO.fromJson(Map<String, dynamic> json) {
    return AgentResponseDTO(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
