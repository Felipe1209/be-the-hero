class CaseModel{
  final String id;
  final String ongId;
  final String ongName;
  final String name;
  final String description;
  final String value;

  CaseModel({
    required this.id,
    required this.ongId,
    required this.ongName,
    required this.name,
    required this.description,
    required this.value,
  });

  factory CaseModel.fromMap(Map<String, dynamic> response) {
    return CaseModel(
      id: response['id'],
      ongId: response['ong_id'],
      ongName: response['ong_name'],
      name: response['name'],
      description: response['description'],
      value: response['value'],
    );
  }
}