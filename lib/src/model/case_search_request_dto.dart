class CaseSearchRequestDTO {
  final String city;
  final String? neighborhood;
  final String? disease;

  CaseSearchRequestDTO({
    required this.city,
    this.neighborhood,
    this.disease,
  });

  Map<String, dynamic> toJson() => {
        'city': city,
        'neighborhood': neighborhood,
        'disease': disease,
      };
}
