class CaseRegisterDTO {
  final String disease;
  final String street;
  final String number;
  final String? complement;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String registrationDate;
  final int agentId;

  CaseRegisterDTO({
    required this.disease,
    required this.street,
    required this.number,
    this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationDate,
    required this.agentId,
  });

  Map<String, dynamic> toJson() => {
        'disease': disease,
        'street': street,
        'number': number,
        'complement': complement,
        'neighborhood': neighborhood,
        'city': city,
        'state': state,
        'zipCode': zipCode,
        'registrationDate': registrationDate,
        'agentId': agentId,
      };
}
